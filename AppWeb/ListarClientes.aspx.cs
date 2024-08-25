using AppWeb.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppWeb
{
    public partial class ListarClientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuarios usuario = (Usuarios)Session["usuario"];
                if (usuario.Rol.Trim().Equals("vendedor"))
                {
                    HyperLinkUsuario.Visible = true;
                }

                CargarDatos();
            }
        }

        public void CargarDatos()
        {
            ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();
            gvClientes.DataSource = servicio.ListaClientes();
            gvClientes.DataBind();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            int id = int.Parse(btn.CommandArgument);

            try
            {
                ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();

                servicio.DeleteCliente(id);

                CargarDatos();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }

        }

        protected void gvClientes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Obtén el valor de Estado
                string estado = (string)DataBinder.Eval(e.Row.DataItem, "Estado");

                // Busca los botones
                Button btnActivar = (Button)e.Row.FindControl("btnActivar");
                Button btnInactivo = (Button)e.Row.FindControl("btnDesactivar");

                // Muestra u oculta los botones según el valor de Estado
                if (estado.Trim().Equals("inactivo")) // Inactivo
                {
                    btnActivar.Visible = true;
                    btnInactivo.Visible = false;
                }
                else if (estado.Trim().Equals("activo")) // Activo
                {
                    btnActivar.Visible = false;
                    btnInactivo.Visible = true;
                }
            }

        }

        protected void btnActivar_Click(object sender, EventArgs e)
        {
            ServiceReference1.WebService1SoapClient ws = new ServiceReference1.WebService1SoapClient();

            // Obtén el botón que desencadenó el evento
            Button btnEliminar = (Button)sender;

            int idCliente = Convert.ToInt32(btnEliminar.CommandArgument);

            try
            {
                ws.ActualizarEstado(idCliente, "activo");
                Response.Redirect("ListarClientes");
            }
            catch (Exception ex)
            {
                // Manejar excepción
                Response.Write("Error: " + ex.Message);
            }
        }

        protected void btnDesactivar_Click(object sender, EventArgs e)
        {
            ServiceReference1.WebService1SoapClient ws = new ServiceReference1.WebService1SoapClient();

            // Obtén el botón que desencadenó el evento
            Button btnEliminar = (Button)sender;

            int idCliente = Convert.ToInt32(btnEliminar.CommandArgument);

            try
            {
                ws.ActualizarEstado(idCliente, "inactivo");
                Response.Redirect("ListarClientes");
            }
            catch (Exception ex)
            {
                // Manejar excepción
                Response.Write("Error: " + ex.Message);
            }

        }
    }
}