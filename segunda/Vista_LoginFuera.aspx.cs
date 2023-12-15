﻿using System;
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
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string Usuario = txtUsuario.Text.Trim();
            string Contrasena = txtContrasena.Text.Trim();

            bool UsuarioValido = ValidateCredentials(Usuario, Contrasena);
            if (UsuarioValido)
            {
                // Si las credenciales son correctas, redirige a la página de inicio
                Response.Redirect("Default.aspx");
            }
            else
            {
                // Muestra un mensaje de error si las credenciales son incorrectas
                Response.Write("Nombre de usuario o contraseña incorrectos");
            }
        }

        // Método para validar las credenciales utilizando el procedimiento almacenado
        private bool ValidateCredentials(string Usuario, string Contrasena)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("[SP_ValidarUsuario]", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Usuario", Usuario);
                    cmd.Parameters.AddWithValue("@Contrasena", Contrasena);

                    connection.Open();
                    int count = (int)cmd.ExecuteScalar();
                    connection.Close();

                    // Si count es mayor que cero, las credenciales son válidas
                    return count > 0;
                }
            }
        }
    }

}