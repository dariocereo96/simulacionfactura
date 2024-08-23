using ServicioFactura.Modelo;
using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Services;

namespace ServicioFactura
{
    /// <summary>
    /// Descripción breve de WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        DataClasses1DataContext db;
        string connectionString = "Data Source=DESKTOP-5K18GIO\\SQLEXPRESS;Initial Catalog=facturas;Integrated Security=True";

        public WebService1()
        {
            db = new DataClasses1DataContext(connectionString);
        }

        // Clientes

        [WebMethod]
        public List<Clientes> ListaClientes()
        {
            var lista = (from cli in db.Clientes
                         select cli).ToList();

            return (from cli in lista
                    select new Clientes
                    {
                        ClienteID = cli.ClienteID,
                        Cedula = cli.Cedula,
                        Direccion = cli.Direccion,
                        Email = cli.Email,
                        Nombre = cli.Nombre,
                        Telefono = cli.Telefono,
                    }).ToList();

        }

        [WebMethod]
        public Clientes ObtenerClienteID(int idCliente)
        {
            var cliente = (from cli in db.Clientes
                           where cli.ClienteID == idCliente
                           select cli).FirstOrDefault();

            return new Clientes()
            {
                Nombre = cliente.Nombre,
                Cedula = cliente.Cedula,
                ClienteID = cliente.ClienteID,
                Direccion = cliente.Direccion,
                Email = cliente.Email,
                Telefono = cliente.Telefono
            };
        }

        [WebMethod]
        public void CrearCliente(Clientes cli)
        {
            db.Clientes.InsertOnSubmit(cli);
            db.SubmitChanges();
        }

        [WebMethod]
        public void UpdateCliente(Clientes cliente)
        {
            Clientes clienteBusqueda = (from c in db.Clientes
                                        where c.ClienteID == cliente.ClienteID
                                        select c).FirstOrDefault();

            if (clienteBusqueda != null)
            {
                clienteBusqueda.Nombre = cliente.Nombre;
                clienteBusqueda.Cedula = cliente.Cedula;
                clienteBusqueda.Direccion = cliente.Direccion;
                clienteBusqueda.Telefono = cliente.Telefono;
                clienteBusqueda.Email = cliente.Email;
                db.SubmitChanges();
            }

        }

        [WebMethod]
        public void DeleteCliente(int idCliente)
        {
            Clientes clienteBusqueda = (from c in db.Clientes
                                        where c.ClienteID == idCliente
                                        select c).FirstOrDefault();

            if (clienteBusqueda != null)
            {
                db.Clientes.DeleteOnSubmit(clienteBusqueda);
                db.SubmitChanges();
            }
        }

        // Productos
        [WebMethod]
        public List<Productos> ListarProductos()
        {
            var lista = (from prod in db.Productos
                         select prod).ToList();

            lista = (from prod in lista
                    select new Productos()
                    {
                        Descripcion = prod.Descripcion,
                        Nombre = prod.Nombre,
                        Precio = prod.Precio,
                        ProductoID = prod.ProductoID,
                        Stock = prod.Stock,
                        Imagen = prod.Imagen!=null ? prod.Imagen:"default.jpg",
                    }).ToList();


            lista.Count();

            return lista;
        }

        [WebMethod]
        public Productos ObtenerProductoID(int id)
        {
            var prod = (from producto in db.Productos
                        where producto.ProductoID == id
                        select producto).FirstOrDefault();

            return new Productos()
            {
                Descripcion = prod.Descripcion,
                Nombre = prod.Nombre,
                Precio = prod.Precio,
                ProductoID = prod.ProductoID,
                Stock = prod.Stock,
                Imagen = prod.Imagen,
            };
        }

        [WebMethod]
        public void InsertarProducto(Productos nuevoProducto)
        {
            db.Productos.InsertOnSubmit(nuevoProducto);
            db.SubmitChanges();
        }

