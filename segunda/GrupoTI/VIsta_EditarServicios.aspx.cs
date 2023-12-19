using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace segunda
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Lógica para cargar la GridView al cargar la página
                LlenarClientes2();
                //LlenarTiendas();
                LlenarTiendas2();
                LlenarTipoTrabajo();  // Agregar esta línea
                LlenarEstatus();
                LlenarNombreTecnico();
                CargarServicios(0); // Cargar todos los servicios al inicio

                // Llenar el DropDownList de filtro de cliente
                LlenarClientesFiltro();

            }
        }

        protected void GridViewServicios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;
            GridViewRow selectedRow = GridViewServicios.Rows[index];

            // Obtén el ID del servicio que se va a eliminar
            int idServicio = Convert.ToInt32(selectedRow.Cells[0].Text);

            // Llama al procedimiento almacenado para eliminar el servicio
            EliminarServicio(idServicio);

            // Vuelve a cargar los servicios para actualizar la GridView
            CargarServicios(0);
        }

        //protected void ddlCliente_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    LlenarTiendas();
        //}
      
        private void EliminarServicio(int idServicio)
        {
            // Configura la conexión a la base de datos
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            SqlConnection sqlConectar = null;  // Declarar fuera del bloque try

            try
            {
                sqlConectar = new SqlConnection(conectar);

                // Configura y ejecuta el comando para llamar al procedimiento almacenado
                SqlCommand cmd = new SqlCommand("SP_EliminarServicio", sqlConectar);
                cmd.CommandType = CommandType.StoredProcedure;

                // Agrega el parámetro al procedimiento almacenado
                cmd.Parameters.AddWithValue("@IdServicio", idServicio);

                // Abre la conexión y ejecuta el comando
                sqlConectar.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                // Maneja la excepción (puedes mostrar un mensaje de error o registrar el error)
                Console.WriteLine("Error al eliminar el servicio: " + ex.Message);
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

        protected void GridViewServicios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = GridViewServicios.Rows[index];

                // Obtén el ID de la fila seleccionada y guárdalo en la variable de sesión
                veridservicio.Text = selectedRow.Cells[0].Text;
                vertecnico.Text = selectedRow.Cells[3].Text;
                string clienteValue = selectedRow.Cells[1].Text;
                // Limpia las selecciones existentes antes de seleccionar el nuevo valor
                vercliente.ClearSelection();
                // Intenta seleccionar el nuevo valor
                ListItem clienteItem = vercliente.Items.FindByText(clienteValue);
                if (clienteItem != null)
                {
                    clienteItem.Selected = true;
                }

                string tiendaValue = selectedRow.Cells[2].Text;
                // Limpia las selecciones existentes antes de seleccionar el nuevo valor
                vertienda.ClearSelection();
                // Intenta seleccionar el nuevo valor
                ListItem tiendaItem = vertienda.Items.FindByText(tiendaValue);
                if (tiendaItem != null)
                {
                    tiendaItem.Selected = true;
                }
                vertelefono1.Text = selectedRow.Cells[4].Text;
                vercorreo.Text = selectedRow.Cells[5].Text;
                verfechaa.Text = selectedRow.Cells[6].Text;
                vermotivo.Text = selectedRow.Cells[7].Text;
                TextBox1.SelectedValue = selectedRow.Cells[8].Text;

                string estatusValue = selectedRow.Cells[9].Text;
                verdescripcion.Text = selectedRow.Cells[10].Text;
                verresponsable.Text = selectedRow.Cells[11].Text;

                vertelefono2.Text = selectedRow.Cells[12].Text;


                // Ajusta según el valor esperado



                // Ajusta el índice según la posición de las columnas


                // Selecciona el valor en el DropDownList estatus
                // Limpia las selecciones existentes antes de seleccionar el nuevo valor
                verestatus.ClearSelection();
                // Intenta seleccionar el nuevo valor
                ListItem estatusItem = verestatus.Items.FindByText(estatusValue);
                if (estatusItem != null)
                {
                    estatusItem.Selected = true;
                }

                // Selecciona el valor en el DropDownList cliente
              

                // Llena las tiendas de acuerdo al cliente seleccionado
                LlenarTiendas2();

                // Selecciona el valor en el DropDownList tienda
             
            }
        }
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            // Validar que todos los campos estén llenos
            if (
                string.IsNullOrWhiteSpace(vermotivo.Text) ||
                string.IsNullOrWhiteSpace(TextBox1.SelectedValue) ||
                string.IsNullOrWhiteSpace(verresponsable.Text) ||
                string.IsNullOrWhiteSpace(verdescripcion.Text) ||
                string.IsNullOrWhiteSpace(vertienda.SelectedValue) ||
                string.IsNullOrWhiteSpace(vercliente.SelectedValue) ||
                string.IsNullOrWhiteSpace(vertecnico.Text) ||
                string.IsNullOrWhiteSpace(vertelefono1.Text) ||
                string.IsNullOrWhiteSpace(verfechaa.Text) ||
                string.IsNullOrWhiteSpace(vercorreo.Text) ||
                string.IsNullOrWhiteSpace(verestatus.SelectedValue)
            )
            {
                // Mostrar mensaje de validación en la parte superior del formulario
             
                return;
            }

            // Obtén el IdServicio desde el TextBox
            int idServicio = Convert.ToInt32(veridservicio.Text);

            // Obtén los valores actualizados desde los DropDownList
            string motivo = vermotivo.Text;
            string tipoTrabajo = TextBox1.SelectedValue; // Actualizar según el valor esperado
            string descripcion = verdescripcion.Text;
            string estatus = verestatus.SelectedValue; // Actualizar según el valor esperado
            string telefono1 = vertelefono1.Text;
            string telefono2 = vertelefono2.Text;
            string responsable = verresponsable.Text;
            DateTime fecha = DateTime.Parse(verfechaa.Text);
            string correo = vercorreo.Text;
            string tecnico = vertecnico.Text;

            // Llama al procedimiento almacenado para actualizar el servicio
            ActualizarServicio(motivo, tipoTrabajo, descripcion, estatus, telefono1, telefono2, responsable, fecha, correo, tecnico, idServicio);

            // Vuelve a cargar los servicios para actualizar la GridView
            CargarServicios(0);
            // Limpia los controles
            LimpiarControles();
            Session.Remove("SelectedRowID");
        }

        private void ActualizarServicio(string motivo, string tipoTrabajo, string descripcion, string estatus, string telefono1, string telefono2, string responsable, DateTime fecha, string correo, string tecnico, int idServicio)
        {
            // Configura la conexión a la base de datos
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            {
                // Configura y ejecuta el comando para llamar al procedimiento almacenado
                SqlCommand cmd = new SqlCommand("SP_ActualizarServicio", sqlConectar);
                cmd.CommandType = CommandType.StoredProcedure;

                // Agrega los parámetros al procedimiento almacenado
                cmd.Parameters.AddWithValue("@Motivo", motivo);
                cmd.Parameters.AddWithValue("@TipoTrabajo", tipoTrabajo);
                cmd.Parameters.AddWithValue("@Descripcion", descripcion);
                cmd.Parameters.AddWithValue("@Estatus", estatus);
                cmd.Parameters.AddWithValue("@Telefono1", telefono1);
                cmd.Parameters.AddWithValue("@Telefono2", telefono2);
                cmd.Parameters.AddWithValue("@Responsable", responsable);
                cmd.Parameters.AddWithValue("@Fecha", fecha);
                cmd.Parameters.AddWithValue("@Correo", correo);
                cmd.Parameters.AddWithValue("@IdServicio", idServicio);
                cmd.Parameters.AddWithValue("@Tecnico", tecnico);

                // Abre la conexión y ejecuta el comando
                sqlConectar.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void LimpiarControles()
        {
            vermotivo.Text = string.Empty;
            TextBox1.SelectedValue = ""; // Limpiar el DropDownList de Tipo de Trabajo
            verresponsable.Text = string.Empty;
            verdescripcion.Text = string.Empty;
            vertienda.SelectedValue = "0"; // Restablecer el DropDownList de Tienda
            vercliente.SelectedValue = "0"; // Restablecer el DropDownList de Cliente
            filtroClienteDropDown.SelectedValue = "0";   // Restablecer el DropDownList de Cliente filtro
            vertecnico.Text = string.Empty;
            vertelefono1.Text = string.Empty;
            vertelefono2.Text = string.Empty;
            verfechaa.Text = string.Empty;
            vercorreo.Text = string.Empty;
            verestatus.SelectedValue = ""; // Limpiar el DropDownList de Estatus
            veridservicio.Text = string.Empty;
        }

        protected void BuscarServicio_Click(object sender, EventArgs e)
        {
            // Lógica para buscar y cargar servicios según los filtros seleccionados
            CargarServicios(0);
        }
        protected void unnobrecualquierasoloquieroacabar(object sender, EventArgs e)
        {
            LlenarTiendas2();
        }
        protected void vercliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Llena las tiendas según el cliente seleccionado
            LlenarTiendas2();

            // Limpiar la selección de la tienda
            vertienda.SelectedValue = "0";
        }
        private void LlenarNombreTecnico()
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            {
                sqlConectar.Open();
                using (SqlCommand sql = new SqlCommand("SELECT DISTINCT NombreTecnico FROM Tecnico", sqlConectar))
                {
                    sql.CommandType = CommandType.Text;
                    vertecnico.DataSource = sql.ExecuteReader();
                    vertecnico.DataTextField = "NombreTecnico";
                    vertecnico.DataValueField = "NombreTecnico";
                    vertecnico.DataBind();
                    vertecnico.Items.Insert(0, new ListItem("Selecciona Técnico", ""));
                }
            }
        }
        private void LlenarTiendas2()
        {
            int verclienteId = Convert.ToInt32(vercliente.SelectedValue);
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            {
                sqlConectar.Open();
                using (SqlCommand sql = new SqlCommand("SELECT * FROM TiendaBD WHERE FK_IdCliente = @IdCliente", sqlConectar))
                {
                    sql.CommandType = CommandType.Text;
                    sql.Parameters.AddWithValue("@IdCliente", verclienteId);
                    vertienda.DataSource = sql.ExecuteReader();
                    vertienda.DataTextField = "NombreTienda";
                    vertienda.DataValueField = "Id_Tienda";
                    vertienda.DataBind();
                    vertienda.Items.Insert(0, new ListItem("Selecciona Tienda", "0"));
                }
            }

            // Seleccionar el valor actual de la tienda, si está disponible
            if (!string.IsNullOrEmpty(vertienda.Text))
            {
                // Intentamos seleccionar el valor actual
                ListItem tiendaItem = vertienda.Items.FindByText(vertienda.Text);
                if (tiendaItem != null)
                {
                    tiendaItem.Selected = true;
                }
                else
                {
                    // Si el valor no se encuentra, dejamos la selección en el ítem predeterminado
                    vertienda.Items.FindByValue("0").Selected = true;
                }
            }
            else
            {
                // Si el TextBox está vacío, dejamos la selección en el ítem predeterminado
                vertienda.Items.FindByValue("0").Selected = true;
            }
        }
        private void LlenarClientes2()
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            {
                sqlConectar.Open();
                using (SqlCommand sql = new SqlCommand("SELECT * FROM ClienteDMC", sqlConectar))
                {
                    sql.CommandType = CommandType.Text;
                    vercliente.DataSource = sql.ExecuteReader();
                    vercliente.DataTextField = "NombreCliente";
                    vercliente.DataValueField = "IdCliente";
                    vercliente.DataBind();
                    vercliente.Items.Insert(0, new ListItem("Selecciona Cliente", "0"));
                }
            }

            // Seleccionar el valor actual del cliente, si está disponible
            if (!string.IsNullOrEmpty(vercliente.Text))
            {
                // Intentamos seleccionar el valor actual
                ListItem clienteItem = vercliente.Items.FindByText(vercliente.Text);
                if (clienteItem != null)
                {
                    clienteItem.Selected = true;
                }
                else
                {
                    // Si el valor no se encuentra, dejamos la selección en el ítem predeterminado
                    vercliente.Items.FindByValue("0").Selected = true;
                }
            }
            else
            {
                // Si el TextBox está vacío, dejamos la selección en el ítem predeterminado
                vercliente.Items.FindByValue("0").Selected = true;
            }
        }
      
        private void LlenarEstatus()
        {
            // Llenar el DropDownList de estatus
            verestatus.Items.Add(new ListItem("Elige el Estatus", ""));
            verestatus.Items.Add(new ListItem("Realizado", "Realizado"));
            verestatus.Items.Add(new ListItem("Pendiente", "Pendiente"));

            // Seleccionar el valor actual de estatus, si está disponible
            if (!string.IsNullOrEmpty(verestatus.Text))
            {
                verestatus.Items.FindByText(verestatus.Text).Selected = true;
            }
        }
        private void LlenarTipoTrabajo()
        {
            // Llenar el DropDownList de Tipo de Trabajo
            TextBox1.Items.Add(new ListItem("Elige el Tipo de Trabajo", ""));
            TextBox1.Items.Add(new ListItem("Servicio en terreno", "Servicio en terreno"));
            TextBox1.Items.Add(new ListItem("Visita en terreno", "Visita en terreno"));
            TextBox1.Items.Add(new ListItem("Monitoreo o Calibracion", "Monitoreo o Calibracion"));

            // Seleccionar el valor actual de Tipo de Trabajo, si está disponible
            if (!string.IsNullOrEmpty(TextBox1.Text))
            {
                TextBox1.Items.FindByText(TextBox1.Text).Selected = true;
            }
        }

        // Modifica el método CargarServicios para incluir el filtro de cliente
        private void CargarServicios(int idCliente)
        {
            // Configurar la conexión a la base de datos
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            {
                // Configurar y ejecutar el procedimiento almacenado con el filtro de cliente
                SqlCommand cmd = new SqlCommand("SP_EditarServicioVerTablas", sqlConectar);
                cmd.CommandType = CommandType.StoredProcedure;

                // Agregar el parámetro del cliente al procedimiento almacenado
                cmd.Parameters.AddWithValue("@IdCliente", idCliente);

                // Abrir la conexión y ejecutar el comando
                sqlConectar.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                // Asignar los resultados a la GridView
                GridViewServicios.DataSource = reader;
                GridViewServicios.DataBind();

                // Cerrar la conexión y el lector
                reader.Close();
                sqlConectar.Close();
            }
        }

        // Nuevo método para manejar el evento de cambio en el DropDownList de filtro de cliente
        protected void FiltrarPorCliente(object sender, EventArgs e)
        {
            // Obtener el ID del cliente seleccionado en el DropDownList de filtro de cliente
            int idCliente = Convert.ToInt32(filtroClienteDropDown.SelectedValue);

            // Volver a cargar los servicios con el filtro de cliente
            CargarServicios(idCliente);
        }

        // Nuevo método para llenar el DropDownList de filtro de cliente
        private void LlenarClientesFiltro()
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            {
                sqlConectar.Open();
                using (SqlCommand sql = new SqlCommand("SELECT * FROM ClienteDMC", sqlConectar))
                {
                    sql.CommandType = CommandType.Text;
                    filtroClienteDropDown.DataSource = sql.ExecuteReader();
                    filtroClienteDropDown.DataTextField = "NombreCliente";
                    filtroClienteDropDown.DataValueField = "IdCliente";
                    filtroClienteDropDown.DataBind();
                    filtroClienteDropDown.Items.Insert(0, new ListItem("Todos los Clientes", "0"));
                }
            }
        }

    }
}


