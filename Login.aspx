<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%--<%@ Register Assembly="ASP.Web.UI.PopupControl" Namespace="ASP.Web.UI.PopupControl" TagPrefix="ASPP" %>--%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=8; IE=9" />
    <meta charset="UTF-8" />
    <title>Costos IT</title>
   
    <link rel="stylesheet" href="css/admonatt/login.css" />
    <link rel="stylesheet" href="css/admonatt/reset.css" />
    <style type="text/css">
        .modal {
            position: fixed;
            top: 0;
            left: 0;
            background-color: black;
            z-index: 99;
            opacity: 0.8;
            filter: alpha(opacity=80);
            -moz-opacity: 0.8;
            min-height: 100%;
            width: 100%;
        }

        .loading {
            font-family: Arial;
            font-size: 10pt;
            border: 5px solid #67CFF5;
            width: 100px;
            height: 100px;
            display: none;
            position: fixed;
            background-color: transparent;
            z-index: 999;
        }
    </style>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            font-family: Arial;
        }

        .modal {
            position: fixed;
            z-index: 999;
            height: 100%;
            width: 100%;
            top: 0;
            background-color: Black;
            filter: alpha(opacity=60);
            opacity: 0.6;
            -moz-opacity: 0.8;
        }

        .center {
            z-index: 1000;
            margin: 300px auto;
            padding: 10px;
            width: 130px;
            background-color: transparent;
            border-radius: 10px;
            filter: alpha(opacity=100);
            opacity: 1;
            -moz-opacity: 1;
        }

            .center img {
                height: 50px;
                width: 50px;
            }
    </style>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>



    <%--    <meta http-equiv="X-UA-Compatible" content="IE=8; IE=9" />
    <meta charset="UTF-8"/>
    <title>Administración y Logística</title>
    <link rel="stylesheet" href="css/login.css"/>--%>
    <script>
        function validar(e) {
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 8) return true;
            patron = /\d/;
            return patron.test(String.fromCharCode(tecla));
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
            <ProgressTemplate>
                <div class="modal">
                    <div class="center">
                        <img alt="" src="img/load2.gif" />
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="contieneLog">


                    <div class="logoLog"></div>

                    <h3 style="font-family: Omnes, sans-serif; font-size: 24px; font-weight: normal; font-variant: normal;">Bienvenido</h3>
                    <div class="contieneUsuario">

                        <asp:TextBox ID="txtUsuario" runat="server" OnLoad="txtUsuario_Load" placeholder="EMPLEADO"></asp:TextBox>
                        <asp:Label ID="usererr" runat="server" Text="" Font-Bold="True" Font-Size="8pt" ForeColor="Red"></asp:Label>

                    </div>
                    <div class="contienePass">
                        <asp:TextBox ID="txtContraseña" runat="server" TextMode="Password" placeholder="CONTRASEÑA"></asp:TextBox>
                        <asp:Label ID="contraerr" runat="server" Font-Bold="True" Font-Size="8pt" ForeColor="Red"></asp:Label>
                    </div>


                    <asp:Button ID="Button1" runat="server" class="btnEntrar" Text="Entrar" OnClick="Button1_Click" />
                </div>

                <div id="loading" style="position: relative; top: 50%; text-align: center;" name="loading" runat="server" visible="false">
                    <img style="vertical-align: middle" width="20" height="20" src="img/load2.gif">
                </div>

            </ContentTemplate>


        </asp:UpdatePanel>

        
    </form>
</body>
</html>
