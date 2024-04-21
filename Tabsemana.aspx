<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Tabsemana.aspx.cs" Title="Asignados" Inherits="Tabsemana" %>

<%--<%@ Register Assembly="Infragistics4.Web.v12.2, Version=12.2.20122.2257, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.Web.UI.GridControls" TagPrefix="ig" %>--%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.9.1.js" type="text/javascript"></script>
    <link href="css/custom-theme/jquery-ui-1.10.1.custom.min.css" rel="stylesheet" type="text/css" />
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
            text-align: left;
            width: 173px;
        }

        .auto-style20 {
            width: 418px;
        }

        .auto-style5 {
            width: 994px;
            text-align: right;
        }

        .auto-style21 {
            width: 10%;
        }

        .auto-style28 {
            width: 14%;
        }

        .auto-style29 {
            width: 12%;
        }

        .auto-style32 {
            width: 7%;
        }

        .auto-style33 {
            width: 9%;
        }

        .auto-style34 {
            width: 8%;
        }
        .auto-style35 {
            width: 48%;
        }
    </style>

     <link href="css/web.css" rel="stylesheet" />
    <script type="text/javascript" src="js/gridviewscroll.js"></script>
    <script type="text/javascript">
        var gridViewScroll = null;
        window.onload = function () {
            gridViewScroll = new GridViewScroll({
                elementID: "gvLeft",
                width: 900,
                height: 550,
                freezeColumn: true,
                freezeFooter: false,
                freezeColumnCssClass: "GridViewScrollItemFreeze",
                freezeFooterCssClass: "GridViewScrollFooterFreeze",
                freezeHeaderRowCount: 1,
                freezeColumnCount: 1,
                onscroll: function (scrollTop, scrollLeft) {
                    console.log(scrollTop + " - " + scrollLeft);
                }
            });
            gridViewScroll.enhance();
        }
        function getScrollPosition() {
            var position = gridViewScroll.scrollPosition;
            alert("scrollTop: " + position.scrollTop + ", scrollLeft: " + position.scrollLeft);
        }
        function setScrollPosition() {
            var scrollPosition = { scrollTop: 50, scrollLeft: 50 };

            gridViewScroll.scrollPosition = scrollPosition;
        }
    </script>

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
                                    <div class="auto-style11" style="font-weight: bold">Selecciona una semana.. </div>
                                    <div class="auto-style10">
                                        <asp:TextBox ID="inicioTabla" runat="server" Height="23px" Text="Inicio" Width="90px" BorderColor="Silver" BorderStyle="Solid" ForeColor="Silver" OnTextChanged="imgPopup_Click"></asp:TextBox>&#160;&#160;<asp:ImageButton ID="imgPopup" runat="server" ImageAlign="Bottom" ImageUrl="~/img/Calendargrey.PNG" Height="27px" Width="27px" OnClick="imgPopup_Click" /><br />
                                        <br />
                                        <cc1:CalendarExtender ID="Calendar1" PopupButtonID="imgPopup" runat="server" TargetControlID="inicioTabla" Format="yyyy/MM/dd" BehaviorID="_content_Calendar1"></cc1:CalendarExtender>
                                    </div>
                                </div>
                            </td>
                            <td colspan="7"></td>
                            <td colspan="2" class="auto-style3">
                                <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Size="10pt" ForeColor="#148BD0"></asp:Label><br />
                                <asp:Label ID="hORASLBL" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="#148BD0" Text="0  hrs."></asp:Label><br />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="auto-style20">&nbsp;</td>
                            <td class="auto-style1" colspan="7">&nbsp;</td>
                            <td class="auto-style5">
                                <asp:Button runat="server" ID="cmdLeft" Text="Eliminar" OnClick="cmdLeft_Click" BackColor="#148BD0" Font-Bold="True" ForeColor="White" CssClass="roundCorner" Height="38px" Width="100px" Visible="False" /></td>
                            <td valign="top" class="auto-style3">
                                <asp:Button runat="server" ID="cmdUpdate" Text="Grabar" BackColor="#E1611C" OnClick="cmdUpdate_Click" Font-Bold="True" ForeColor="White" BorderStyle="None" CssClass="roundCorner" Height="38px" Width="100px" OnClientClick=" " /></td>
                        </tr>
                        <tr>
                            <td valign="top" class="auto-style20">&nbsp;</td>
                            <td class="auto-style21">&nbsp;</td>
                            <td class="auto-style28">&nbsp;</td>
                            <td class="auto-style29">&nbsp;</td>
                </td>
                <td class="auto-style34">&nbsp;</td>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style33">&nbsp;</td>
                <td class="auto-style35">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td valign="top" class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td valign="top" colspan="10">

                </td>
            </tr>
            <tr>
                <td valign="top" class="auto-style20">&nbsp;</td>
                <td class="auto-style1" colspan="7">
                    &nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td valign="top" class="auto-style3">&#160;</td>
            </tr>
            <tr>
                <td valign="top" colspan="10">
                    <%--<div style="overflow: scroll; height: 100%; width: 100%;">--%>
                        <script type="text/javascript">
                            function numbersonly(e) {
                                var unicode = e.charCode ? e.charCode : e.keyCode
                                if (unicode != 8 && unicode != 44) {
                                    if (unicode < 48 || unicode > 57) //if not a number
                                    { return false } //disable key press    
                                }
                            }
                        </script>


                    <%--</div>--%>
                </td>
            </tr>
        </table>
                            <div id="divGrid" style="overflow: auto; height: 550px">
                        <asp:GridView runat="server" ID="gvLeft" DataKeyNames="ID" EmptyDataText="Sin registros"
                              HeaderStyle-BackColor="LightGray" 
                            AlternatingRowStyle-BackColor="WhiteSmoke"
                            AutoGenerateColumns="False" EnableTheming="False"  
                            CellPadding="2" GridLines="Vertical" >
                            <HeaderStyle CssClass="HeaderFreez" />
                            <Columns>
                                <asp:TemplateField >
                                    <HeaderTemplate>
                                        <asp:Label ID="chkAll" runat="server" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk" runat="server" AutoPostBack="false" Width="20px" />
                                    </ItemTemplate>
                                    <HeaderStyle />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="FOLIO" HeaderText="Folio">
                                    <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="ASUNTO" HeaderText="Descripción">
                                    <HeaderStyle HorizontalAlign="Left" Wrap="true" />
                                    <ItemStyle HorizontalAlign="Left" Width="100px"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="LUNES">
                                    <HeaderTemplate>
                                        <p>LUNES</p>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                         <b><asp:DropDownList ID="DropLUNES1" runat="server" Width="50" ToolTip="Actividades">
                                                <asp:ListItem>Analisis</asp:ListItem>
                                                <asp:ListItem>Desarrollo</asp:ListItem>
                                                <asp:ListItem>Prueba</asp:ListItem>
                                                <asp:ListItem>Liberacion</asp:ListItem>
                                                <asp:ListItem>Seguimiento</asp:ListItem>
                                                <asp:ListItem>Mantenimiento</asp:ListItem>
                                                <asp:ListItem>Junta</asp:ListItem>
                                                <asp:ListItem>Capacitación</asp:ListItem>
                                                <asp:ListItem>Coaching</asp:ListItem>
                                                <asp:ListItem>Enfermedad</asp:ListItem>
                                                <asp:ListItem>Vacaciones</asp:ListItem>
                                            </asp:DropDownList></b>
                                         <b><asp:Label ID="Lbllunes" runat="server" DataFormatString="{0:d}" Text='<%# Eval("Lunes","{0:d}") %>' ForeColor="Transparent"></asp:Label></b>
                                         <b><asp:TextBox ID="TBox1" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox></b>
                                    </ItemTemplate>
                                    <HeaderStyle Width="50px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="MARTES">
                                    <HeaderTemplate>
                                        <p>MARTES</p>

                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <b><asp:DropDownList ID="DropMARTES" runat="server" Width="100" ToolTip="Actividades">
                                                <asp:ListItem>Analisis</asp:ListItem>
                                                <asp:ListItem>Desarrollo</asp:ListItem>
                                                <asp:ListItem>Prueba</asp:ListItem>
                                                <asp:ListItem>Liberacion</asp:ListItem>
                                                <asp:ListItem>Seguimiento</asp:ListItem>
                                                <asp:ListItem>Mantenimiento</asp:ListItem>
                                                <asp:ListItem>Junta</asp:ListItem>
                                                <asp:ListItem>Capacitación</asp:ListItem>
                                                <asp:ListItem>Coaching</asp:ListItem>
                                                <asp:ListItem>Enfermedad</asp:ListItem>
                                                <asp:ListItem>Vacaciones</asp:ListItem>                                        </asp:DropDownList></b>
                                        <b><asp:Label ID="Lblmartes" runat="server" DataFormatString="{0:d}" Text='<%# Eval("Martes","{0:d}") %>' ForeColor="Transparent"></asp:Label></b>
                                        <b><asp:TextBox ID="TBox2" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox></b>
                                    </ItemTemplate>
                                    <HeaderStyle Width="70px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="MIERCOLES">
                                    <HeaderTemplate>
                                        <p>MIERCOLES</p>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                         <b><asp:DropDownList ID="DropMIERCOLES" runat="server" Width="100" ToolTip="Actividades">
                                                <asp:ListItem>Analisis</asp:ListItem>
                                                <asp:ListItem>Desarrollo</asp:ListItem>
                                                <asp:ListItem>Prueba</asp:ListItem>
                                                <asp:ListItem>Liberacion</asp:ListItem>
                                                <asp:ListItem>Seguimiento</asp:ListItem>
                                                <asp:ListItem>Mantenimiento</asp:ListItem>
                                                <asp:ListItem>Junta</asp:ListItem>
                                                <asp:ListItem>Capacitación</asp:ListItem>
                                                <asp:ListItem>Coaching</asp:ListItem>
                                                <asp:ListItem>Enfermedad</asp:ListItem>
                                                <asp:ListItem>Vacaciones</asp:ListItem>
                                        </asp:DropDownList></b>
                                        <b><asp:Label ID="Lblmiercoles" runat="server"  DataFormatString="{0:d}" Text='<%# Eval("Miercoles","{0:d}") %>' ForeColor="Transparent"></asp:Label></p></b>
                                        <b><asp:TextBox ID="TBox3" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox></b>
                                    </ItemTemplate>
                                    <HeaderStyle Width="70px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="JUEVES">
                                    <HeaderTemplate>
                                        <p>JUEVES</p>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <b><asp:DropDownList ID="DropJUEVES" runat="server" Width="100" ToolTip="Actividades">
                                                <asp:ListItem>Analisis</asp:ListItem>
                                                <asp:ListItem>Desarrollo</asp:ListItem>
                                                <asp:ListItem>Prueba</asp:ListItem>
                                                <asp:ListItem>Liberacion</asp:ListItem>
                                                <asp:ListItem>Seguimiento</asp:ListItem>
                                                <asp:ListItem>Mantenimiento</asp:ListItem>
                                                <asp:ListItem>Junta</asp:ListItem>
                                                <asp:ListItem>Capacitación</asp:ListItem>
                                                <asp:ListItem>Coaching</asp:ListItem>
                                                <asp:ListItem>Enfermedad</asp:ListItem>
                                                <asp:ListItem>Vacaciones</asp:ListItem>                                        </asp:DropDownList></b>
                                        <b><asp:Label ID="Lbljueves" runat="server" DataFormatString="{0:d}" Text='<%# Eval("Jueves","{0:d}") %>' ForeColor="Transparent"></asp:Label></b>
                                        <b><asp:TextBox ID="TBox4" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox></b>
                                    </ItemTemplate>
                                    <HeaderStyle Width="70px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="VIERNES">
                                    <HeaderTemplate>
                                        <p>VIERNES</p>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                     
                                        <b><asp:DropDownList ID="DropVIERNES" runat="server" Width="100" ToolTip="Actividades">
                                                <asp:ListItem>Analisis</asp:ListItem>
                                                <asp:ListItem>Desarrollo</asp:ListItem>
                                                <asp:ListItem>Prueba</asp:ListItem>
                                                <asp:ListItem>Liberacion</asp:ListItem>
                                                <asp:ListItem>Seguimiento</asp:ListItem>
                                                <asp:ListItem>Mantenimiento</asp:ListItem>
                                                <asp:ListItem>Junta</asp:ListItem>
                                                <asp:ListItem>Capacitación</asp:ListItem>
                                                <asp:ListItem>Coaching</asp:ListItem>
                                                <asp:ListItem>Enfermedad</asp:ListItem>
                                                <asp:ListItem>Vacaciones</asp:ListItem>                                        </asp:DropDownList></b>
                                        <b><asp:Label ID="Lblviernes" runat="server" DataFormatString="{0:d}" Text='<%# Eval("Viernes","{0:d}") %>' ForeColor="Transparent"></asp:Label></b>
                                        <b><asp:TextBox ID="TBox5" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox></b>
                                    </ItemTemplate>
                                    <HeaderStyle Width="70px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SABADO">
                                    <HeaderTemplate>
                                        <p>SABADO</p>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <b><asp:DropDownList ID="DropSABADO" runat="server" Width="100" ToolTip="Actividades">
                                                <asp:ListItem>Analisis</asp:ListItem>
                                                <asp:ListItem>Desarrollo</asp:ListItem>
                                                <asp:ListItem>Prueba</asp:ListItem>
                                                <asp:ListItem>Liberacion</asp:ListItem>
                                                <asp:ListItem>Seguimiento</asp:ListItem>
                                                <asp:ListItem>Mantenimiento</asp:ListItem>
                                                <asp:ListItem>Junta</asp:ListItem>
                                                <asp:ListItem>Capacitación</asp:ListItem>
                                                <asp:ListItem>Coaching</asp:ListItem>
                                                <asp:ListItem>Enfermedad</asp:ListItem>
                                                <asp:ListItem>Vacaciones</asp:ListItem>
                                        </asp:DropDownList></b>
                                        <b><asp:Label ID="Lblsabado" runat="server" DataFormatString="{0:d}" Text='<%# Eval("Sabado","{0:d}") %>' ForeColor="Transparent"></asp:Label></b>
                                        <b><asp:TextBox ID="TBox6" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox></b>
                                    </ItemTemplate>
                                    <HeaderStyle Width="70px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DOMINGO">
                                    <HeaderTemplate>
                                        <p>DOMINGO</p>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                         <b><asp:DropDownList ID="DropDOMINGO" runat="server" Width="100" ToolTip="Actividades">
                                                <asp:ListItem>Analisis</asp:ListItem>
                                                <asp:ListItem>Desarrollo</asp:ListItem>
                                                <asp:ListItem>Prueba</asp:ListItem>
                                                <asp:ListItem>Liberacion</asp:ListItem>
                                                <asp:ListItem>Seguimiento</asp:ListItem>
                                                <asp:ListItem>Mantenimiento</asp:ListItem>
                                                <asp:ListItem>Junta</asp:ListItem>
                                                <asp:ListItem>Capacitación</asp:ListItem>
                                                <asp:ListItem>Coaching</asp:ListItem>
                                                <asp:ListItem>Enfermedad</asp:ListItem>
                                                <asp:ListItem>Vacaciones</asp:ListItem>                                        </asp:DropDownList></b>
                                         <b><asp:Label ID="Lbldomingo" runat="server" DataFormatString="{0:d}" Text='<%# Eval("Domingo","{0:d}") %>' ForeColor="Transparent"></asp:Label></b>
                                         <b><asp:TextBox ID="TBox7" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox></b>
                                    </ItemTemplate>
                                    <HeaderStyle Width="70px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="Silver" Font-Bold="True" ForeColor="#333333"></HeaderStyle>
                        </asp:GridView>
                    </div>
    </form>
</body>
</html>

