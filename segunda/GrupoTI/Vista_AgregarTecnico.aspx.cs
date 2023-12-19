using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace segunda
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListarTecnicos();
            }
        }
        protected void Guardar_Click(object sender, EventArgs e)
        {
            // Validar que todos los campos estén llenos
            if (
                string.IsNullOrWhiteSpace(txttecnico.Text) ||
                string.IsNullOrWhiteSpace(txtnombretecnico.Text) &&
                string.IsNullOrWhiteSpace(txtdirecciontecnico.Text)
            )
            {
                // Muestra un mensaje de error o realiza alguna acción

                return;
            }

            // Resto del código para guardar en la base de datos

            // Si llega a este punto, significa que los campos están llenos y puedes proceder con la inserción en la base de datos

            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            using (SqlCommand sql = new SqlCommand("AgregarTecnico", sqlConectar))
            {
                sqlConectar.Open();
                sql.CommandType = CommandType.StoredProcedure;

                // Obtener valores de los campos de texto
                string rtecnico = txttecnico.Text;
                string nombretecnico = txtnombretecnico.Text;
                string direcciontecnico = txtdirecciontecnico.Text;

                // Parámetros del procedimiento almacenado
                sql.Parameters.Add("@RutTecnico", SqlDbType.VarChar, 50).Value = rtecnico;
                sql.Parameters.Add("@NombreTecnico", SqlDbType.VarChar, 50).Value = nombretecnico;
                sql.Parameters.Add("@DireccionTecnico", SqlDbType.VarChar, 50).Value = direcciontecnico;

                // Ejecutar el procedimiento almacenado
                sql.ExecuteNonQuery();
            }

            // Limpiar los campos después de guardar
            txttecnico.Text = "";
            txtnombretecnico.Text = "";
            txtdirecciontecnico.Text = "";
        }
        protected void ListarTecnicos()
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            {
                using (SqlCommand sql = new SqlCommand("SP_ListarTecnico", sqlConectar))
                {
                    sql.CommandType = CommandType.StoredProcedure;

                    sql.Connection.Open();

                    using (SqlDataReader reader = sql.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            GridViewTecnico.DataSource = reader;
                            GridViewTecnico.DataBind();
                        }
                    }
                }
            }
        }


        protected void GridViewServicios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;
            GridViewRow selectedRow = GridViewTecnico.Rows[index];

            // Obtén el ID del servicio que se va a eliminar
            int idTecnico = Convert.ToInt32(selectedRow.Cells[0].Text);

            // Llama al procedimiento almacenado para eliminar el servicio
            EliminarServicio(idTecnico);

            // Vuelve a cargar los servicios para actualizar la GridView
            ListarTecnicos();
        }



        private void EliminarServicio(int idTecnico)
        {
            // Configura la conexión a la base de datos
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            SqlConnection sqlConectar = null;  // Declarar fuera del bloque try

            try
            {
                sqlConectar = new SqlConnection(conectar);

                // Configura y ejecuta el comando para llamar al procedimiento almacenado
                SqlCommand cmd = new SqlCommand("SP_EliminarServicio2", sqlConectar);
                cmd.CommandType = CommandType.StoredProcedure;

                // Agrega el parámetro al procedimiento almacenado
                cmd.Parameters.AddWithValue("@IdTecnico", idTecnico);

                // Abre la conexión y ejecuta el comando
                sqlConectar.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                // Maneja la excepción (puedes mostrar un mensaje de error o registrar el error)
                Console.WriteLine("Error al eliminar el Tecnico: " + ex.Message);
            }
            finally
            {
                if (sqlConectar != null)
                {
                    // Asegúrate de cerrar la conexión, incluso si se produce una excepción
                    sqlConectar.Close();
                }
            }
        }









        protected void volveracasa23(object sender, EventArgs e)
        {
            Response.Redirect("Vista_Formulario.aspx");
        }
    }
}