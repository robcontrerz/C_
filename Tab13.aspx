<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Tab13.aspx.cs" Title="AJAXRND ::: Tab Control Implementation" Inherits="TabControl" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.9.1.js" type="text/javascript"></script>
    <link href="css/custom-theme/jquery-ui-1.10.1.custom.min.css" rel="stylesheet" type="text/css" />
     <link href="css/estilosRobert.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-ui-1.10.1.custom.js" type="text/javascript"></script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style3 {
            text-align: right;
        }

        .auto-style4 {
            width: 994px;
        }

        .auto-style6 {
            text-align: center;
        }

        .auto-style10 {
            text-align: left;
        }

        .auto-style11 {
            text-align: justify;
            width: 173px;
        }

        .auto-style20 {
            width: 418px;
        }
    
        .auto-style5 {
            width: 994px;
            text-align: right;
        }

        </style>
       <script src="scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
 
 

<%--    <script language="javascript" type="text/javascript">

        $(document).ready(function () {

            $("#<%=gvLeft.ClientID%> [id*='TBox1']").change(function () {

                var tr = $(this).parent().parent();
                var precio = $("td:eq(1)", tr).html();

                $("td:eq(3) span", tr).html($(this).val() * precio);

                CalcularTotal();

            });

        });

        //calculo total grid paginado
        function CalcularTotal() {

            var total = 0;
            $("#<%=gvLeft.ClientID%> [id*='TBox1']").each(function () {

                var coltotal = parseFloat($(this).html());

                if (!isNaN(coltotal)) {
                    total += coltotal;
                }

            });

            $("#<%=hORASLBL.ClientID%>").html(total);

        }--%>
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
                                    <td valign="top" class="auto-style20">
                                        <div class="auto-style6">
                                            <div class="auto-style11" style="font-weight: bold">Selecciona un día.. </div>
                                            <div class="auto-style10">
                                                <asp:TextBox ID="inicioTabla" runat="server" Height="23px" Text="Inicio" Width="90px" BorderColor="Silver" BorderStyle="Solid" ForeColor="Silver" OnTextChanged="imgPopup_Click"></asp:TextBox>&#160;&#160;<asp:ImageButton ID="imgPopup" runat="server" ImageAlign="Bottom" ImageUrl="~/img/Calendarblue.PNG" Height="27px" Width="27px" OnClick="imgPopup_Click" /><br />
                                                <br />
                                                <cc1:CalendarExtender ID="Calendar1" PopupButtonID="imgPopup" runat="server" TargetControlID="inicioTabla" Format="yyyy/MM/dd" BehaviorID="_content_Calendar1"></cc1:CalendarExtender>
                                            </div>
                                        </div>
                                    </td>
                                    <td></td>
                                    <td colspan="2" class="auto-style3">
                                        <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Size="10pt" ForeColor="#148BD0"></asp:Label><br />
                                        <asp:Label ID="hORASLBL" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="#148BD0" Text="0  hrs."></asp:Label><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" class="auto-style20">&nbsp;</td>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td class="auto-style5">
                                        <asp:Button runat="server" ID="cmdLeft" Text="Eliminar" OnClick="cmdLeft_Click" BackColor="#148BD0" Font-Bold="True" ForeColor="White" CssClass="roundCorner" Height="38px" Width="100px" Visible="False" /></td>
                                    <td valign="top" class="auto-style3">
                                        <asp:Button runat="server" ID="cmdUpdate" Text="Grabar" BackColor="#E1611C" OnClick="cmdUpdate_Click" Font-Bold="True" ForeColor="White" BorderStyle="None" CssClass="roundCorner" Height="38px" Width="100px" OnClientClick="cmdUpdate_Click" /></td>
                                </tr>
                                <tr>
                                    <td valign="top" colspan="4">
                                        <div>
                                            <asp:GridView runat="server" ID="gvLeft" DataKeyNames="ID" EmptyDataText="Sin registros"
                                                AutoGenerateColumns="False" EnableTheming="False" Height="100%" CssClass="Grid" 
                                                CellPadding="10" GridLines="Horizontal" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            <asp:Label ID="chkAll" runat="server" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chk" runat="server"
                                                                AutoPostBack="false" Width="20px"/>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="FOLIO" HeaderText="Folio">
                                                        <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ASUNTO" HeaderText="Descripción">
                                                        <HeaderStyle HorizontalAlign="Left" Wrap="true" />
                                                        <ItemStyle HorizontalAlign="Left" Width="100px"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="Analisis">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox1" runat="server"  MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Desarrollo">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox2" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Junta">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox3" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Mantenimiento">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox4" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Seguridad">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox5" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Prueba">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox6" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Seguimiento">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox7" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle BackColor="Silver" Font-Bold="True" ForeColor="#333333"></HeaderStyle>
                                            </asp:GridView>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" class="auto-style20">&nbsp;</td>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td class="auto-style4">&nbsp;</td>
                                    <td valign="top" class="auto-style3">&#160;</td>
                                </tr>
                                <tr>
                                    <td valign="top" colspan="4">
                                        <div style="overflow: scroll; height: 100%; width: 100%;">
                                            <script type="text/javascript">
                                                function numbersonly(e) {
                                                    var unicode = e.charCode ? e.charCode : e.keyCode
                                                    if (unicode != 8 && unicode != 44) {
                                                        if (unicode < 48 || unicode > 57) //if not a number
                                                        { return false } //disable key press    
                                                    }
                                                }
                                            </script>
                                            <script type="text/javascript">
                                                function agregar_numero() {

                                                    var TextBox1 = parseFloat(document.getElementById("TBox1").value);
                                                    var TextBox2 = parseFloat(document.getElementById("TBox2").value);
                                                    var TextBox3 = parseFloat(document.getElementById("TBox3").value.replace(/\,/g, '')) || 0;
                                                    var result = TextBox1 + TextBox2 + TextBox3;
                                                    result.toFixed(2);
                                                    document.getElementById("hORASLBL").value = result;
                                                    format(document.getElementById("hORASLBL"));
                                                }
</script>

                                        </div>
                                    </td>
                                </tr>
                                </table>

     <%--                   </ContentTemplate>
                    </asp:UpdatePanel>--%>
                </td>
            </tr>
            <tr>
                <td>
<%--                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" >
                        <ProgressTemplate>
                            <div id="loading" style="position: relative; top: 50%; text-align: center;" name="loading" runat="server" visible="false">
                                <img style="vertical-align: middle" width="20" height="20" src="img/load2.gif">
                            </div>
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
