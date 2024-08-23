using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ServicioFactura.Modelo
{
    public class FacturaDTO
    {
        public int FacturaID { get; set; }
        public int ClienteID { get; set; }
        public DateTime Fecha { get; set; }
        public decimal Subtotal { get; set; }
        public decimal IVA { get; set; }
        public decimal Total { get; set; }
        public string NombreCliente { get; set; }


    }
}