<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Tab15.aspx.cs" Title="AJAXRND ::: Tab Control Implementation" Inherits="TabControl" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.9.1.js" type="text/javascript"></script>
    <link href="css/custom-theme/jquery-ui-1.10.1.custom.min.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-ui-1.10.1.custom.js" type="text/javascript"></script>
       <link href="css/estilosRobert.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            overflow: scroll;
            height: 200px;
            width: 100%;
        }

        .auto-style3 {
            text-align: right;
        }

        .auto-style4 {
            width: 994px;
        }

        .auto-style5 {
            width: 994px;
            text-align: right;
        }

        .auto-style6 {
            text-align: center;
        }

        .auto-style7 {
            width: 207px;
        }

        .auto-style9 {
            height: 27px;
        }

        .auto-style10 {
            text-align: left;
        }

        .auto-style11 {
            text-align: justify;
        }

        .auto-style12 {
            text-align: justify;
            font-weight: bold;
        }

        .auto-style13 {
            text-align: left;
            width: 226px;
            height: 70px;
        }

        .auto-style14 {
            width: 100%;
        }

        .auto-style16 {
            height: 77px;
        }

        .auto-style18 {
            text-align: left;
            width: 839px;
        }

        .auto-style19 {
            text-align: left;
            width: 165px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        &nbsp;&nbsp;
        <table style="width: 100%">
            <tr>
                <td>
                    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
                </td>
            </tr>
            <tr>
                <td>


                    <div style="width: 100%; height: 100%">
                        <div class="auto-style11" style="font-weight: bold">Selecciona un día </div>
                        <div class="auto-style10">
                            <asp:TextBox ID="actividaddia" runat="server" Height="23" Text="Inicio" Width="90" BorderColor="Silver" BorderStyle="Solid" ForeColor="Silver"></asp:TextBox>&#160;&#160;<asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="Bottom" ImageUrl="~/img/calendario-att.png" Height="27px" Width="27px" /><br />
                            <br />
                            <cc1:CalendarExtender ID="CalendarExtender1" PopupButtonID="ImageButton1" runat="server" TargetControlID="actividaddia" Format="yyyy/MM/dd"></cc1:CalendarExtender>
                        </div>
                    </div>
                    <fieldset>
                        <legend>Actividades</legend>
                        <asp:Button ID="Buttactividad" runat="server" Text="Grabar" OnClick="Buttactividad_Click" BackColor="#E1611C" Font-Bold="True" ForeColor="White" BorderStyle="None" CssClass="roundCorner" Height="38px" Width="100px" /><table cellpadding="0" class="style1">
                            <tr>
                                <td class="auto-style9">Usuario: </td>
                                <td class="auto-style9">
                                     <asp:TextBox ID="folio" MaxLength="11" runat="server" Text="" Width="315px"></asp:TextBox>
                                    <cc1:AutoCompleteExtender ServiceMethod="SearchCustomers"
                                        MinimumPrefixLength="5"
                                        CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                        TargetControlID="folio"
                                        ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false">
                                    </cc1:AutoCompleteExtender>

                                   </td>
                            </tr>
                            <tr>
                                <td class="auto-style9">Actividad: </td>
                                <td class="auto-style9">
                                    <%--<asp:TextBox ID="actividadx" runat="server" Text="" Width="314px"></asp:TextBox>--%>
                                    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td class="alignRight">Horas: </td>
                                <td class="alignLeft">
                                    <asp:TextBox ID="addhrs" runat="server" MaxLength="2" Width="25px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox></td>
                            </tr>
                        </table>
                        <script type="text/javascript">
                            function numbersonly(e) {
                                var unicode = e.charCode ? e.charCode : e.keyCode
                                if (unicode != 8 && unicode != 44) {
                                    if (unicode < 48 || unicode > 57) //if not a number
                                    { return false } //disable key press    
                                }
                            }
                        </script>
                    </fieldset>


                </td>
            </tr>
            <tr>
                <td>
                    <%--                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="0">
                        <ProgressTemplate>
                            &nbsp;<img src="load2.gif" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>--%>
                </td>
            </tr>
        </table>
        <br />
        &nbsp;<div>
            &nbsp;
        </div>
    </form>
</body>
</html>
