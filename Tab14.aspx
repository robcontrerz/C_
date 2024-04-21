<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Tab14.aspx.cs" Title="AJAXRND ::: Tab Control Implementation" Inherits="TabControl" %>

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
                    <asp:ScriptManager ID="ScriptManager1" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
<%--                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>--%>

                            <table style="width: 100%">
                                <tr>
                                    <td valign="top" class="auto-style7">
                                        <div class="auto-style6">
                                            <div class="auto-style11" style="font-weight: bold">Buscar </div>
                                            <div class="auto-style13">
                                                <asp:TextBox ID="busquedabt" runat="server" Height="28px" Width="132px"></asp:TextBox>&#160;&#160;
                                                            <asp:ImageButton ID="ImageButton3" runat="server" Width="27px" OnClick="ImageButton3_Click" ImageUrl="~/img/lupa.png" /><br />
                                                <br />
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Panel ID="busqueda" runat="server" Visible="false">
                                            <div class="auto-style12">Selecciona un día </div>
                                            <div class="auto-style19">
                                                <asp:TextBox ID="TextBox1" runat="server" Height="23" Text="Inicio" Width="90" BorderColor="Silver" BorderStyle="Solid" ForeColor="Silver"></asp:TextBox>&#160;&#160;
                                                <asp:ImageButton ID="ImageButton2" runat="server" ImageAlign="Bottom" ImageUrl="~/img/calendario-att.png" Height="27px" Width="32px" /><br />
                                                <br />
                                                <cc1:CalendarExtender ID="CalendarExtender2" PopupButtonID="ImageButton2" runat="server" TargetControlID="TextBox1" Format="yyyy/MM/dd"></cc1:CalendarExtender>
                                                <asp:Button ID="busquedagrabar" runat="server" BackColor="#E1611C" BorderStyle="None" CssClass="roundCorner" Font-Bold="True" ForeColor="White" Height="38px" OnClick="busquedagrabar_Click" Text="Grabar" Width="100px" />
                                            </div>
                                        </asp:Panel>
                                    </td>
                                    <td colspan="2" class="auto-style3">
                                        <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="10" ForeColor="#148BD0" Text=""></asp:Label><br />
                                        <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="#148BD0" Text="0  hrs."></asp:Label><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" class="auto-style7">&nbsp;</td>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td class="auto-style5">

                                        <td valign="top" class="auto-style3">
                                            &nbsp;</td>
                                </tr>
                                <tr>
                                    <td valign="top" colspan="4">
                                        <div style="overflow: scroll; height: 100%">
                                            <asp:GridView runat="server" ID="busquedag" EmptyDataText="Sin registros" DataKeyNames="ID" AutoGenerateColumns="False"
                                                HeaderStyle-BackColor="Silver" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="black" GridLines="Horizontal"
                                                CssClass="Grid"
                                                CellPadding="5" Style="width: 100%" BorderColor="#CCCCCC">
                                                <Columns>
                                                    <asp:TemplateField ItemStyle-Width="20px" HeaderText="">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="FOLIO" HeaderText="Folio" ItemStyle-Width="200px" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField DataField="ASUNTO" ItemStyle-Width="200px" HeaderText="Descripción" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Analisis" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox1" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Desarrollo" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox2" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Junta" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox3" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Mantenimiento" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox4" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Seguridad" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox5" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Prueba" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox6" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Seguimiento" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox7" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <script type="text/javascript">
                                                function numbersonly(e) {
                                                    var unicode = e.charCode ? e.charCode : e.keyCode
                                                    if (unicode != 8 && unicode != 44) {
                                                        if (unicode < 48 || unicode > 57) //if not a number
                                                        { return false } //disable key press    
                                                    }
                                                }
                                            </script>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" class="auto-style7">&nbsp;</td>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td class="auto-style4">&nbsp;</td>
                                    <td valign="top" class="auto-style3">
                                </tr>
                                <tr>
                                    <td valign="top" colspan="4"></td>
                                </tr>
                                </table>

<%--                        </ContentTemplate>
                    </asp:UpdatePanel>--%>
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
