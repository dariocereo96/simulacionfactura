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
    }
}