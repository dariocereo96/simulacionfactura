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
    public partial class ActualizarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuario();
            }            
        }

        private void CargarUsuario()
        {
            // Cargar datos del usuario a editar
            int usuarioID = Convert.ToInt32(Request.QueryString["id"]);

            ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();

            Usuarios usuario = servicio.GetUsuario(usuarioID);

            txtNombreUsuario.Text = usuario.NombreUsuario;
            txtNombre.Text = usuario.Nombre;
            txtApellido.Text = usuario.Apellido;
            txtEmail.Text = usuario.Email;
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                
                int usuarioID = Convert.ToInt32(Request.QueryString["id"]);

                
                Usuarios usuarioActualizado = new Usuarios
                {
                    UsuarioID = usuarioID,
                    NombreUsuario = txtNombreUsuario.Text,
                    Nombre = txtNombre.Text,
                    Apellido = txtApellido.Text,
                    Email = txtEmail.Text
                };

                if (!string.IsNullOrEmpty(txtContrasena.Text))
                {
                    usuarioActualizado.Contraseña = EncriptarContraseña(txtContrasena.Text);
                }

                ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();
                servicio.UpdateUsuario(usuarioActualizado);

                
                Response.Redirect("ListarUsuarios.aspx");
            }
        }

        private string EncriptarContraseña(string contraseña)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(contraseña));
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