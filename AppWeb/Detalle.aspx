<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="AppWeb.Detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4" style="width: 900px; margin: auto">
        <h2 style="font-size: 18px; margin-top: 6px; margin-bottom: 10px">DETALLES DE LA FACTURA</h2>

        <!-- Selección de Cliente -->
        <label for="ddlClientes" class="fw-bold">CLIENTE</label>
        <div class="form-group row mt-2">
            <div class="col-3">
                <label>Nombre</label>
                <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="txtNombre" />
            </div>
            <div class="col-3">
                <label>Cedula</label>
                <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="txtCedula" />
            </div>
            <div class="col-3">
                <label>Direccion</label>
                <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="txtDireccion" />
            </div>
            <div class="col-3">
                <label>Telefono</label>
                <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="txtTelefono" />
            </div>
            <div class="col-3 mt-3">
                <label>Direccion</label>
                <asp:TextBox runat="server" CssClass="form-control" ReadOnly="true" ID="txtEmail" />
            </div>
        </div>

        <!-- Tabla de Detalle de Factura -->
        <label class="fw-bold d-block mt-4">DETALLE</label>
        <asp:Label runat="server" ID="lblMensaje" CssClass="text-danger" Style="font-size: 12px; padding: 6px"></asp:Label>
        <asp:GridView ID="gvDetalleFactura" runat="server" CssClass="table table-bordered mt-2" AutoGenerateColumns="false" Style="font-size: 14px">
            <Columns>
                <asp:BoundField DataField="ProductoID" HeaderText="Codigo" />
                <asp:BoundField DataField="NombreProducto" HeaderText="Producto" />
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                <asp:BoundField DataField="PrecioUnitario" HeaderText="Precio Unitario" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" DataFormatString="{0:C}" />
            </Columns>
        </asp:GridView>

        <label class="fw-bold d-block mt-4 text-end px-4">VALOR A PAGAR</label>
        <!-- Total a pagar -->
        <div class="d-flex justify-content-end px-4">
            <div>
                <div class="form-group mt-2">
                    <label for="txtSubTotal" style="font-size: 14px">SUBTOTAL:</label>
                    <asp:TextBox ID="txtSubTotal" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group mt-2">
                    <label for="txtIVA" style="font-size: 14px">IVA 15%:</label>
                    <asp:TextBox ID="txtIVA" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group mt-2">
                    <label for="txtTotal" style="font-size: 14px">TOTAL</label>
                    <asp:TextBox ID="txtTotal" ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>

        <!-- Botón para Guardar la Factura -->
        <div class="text-end mt-4 px-4">
            <a href="ListaFacturas" class="btn btn-secondary">REGRESAR</a>
        </div>
    </div>
</asp:Content>
