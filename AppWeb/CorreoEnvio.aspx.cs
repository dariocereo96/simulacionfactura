using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppWeb
{
    public partial class CorreoEnvio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            string destinatarios = txtDestinatario.Text.Trim();
            string asunto = txtAsunto.Text.Trim();
            string cuerpo = txtCuerpo.Text.Trim();

            // Verificar si un archivo fue seleccionado
            if (fuArchivo.HasFile)
            {
                // Verificar si el archivo es un PDF
                if (fuArchivo.PostedFile.ContentType != "application/pdf")
                {
                    Mensaje("Por favor, selecciona un archivo PDF.");
                    return;
                }
               
            }

            // Convertir la lista de destinatarios en una matriz
            string[] destinatariosArray = destinatarios.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

            // Validar y limpiar las direcciones de correo electrónico
            List<string> direccionesValidas = new List<string>();
            List<string> direccionesInvalidas = new List<string>();
            Regex regex = new Regex(@"^[^@\s]+@[^@\s]+\.[^@\s]+$"); // Expresión regular para validar el formato del correo

            foreach (string destinatario in destinatariosArray)
            {
                string trimmedDestinatario = destinatario.Trim(); // Eliminar espacios en blanco

                if (regex.IsMatch(trimmedDestinatario))
                {
                    direccionesValidas.Add(trimmedDestinatario);
                }
                else
                {
                    direccionesInvalidas.Add(trimmedDestinatario);
                }
            }

            // Informar al usuario sobre las direcciones incorrectas
            if (direccionesInvalidas.Count > 0)
            {
                lblMensaje.Text = "Las siguientes direcciones son inválidas: " + string.Join(", ", direccionesInvalidas);
                return;
            }

            // Llamar al método para enviar el correo
            bool exito = Utils.ServicioEmail.EnviarCorreo(destinatariosArray, asunto, cuerpo,fuArchivo.PostedFile);

            if (exito)
            {
                Mensaje("Correo enviado exitosamente.");
            }
            else
            {
                Mensaje("Error al enviar el correo.");
            }

        }

        public void Mensaje(string mensaje)
        {
            string script = $"alert('{mensaje}');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "MensajeAlerta", script, true);
        }
    }
}