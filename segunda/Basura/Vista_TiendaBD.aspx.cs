using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace segunda
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarTiendas();
            }
        }

        private void LlenarTiendas()
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            {
                using (SqlCommand cmd = new SqlCommand("SP_VerTrabajoUTIL1212", sqlConectar))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        Tienda.DataSource = dt;
                        Tienda.DataBind();
                    }
                }
            }
        }

        //protected void ButtonBuscar_Click(object sender, EventArgs e)
        //{
        //    string estatusTrabajo = TxtBuscar.Text.Trim(); // Obtener el valor del filtro desde el TextBox

        //    // Llamar al procedimiento almacenado con el parámetro
        //    DataTable resultado = ObtenerDatosConFiltro(estatusTrabajo);

        //    // Enlazar los datos al GridView
        //    Tienda.DataSource = resultado;
        //    Tienda.DataBind();
        //}

        //private DataTable ObtenerDatosConFiltro(string estatusTrabajo)
        //{
        //    string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
        //    using (SqlConnection sqlConectar = new SqlConnection(conectar))
        //    {
        //        sqlConectar.Open();
        //        DataTable GV = new DataTable();
        //        GV.Columns.AddRange(new DataColumn[]{
        //            new DataColumn("id_Tienda", typeof(int)),
        //            new DataColumn("NombreTienda", typeof(string)),
        //            new DataColumn("Direccion", typeof(string)),
        //            new DataColumn("Comuna", typeof(string)),
        //            new DataColumn("FK_IdCliente", typeof(int)) // Asegúrate de que este campo exista en tu procedimiento almacenado
        //        });

        //        using (SqlCommand cmd = new SqlCommand("ObtenerServiciosPorEstadoYTiendaUTIL", sqlConectar))
        //        {
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@EstatusTrabajo", estatusTrabajo);

        //            using (SqlDataReader dr = cmd.ExecuteReader())
        //            {
        //                while (dr.Read())
        //                {
        //                    GV.Rows.Add(
        //                        Convert.ToInt32(dr["id_Tienda"]),
        //                        dr["NombreTienda"].ToString(),
        //                        dr["Direccion"].ToString(),
        //                        dr["Comuna"].ToString(),
        //                        Convert.ToInt32(dr["FK_IdCliente"])
        //                    );
        //                }
        //            }
        //        }

        //        sqlConectar.Close();
        //        return GV;
        //    }
        //}
    }
}
