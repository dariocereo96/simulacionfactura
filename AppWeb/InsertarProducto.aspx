<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InsertarProducto.aspx.cs" Inherits="AppWeb.InsertarProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <div style="width:1000px;margin:auto">
            <h2 class="mb-4" style="font-size: 18px">Insertar Producto</h2>
            <div class="form-group mt-2">
                <label for="txtNombre">Nombre</label>
                <asp:TextBox Required="true" ID="txtNombre" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group mt-2">
                <label for="fileUpload">Imagen</label>
                <asp:FileUpload ID="fileUpload" Required="true" runat="server" CssClass="form-control" onchange="previewImage(event);"/>
            </div>

            <div class="form-group mt-2">
                <asp:Image ID="imagePreview" runat="server"
                    alt="Previsualización de la imagen"
                    Style="display: none; width: 120px; height: auto;" />
            </div>

            <div class="form-group mt-2">
                <label for="txtPrecio">Precio</label>
                <asp:TextBox oninput="validarPrecio(this)" Required="true" ID="txtPrecio" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group mt-2">
                <label for="txtStock">Stock</label>
                <asp:TextBox Required="true" Min="1" Text="1" ID="txtStock" TextMode="Number" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group mt-2">
                <label for="txtDescripcion">Descripción</label>
                <asp:TextBox Required="true" ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" />
            </div>
            <div class="form-group mt-4">
                <asp:Button ID="btnInsertar" runat="server" Text="Insertar" CssClass="btn btn-primary" OnClick="btnInsertar_Click" Style="margin-left:110px"/>
                <a href="ListarProductos.aspx" class="btn btn-secondary">Cancelar</a>
            </div>
        </div>
    </div>
</asp:Content>
