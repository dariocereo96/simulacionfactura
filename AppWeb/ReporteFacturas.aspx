<%@ Page Title="Reporte de factura" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReporteFacturas.aspx.cs" Inherits="AppWeb.ReporteFacturas" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <label style="font-size:16px;font-weight:bold;margin-top:10px">REPORTE DE FACTURAS</label>
    <div class="mt-4">
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Style="width:800px;margin:auto;height:100vh"></rsweb:ReportViewer>
    </div>
</asp:Content>
