using AppWeb.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppWeb
{
    public partial class InsertarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            // Crear un nuevo objeto Usuario
            Usuarios nuevoUsuario = new Usuarios
            {
                NombreUsuario = txtNombreUsuario.Text.Trim(),
                Contraseña = EncriptarContraseña(txtContrasena.Text.Trim()),
                Nombre = txtNombre.Text.Trim(),
                Apellido = txtApellido.Text.Trim(),
                Email = txtEmail.Text.Trim()
            };

            // Llamar al servicio para insertar el nuevo usuario
            ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();

            servicio.InsertUsuario(nuevoUsuario);

            // Redireccionar o mostrar un mensaje de éxito
            Response.Redirect("ListarUsuarios.aspx");
        }

        private string EncriptarContraseña(string contraseña)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // Convertir la cadena en bytes
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(contraseña));

                // Convertir los bytes en una cadena
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}