//private void LlenarTiendas()
//{
//    int IdCliente = Convert.ToInt32(ddlCliente.SelectedValue);
//    string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
//    using (SqlConnection sqlConectar = new SqlConnection(conectar))
//    {
//        sqlConectar.Open();
//        using (SqlCommand sql = new SqlCommand("SELECT * FROM TiendaBD WHERE FK_IdCliente = @IdCliente", sqlConectar))
//        {
//            sql.CommandType = CommandType.Text;
//            sql.Parameters.AddWithValue("@IdCliente", IdCliente);
//            DropDownListTienda.DataSource = sql.ExecuteReader();
//            DropDownListTienda.DataTextField = "NombreTienda";
//            DropDownListTienda.DataValueField = "Id_Tienda";
//            DropDownListTienda.DataBind();
//            DropDownListTienda.Items.Insert(0, new ListItem("Selecciona Tienda", "0"));
//        }
//    }

//    if (!string.IsNullOrEmpty(vertienda.Text))
//    {
//        // Intentamos seleccionar el valor actual
//        ListItem tiendaItem = DropDownListTienda.Items.FindByText(vertienda.Text);
//        if (tiendaItem != null)
//        {
//            tiendaItem.Selected = true;
//        }
//        else
//        {
//            DropDownListTienda.Items.FindByValue("0").Selected = true;
//        }
//    }
//    else
//    {
//        DropDownListTienda.Items.FindByValue("0").Selected = true;
//    }
//}
