using AppWeb.ServiceReference1;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppWeb
{
    public partial class ActualizarProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CargarProducto();
            }
        }

        private void CargarProducto()
        {
            try
            {
                int id = int.Parse(Request.QueryString["id"] != null ? Request.QueryString["id"] : "-1");
                ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();

                var producto = servicio.ObtenerProductoID(id);

                if (producto != null)
                {
                    txtNombre.Text = producto.Nombre;
                    txtPrecio.Text = producto.Precio.ToString();
                    txtStock.Text = producto.Stock.ToString();
                    txtDescripcion.Text = producto.Descripcion;

                    string imageUrl = producto.Imagen != null ? producto.Imagen : "default.jpg";
                    imagePreview.ImageUrl = "~/imagenes/" + imageUrl; // Ruta de la imagen en el servidor
                    imagePreview.Style["display"] = "block"; // Hacer visible la imagen
                }

            }catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"] != null ? Request.QueryString["id"] : "-1");
            ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();
            Productos producto = new Productos()
            {
                Descripcion = txtDescripcion.Text.Trim(),
                Nombre = txtNombre.Text.Trim(),
                Precio = decimal.Parse(txtPrecio.Text.Trim()),
                ProductoID = id,
                Stock = int.Parse(txtStock.Text.Trim()),
                Imagen = GuardarImagen(fileUpload.PostedFile)
            };

            servicio.UpdateProducto(producto);

            Response.Redirect("ListarProductos.aspx");

        }

        public string GuardarImagen(HttpPostedFile fileUpload)
        {
            // Verificar si hay un archivo en el control de carga
            if (fileUpload != null && fileUpload.ContentLength > 0)
            {
                // Generar un nombre único para el archivo usando un UUID
                string uniqueFileName = Guid.NewGuid().ToString() + Path.GetExtension(fileUpload.FileName);

                // Definir la ruta donde se guardará el archivo
                string folderPath = Server.MapPath("~/imagenes/");
                string filePath = Path.Combine(folderPath, uniqueFileName);

                // Crear la carpeta si no existe
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                // Guardar el archivo en la carpeta
                fileUpload.SaveAs(filePath);

                // Devolver el nombre del archivo guardado
                return uniqueFileName;
            }
            else
            {
                // Si no hay archivo, devolver null o lanzar una excepción
                return null;
            }
        }
    }
}