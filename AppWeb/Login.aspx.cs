using AppWeb.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppWeb
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string nombreUsuarioOEmail = txtNombreUsuarioOEmail.Text;
            string contrasena = txtContrasena.Text;

            ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();

            Usuarios usuario = servicio.Login(nombreUsuarioOEmail, contrasena);

            if (usuario != null)
            {
                // Autenticación exitosa, guardar información de sesión y redireccionar
                Session["Usuario"] = usuario;
                Response.Redirect("ListarClientes.aspx");
            }
            else
            {
                // Mostrar mensaje de error
                lblError.Text = "Nombre de usuario o contraseña incorrectos.";
            }
        }
    }
}