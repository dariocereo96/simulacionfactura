<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ActualizarProducto.aspx.cs" Inherits="AppWeb.ActualizarProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2 class="mb-4" style="font-size: 18px">Actualizar Producto</h2>
        <div class="form-group">
            <label for="txtNombre">Nombre</label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group mt-2">
            <label for="fileUpload">Imagen</label>
            <asp:FileUpload ID="fileUpload" onchange="previewImage(event)" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group mt-2">
            <asp:Image ID="imagePreview" runat="server"
                alt="Previsualización de la imagen"
                Style="display: none; width: 120px; height: auto;" />
        </div>

        <div class="form-group mt-2">
            <label for="txtPrecio">Precio</label>
            <asp:TextBox ID="txtPrecio" oninput="validarPrecio(this)" Required="true" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group mt-2">
            <label for="txtStock">Stock</label>
            <asp:TextBox ID="txtStock" Min="1" Text="1" TextMode="Number" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group mt-2">
            <label for="txtDescripcion">Descripción</label>
            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" />
        </div>
        <div class="form-group mt-4">
            <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CssClass="btn btn-primary" OnClick="btnActualizar_Click" Style="margin-left:95px" />
            <a href="ListarProductos.aspx" class="btn btn-secondary">Cancelar</a>
        </div>
    </div>
</asp:Content>
