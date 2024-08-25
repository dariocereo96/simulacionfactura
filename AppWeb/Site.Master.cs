using AppWeb.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppWeb
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                Usuarios usuario = (Usuarios)Session["usuario"];

                lblUsuario.Text = usuario.NombreUsuario + " | " + usuario.Rol;

                if (usuario.Rol.Trim().Equals("vendedor"))
                {
                    HyperLinkProductos.Visible = false;
                    HyperLinkUsuarios.Visible = false;
                    HyperLinkReportes.Visible = false;
                    HyperLinkEmail.Visible = false;
                }
                else if (usuario.Rol.Trim().Equals("cliente"))
                {
                    HyperLinkProductos.Visible = false;
                    HyperLinkUsuarios.Visible = false;
                    HyperLinkClientes.Visible = false;
                    HyperLinkReportes.Visible = false;
                    HyperLinkEmail.Visible = false;
                }
            }
            else
            {
                Response.Redirect("Login");
            }
        }

        protected void LinkButtonCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login");
        }
    }
}