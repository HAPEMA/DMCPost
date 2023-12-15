using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Element;

namespace segunda
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropClientes();
                Droptecnico();
            }
        }

        protected void DropClientes()
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
                    ddlCliente.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Selecciona Cliente", "0"));
                }
            }
        }


        protected void Droptecnico()
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            {
                sqlConectar.Open();
                using (SqlCommand sql = new SqlCommand("SELECT * FROM Tecnico", sqlConectar))
                {
                    sql.CommandType = CommandType.Text;
                    DropDownListtxttecnico.DataSource = sql.ExecuteReader();
                    DropDownListtxttecnico.DataTextField = "NombreTecnico";
                    DropDownListtxttecnico.DataValueField = "idTecnico";
                    DropDownListtxttecnico.DataBind();
                    DropDownListtxttecnico.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Selecciona Tecnico", "0"));
                }
            }
        }



        protected void ddlCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            int IdCliente = Convert.ToInt32(ddlCliente.SelectedValue);
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            {
                sqlConectar.Open();
                using (SqlCommand sql = new SqlCommand("SELECT * FROM TiendaBD WHERE FK_IdCliente =" + IdCliente, sqlConectar))
                {
                    sql.CommandType = CommandType.Text;
                    ddlTienda.DataSource = sql.ExecuteReader();
                    ddlTienda.DataTextField = "NombreTienda";
                    ddlTienda.DataValueField = "Id_Tienda";
                    ddlTienda.DataBind();
                    ddlTienda.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Selecciona Tienda", "0"));
                }
            }
        }

        protected void botonEnviar_Click(object sender, EventArgs e)
        {
            // Validar que todos los campos estén llenos
            if (
                string.IsNullOrWhiteSpace(DropDownListtxttecnico.SelectedValue) ||
                ddlCliente.SelectedValue == "0" ||
                ddlTienda.SelectedValue == "0" ||
                string.IsNullOrWhiteSpace(txtCorreo.Text) ||
                string.IsNullOrWhiteSpace(txtfecha.Text) ||
                string.IsNullOrWhiteSpace(txtmotivo.Text) ||
                string.IsNullOrWhiteSpace(DropDownListtipotrabajo.SelectedValue) ||
                string.IsNullOrWhiteSpace(DropDownListEstado.SelectedValue) ||
                string.IsNullOrWhiteSpace(txtdescripcion.Text) ||
                string.IsNullOrWhiteSpace(txtresponsable.Text) ||
                string.IsNullOrWhiteSpace(txtfono2.Text)
            )
            {
                // Mostrar mensaje de validación en la parte superior del formulario
                divMensajeValidacion.InnerText = "Todos los campos son obligatorios. Por favor, complete todos los campos.";
                return;
            }

            // Limpiar el mensaje de validación si la validación fue exitosa
            divMensajeValidacion.InnerText = "";

            // Obtener los valores de los controles
            string cliente = ddlCliente.SelectedItem.Text;
            string tienda = ddlTienda.SelectedItem.Text;
            string correo = txtCorreo.Text;
            DateTime fecha = DateTime.Parse(txtfecha.Text);
            string motivo = txtmotivo.Text;
            string tipoTrabajo = DropDownListtipotrabajo.SelectedValue;
            string estado = DropDownListEstado.SelectedValue;
            string descripcion = txtdescripcion.Text;
            string responsable = txtresponsable.Text;
            string telefono = txtfono2.Text;
            string telefonor = txttelefonor.Text;
            int idTecnico = int.Parse(DropDownListtxttecnico.SelectedValue);
            // Llamar al nuevo procedimiento almacenado con el ID del técnico
            AgregarDatosServicioCompleto(cliente, tienda, correo, fecha, motivo, tipoTrabajo, estado, descripcion, responsable, telefono, telefonor, idTecnico);

            // Limpiar los campos después de enviar
            LimpiarCampos();
        }

        // Función para limpiar los campos
        private void LimpiarCampos()
        {
            DropDownListtxttecnico.SelectedIndex = 0;
            ddlCliente.SelectedIndex = 0;
            ddlTienda.SelectedIndex = 0;
            txtCorreo.Text = "";
            txtfecha.Text = DateTime.Now.Date.ToShortDateString();
            txtmotivo.Text = "";
            DropDownListtipotrabajo.SelectedIndex = 0;
            DropDownListEstado.SelectedIndex = 0;
            txtdescripcion.Text = "";
            txtresponsable.Text = "";
            txtfono2.Text = "";
            txttelefonor.Text = "";
        }




        protected void AgregarDatosServicioCompleto(string cliente, string tienda, string correo, DateTime fecha, string motivo, string tipoTrabajo, string estado, string descripcion, string responsable, string telefono, string telefonor, int idTecnico)
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conectar))
            {
                using (SqlCommand cmd = new SqlCommand("SP_GuardarServicioFormulario", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Parámetros del procedimiento almacenado
                    cmd.Parameters.AddWithValue("@Tecnico", idTecnico);

                    cmd.Parameters.AddWithValue("@Cliente", cliente);
                    cmd.Parameters.AddWithValue("@Tienda", tienda);
                    cmd.Parameters.AddWithValue("@Correo", correo);
                    cmd.Parameters.AddWithValue("@Fecha", fecha);
                    cmd.Parameters.AddWithValue("@Motivo", motivo);
                    cmd.Parameters.AddWithValue("@TipoTrabajo", tipoTrabajo);
                    cmd.Parameters.AddWithValue("@Estado", estado);
                    cmd.Parameters.AddWithValue("@Descripcion", descripcion);
                    cmd.Parameters.AddWithValue("@Responsable", responsable);
                    cmd.Parameters.AddWithValue("@Telefono", telefono);
                    cmd.Parameters.AddWithValue("@TelefonoR", telefonor);
                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                    catch (SqlException sqlEx)
                    {
                        for (int i = 0; i < sqlEx.Errors.Count; i++)
                        {
                            Console.WriteLine($"Index #{i}: " +
                                $"Error Number: {sqlEx.Errors[i].Number}, " +
                                $"Message: {sqlEx.Errors[i].Message}");
                        }
                    }
                }
            }
        }
      
        protected void CrearTienda_Click(object sender, EventArgs e)
        {
            Response.Redirect("Vista_AgregarTienda.aspx");
        }

        protected void botonEnviarcorreo(object sender, EventArgs e)
        {
            Response.Redirect("Vista_EnviarCorreo.aspx");
        }
        protected void CrearTecnico_Click(object sender, EventArgs e)
        {
            Response.Redirect("Vista_AgregarTecnico.aspx");
        }
        protected void CrearTienda_Click2(object sender, EventArgs e)
        {
            Response.Redirect("Vista_AgregarCliente.aspx");
        }
    }
}