        [WebMethod]
        public void UpdateProducto(Productos producto)
        {
            Productos productoBusqueda = (from prod in db.Productos
                                          where prod.ProductoID == producto.ProductoID
                                          select prod).FirstOrDefault();

            if (productoBusqueda != null)
            {
                productoBusqueda.Nombre = producto.Nombre;
                productoBusqueda.Precio = producto.Precio;
                productoBusqueda.Stock = producto.Stock;
                productoBusqueda.Descripcion = producto.Descripcion;

                if (!string.IsNullOrEmpty(producto.Imagen))
                {
                    productoBusqueda.Imagen = producto.Imagen;
                }
               

                db.SubmitChanges();
            }
        }

        [WebMethod]
        public void DeleteProducto(int id)
        {
            Productos producto = (from prod in db.Productos
                                  where prod.ProductoID == id
                                  select prod).FirstOrDefault();

            if (producto != null)
            {
                db.Productos.DeleteOnSubmit(producto);
                db.SubmitChanges();
            }
        }

        // Facturas
        [WebMethod]
        public void InsertFactura(Facturas factura, List<DetalleFactura> detalles)
        {

            db.Facturas.InsertOnSubmit(factura);
            db.SubmitChanges();

            foreach (var detalle in detalles)
            {
                detalle.FacturaID = factura.FacturaID;

                db.DetalleFactura.InsertOnSubmit(detalle);

                // Actualizar stock del producto
                var producto = db.Productos.SingleOrDefault(p => p.ProductoID == detalle.ProductoID);
                if (producto != null)
                {
                    producto.Stock -= detalle.Cantidad;
                }
            }

            db.SubmitChanges();

        }

        [WebMethod]
        public List<Facturas> GetFacturas()
        {
            var lista = (from f in db.Facturas
                         select f).ToList();

            return (from f in lista
                    select new Facturas()
                    {
                        ClienteID = f.ClienteID,
                        Fecha = f.Fecha,
                        IVA = f.IVA,
                        Subtotal = f.Subtotal,
                        TotalConIVA = f.TotalConIVA,
                        FacturaID = f.FacturaID,
                        UsuarioID = f.UsuarioID,
                    }).ToList();
        }

        [WebMethod]
        public Facturas GetFactura(int idFactura)
        {
            var facturaBusqueda = (from f in db.Facturas
                                   where f.FacturaID == idFactura
                                   select f).SingleOrDefault();

            return new Facturas()
            {
                FacturaID = facturaBusqueda.FacturaID,
                UsuarioID = facturaBusqueda.UsuarioID,
                ClienteID = facturaBusqueda.ClienteID,
                Fecha = facturaBusqueda.Fecha,
                IVA = facturaBusqueda.IVA,
                Subtotal = facturaBusqueda.Subtotal,
                TotalConIVA = facturaBusqueda.TotalConIVA,
            };

        }

        [WebMethod]
        public List<DetalleFactura> GetDetalle(int idFactura)
        {
            var lista = (from dt in db.DetalleFactura
                         where dt.FacturaID == idFactura
                         select dt).ToList();

            return (from dt in lista
                    select new DetalleFactura()
                    {
                        Subtotal = dt.Subtotal,
                        Cantidad = dt.Cantidad,
                        DetalleID = dt.DetalleID,
                        FacturaID = dt.FacturaID,
                        PrecioUnitario = dt.PrecioUnitario,
                        ProductoID = dt.ProductoID,
                    }).ToList();
        }

        [WebMethod]
        public void DeleteFactura(int facturaId)
        {

            var factura = (from fact in db.Facturas
                           where fact.FacturaID == facturaId
                           select fact).SingleOrDefault();


            if (factura != null)
            {
                var detalles = (from detalle in db.DetalleFactura
                                where detalle.FacturaID == factura.FacturaID
                                select detalle).ToList();

                // Revertir stock de productos
                foreach (var detalle in detalles)
                {
                    var producto = db.Productos.SingleOrDefault(p => p.ProductoID == detalle.ProductoID);
                    if (producto != null)
                    {
                        producto.Stock += detalle.Cantidad;
                    }
                }

                db.DetalleFactura.DeleteAllOnSubmit(detalles);
                db.Facturas.DeleteOnSubmit(factura);
                db.SubmitChanges();
            }

        }

