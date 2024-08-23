using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppWeb
{
    public partial class ListarUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios();
            }
           
        }

        private void CargarUsuarios()
        {
            ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();

            var usuarios = servicio.GetUsuarios(); // Obtener todos los usuarios
            gvUsuarios.DataSource = usuarios;
            gvUsuarios.DataBind();
        }

        protected void gvUsuarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int usuarioID = Convert.ToInt32(gvUsuarios.DataKeys[e.RowIndex].Value);

            ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();

            servicio.DeleteUsuario(usuarioID);

            CargarUsuarios();
        }

        protected void gvUsuarios_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            int id = int.Parse(btn.CommandArgument);

            try
            {
                ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();

                servicio.DeleteUsuario(id);

                CargarUsuarios();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
    }
}