<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaFacturas.aspx.cs" Inherits="AppWeb.ListaFacturas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2 style="font-size: 20px">Lista de Facturas</h2>
        <a href="InsertarFactura.aspx" class="btn btn-primary mt-2">Insertar Nuevo Factura</a>
        <asp:GridView ID="gvFacturas" runat="server" CssClass="table table-bordered mt-4" Style="font-size: 14px" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="FacturaID" HeaderText="Codigo" />
                <asp:BoundField DataField="ClienteNombre" HeaderText="Cliente" />
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" DataFormatString="{0:C}" />
                <asp:BoundField DataField="IVA" HeaderText="IVA" DataFormatString="{0:C}" />
                <asp:BoundField DataField="TotalConIVA" HeaderText="Total" DataFormatString="{0:C}" />
                 <asp:TemplateField HeaderText="Opciones">
                    <ItemTemplate>
                        <a href="Detalle.aspx?id=<%# Eval("FacturaID") %>" class="btn btn-success" style="font-size: 14px">DETALLE</a>
                        <asp:Button runat="server" CommandArgument='<%# Eval("FacturaID") %>' CssClass="btn btn-danger" ID="btnEliminar" Style="font-size: 14px" OnClick="btnEliminar_Click" Text="ELIMINAR" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
