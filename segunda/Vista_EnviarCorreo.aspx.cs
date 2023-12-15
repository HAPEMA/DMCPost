using System;
using System.Net;
using System.Net.Mail;
using System.Web.UI;

namespace segunda
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviarCorreo_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage mensaje = new MailMessage();
                mensaje.From = new MailAddress("haroldorlandop@gmail.com");
                mensaje.To.Add(new MailAddress("haroldperalta60@gmail.com"));
                mensaje.Subject = "Asunto del correo";
                mensaje.Body = "Cuerpo del correo electrónico";

                SmtpClient clienteSmtp = new SmtpClient("smtp.gmail.com");
                clienteSmtp.Port = 587;
                clienteSmtp.Credentials = new NetworkCredential("haroldorlandop@gmail.com", "Haroldmartes1212");
                clienteSmtp.EnableSsl = true;

                clienteSmtp.Send(mensaje);

                Response.Write("Correo enviado exitosamente.");
            }
            catch (Exception ex)
            {
                Response.Write("Error al enviar el correo: " + ex.Message);
            }
        }

    }
}
