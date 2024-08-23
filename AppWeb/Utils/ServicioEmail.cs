using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;

namespace AppWeb.Utils
{
    public class ServicioEmail
    {
        public static bool EnviarCorreo(string[] destinatarios, string asunto, string cuerpo, HttpPostedFile archivo)
        {
            // Configurar la información del servidor SMTP de Gmail
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com");
            smtpClient.Port = 587; // El puerto 587 es el puerto SMTP de Gmail
            smtpClient.EnableSsl = true; // Habilitar SSL para Gmail
            smtpClient.Credentials = new NetworkCredential("meplusva@gmail.com", "umribwhhnmjvfbdh"); // Tus credenciales de Gmail

            // Configurar el mensaje
            MailMessage mensaje = new MailMessage();
            mensaje.From = new MailAddress("meplusva@gmail.com"); // Tu dirección de correo de Gmail

            // Agregar múltiples destinatarios
            foreach (string destinatario in destinatarios)
            {
                string trimmedDestinatario = destinatario.Trim(); // Eliminar espacios en blanco
                if (!string.IsNullOrEmpty(trimmedDestinatario))
                {
                    mensaje.To.Add(trimmedDestinatario);
                }
            }

            mensaje.Subject = asunto;
            mensaje.Body = cuerpo;

            // Configurar si el cuerpo del mensaje es HTML (opcional)
            mensaje.IsBodyHtml = true;

            // Adjuntar el archivo PDF
            Attachment adjunto = new Attachment(archivo.InputStream,archivo.FileName);
            mensaje.Attachments.Add(adjunto);

            try
            {
                // Enviar el correo
                smtpClient.Send(mensaje);
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return false;
            }
        }
    }
}