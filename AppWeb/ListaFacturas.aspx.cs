using AppWeb.ServiceReference1;
using ServicioFactura;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppWeb
{
    public partial class ListaFacturas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarFacturas();
            }
        }

        private void CargarFacturas()
        {
            ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();
            var facturas = servicio.GetFacturas(); // Obtener todas las facturas

            var lista = (from f in  facturas
                         select new
                         {
                             FacturaID = f.FacturaID,
                             ClienteID = f.ClienteID,
                             Fecha = f.Fecha,
                             Subtotal = f.Subtotal,
                             IVA = f.IVA,
                             TotalConIVA = f.TotalConIVA,
                             ClienteNombre = servicio.ObtenerClienteID((int)f.ClienteID).Nombre,
                         }).ToList();

            lista.OrderByDescending(f => f.FacturaID);
            gvFacturas.DataSource = lista;
            gvFacturas.DataBind();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            int id = int.Parse(btn.CommandArgument);

            try
            {
                ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();

                servicio.DeleteFactura(id);

                CargarFacturas();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
    }
}