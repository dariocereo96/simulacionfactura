<%@ Page Title="Insertar Cliente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InsertarCliente.aspx.cs" Inherits="AppWeb.InsertarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <div style="width: 900px; margin: auto">
            <h2 class="mb-4" style="font-size:18px">INSERTAR CLIENTE</h2>
            <div class="form-group mt-2">
                <label for="txtNombre">Nombre</label>
                <asp:TextBox Required="true" oninput="validarTexto(this)" ID="txtNombre" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group mt-2">
                <label for="txtApellido">Apellido</label>
                <asp:TextBox Required="true" oninput="validarTexto(this)" ID="txtApellido" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group mt-2">
                <label for="txtCedula">Cédula</label>
                <asp:TextBox Required="true" oninput="validarNumeroDocumento(this)" ID="txtCedula" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group mt-2">
                <label for="txtDireccion">Dirección</label>
                <asp:TextBox Required="true" ID="txtDireccion" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group mt-2">
                <label for="txtTelefono">Teléfono</label>
                <asp:TextBox Required="true" ID="txtTelefono" oninput="validarTelefono(this)" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group mt-2">
                <label for="txtEmail">Email</label>
                <asp:TextBox Required="true" ID="txtEmail" runat="server" CssClass="form-control" />
            </div>
            <div class="mt-4">
                <asp:Button ID="btnInsertar" runat="server" Text="Insertar" CssClass="btn btn-primary" OnClick="btnInsertar_Click" Style="margin-left:110px" />
                <a href="ListarClientes.aspx" class="btn btn-secondary">Regresar</a>
            </div>
        </div>
    </div>
</asp:Content>
