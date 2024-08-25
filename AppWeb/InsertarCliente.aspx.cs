using AppWeb.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
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
                    Apellido = txtApellido.Text.Trim(),
                };

                ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();

                // Crear un nuevo objeto Usuario para el cliente
                Usuarios nuevoUsuario = new Usuarios
                {
                    NombreUsuario = txtCedula.Text.Trim(),
                    Contraseña = EncriptarContraseña(txtCedula.Text.Trim()),
                    Nombre = txtNombre.Text.Trim(),
                    Apellido = txtApellido.Text.Trim(),
                    Email = txtEmail.Text.Trim(),
                    Rol = "cliente",
                };

                int UsuarioID = servicio.InsertUsuario(nuevoUsuario);

                cliente.Estado = "activo";
                cliente.UsuarioID = UsuarioID;

                servicio.CrearCliente(cliente);

                Response.Redirect("ListarClientes");
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }

        private string EncriptarContraseña(string contraseña)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // Convertir la cadena en bytes
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(contraseña));

                // Convertir los bytes en una cadena
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}