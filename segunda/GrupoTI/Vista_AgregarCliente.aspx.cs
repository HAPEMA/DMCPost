using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services.Description;

namespace segunda
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        public object Mensaje { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListarCliente();

            }
        }
        protected void Guardar_Click(object sender, EventArgs e)
        {
            // Validar que todos los campos estén llenos
            if (
                string.IsNullOrWhiteSpace(txtrcliente.Text) ||
                string.IsNullOrWhiteSpace(txtnombrecliente.Text) ||
                string.IsNullOrWhiteSpace(txtdireccioncliente.Text)
            )
            {
                // Muestra un mensaje de error o realiza alguna acción
              
                return;
            }

            // Resto del código para guardar en la base de datos

            // Si llega a este punto, significa que los campos están llenos y puedes proceder con la inserción en la base de datos

            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            using (SqlCommand sql = new SqlCommand("AgregarCliente", sqlConectar))
            {
                sqlConectar.Open();
                sql.CommandType = CommandType.StoredProcedure;

                // Obtener valores de los campos de texto
                string rutCliente = txtrcliente.Text;
                string nombreCliente = txtnombrecliente.Text;
                string direccionCliente = txtdireccioncliente.Text;

                // Parámetros del procedimiento almacenado
                sql.Parameters.Add("@RutCliente", SqlDbType.VarChar, 50).Value = rutCliente;
                sql.Parameters.Add("@NombreCliente", SqlDbType.VarChar, 50).Value = nombreCliente;
                sql.Parameters.Add("@DireccionCliente", SqlDbType.VarChar, 50).Value = direccionCliente;

                // Ejecutar el procedimiento almacenado
                sql.ExecuteNonQuery();
            }

            // Limpiar los campos después de guardar
            txtrcliente.Text = "";
            txtnombrecliente.Text = "";
            txtdireccioncliente.Text = "";
        }




        protected void ListarCliente()
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            {
                using (SqlCommand sql = new SqlCommand("SP_ListarCliente", sqlConectar))
                {
                    sql.CommandType = CommandType.StoredProcedure;

                    sql.Connection.Open();

                    using (SqlDataReader reader = sql.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            GridViewCliente.DataSource = reader;
                            GridViewCliente.DataBind();
                        }
                    }
                }
            }
        }


        protected void GridViewCliente_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;
            GridViewRow selectedRow = GridViewCliente.Rows[index];

            // Obtén el ID del servicio que se va a eliminar
            int idCliente = Convert.ToInt32(selectedRow.Cells[0].Text);

            // Llama al procedimiento almacenado para eliminar el servicio
            EliminarServicio(idCliente);

            // Vuelve a cargar los servicios para actualizar la GridView
            ListarCliente();
        }



        private void EliminarServicio(int idCliente)
        {
            // Configura la conexión a la base de datos
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            SqlConnection sqlConectar = null;  // Declarar fuera del bloque try

            try
            {
                sqlConectar = new SqlConnection(conectar);

                // Configura y ejecuta el comando para llamar al procedimiento almacenado
                SqlCommand cmd = new SqlCommand("SP_EliminarServicio3", sqlConectar);
                cmd.CommandType = CommandType.StoredProcedure;

                // Agrega el parámetro al procedimiento almacenado
                cmd.Parameters.AddWithValue("@IdCliente", idCliente);

                // Abre la conexión y ejecuta el comando
                sqlConectar.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                // Maneja la excepción (puedes mostrar un mensaje de error o registrar el error)
                Console.WriteLine("Error al eliminar el Cliente: " + ex.Message);
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