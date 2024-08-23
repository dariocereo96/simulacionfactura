<%@ Page Title="Insertar usuario" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InsertarUsuario.aspx.cs" Inherits="AppWeb.InsertarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container p-4">
        <h2 style="font-size: 18px">Registrar Nuevo Usuario</h2>
        <div>
            <div class="form-group">
                <asp:Label ID="lblNombreUsuario" runat="server" Text="Nombre de Usuario" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtNombreUsuario" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group  mt-2">
                <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group mt-2">
                <asp:Label ID="lblContrasena" runat="server" Text="Contraseña" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control" TextMode="Password" required="required"></asp:TextBox>
            </div>
            <div class="form-group mt-2 ">
                <asp:Label ID="lblNombre" oninput="validarTexto(this)" runat="server" Text="Nombre" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group  mt-2">
                <asp:Label ID="lblApellido" oninput="validarTexto(this)" runat="server" Text="Apellido" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            </div>
            
            <div class="form-group mt-4">
                <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn btn-primary" Style="margin-left: 90px" OnClick="btnRegistrar_Click" />
                <a href="ListarUsuarios.aspx" class="btn btn-secondary">REGRESAR</a>
            </div>
        </div>
    </div>
</asp:Content>
