using AppWeb.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppWeb
{
    public partial class InsertarCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            try
            {
                Clientes cliente = new Clientes()
                {
                    Cedula = txtCedula.Text.Trim(),
                    Direccion = txtDireccion.Text.Trim(),
                    Email = txtEmail.Text.Trim(),   
                    Nombre = txtNombre.Text.Trim(), 
                    Telefono = txtTelefono.Text.Trim(),
                };

                ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();

                servicio.CrearCliente(cliente);
                Response.Redirect("ListarClientes");
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }
    }
}