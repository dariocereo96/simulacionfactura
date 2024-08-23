<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AppWeb.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css" />

    <style>
        body{
            background:url("https://i.pinimg.com/736x/53/f1/25/53f1252470d9f90a08d36dbd74217574.jpg");
            background-size:cover;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div style="width: 400px; margin: auto;background-color:rgba(0, 0, 0, 0.5);padding:20px 20px;margin-top:60px;border-radius:inherit">
                <div>
                    <h2 class="text-center" style="font-size: 20px; margin-top: 10px;color:#fff">INICIAR SESION</h2>
                    <asp:Label ID="lblError" runat="server" CssClass="text-danger" />
                    <div class="form-group mt-4">
                        <asp:Label ID="lblNombreUsuarioOEmail" Style="color:#fff" runat="server" Text="Nombre de Usuario o Email" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtNombreUsuarioOEmail" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                    </div>
                    <div class="form-group mt-2">
                        <asp:Label ID="lblContrasena" runat="server"  Style="color:#fff" Text="Contraseña" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control" TextMode="Password" required="required"></asp:TextBox>
                    </div>
                    <div class="text-center mt-4">
                        <asp:Button ID="btnLogin" runat="server" Text="INICIAR SESION" CssClass="btn btn-success btn-block" OnClick="btnLogin_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
