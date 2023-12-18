using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Element;
using iText.Html2pdf;
using iText.IO.Image;


namespace segunda
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Tecnico"] != null && Session["Cliente"] != null && Session["Tienda"] != null && Session["Correo"] != null && Session["Fecha"] != null && Session["Motivo"] != null && Session["TipoTrabajo"] != null && Session["Estado"] != null && Session["Descripcion"] != null && Session["Responsable"] != null && Session["Telefono"] != null && Session["Telefonor"] != null)
            {
                string tecnico = Session["Tecnico"].ToString();
                string cliente = Session["Cliente"].ToString();
                string tienda = Session["Tienda"].ToString();
                string correo = Session["Correo"].ToString();
                string fecha = Session["Fecha"].ToString();
                string motivo = Session["Motivo"].ToString();
                string tipoTrabajo = Session["TipoTrabajo"].ToString();
                string estado = Session["Estado"].ToString();
                string descripcion = Session["Descripcion"].ToString();
                string responsable = Session["Responsable"].ToString();
                string telefono = Session["Telefono"].ToString();
                string Telefonor = Session["Telefonor"].ToString();

                // Crear una tabla con los datos
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[12] {
                new DataColumn("Tecnico", typeof(string)),
                new DataColumn("Cliente", typeof(string)),
                new DataColumn("Tienda", typeof(string)),
                new DataColumn("Correo", typeof(string)),
                new DataColumn("Fecha", typeof(string)),
                new DataColumn("Motivo", typeof(string)),
                new DataColumn("TipoTrabajo", typeof(string)),
                new DataColumn("Estado", typeof(string)),
                new DataColumn("Descripcion", typeof(string)),
                new DataColumn("Responsable", typeof(string)),
                new DataColumn("Telefono", typeof(string)),
                new DataColumn("Telefonor", typeof(string))
            });

                // Agregar una fila con los datos a la tabla
                dt.Rows.Add(tecnico, cliente, tienda, correo, fecha, motivo, tipoTrabajo, estado, descripcion, responsable, telefono, Telefonor);

                // Asignar la tabla al GridView
                GViewDatos.DataSource = dt;
                GViewDatos.DataBind();


            }
        }

        protected void Descargar_Click(object sender, EventArgs e)
        {

        }


        public override void VerifyRenderingInServerForm(Control control)
        {
            // Este método es necesario para permitir el renderizado de la página
            // incluso si no está dentro de un formulario
        }
    }
}