        [WebMethod]
        public List<FacturaDTO> GetFacturaClientes()
        {
            return (from fact in db.Facturas
                    join cli in db.Clientes on fact.ClienteID equals cli.ClienteID
                    select new FacturaDTO()
                    {
                        ClienteID = (int)fact.ClienteID,
                        FacturaID = fact.FacturaID,
                        Fecha = fact.Fecha,
                        IVA = fact.IVA,
                        NombreCliente = cli.Nombre, 
                        Total = fact.TotalConIVA,
                        Subtotal = fact.Subtotal
                    }).ToList();
        }

        //Metodo Usuarios

        [WebMethod]
        public void InsertUsuario(Usuarios usuario)
        {
            db.Usuarios.InsertOnSubmit(usuario);
            db.SubmitChanges();
        }

        [WebMethod]
        public Usuarios GetUsuario(int usuarioID)
        {
         
            var usuarioBusqueda = (from usuario in db.Usuarios
                          where usuario.UsuarioID == usuarioID
                          select usuario).SingleOrDefault();

            return new Usuarios()
            {
                UsuarioID = usuarioBusqueda.UsuarioID,
                Apellido = usuarioBusqueda.Apellido,
                Contraseña = usuarioBusqueda.Contraseña,
                Nombre = usuarioBusqueda.Nombre,
                Email = usuarioBusqueda.Email,
                NombreUsuario = usuarioBusqueda.NombreUsuario
            };
           
        }

        [WebMethod]
        public List<Usuarios> GetUsuarios()
        {
           var list = (from usuario in db.Usuarios
                      select usuario).ToList();

            
            return (from usuario in list
                    select new Usuarios()
                    {
                        Apellido = usuario.Apellido,
                        Contraseña = usuario.Contraseña,
                        Email = usuario.Email,
                        Nombre = usuario.Nombre,
                        NombreUsuario = usuario.NombreUsuario,
                        UsuarioID = usuario.UsuarioID
                    }).ToList();
        }

        [WebMethod]
        public void UpdateUsuario(Usuarios usuario)
        {
          
            var usuarioExistente = db.Usuarios.SingleOrDefault(u => u.UsuarioID == usuario.UsuarioID);

            if (usuarioExistente != null)
            {
                usuarioExistente.NombreUsuario = usuario.NombreUsuario;
                usuarioExistente.Nombre = usuario.Nombre;
                usuarioExistente.Apellido = usuario.Apellido;
                usuarioExistente.Email = usuario.Email;

                if (!string.IsNullOrEmpty(usuario.Contraseña))
                {
                    usuarioExistente.Contraseña = usuario.Contraseña;
                }

                db.SubmitChanges();
            }
        }

        [WebMethod]
        public void DeleteUsuario(int usuarioID)
        {
            var usuario = db.Usuarios.SingleOrDefault(u => u.UsuarioID == usuarioID);

            if (usuario != null)
            {
                db.Usuarios.DeleteOnSubmit(usuario);
                db.SubmitChanges();
            }
            
        }

        [WebMethod]
        public Usuarios Login(string nombreUsuarioOEmail, string contrasena)
        {
            string contrasenaEncriptada = EncriptarContraseña(contrasena);

            var usuario = db.Usuarios
                .FirstOrDefault(u => (u.NombreUsuario == nombreUsuarioOEmail || u.Email == nombreUsuarioOEmail)
                                        && u.Contraseña == contrasenaEncriptada);
            if (usuario != null)
            {
                return new Usuarios()
                {
                    Apellido = usuario.Apellido,
                    Email = usuario.Email,
                    Nombre = usuario.Nombre,
                    NombreUsuario = usuario.NombreUsuario,
                    UsuarioID = usuario.UsuarioID   
                };
            }
            return null;
        }

        private string EncriptarContraseña(string contraseña)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(contraseña));
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
