<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ActualizarUsuario.aspx.cs" Inherits="AppWeb.ActualizarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2 style="font-size:18px" class="my-4">Editar Usuario</h2>
        <div class="form-group mt-2">
            <asp:Label ID="lblNombreUsuario" runat="server" Text="Nombre de Usuario" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtNombreUsuario" runat="server" CssClass="form-control" required="required"></asp:TextBox>
        </div>
        <div class="form-group mt-3">
            <asp:Label ID="lblContrasena" runat="server" Text="Nueva Contraseña (Dejar en blanco para no cambiar)" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        </div>
        <div class="form-group mt-3">
            <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" required="required"></asp:TextBox>
        </div>
        <div class="form-group mt-3">
            <asp:Label ID="lblNombre" runat="server" Text="Nombre" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" required="required"></asp:TextBox>
        </div>
        <div class="form-group mt-3">
            <asp:Label ID="lblApellido" runat="server" Text="Apellido" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" required="required"></asp:TextBox>
        </div>
        <div class="form-group mt-4">
            <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CssClass="btn btn-primary" Style="margin-left:80px" OnClick="btnActualizar_Click" />
            <a href="ListarUsuarios.aspx" class="btn btn-secondary">REGRESAR</a>
        </div>
    </div>
</asp:Content>
