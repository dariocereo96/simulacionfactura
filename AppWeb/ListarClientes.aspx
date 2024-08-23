<%@ Page Title="Lista de clientes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarClientes.aspx.cs" Inherits="AppWeb.ListarClientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2 class="mb-4" style="font-size:20px">Listar clientes</h2>
        <asp:Label runat="server" ID="lblInfo" Style="font-size:12px;font-weight:bold"></asp:Label>
        <a href="InsertarCliente.aspx" class="btn btn-primary">Insertar Nuevo Cliente</a>
        <asp:GridView ID="gvClientes" runat="server" AutoGenerateColumns="False" DataKeyNames="ClienteID" CssClass="table table-bordered mt-4" Style="font-size:14px">
            <Columns>
                <asp:BoundField DataField="ClienteID" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="Cedula" HeaderText="Cédula" />
                <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:TemplateField HeaderText="Opciones">
                    <ItemTemplate>
                        <a href="ActualizarCliente.aspx?id=<%# Eval("ClienteID") %>" class="btn btn-success" style="font-size:14px">Editar</a>
                        <asp:Button runat="server" CommandArgument='<%# Eval("ClienteID") %>' CssClass="btn btn-danger" ID="btnEliminar" Style="font-size:14px" OnClick="btnEliminar_Click" Text="Eliminar" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        
    </div>
</asp:Content>
