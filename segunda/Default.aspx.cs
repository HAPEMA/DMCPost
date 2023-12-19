using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace segunda
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void Formulario(object sender, EventArgs e)
        {
            Response.Redirect("~/GrupoTI/Vista_Formulario.aspx");
        }

        protected void EstadoServicios_Click(object sender, EventArgs e)
        {
         Response.Redirect("~/GrupoTI/Vista_EstadosServicios.aspx");

        }
        protected void EstadoServicioTecnico(object sender, EventArgs e)
        {
         Response.Redirect("~/GrupoTI/Vista_ServicioTecnicoBD.aspx");

        }
        protected void EditarServicios(object sender, EventArgs e)
        {
         Response.Redirect("~/GrupoTI/Vista_EditarServicios.aspx");

        }
    }
}