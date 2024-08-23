<%@ Page Title="Insertar Factura" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InsertarFactura.aspx.cs" Inherits="AppWeb.InsertarFactura" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4" style="width: 900px; margin: auto">
        <h2 style="font-size: 18px; margin-top: 6px; margin-bottom: 10px">Insertar Factura</h2>

        <!-- Selección de Cliente -->
        <div class="form-group row">
            <label for="ddlClientes" class="fw-bold">CLIENTE</label>
            <div class="col-12 row px-4 mt-2">
                <asp:DropDownList ID="ddlClientes" runat="server" CssClass="form-control w-100"></asp:DropDownList>
            </div>
        </div>

        <!-- Selección de Productos -->
        <label class="fw-bold d-block mt-4">ITEM</label>
        <div class="row">
            <div class="form-group col-4">
                <label for="ddlProductos">Producto:</label>
                <asp:DropDownList ID="ddlProductos" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="form-group col-4">
                <label for="txtCantidad">Cantidad:</label>
                <asp:TextBox ID="txtCantidad" Min="1" Text="1" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group col-4 mt-4">
                <asp:Button ID="btnAgregarProducto" Style="font-size: 12px" runat="server" Text="AGREGAR PRODUCTO" CssClass="btn btn-warning" OnClick="btnAgregarProducto_Click" />
            </div>
        </div>

        <!-- Tabla de Detalle de Factura -->
        <label class="fw-bold d-block mt-4">DETALLE</label>
        <asp:Label runat="server" ID="lblMensaje" CssClass="text-danger" Style="font-size: 12px; padding: 6px"></asp:Label>
        <asp:GridView ID="gvDetalleFactura" runat="server" CssClass="table table-bordered mt-2" AutoGenerateColumns="false" Style="font-size: 14px" OnRowCommand="gvDetalleFactura_RowCommand">
            <Columns>
                <asp:BoundField DataField="ProductoID" HeaderText="Codigo" />
                <asp:BoundField DataField="NombreProducto" HeaderText="Producto" />
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                <asp:BoundField DataField="PrecioUnitario" HeaderText="Precio Unitario" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" DataFormatString="{0:C}" />
                <asp:ButtonField ButtonType="Button" Text="REMOVER" CommandName="EliminarProducto" />
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
            <asp:Button ID="btnGuardarFactura" runat="server" Text="Guardar Factura" CssClass="btn btn-success" OnClick="btnGuardarFactura_Click" />
            <a href="ListaFacturas" class="btn btn-secondary">Cancelar</a>
        </div>
    </div>
</asp:Content>
