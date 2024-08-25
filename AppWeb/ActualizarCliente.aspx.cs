using AppWeb.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppWeb
{
    public partial class ActualizarCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CargarCliente();
            };
         
        }

        public void CargarCliente()
        {
            try
            {
                int id = int.Parse(Request.QueryString["id"] != null ? Request.QueryString["id"] : "-1");
                ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();

                var cliente = servicio.ObtenerClienteID(id);

                if(cliente != null)
                {
                    txtNombre.Text = cliente.Nombre;
                    txtEmail.Text = cliente.Email;
                    txtCedula.Text = cliente.Cedula;
                    txtDireccion.Text = cliente.Direccion;
                    txtTelefono.Text = cliente.Telefono;
                    txtApellido.Text = cliente.Apellido;
                }
                else
                {
                    Response.Write("No se encontro el usuario");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"] != null ? Request.QueryString["id"] : "-1");

            try
            {
                ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();

                Clientes cliente = new Clientes()
                {
                    Telefono = txtTelefono.Text.Trim(),
                    Cedula = txtCedula.Text.Trim(),
                    ClienteID = id,
                    Direccion = txtDireccion.Text.Trim(),
                    Email = txtEmail.Text.Trim(),
                    Nombre = txtNombre.Text.Trim(),
                    Apellido = txtApellido.Text.Trim(),
                };

                servicio.UpdateCliente(cliente);
                Response.Redirect("ListarClientes.aspx");

            }catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}