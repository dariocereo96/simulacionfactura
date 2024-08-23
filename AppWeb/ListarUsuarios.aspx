<%@ Page Title="Listar usuario" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarUsuarios.aspx.cs" Inherits="AppWeb.ListarUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2 class="mt-4" style="font-size: 20px">Listar Usuarios</h2>
        <a href="InsertarUsuario.aspx" class="btn btn-primary my-4">Insertar Nuevo Usuario</a>

        <asp:GridView ID="gvUsuarios" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" DataKeyNames="UsuarioID" Style="font-size:14px" >
            <Columns>
                <asp:BoundField DataField="UsuarioID" HeaderText="ID" />
                <asp:BoundField DataField="NombreUsuario" HeaderText="Nombre de Usuario" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                 <asp:TemplateField HeaderText="Opciones">
                    <ItemTemplate>
                        <a href="ActualizarUsuario.aspx?id=<%# Eval("UsuarioID") %>" class="btn btn-success" style="font-size: 14px">Editar</a>
                        <asp:Button runat="server" CommandArgument='<%# Eval("UsuarioID") %>' CssClass="btn btn-danger" ID="btnEliminar" Style="font-size: 14px" OnClick="btnEliminar_Click" Text="Eliminar" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
