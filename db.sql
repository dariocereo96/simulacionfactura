USE [facturas]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 25/8/2024 9:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Cedula] [nvarchar](20) NOT NULL,
	[Direccion] [nvarchar](255) NULL,
	[Telefono] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[UsuarioID] [int] NULL,
	[Estado] [varchar](20) NULL,
	[Apellido] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 25/8/2024 9:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[DetalleID] [int] IDENTITY(1,1) NOT NULL,
	[FacturaID] [int] NULL,
	[ProductoID] [int] NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](18, 2) NOT NULL,
	[Subtotal] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DetalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 25/8/2024 9:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[FacturaID] [int] IDENTITY(1,1) NOT NULL,
	[ClienteID] [int] NULL,
	[UsuarioID] [int] NULL,
	[Fecha] [datetime] NOT NULL,
	[Subtotal] [decimal](18, 2) NOT NULL,
	[IVA] [decimal](18, 2) NOT NULL,
	[TotalConIVA] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FacturaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 25/8/2024 9:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ProductoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](255) NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[Imagen] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 25/8/2024 9:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [nvarchar](50) NOT NULL,
	[Contraseña] [nvarchar](255) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Apellido] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Rol] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Cedula], [Direccion], [Telefono], [Email], [UsuarioID], [Estado], [Apellido]) VALUES (7, N'OSCAR', N'1207340264', N'AV. AMBATO Y CASA', N'0985678458', N'oscarquispe@gmail.com', 6, N'inactivo', N'QUISPE')
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Cedula], [Direccion], [Telefono], [Email], [UsuarioID], [Estado], [Apellido]) VALUES (8, N'camilo', N'1203920392', N'quito', N'0986465465', N'camiloguaman@gmail.com', 7, N'activo', N'guaman')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleFactura] ON 

