<%@ Page Title="Actualizar Cliente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ActualizarCliente.aspx.cs" Inherits="AppWeb.ActualizarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <div style="width: 900px; margin: auto">
            <h2 class="mb-4" style="font-size: 16px">Actualizar Cliente</h2>
            <div class="form-group mt-2">
                <label for="txtNombre">Nombre</label>
                <asp:TextBox Required="true" ID="txtNombre" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group mt-2">
                <label for="txtNombre">Apellido</label>
                <asp:TextBox Required="true" ID="txtApellido" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group mt-2">
                <label for="txtCedula">Cédula</label>
                <asp:TextBox Required="true" ID="txtCedula" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group mt-2">
                <label for="txtDireccion">Dirección</label>
                <asp:TextBox Required="true" ID="txtDireccion" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group mt-2">
                <label for="txtTelefono">Teléfono</label>
                <asp:TextBox Required="true" ID="txtTelefono" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group mt-2">
                <label for="txtEmail">Email</label>
                <asp:TextBox Required="true" ID="txtEmail" runat="server" CssClass="form-control" />
            </div>
            <div style="margin-top: 10px">
                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CssClass="btn btn-primary" Style="margin-left: 95px" OnClick="btnActualizar_Click" />
                <a href="ListarClientes.aspx" class="btn btn-secondary">Cancelar</a>
            </div>
        </div>
    </div>
</asp:Content>
