﻿using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace TuNamespace
{
    public partial class VistaServicios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarClientes();
                LlenarTiendas(); // También se llena al cargar la página
            }
        }

        protected void ButtonMostrar_Click(object sender, EventArgs e)
        {
            LlenarGridView();
        }

        protected void ddlCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            LlenarTiendas();
        }

        private void LlenarClientes()
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            {
                sqlConectar.Open();
                using (SqlCommand sql = new SqlCommand("SELECT * FROM ClienteDMC", sqlConectar))
                {
                    sql.CommandType = CommandType.Text;
                    ddlCliente.DataSource = sql.ExecuteReader();
                    ddlCliente.DataTextField = "NombreCliente";
                    ddlCliente.DataValueField = "IdCliente";
                    ddlCliente.DataBind();
                    ddlCliente.Items.Insert(0, new ListItem("Selecciona Cliente", "0"));
                }
            }
        }

        private void LlenarTiendas()
        {
            int IdCliente = Convert.ToInt32(ddlCliente.SelectedValue);
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            {
                sqlConectar.Open();
                using (SqlCommand sql = new SqlCommand("SELECT * FROM TiendaBD WHERE FK_IdCliente = @IdCliente", sqlConectar))
                {
                    sql.CommandType = CommandType.Text;
                    sql.Parameters.AddWithValue("@IdCliente", IdCliente);
                    DropDownListTienda.DataSource = sql.ExecuteReader();
                    DropDownListTienda.DataTextField = "NombreTienda";
                    DropDownListTienda.DataValueField = "Id_Tienda";
                    DropDownListTienda.DataBind();
                    DropDownListTienda.Items.Insert(0, new ListItem("Selecciona Tienda", "0"));
                }
            }
        }

        private void LlenarGridView()
        {
            int IdCliente = Convert.ToInt32(ddlCliente.SelectedValue);
            int IdTienda = Convert.ToInt32(DropDownListTienda.SelectedValue);
            string estado = DropDownListEstado.SelectedValue;

            DateTime fechaInicio;
            DateTime fechaFin;

            // Validar las fechas
            if (!DateTime.TryParse(txtFechaInicio.Text, out fechaInicio))
            {
                // Manejar el caso en que la fecha de inicio no sea válida
                // Puedes mostrar un mensaje al usuario o realizar otra acción apropiada.
                return;
            }

            if (!DateTime.TryParse(txtFechaFin.Text, out fechaFin))
            {
                // Manejar el caso en que la fecha de fin no sea válida
                // Puedes mostrar un mensaje al usuario o realizar otra acción apropiada.
                return;
            }

            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            {
                sqlConectar.Open();
                DataTable GV = new DataTable();

                // Define las columnas del DataTable
                GV.Columns.AddRange(new DataColumn[]{
                    new DataColumn("Motivo", typeof(string)),
                    new DataColumn("TipoTrabajo", typeof(string)),
                    new DataColumn("Descripcion", typeof(string)),
                    new DataColumn("Estatus", typeof(string)),
                    new DataColumn("Fecha", typeof(string)),
                    new DataColumn("Responsable", typeof(string)),
                    new DataColumn("Correo", typeof(string)),
                    new DataColumn("NombreTecnico", typeof(string)),
                    new DataColumn("NombreTienda", typeof(string)),
                    new DataColumn("NombreCliente", typeof(string)),
                    new DataColumn("Telefono1", typeof(string)),
                    new DataColumn("Telefono2", typeof(string)),
                });

                // Utiliza el procedimiento almacenado adecuado
                using (SqlCommand cmd = new SqlCommand("SP_FiltrarServicios", sqlConectar))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IdCliente", IdCliente);
                    cmd.Parameters.AddWithValue("@IdTienda", IdTienda);
                    cmd.Parameters.AddWithValue("@Estado", estado);
                    cmd.Parameters.AddWithValue("@FechaInicio", fechaInicio);
                    cmd.Parameters.AddWithValue("@FechaFin", fechaFin);

                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            // Agrega filas al DataTable
                            GV.Rows.Add(
                                dr["Motivo"].ToString(),
                                dr["TipoTrabajo"].ToString(),
                                dr["Descripcion"].ToString(),
                                dr["Estatus"].ToString(),
                                dr["Fecha"].ToString(),
                                dr["Responsable"].ToString(),
                                dr["Correo"].ToString(),
                                dr["NombreTecnico"].ToString(),
                                dr["NombreTienda"].ToString(),
                                dr["NombreCliente"].ToString(),
                                dr["Telefono1"].ToString(),
                                dr["Telefono2"].ToString()
                            );
                        }
                    }
                }

                sqlConectar.Close();

                GridViewServicios.DataSource = GV;
                GridViewServicios.DataBind();
            }
        }
    }
}
