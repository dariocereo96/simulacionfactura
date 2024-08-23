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
    public partial class InsertarProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();

            Productos producto = new Productos()
            {
                Nombre = txtNombre.Text.Trim(),
                Precio = decimal.Parse(txtPrecio.Text),
                Stock = int.Parse(txtStock.Text),
                Descripcion = txtDescripcion.Text,
                Imagen = GuardarImagen(fileUpload.PostedFile)
            };

            servicio.InsertarProducto(producto);

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