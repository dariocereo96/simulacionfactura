<%@ Page Title="Lista de clientes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarClientes.aspx.cs" Inherits="AppWeb.ListarClientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2 class="mb-4" style="font-size:20px">Listar clientes</h2>
        <asp:Label runat="server" ID="lblInfo" Style="font-size:12px;font-weight:bold"></asp:Label>
        <asp:HyperLink ID="HyperLinkUsuario" Visible="false" runat="server" CssClass="btn btn-primary" NavigateUrl="~/InsertarCliente">Insertar Nuevo Cliente</asp:HyperLink>
        <asp:GridView ID="gvClientes" OnRowDataBound="gvClientes_RowDataBound" runat="server" AutoGenerateColumns="False" DataKeyNames="ClienteID" CssClass="table table-bordered mt-4" Style="font-size:14px">
            <Columns>
                <asp:BoundField DataField="ClienteID" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                <asp:BoundField DataField="Cedula" HeaderText="Cedula" />
                <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" />
                <asp:TemplateField HeaderText="Opciones">
                    <ItemTemplate>
                        <a href="ActualizarCliente.aspx?id=<%# Eval("ClienteID") %>" class="btn btn-primary" style="font-size:14px">Editar</a>
                        <asp:Button runat="server" CommandArgument='<%# Eval("ClienteID") %>' CssClass="btn btn-success" ID="btnActivar" Style="font-size:14px" OnClick="btnActivar_Click" Text="Activar" />
                        <asp:Button runat="server" CommandArgument='<%# Eval("ClienteID") %>' CssClass="btn btn-danger" ID="btnDesactivar" Style="font-size:14px" OnClick="btnDesactivar_Click" Text="Desactivar" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
