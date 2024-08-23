using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppWeb
{
    public partial class Detalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarDatos();
        }

        public void CargarDatos()
        {
            int idFactura = int.Parse(Request.QueryString["id"]!=null? Request.QueryString["id"]:"-1");

            ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();

            var factura = servicio.GetFactura(idFactura);

            if (factura != null)
            {
                var cliente = servicio.ObtenerClienteID((int)factura.ClienteID);

                if(cliente != null )
                {
                    txtCedula.Text = cliente.Cedula;
                    txtDireccion.Text = cliente.Direccion;
                    txtEmail.Text = cliente.Email;
                    txtNombre.Text = cliente.Nombre;
                    txtTelefono.Text = cliente.Telefono;
                }

                var detalle = servicio.GetDetalle(factura.FacturaID);

                if(detalle != null)
                {
                    var lista = detalle.Select(dt => new
                    {
                        ProductoID = dt.ProductoID,
                        Cantidad = dt.Cantidad,
                        PrecioUnitario = dt.PrecioUnitario,
                        Subtotal = dt.Subtotal,
                        NombreProducto = (servicio.ObtenerProductoID((int)dt.ProductoID)).Nombre,
                    }).ToList();

                    gvDetalleFactura.DataSource = lista;
                    gvDetalleFactura.DataBind();
                }

                txtIVA.Text = factura.IVA.ToString();
                txtSubTotal.Text = factura.Subtotal.ToString();
                txtTotal.Text = factura.TotalConIVA.ToString(); 



            }

        }
    }
}