<%@ Page Title="Reporte de productos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReporteProductos.aspx.cs" Inherits="AppWeb.ReporteProductos" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <label style="font-size: 16px; font-weight: bold; margin-top: 10px">REPORTE DE PRODUCTOS</label>
    <div class="mt-4">
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="971px"></rsweb:ReportViewer>
    </div>
</asp:Content>