INSERT [dbo].[DetalleFactura] ([DetalleID], [FacturaID], [ProductoID], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (31, 17, 17, 3, CAST(3.80 AS Decimal(18, 2)), CAST(11.40 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([DetalleID], [FacturaID], [ProductoID], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (32, 18, 15, 2, CAST(2.30 AS Decimal(18, 2)), CAST(4.60 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[DetalleFactura] OFF
GO
SET IDENTITY_INSERT [dbo].[Facturas] ON 

INSERT [dbo].[Facturas] ([FacturaID], [ClienteID], [UsuarioID], [Fecha], [Subtotal], [IVA], [TotalConIVA]) VALUES (17, 8, NULL, CAST(N'2024-08-24T22:54:33.657' AS DateTime), CAST(11.40 AS Decimal(18, 2)), CAST(1.71 AS Decimal(18, 2)), CAST(13.11 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([FacturaID], [ClienteID], [UsuarioID], [Fecha], [Subtotal], [IVA], [TotalConIVA]) VALUES (18, 8, NULL, CAST(N'2024-08-25T09:29:10.353' AS DateTime), CAST(4.60 AS Decimal(18, 2)), CAST(0.69 AS Decimal(18, 2)), CAST(5.29 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Facturas] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (1, N'Aceite', N'Aceite La favorita', CAST(0.90 AS Decimal(18, 2)), 295, N'eddd0990-e037-43f9-8b67-5c6101b46c1a.png')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (3, N'Leche Entera', N'Leche entera pasteurizada 1L', CAST(0.90 AS Decimal(18, 2)), 300, N'd6f90565-7be7-46ca-8e5c-ba83b43f2dab.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (4, N'Pan de Molde', N'Pan de molde integral', CAST(1.50 AS Decimal(18, 2)), 120, N'4a357752-51c4-4e3e-badc-ba23f77f1cb6.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (5, N'Café Molido', N'Café molido 500g', CAST(4.75 AS Decimal(18, 2)), 79, N'bf12b69e-aa3c-483c-9055-ee5800117a53.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (6, N'Azúcar', N'Azúcar blanca refinada 1kg', CAST(1.10 AS Decimal(18, 2)), 219, N'4a0bbe7b-80d2-4725-84e0-abe34b433da0.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (7, N'Huevos', N'Docena de huevos', CAST(2.00 AS Decimal(18, 2)), 99, N'bcb33493-099f-4d8b-9bd5-a70bc608309f.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (8, N'Mantequilla', N'Mantequilla sin sal 250g', CAST(2.50 AS Decimal(18, 2)), 90, N'ff48aa23-8c2c-48f6-ab62-2bb9a60fbe31.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (9, N'Yogur Natural', N'Yogur natural 125g', CAST(0.50 AS Decimal(18, 2)), 150, N'e901fdff-1e18-4480-87dc-fd8a99a22af9.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (10, N'Cereal de Maíz', N'Cereal de maíz 500g', CAST(3.20 AS Decimal(18, 2)), 130, N'9c7748b3-e9e8-4bdc-aae3-c07eff98a98c.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (11, N'Pasta', N'Pasta tipo espagueti 500g', CAST(1.40 AS Decimal(18, 2)), 199, N'503e9bcd-c764-4f64-87a4-2aa7a161aa75.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (12, N'Atún en Lata', N'Atún en aceite de oliva 200g', CAST(2.75 AS Decimal(18, 2)), 110, N'fa050bf1-1841-4575-82e1-54170af715f8.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (13, N'Jugo de Naranja', N'Jugo de naranja 1L', CAST(1.85 AS Decimal(18, 2)), 94, N'd8f90e05-100e-45ee-8b7e-8c9341eb9f08.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (14, N'Sal', N'Sal fina de mesa 1kg', CAST(0.85 AS Decimal(18, 2)), 248, N'fade5389-9c29-497d-a5b0-8589e3bf9edb.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (15, N'Galletas de Chocolate', N'Galletas rellenas de chocolate 200g', CAST(2.30 AS Decimal(18, 2)), 136, N'b47abf72-342f-4baa-9b60-1bee4b1e0faf.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (16, N'Harina de Trigo', N'Harina de trigo 1kg', CAST(1.20 AS Decimal(18, 2)), 188, N'c695a7f4-3cf1-4791-abc4-f3b45e6966c6.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (17, N'Queso Mozzarella', N'Queso mozzarella 250g', CAST(3.80 AS Decimal(18, 2)), 67, N'3c1ebb11-d9d5-478f-b9d4-268ff7c0863d.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (18, N'Jamón Cocido', N'Jamón cocido en lonchas 200g', CAST(3.00 AS Decimal(18, 2)), 80, N'b4cf907e-9ce8-4a9a-8ef6-440201c99141.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (19, N'Tomate Frito', N'Tomate frito 350g', CAST(1.75 AS Decimal(18, 2)), 60, N'2898157e-265d-414b-8a42-0f559ed391e9.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (20, N'Detergente', N'Detergente en polvo para ropa 1kg', CAST(6.50 AS Decimal(18, 2)), 110, N'c70c916c-5433-4a16-b8ab-b5e7be4d5c9e.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (21, N'Papel Higiénico', N'Papel higiénico paquete 12 rollos', CAST(4.25 AS Decimal(18, 2)), 90, N'b723345e-e92e-4e00-9c9d-73e0eab0f771.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (22, N'Shampoo', N'Shampoo para cabello normal 400ml', CAST(3.60 AS Decimal(18, 2)), 100, N'253a462d-08ab-42d6-8644-96180a7bb4ce.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (23, N'Pasta de Dientes', N'Pasta dental con flúor 75ml', CAST(2.20 AS Decimal(18, 2)), 150, N'c20b845a-7bba-4339-b3ee-dd504c2a9e72.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (24, N'Jabón de Manos', N'Jabón líquido para manos 250ml', CAST(1.80 AS Decimal(18, 2)), 130, N'1d2690ff-9868-4ab7-aa4c-871e6ddabb42.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (25, N'Pechuga de Pollo', N'Pechuga de pollo fileteada 500g', CAST(4.90 AS Decimal(18, 2)), 50, N'c22a269a-cf12-4b40-9f4f-986e852884c6.jpeg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (26, N'Manzanas', N'Manzanas rojas 1kg', CAST(3.00 AS Decimal(18, 2)), 75, N'ad96a0d1-28e2-42c3-b77a-fede14c401c7.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (28, N'Zanahorias', N'Zanahorias frescas 1kg', CAST(1.10 AS Decimal(18, 2)), 84, N'76b41e0b-3857-4e6d-87f1-95650d65a2df.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (29, N'Cebollas', N'Cebollas blancas 1kg', CAST(1.50 AS Decimal(18, 2)), 89, N'da468309-cd87-4bc4-ba04-b13de7c8b2ac.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (34, N'JABON', N'JABON DE LAVAR ROPA', CAST(1.00 AS Decimal(18, 2)), 2, N'dbbb4547-b09b-4cb9-96b6-c0b772445149.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (36, N'COCA COLA 500mg', N'coca personal', CAST(1.00 AS Decimal(18, 2)), 5, N'd8767693-e140-4363-a0a4-d386b6298b39.jpg')
INSERT [dbo].[Productos] ([ProductoID], [Nombre], [Descripcion], [Precio], [Stock], [Imagen]) VALUES (37, N'PAN INTEGRAL', N'PAN INTEGRAL 500MG', CAST(4.50 AS Decimal(18, 2)), 5, N'fee6c5bb-9c51-4148-8a69-bde0213c72d1.jpg')
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([UsuarioID], [NombreUsuario], [Contraseña], [Nombre], [Apellido], [Email], [Rol]) VALUES (1, N'admin', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'pablo', N'cerezo', N'admin@admin.com', N'administrador')
INSERT [dbo].[Usuarios] ([UsuarioID], [NombreUsuario], [Contraseña], [Nombre], [Apellido], [Email], [Rol]) VALUES (4, N'vendedor1', N'5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', N'JUAN', N'JACOME', N'vendedor1', N'vendedor')
INSERT [dbo].[Usuarios] ([UsuarioID], [NombreUsuario], [Contraseña], [Nombre], [Apellido], [Email], [Rol]) VALUES (6, N'1207340264', N'78bbe0567465a9b92ad2f6d0a8c1f5f3eb107cd8b0ca54c332f847f4b8d0ecd9', N'OSCAR', N'QUISPE', N'oscarquispe@gmail.com', N'cliente')
INSERT [dbo].[Usuarios] ([UsuarioID], [NombreUsuario], [Contraseña], [Nombre], [Apellido], [Email], [Rol]) VALUES (7, N'1203920392', N'3c023c617b4ef954ed93e88d7313860b5af21f9b57f1f01f651c254bc54ca987', N'camilo', N'guaman', N'camiloguaman@gmail.com', N'cliente')
INSERT [dbo].[Usuarios] ([UsuarioID], [NombreUsuario], [Contraseña], [Nombre], [Apellido], [Email], [Rol]) VALUES (8, N'vendedor2', N'5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', N'OSCAR', N'SANCHEZ', N'vendedor2@gmail.com', N'vendedor')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK__DetalleFa__Factu__412EB0B6] FOREIGN KEY([FacturaID])
REFERENCES [dbo].[Facturas] ([FacturaID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK__DetalleFa__Factu__412EB0B6]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK__DetalleFa__Produ__4222D4EF] FOREIGN KEY([ProductoID])
REFERENCES [dbo].[Productos] ([ProductoID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK__DetalleFa__Produ__4222D4EF]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK__Facturas__Client__3D5E1FD2] FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Clientes] ([ClienteID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK__Facturas__Client__3D5E1FD2]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK__Facturas__Usuari__3E52440B] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuarios] ([UsuarioID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK__Facturas__Usuari__3E52440B]
GO
