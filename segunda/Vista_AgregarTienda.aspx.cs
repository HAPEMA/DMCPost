using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace segunda
{
    public partial class WebForm7 : System.Web.UI.Page
    {

        protected void volveracasa(object sender, EventArgs e)
        {
            Response.Redirect("WebForm11.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropCliente();
                ListarTienda();
            }
        }

        protected void DropCliente()
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conectar))
            {
                ddlCliente.Items.Add(new ListItem("--Seleccionar Cliente--", ""));
                ddlCliente.AppendDataBoundItems = true;
                String strQuery = "SELECT IdCliente, NombreCliente FROM ClienteDMC";
                SqlCommand cmd = new SqlCommand(strQuery, con);

                try
                {
                    con.Open();
                    ddlCliente.DataSource = cmd.ExecuteReader();
                    ddlCliente.DataTextField = "NombreCliente";
                    ddlCliente.DataValueField = "IdCliente";
                    ddlCliente.DataBind();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        protected void ddlCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            String strQuery = "SELECT IdCliente FROM ClienteDMC WHERE IdCliente = @IdCliente";

            using (SqlConnection con = new SqlConnection(conectar))
            using (SqlCommand sql = new SqlCommand(strQuery, con))
            {
                sql.Parameters.AddWithValue("@IdCliente", ddlCliente.SelectedItem.Value);

                try
                {
                    con.Open();
                    SqlDataReader sdr = sql.ExecuteReader();
                    while (sdr.Read())
                    {
                        labelid.Text = sdr["IdCliente"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        protected void Guardar_Click(object sender, EventArgs e)
        {
            // Validar que todos los campos estén llenos
            if (
                string.IsNullOrWhiteSpace(txttienda.Text) ||
                string.IsNullOrWhiteSpace(txtdireccion.Text) ||
                string.IsNullOrWhiteSpace(txtcomuna.Text) ||
                string.IsNullOrWhiteSpace(ddlCliente.Text)
            )
            {
                Mensaje.Text = "Todos los campos deben llenarse para agregar una tienda.";
                return;
            }

            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            using (SqlCommand sql = new SqlCommand("AgregarclienteUTIL", sqlConectar))
            {
                sqlConectar.Open();
                sql.CommandType = CommandType.StoredProcedure;
                sql.Parameters.Add("@NombreTienda", SqlDbType.VarChar, 50).Value = txttienda.Text;
                sql.Parameters.Add("@Direccion", SqlDbType.VarChar, 50).Value = txtdireccion.Text;
                sql.Parameters.Add("@Comuna", SqlDbType.VarChar, 15).Value = txtcomuna.Text;
                sql.Parameters.Add("@FK_IdCliente", SqlDbType.Int).Value = Convert.ToInt32(labelid.Text);

                // Obtén el nuevo Id_Tienda
                int nuevoIdTienda = Convert.ToInt32(sql.ExecuteScalar());
                Mensaje.Text = "Tienda agregada con ID: " + nuevoIdTienda;

                // Limpia los campos después de agregar
                txttienda.Text = "";
                txtdireccion.Text = "";
                txtcomuna.Text = "";
                // Puedes seguir limpiando otros campos según sea necesario
            }
        }








        protected void ListarTienda()
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            {
                using (SqlCommand sql = new SqlCommand("SP_ListarTiendaConCliente", sqlConectar))
                {
                    sql.CommandType = CommandType.StoredProcedure;

                    sql.Connection.Open();

                    using (SqlDataReader reader = sql.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            GridViewTienda.DataSource = reader;
                            GridViewTienda.DataBind();
                        }
                    }
                }
            }
        }


        protected void GridViewTienda_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;
            GridViewRow selectedRow = GridViewTienda.Rows[index];

            // Obtén el ID del servicio que se va a eliminar
            int idTienda = Convert.ToInt32(selectedRow.Cells[0].Text);

            // Llama al procedimiento almacenado para eliminar el servicio
            EliminarServicio(idTienda);

            // Vuelve a cargar los servicios para actualizar la GridView
            ListarTienda();
        }



        private void EliminarServicio(int idTienda)
        {
            // Configura la conexión a la base de datos
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            SqlConnection sqlConectar = null;  // Declarar fuera del bloque try

            try
            {
                sqlConectar = new SqlConnection(conectar);

                // Configura y ejecuta el comando para llamar al procedimiento almacenado
                SqlCommand cmd = new SqlCommand("SP_EliminarServicio4", sqlConectar);
                cmd.CommandType = CommandType.StoredProcedure;

                // Agrega el parámetro al procedimiento almacenado
                cmd.Parameters.AddWithValue("@IdTienda", idTienda);

                // Abre la conexión y ejecuta el comando
                sqlConectar.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                // Maneja la excepción (puedes mostrar un mensaje de error o registrar el error)
                Console.WriteLine("Error al eliminar el Tienda: " + ex.Message);
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
