<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarProductos.aspx.cs" Inherits="AppWeb.ListarProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2 class="mb-4" style="font-size: 20px">Listar Productos</h2>
        <a href="InsertarProducto" class="btn btn-primary">Insertar Nuevo Producto</a>
        <a href="ReporteProductos" class="btn btn-warning">Reporte de productos</a>
        <asp:GridView ID="gvProductos" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductoID" CssClass="table table-bordered mt-4" Style="font-size: 14px">
            <Columns>
                <asp:BoundField DataField="ProductoID" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:TemplateField HeaderText="Imagen">
                    <ItemTemplate>
                        <asp:Image ID="Img" runat="server" ImageUrl='<%# "~/Imagenes/" + Eval("Imagen") %>' Width="60" Height="60" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Stock" HeaderText="Stock" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                <asp:TemplateField HeaderText="Opciones">
                    <ItemTemplate>
                        <a href="ActualizarProducto.aspx?id=<%# Eval("ProductoID") %>" class="btn btn-success" style="font-size: 14px">Editar</a>
                        <asp:Button runat="server" CommandArgument='<%# Eval("ProductoID") %>' CssClass="btn btn-danger" ID="btnEliminar" Style="font-size: 14px" OnClick="btnEliminar_Click" Text="Eliminar" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
