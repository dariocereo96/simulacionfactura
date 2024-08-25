using AppWeb.ServiceReference1;
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
                Usuarios usuario = (Usuarios)Session["usuario"];

                if (usuario.Rol.Trim().Equals("vendedor"))
                {
                    HyperLinkFactura.Visible = true;
                    CargarFacturas();
                }
                else if (usuario.Rol.Trim().Equals("cliente"))
                {
                    CargarFacturasCliente();
                }
                else
                {
                    CargarFacturas();
                }
            }
        }

        private void CargarFacturasCliente()
        {

            ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();
            Usuarios usuario = (Usuarios)Session["usuario"];
            Clientes cliente = servicio.ListaClientes().Where(cli => cli.UsuarioID == usuario.UsuarioID).SingleOrDefault();

            if (cliente != null) {

                var facturas = servicio.GetFacturas(); // Obtener todas las facturas


                var lista = (from f in facturas
                             where f.ClienteID == cliente.ClienteID
                             select new
                             {
                                 FacturaID = f.FacturaID,
                                 ClienteID = f.ClienteID,
                                 Fecha = f.Fecha,
                                 Subtotal = f.Subtotal,
                                 IVA = f.IVA,
                                 TotalConIVA = f.TotalConIVA,
                                 ClienteNombre = servicio.ObtenerClienteID((int)f.ClienteID).Nombre + " " + servicio.ObtenerClienteID((int)f.ClienteID).Apellido,
                                 Cedula = servicio.ObtenerClienteID((int)f.ClienteID).Cedula
                             }).ToList();

                lista.OrderByDescending(f => f.Fecha);
                gvFacturas.DataSource = lista;
                gvFacturas.DataBind();
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
                             ClienteNombre = servicio.ObtenerClienteID((int)f.ClienteID).Nombre + " " + servicio.ObtenerClienteID((int)f.ClienteID).Apellido,
                             Cedula = servicio.ObtenerClienteID((int)f.ClienteID).Cedula
                         }).ToList();

            lista.OrderByDescending(f => f.Fecha);
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

        protected void gvFacturas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Usuarios usuario = (Usuarios)Session["usuario"];
            string rol = usuario.Rol;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Busca los botones
                Button btnEliminar = (Button)e.Row.FindControl("btnEliminar");
                

                // Muestra u oculta los botones según el tipo de usuario
                if (rol.Trim().Equals("cliente"))
                {
                    btnEliminar.Visible = false;
                }
                else
                {
                    btnEliminar.Visible = true;
                }
                
            }
        }
    }
}