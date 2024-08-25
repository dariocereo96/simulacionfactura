<%@ Page Title="Envio de correo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CorreoEnvio.aspx.cs" Inherits="AppWeb.CorreoEnvio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="">
            <div class="row p-4">
                <h2 class="mb-4 col-12" style="font-size:18px">ENVIAR REPORTE</h2>
                <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
                <div class="col-12 row">
                    <label for="txtDestinatario" class="form-label">Destinatarios<span style="font-size:12px;margin-left:10px"> (Ingrese las direccion separadas por coma)</span></label>
                    <asp:TextBox ID="txtDestinatario" Required="true" runat="server" CssClass="form-control" Style="width:500px;margin-left:10px" placeholder="Correo del destinatario" />
                </div>

                <div class="col-3 mt-2">
                    <label for="txtAsunto" class="form-label">Asunto</label>
                    <asp:TextBox ID="txtAsunto" Required="true" runat="server" CssClass="form-control" placeholder="Asunto del correo" />
                </div>

                <div class="col-12">
                    <label for="txtCuerpo" class="form-label mt-4">Detalle del mensaje</label>
                    <asp:TextBox ID="txtCuerpo" Required="true" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Escribe tu mensaje aquí" />
                </div>

                <div class="mb-3 mt-2">
                    <label for="fuArchivo" class="form-label">Archivo PDF</label>
                    <asp:FileUpload ID="fuArchivo" onchange="validarArchivoPDF(event)" Required="true" runat="server" CssClass="form-control" />
                </div>
                
                <div>
                  <asp:Button ID="btnEnviar" runat="server" Text="Enviar Correo" CssClass="btn btn-primary" OnClick="btnEnviar_Click" />
                </div>
            </div>
        </div>
</asp:Content>
