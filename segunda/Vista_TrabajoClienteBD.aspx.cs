using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

namespace segunda
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cliente();
            }
        }

        private void Cliente()
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            {
                using (SqlCommand cmd = new SqlCommand("ObtenerServiciosPorEstadoYTiendaUTIL", sqlConectar))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    sqlConectar.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        DataTable GV = new DataTable();
                        GV.Columns.AddRange(new DataColumn[]{
                            new DataColumn("idCliente", typeof(int)),
                            new DataColumn("NombreCliente", typeof(string))
                        });

                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                GV.Rows.Add(
                                    Convert.ToInt32(dr["idCliente"]),
                                    dr["NombreCliente"].ToString()
                                );
                            }
                        }

                        Clientes.DataSource = GV;
                        Clientes.DataBind();
                    }
                }
            }
        }
    }
}
