<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Tab17.aspx.cs" Title="" Inherits="Tab17" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
    <style type="text/css">
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 50%;
            margin: auto;
            height: 50%;
        }
    </style>

    <script src="js/jquery-1.9.1.js" type="text/javascript"></script>
    <link href="css/custom-theme/jquery-ui-1.10.1.custom.min.css" rel="stylesheet" type="text/css" />
    <link href="css/estilosRobert.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-ui-1.10.1.custom.js" type="text/javascript"></script>

    <script type="text/javascript">
        function numbersonly(e) {
            var unicode = e.charCode ? e.charCode : e.keyCode
            if (unicode != 8 && unicode != 44) {
                if (unicode < 48 || unicode > 57) //if not a number
                { return false } //disable key press    
            }
        }
    </script>
    <style type="text/css">
        .auto-style3 {
            text-align: right;
        }

        .auto-style6 {
            text-align: left;
        }

        .auto-style10 {
            text-align: left;
        }

        </style>
    <script src="scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <style type="text/css">
        .FixedHeader {
            position: absolute;
            font-weight: bold;
            vertical-align: text-bottom;
        }
        .Button
       {
       	background-color:Aqua;
       	width:100px;
       	padding:10px;
       	color:Black;
       	cursor:pointer;
       	text-align:center;
       	 -moz-border-radius: 10px;
       	 -webkit-border-radius: 10px;
         -khtml-border-radius: 10px;
           border-radius: 10px; }
        .auto-style22 {
            font-size: medium;
        }

        .auto-style28 {
            width: 289px;
        }

        .auto-style33 {
            color: #3399FF;
        }

        .auto-style35 {
            font-weight: bold;
            font-size: xx-large;
        }

        .auto-style36 {
            /*border-style: solid;
            border-color: #3399FF;
            color: #3399FF;*/
            font-size: x-large;
            font-weight: normal;
        }

        .auto-style41 {
            overflow: auto;
            height: 250px;
        }

        .auto-style47 {
            color: #3399FF;
            font-size: medium;
        }

        .auto-style48 {
            color: #148BD0;
        }

        .auto-style57 {
            text-align: left;
            width: 315px;
            height: 40px;
        }

        .auto-style58 {
            width: 238px;
        }

        .auto-style59 {
            width: 694px;
            height: 256px;
        }
        .auto-style60 {
            width: 440px;
        }
        .auto-style61 {
            width: 440px;
            height: 13px;
        }
        .auto-style62 {
            height: 13px;
        }
        .auto-style63 {
            width: 238px;
            height: 13px;
        }
    </style>

    <script src="scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">

        $(document).ready(function () {

            $("#<%=GridView1.ClientID%> [id*='txtCantidad']").change(function () {

                var tr = $(this).parent().parent();
                var precio = $("td:eq(1)", tr).html();

                //$("td:eq(3) span", tr).html($(this).val() * precio);
                $("td:eq(2) span", tr).html($(this).val());

                CalcularTotal();

            });

        });

        //calculo total grid paginado
        function CalcularTotal() {

            var total = 0;
            $("#<%=GridView1.ClientID%> [id*='lblPrecio']").each(function () {

                var coltotal = parseFloat($(this).html());

                if (!isNaN(coltotal)) {
                    total += coltotal;
                }

            });

            $("#<%=GridView1.ClientID%> [id*='lblTotal']").html(total);


            $("[id$=Label1]").html(total);
        }

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <div style="overflow: auto; height: auto">
            <table style="width: 100%">
                <tr>
                    <td class="auto-style3">

                        <div class="auto-style6" style="font-size: medium; color: #CCCCCC; font-weight: bold;">
                            <asp:Label ID="Label8" runat="server" Text="0" Style="font-weight: 700; font-size: x-large;" Visible="False"></asp:Label>
                            &nbsp;RESUMEN<br />
                            <br />
                            <div style="border-style: none; overflow: auto; width:800px; height: 120px; padding-right: inherit;">
                            </div>
                            <br />
                            &nbsp;CAPTURA<br />
                            <br />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table cellpadding="2" cellspacing="3" class="auto-style59">
                            <tr>
                                <td class="auto-style60">
                                    <div class="auto-style57" style="border: 1px solid #CCCCCC">
                                        <asp:Image ID="Image2" runat="server" Height="30px" ImageUrl="~/img/lupagris.png" Width="30px" />
                                        <asp:TextBox ID="busquedabt" runat="server" BorderColor="#CCCCCC" BorderStyle="None" Height="28px"  placeholder="Buscar Requerimiento ..." Width="247px"  ></asp:TextBox>
                                    </div>
                                </td>
                                <td>&nbsp;</td>
                                <td class="auto-style58">
                                    <asp:Button ID="Buscar" runat="server" BackColor="#009FDB" BorderStyle="None" CssClass="Button" ForeColor="White" Height="38px" OnClick="Buscar_Click" OnClientClick="Buscar_Click" Text="BUSCAR" Width="110px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style61"></td>
                                <td class="auto-style62"></td>
                                <td class="auto-style63"></td>
                            </tr>
                            <tr>
                                <td class="auto-style60">
                                    <div class="auto-style10" style="border: 1px solid #CCCCCC">
                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/actividadesgris.png" Width="30px" Height="30px" />&nbsp;
                                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" Height="30px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Width="180px">
                                            <asp:ListItem>Actividades</asp:ListItem>
                                            <asp:ListItem>Actividades administrativas(diversos)</asp:ListItem>
                                            <asp:ListItem>Capacitación, Coaching</asp:ListItem>
                                            <asp:ListItem>Dia festivo</asp:ListItem>
                                            <asp:ListItem>Enfermedad</asp:ListItem>
                                            <asp:ListItem>Vacaciones</asp:ListItem>
                                        </asp:DropDownList> 
                                    </div>
                                </td>
                                <td>&nbsp;</td>
                                <td class="auto-style58">
                                    <div class="auto-style10" style="border: 1px solid #CCCCCC">
                                        <asp:Image ID="Image1" runat="server" Height="30px" ImageUrl="~/img/Calendargrey.PNG" Width="30px" />
                                        &nbsp;
                                        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" AutoPostBack="true" Height="30px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="180px">
                                            <asp:ListItem Text="&lt; Semanas &gt;" Value="0" />
                                        </asp:DropDownList>
                                         
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style60">
                                    <div style="border: 1px solid #CCCCCC">
                                    <asp:TextBox ID="addhrs" runat="server" CssClass="auto-style36" MaxLength="2" onkeypress="return numbersonly(event);" placeholder="00"  Visible="False" Width="43px"></asp:TextBox>
                                    <strong>
                                        <asp:Label ID="Label6" runat="server" CssClass="auto-style35" Font-Bold="False" Font-Size="X-Large" ForeColor="#CCCCCC" Text=" Horas" Visible="False" />
                                    </strong>
                                   &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="cmdUpdate1" runat="server" BackColor="#E1611C" BorderStyle="None" CssClass="Button" Font-Bold="True" ForeColor="White" Height="38px" OnClick="cmdUpdate1_Click" OnClientClick="cmdUpdate1_Click" Text="GUARDAR" Visible="false" Width="100px" />
                                    &nbsp;&nbsp;
                                    </div>
                                </td>
                                <td>&nbsp;</td>
                                <td class="auto-style58">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style60"><strong>
                                    <asp:Label ID="Label1" runat="server" CssClass="auto-style33" Font-Bold="False" Font-Size="X-Large" ForeColor="#148BD0" Text="0" />
                                    <asp:Label ID="Label2" runat="server" CssClass="auto-style33" Font-Bold="False" Font-Size="X-Large" ForeColor="#148BD0" Text=" hrs." />
                                    &nbsp;</strong><asp:Label ID="Label4" runat="server" CssClass="auto-style33" Font-Bold="False" Font-Size="X-Large" ForeColor="#148BD0" Text="0"></asp:Label>
                                    &nbsp;
                                    <asp:Label ID="Label7" runat="server" CssClass="auto-style33" Font-Bold="False" Font-Size="X-Large" ForeColor="#148BD0" Text="requerimientos" />
                                </td>
                                <td>&nbsp;</td>
                                <td class="auto-style58">
                                    <h1><span class="auto-style48"><strong><span class="auto-style22">Semana seleccionada</span>
                                        <asp:Label ID="Label5" runat="server" CssClass="auto-style47" ForeColor="#148BD0" Text="">
                                        </asp:Label>
                                    </h1>
                                    <p class="auto-style6">
                                        <asp:Label ID="Label3" runat="server" CssClass="auto-style22" Font-Bold="False" Font-Size="14pt" ForeColor="#148BD0"></asp:Label>
                                    </p>
                                    </strong></span>

                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
                <tr>
                    <td valign="top" class="auto-style28"></td>
                </tr>
                <tr>
                    <td valign="top">

                        <div id="divGrid" class="auto-style41">
                            <asp:GridView ID="GridView1" runat="server" BackColor="White"
                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" HeaderStyle-CssClass="FixedHeader"
                                ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound"
                                OnPageIndexChanging="GridView1_PageIndexChanging" ShowHeader="true"
                                ShowFooter="True" Width="659px">
                                <Columns>
                                    <asp:TemplateField HeaderText=""  HeaderStyle-Width="20px" ItemStyle-Width="20px">
                                        <ItemTemplate>

                                            <%--<asp:CheckBox ID="chk" runat="server" AutoPostBack="false" Width="20px" />--%>
                                        </ItemTemplate>

         <%--                               <HeaderStyle Width="30px"></HeaderStyle>

                                        <ItemStyle Width="30px"></ItemStyle>--%>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Horas" ItemStyle-Width="60px" HeaderStyle-Width="60px">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtCantidad" MaxLength="2" runat="server" Width="30px" class="cantidad" Text="0"></asp:TextBox>

                                        </ItemTemplate>

                                        <HeaderStyle Width="60px"></HeaderStyle>

                                        <ItemStyle Width="60px"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total" ItemStyle-Width="20px" HeaderStyle-Width="20px">
                                        <HeaderTemplate>
                                            <asp:Label ID="lblTotal" runat="server"></asp:Label>

                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrecio" runat="server"></asp:Label>

                                        </ItemTemplate>

                                        <HeaderStyle Width="20px"></HeaderStyle>

                                        <ItemStyle Width="20px"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Folio" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFOLIO" runat="server" Text='<%#Eval("FOLIO")%>'></asp:Label>

                                        </ItemTemplate>

                                        <HeaderStyle Width="100px"></HeaderStyle>

                                        <ItemStyle Width="100px"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Asunto" ItemStyle-Width="500px" HeaderStyle-Width="500px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblASUNTO" runat="server" Text='<%#Eval("ASUNTO")%>'></asp:Label>

                                        </ItemTemplate>

                                        <HeaderStyle Width="500px"></HeaderStyle>

                                        <ItemStyle Width="500px"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="1px" HeaderStyle-Width="1px" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="ESTADOX" runat="server" Text='<%#Eval("ESTADOX")%>'></asp:Label>

                                        </ItemTemplate>

                                        <HeaderStyle Width="1px"></HeaderStyle>

                                        <ItemStyle Width="1px"></ItemStyle>
                                    </asp:TemplateField>
                                </Columns>

                                <%--                                <Columns>

                                    <asp:TemplateField HeaderText="Horas" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtCantidad" MaxLength="2" runat="server" Width="30px" class="cantidad" Text="0"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total" HeaderStyle-Width="20px" ItemStyle-Width="20px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrecio" runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <asp:Label ID="lblTotal" runat="server"></asp:Label>
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                </Columns>

                                <Columns>
                                    <asp:TemplateField HeaderText="Folio" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFOLIO" runat="server" Text='<%#Eval("FOLIO")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <Columns>
                                    <asp:TemplateField HeaderText="Asunto" HeaderStyle-Width="500px" ItemStyle-Width="500px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblASUNTO" runat="server" Text='<%#Eval("ASUNTO")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>--%>

                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="#CCCCCC" />
                                <FooterStyle BackColor="#666666" />
                            </asp:GridView>


                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White"
                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3"
                                ForeColor="Black" GridLines="Vertical" HeaderStyle-CssClass="FixedHeader"
                                ShowFooter="True" ShowHeader="true" Visible="false" Width="656px">
                                <Columns>
                                    <asp:TemplateField HeaderStyle-Width="30px" HeaderText="" ItemStyle-Width="30px">
                                        <ItemTemplate>

                                            <%--<asp:CheckBox ID="chk" runat="server" AutoPostBack="false" Width="20px" />--%>
                                        </ItemTemplate>

                                        <HeaderStyle Width="30px"></HeaderStyle>

                                        <ItemStyle Width="30px"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Horas" ItemStyle-Width="30px" HeaderStyle-Width="30px">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtCantidad0" runat="server" class="cantidad" MaxLength="2" Text="0" Width="30px"></asp:TextBox>

                                        </ItemTemplate>

                                        <HeaderStyle Width="30px"></HeaderStyle>

                                        <ItemStyle Width="30px"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total" ItemStyle-Width="20px" HeaderStyle-Width="20px">
                                        <HeaderTemplate>
                                            <asp:Label ID="lblTotal0" runat="server"></asp:Label>

                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrecio0" runat="server"></asp:Label>

                                        </ItemTemplate>

                                        <HeaderStyle Width="20px"></HeaderStyle>

                                        <ItemStyle Width="20px"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Folio" ItemStyle-Width="100px" HeaderStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFOLIO0" runat="server" Text='<%#Eval("FOLIO")%>'></asp:Label>

                                        </ItemTemplate>

                                        <HeaderStyle Width="100px"></HeaderStyle>

                                        <ItemStyle Width="100px"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Asunto" ItemStyle-Width="500px" HeaderStyle-Width="500px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblASUNTO0" runat="server" Text='<%#Eval("ASUNTO")%>'></asp:Label>

                                        </ItemTemplate>

                                        <HeaderStyle Width="500px"></HeaderStyle>

                                        <ItemStyle Width="500px"></ItemStyle>
                                    </asp:TemplateField>
                                </Columns>
                                <%--                                <Columns>
                                    <asp:TemplateField HeaderStyle-Width="30px" HeaderText="Horas" ItemStyle-Width="30px">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtCantidad0" runat="server" class="cantidad" MaxLength="2" Text="0" Width="30px"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-Width="20px" HeaderText="Total" ItemStyle-Width="20px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrecio0" runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <asp:Label ID="lblTotal0" runat="server"></asp:Label>
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <Columns>
                                    <asp:TemplateField HeaderStyle-Width="100px" HeaderText="Folio" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFOLIO0" runat="server" Text='<%#Eval("FOLIO")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <Columns>
                                    <asp:TemplateField HeaderStyle-Width="500px" HeaderText="Asunto" ItemStyle-Width="500px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblASUNTO0" runat="server" Text='<%#Eval("ASUNTO")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>--%>
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="#CCCCCC" />
                                <FooterStyle BackColor="#666666" />
                            </asp:GridView>

                        </div>

                    </td>
                </tr>
                <tr>
                    <td valign="top" class="auto-style28">
                        <asp:Button ID="cmdUpdate" runat="server" BackColor="#009FDB" BorderStyle="None" CssClass="Button" Font-Bold="True" ForeColor="White" Height="38px" OnClick="cmdUpdate_Click" OnClientClick="cmdUpdate_Click" Text="GUARDAR" Width="100px" />
                        <asp:Button ID="cmdUpdate0" runat="server" BackColor="#009FDB" BorderStyle="None" CssClass="Button" Font-Bold="True" ForeColor="White" Height="38px" OnClick="cmdUpdate0_Click" OnClientClick="cmdUpdate0_Click" Text="GUARDAR" Visible="false" Width="100px" />
                    </td>
                </tr>
                <tr>
                    <td valign="top"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
