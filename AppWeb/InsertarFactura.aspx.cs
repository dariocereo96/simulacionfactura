using AppWeb.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppWeb
{
    public partial class InsertarFactura : System.Web.UI.Page
    {
        private List<DetalleFactura> detallesFactura;

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                CargarClientes();
                CargarProductos();
                detallesFactura = new List<DetalleFactura>();
                Session["detallesFactura"] = detallesFactura;
            }
            else
            {
                detallesFactura = Session["detallesFactura"] as List<DetalleFactura>;
            }
        }

        private void CargarClientes()
        {
            ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();

            // Método que devuelve la lista de clientes activos
            var clientes = servicio.ListaClientes().Where(cli => cli.Estado.Trim().Equals("activo")).ToList();

            
            if (clientes.Count > 0)
            {
                // Crear una lista temporal para mostrar el nombre completo
                var clientesConNombreCompleto = clientes.Select(c => new
                {
                    ClienteID = c.ClienteID,
                    NombreCompleto = c.Nombre + " " + c.Apellido
                }).ToList();

                ddlClientes.DataSource = clientesConNombreCompleto;
                ddlClientes.DataTextField = "NombreCompleto";
                ddlClientes.DataValueField = "ClienteID";
                ddlClientes.DataBind();
            }
            else
            {
                ddlClientes.Items.Insert(0, new ListItem("-- NO HAY REGISTRO -- ", "0"));
            }

        }

        private void CargarProductos()
        {
            ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();
            ddlProductos.DataSource = servicio.ListarProductos();  // Método que devuelve la lista de productos
            ddlProductos.DataTextField = "Nombre";
            ddlProductos.DataValueField = "ProductoID";
            ddlProductos.DataBind();
        }

        protected void gvDetalleFactura_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EliminarProducto")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                detallesFactura.RemoveAt(index);

                ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();

                var lista = detallesFactura.Select(dt => new
                {
                    ProductoID = dt.ProductoID,
                    Cantidad = dt.Cantidad,
                    PrecioUnitario = dt.PrecioUnitario,
                    Subtotal = dt.Subtotal,
                    NombreProducto = (servicio.ObtenerProductoID((int)dt.ProductoID)).Nombre,
                }).ToList();

                gvDetalleFactura.DataSource = lista;
                gvDetalleFactura.DataBind();

                txtSubTotal.Text = CalcularSubtotal().ToString("F2");
                txtIVA.Text = CalcularIVA().ToString("F2");
                txtTotal.Text = CalcularTotalConIVA().ToString("F2");
            }
        }

        protected void btnGuardarFactura_Click(object sender, EventArgs e)
        {
            if (!detallesFactura.Any())
            {
                lblMensaje.Text = "* AGREGUE UN PRODUCTO A LA FACTURA";
                return;
            }
            else
            {
                lblMensaje.Text = string.Empty;
            }

            try { 
                int clienteID = int.Parse(ddlClientes.SelectedValue);

                if(clienteID <= 0)
                {
                    lblMensaje2.Text = "* Seleccione un cliente";
                    return;
                }

                Facturas factura = new Facturas
                {
                    ClienteID = clienteID,
                    Fecha = DateTime.Now,
                    Subtotal = CalcularSubtotal(),
                    IVA = CalcularIVA(),
                    TotalConIVA = CalcularTotalConIVA()
                };

                ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();

                List<AppWeb.ServiceReference1.DetalleFactura> detallesFacturaServicio = new List<AppWeb.ServiceReference1.DetalleFactura>();

                foreach (var detalle in detallesFactura)
                {
                    AppWeb.ServiceReference1.DetalleFactura detalleServicio = new AppWeb.ServiceReference1.DetalleFactura
                    {
                        ProductoID = detalle.ProductoID,
                        Cantidad = detalle.Cantidad,
                        PrecioUnitario = detalle.PrecioUnitario,
                        Subtotal = detalle.Subtotal
                    };

                    detallesFacturaServicio.Add(detalleServicio);
                }

                servicio.InsertFactura(factura, detallesFacturaServicio.ToArray());

                Response.Redirect("ListaFacturas");

            }catch(Exception ex)
            {
                Response.Write(ex.ToString());
            }
            
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            int productoID = int.Parse(ddlProductos.SelectedValue);
            string productoNombre = ddlProductos.SelectedItem.Text;
            int cantidad = int.Parse(txtCantidad.Text);

            ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();

            Productos producto = servicio.ObtenerProductoID(productoID);

            if (producto != null)
            {
                var detalle = new DetalleFactura
                {
                    ProductoID = productoID,
                    Cantidad = cantidad,
                    PrecioUnitario = producto.Precio,
                    Subtotal = cantidad * producto.Precio
                };

                detallesFactura.Add(detalle);
                Session["detallesFactura"] = detallesFactura;

                var lista = detallesFactura.Select(dt => new
                {
                    ProductoID = dt.ProductoID,
                    Cantidad = dt.Cantidad,
                    PrecioUnitario = dt.PrecioUnitario,
                    Subtotal = dt.Subtotal,
                    NombreProducto = (servicio.ObtenerProductoID((int)dt.ProductoID)).Nombre,
                }).ToList();

                gvDetalleFactura.DataSource = lista;
                gvDetalleFactura.DataBind();

                txtCantidad.Text = "1";

                txtSubTotal.Text = CalcularSubtotal().ToString("F2");
                txtIVA.Text = CalcularIVA().ToString("F2");
                txtTotal.Text = CalcularTotalConIVA().ToString("F2");
            }
        }

        private decimal CalcularSubtotal()
        {
            decimal subtotal = 0;
            foreach (var detalle in detallesFactura)
            {
                subtotal += detalle.Subtotal;
            }
            return subtotal;
        }

        private decimal CalcularIVA()
        {
            return CalcularSubtotal() * 0.15M;  // IVA del 15%
        }

        private decimal CalcularTotalConIVA()
        {
            return CalcularSubtotal() + CalcularIVA();
        }
    }
}