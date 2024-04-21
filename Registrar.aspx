<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registrar.aspx.cs" Inherits="Capturas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel='stylesheet' type='text/css' href='scripts/StaticHeader.css' />
    <title></title>

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet" />
    <link href="css/sb-admin-2.css" rel="stylesheet" />
    <link href="vendor/morrisjs/morris.css" rel="stylesheet" />
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet" />
    <link href="vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet" />

    <script type='text/javascript' src='scripts/x.js'></script>

    <script type='text/javascript' src='scripts/xtableheaderfixed.js'></script>

    <script type='text/javascript'>
        xAddEventListener(window, 'load',
            function () { new xTableHeaderFixed('GridView1', 'table-container', 0); }, false);
    </script>




    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <%--        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Captura</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->--%>


        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div>
                            <div class="panel-heading">Captura</div>
                            <asp:TextBox ID="inicioTabla" runat="server" Height="23" Width="90" Text="fecha captura"></asp:TextBox>
                            <asp:ImageButton ID="imgPopup" ImageUrl="img/calendar.png" ImageAlign="Bottom" runat="server" />
                            <ajaxtoolkit:CalendarExtender ID="Calendar1" PopupButtonID="imgPopup" runat="server" TargetControlID="inicioTabla" Format="MM/dd/yyyy"></ajaxtoolkit:CalendarExtender>
                        </div>
                    </div>
                    <!-- .panel-heading -->
                    <div class="panel-body">
                        <div class="panel-group" id="accordion">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Folios</a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in">
                                    <div class="panel-body">

                                        <table style="width: 100%">
                                            <tr>
                                                <td valign="top" class="auto-style7">
                                                    <div class="auto-style6">
                                                        <div class="auto-style11" style="font-weight: bold">Selecciona un día </div>
                                                        <div class="auto-style10">
                                                            <asp:TextBox ID="TextBox1" runat="server" Height="23px" Text="Inicio" Width="90px" BorderColor="Silver" BorderStyle="Solid" ForeColor="Silver" OnTextChanged="imgPopup_Click"></asp:TextBox>&#160;&#160;<asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="Bottom" ImageUrl="~/img/Calendargrey.PNG" Height="27px" Width="27px" OnClick="imgPopup_Click" /><br />
                                                            <br />
                                                            <cc1:CalendarExtender ID="CalendarExtender1" PopupButtonID="imgPopup" runat="server" TargetControlID="inicioTabla" Format="dd/MM/yyyy" BehaviorID="_content_Calendar1"></cc1:CalendarExtender>
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
                                                <td valign="top" colspan="4">
                                                    <div>
                                                        <asp:GridView runat="server" ID="gvLeft" DataKeyNames="ID" EmptyDataText="Sin registros"
                                                            AutoGenerateColumns="False" EnableTheming="False"
                                                            CellPadding="10" GridLines="Horizontal" Width="100%">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="chkAll" runat="server" />
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chk" runat="server"
                                                                            AutoPostBack="false" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="FOLIO" HeaderText="Folio">
                                                                    <ItemStyle HorizontalAlign="Center" Width="400px"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="ASUNTO" HeaderText="Descripción">
                                                                    <HeaderStyle HorizontalAlign="Left" Wrap="False" />
                                                                    <ItemStyle HorizontalAlign="Left" Width="100%"></ItemStyle>
                                                                </asp:BoundField>
                                                                <asp:TemplateField HeaderText="Analisis">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TBox1" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
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
                                                                <asp:TemplateField HeaderText="Producción">
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
                                                <td valign="top" class="auto-style7">&nbsp;</td>
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
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" class="auto-style7">&nbsp;</td>
                                                <td class="auto-style1">&nbsp;</td>
                                                <td class="auto-style5">
                                                    <asp:Button runat="server" ID="cmdLeft" Text="Eliminar" OnClick="cmdLeft_Click" BackColor="#148BD0" Font-Bold="True" ForeColor="White" CssClass="roundCorner" Height="38px" Width="100px" Visible="False" /></td>
                                                <td valign="top" class="auto-style3">
                                                    <asp:Button runat="server" ID="cmdUpdate" Text="Grabar" BackColor="#E1611C" OnClick="cmdUpdate_Click" Font-Bold="True" ForeColor="White" BorderStyle="None" CssClass="roundCorner" Height="38px" Width="100px" /></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Busqueda</a>
                                    </h4>
                                </div>

                                <div id="collapseTwo" class="panel-collapse collapse">
                                    <div class="panel-body">
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
                                                    <asp:Panel ID="busqueda" runat="server" Visible="true">
                                                        <div class="auto-style12">Selecciona un día </div>
                                                        <div class="auto-style19">
                                                            <asp:TextBox ID="TextBox4" runat="server" Height="23" Text="Inicio" Width="90" BorderColor="Silver" BorderStyle="Solid" ForeColor="Silver"></asp:TextBox>&#160;&#160;<asp:ImageButton ID="ImageButton6" runat="server" ImageAlign="Bottom" ImageUrl="~/img/Calendargrey.PNG" Height="27px" Width="32px" /><br />
                                                            <br />
                                                            <cc1:CalendarExtender ID="CalendarExtender5" PopupButtonID="ImageButton2" runat="server" TargetControlID="TextBox1" Format="dd/MM/yyyy"></cc1:CalendarExtender>
                                                        </div>
                                                    </asp:Panel>
                                                </td>
                                                <td colspan="2" class="auto-style3">
                                                    <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="10" ForeColor="#148BD0" Text=""></asp:Label><br />
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="#148BD0" Text="0  hrs."></asp:Label><br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" colspan="4">
                                                    <div style="overflow: scroll; height: 100%">
                                                        <asp:GridView runat="server" ID="busquedag" EmptyDataText="Sin registros" DataKeyNames="ID" AutoGenerateColumns="False"
                                                            HeaderStyle-BackColor="Silver" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="black" GridLines="Horizontal"
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
                                                                <asp:TemplateField HeaderText="Producción" ItemStyle-HorizontalAlign="Center">
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
                                            <tr>
                                                <td valign="top" class="auto-style7">&nbsp;</td>
                                                <td class="auto-style1">&nbsp;</td>
                                                <td class="auto-style5">

                                                    <td valign="top" class="auto-style3">
                                                        <asp:Button runat="server" ID="busquedagrabar" Text="Grabar" BackColor="#E1611C" OnClick="busquedagrabar_Click" Font-Bold="True" ForeColor="White" BorderStyle="None" CssClass="roundCorner" Height="38px" Width="100px" /></td>
                                            </tr>
                                        </table>
                               

                                    </div>
                                </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Actividades</a>
                                </h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse">
                                <div class="panel-body">
                                         <div style="width: 100%; height: 100%">
                                            <div class="auto-style11" style="font-weight: bold">Selecciona un día </div>
                                            <div class="auto-style10">
                                                <asp:TextBox ID="actividaddia" runat="server" Height="23" Text="Inicio" Width="90" BorderColor="Silver" BorderStyle="Solid" ForeColor="Silver"></asp:TextBox>&#160;&#160;<asp:ImageButton ID="ImageButton2" runat="server" ImageAlign="Bottom" ImageUrl="~/img/Calendargrey.PNG" Height="27px" Width="27px" /><br />
                                                <br />
                                                <cc1:CalendarExtender ID="CalendarExtender2" PopupButtonID="ImageButton1" runat="server" TargetControlID="actividaddia" Format="dd/MM/yyyy"></cc1:CalendarExtender>
                                            </div>
                                        </div>
                                        <fieldset>
                                            <legend>Actividades</legend>
                                            <asp:Button ID="Buttactividad" runat="server" Text="Grabar" OnClick="Buttactividad_Click" BackColor="#E1611C" Font-Bold="True" ForeColor="White" BorderStyle="None" CssClass="roundCorner" Height="38px" Width="100px" /><table cellpadding="0" class="style1">
                                                <tr>
                                                    <td class="alignRight">Folio o Usuario: </td>
                                                    <td class="alignLeft">
                                                        <asp:TextBox ID="addEventName" runat="server" Text="" Width="315px"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style9">Actividad: </td>
                                                    <td class="auto-style9">
                                                        <asp:TextBox ID="addEventDesc" runat="server" Text="" Width="314px"></asp:TextBox></td>
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
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">Resumen</a>
                                </h4>
                            </div>
                            <div id="collapseFour" class="panel-collapse collapse">
                                <div class="panel-body">
    <table class="auto-style14">
                                            <tr>
                                                <td class="auto-style16">
                                                    <div class="auto-style6">
                                                        <div class="auto-style11" style="font-weight: bold">Selecciona rango de fechas : </div>
                                                        <div class="auto-style18">
                                                            <asp:TextBox ID="TextBox2" runat="server" Height="23" Text="Inicio" Width="90" BorderColor="Silver" BorderStyle="Solid" ForeColor="Silver"></asp:TextBox>&#160;&#160;<asp:ImageButton ID="ImageButton4" runat="server" ImageAlign="Bottom" ImageUrl="~/img/Calendargrey.PNG" Height="27px" Width="27px" OnClick="imgPopup_Click" />&#160;<cc1:CalendarExtender ID="CalendarExtender3" PopupButtonID="ImageButton4" runat="server" TargetControlID="TextBox2" Format="dd/MM/yyyy"></cc1:CalendarExtender>
                                                            <asp:TextBox ID="TextBox3" runat="server" Height="23" Text="Fin" Width="90" BorderColor="Silver" BorderStyle="Solid" ForeColor="Silver"></asp:TextBox>&#160;&#160;<asp:ImageButton ID="ImageButton5" runat="server" ImageAlign="Bottom" ImageUrl="~/img/Calendargrey.PNG" Height="27px" Width="27px" OnClick="imgPopup_Click" />&#160;&#160;<cc1:CalendarExtender ID="CalendarExtender4" PopupButtonID="ImageButton5" runat="server" TargetControlID="TextBox3" Format="dd/MM/yyyy"></cc1:CalendarExtender>
                                                            <asp:Button ID="Buttactividad0" runat="server" BackColor="#E1611C" BorderStyle="None" CssClass="roundCorner" Font-Bold="True" ForeColor="White" Height="38px" Text="Buscar" Width="100px" OnClick="Buttactividad0_Click" CausesValidation="true" />&#160;&#160;&#160;&#160;
                                                            <asp:Button ID="Botonborrar" runat="server" BackColor="#E1611C" BorderStyle="None" CssClass="roundCorner" Font-Bold="True" ForeColor="White" Height="38px" Text="Borrar" Width="100px" OnClick="Botonborrar_Click" CausesValidation="true" />
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="auto-style16">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <div style="overflow: scroll; width: 90%; height: 400px">
                                                        <asp:GridView ID="Resumengrid" runat="server" AutoGenerateColumns="False"
                                                            HeaderStyle-BackColor="Silver" HeaderStyle-Font-Bold="true"
                                                            HeaderStyle-ForeColor="black" GridLines="Horizontal"
                                                            CellPadding="2" BorderColor="#CCCCCC">
                                                            <Columns>
                                                                <asp:TemplateField ItemStyle-Width="20px" HeaderText="">
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox runat="server" ID="chk" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-Width="20px" HeaderText="">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="id" ItemStyle-Width="20px" Text='<%#Eval("id") %>' runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="title" HeaderText="Folio/Actividad" SortExpression="title" />
                                                                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                                                                <asp:BoundField DataField="startDate" DataFormatString="{0:d}" HeaderText="Fecha" SortExpression="startDate" />
                                                                <asp:BoundField DataField="actividad1" HeaderText="Analisis" SortExpression="actividad1" />
                                                                <asp:BoundField DataField="actividad2" HeaderText="Desarrollo" SortExpression="actividad2" />
                                                                <asp:BoundField DataField="actividad3" HeaderText="Junta" SortExpression="actividad3" />
                                                                <asp:BoundField DataField="actividad4" HeaderText="Mantenimiento" SortExpression="actividad4" />
                                                                <asp:BoundField DataField="actividad5" HeaderText="Produccion" SortExpression="actividad5" />
                                                                <asp:BoundField DataField="actividad6" HeaderText="Prueba" SortExpression="actividad6" />
                                                                <asp:BoundField DataField="actividad7" HeaderText="Seguimiento" SortExpression="actividad7" />
                                                                <asp:BoundField DataField="foliohrs" HeaderText="Actividades" SortExpression="foliohrs" />
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">&nbsp;</td>
                                            </tr>
                                        </table>


 

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- .panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
        </div>



        <!-- jQuery -->
        <script src="vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="vendor/metisMenu/metisMenu.min.js"></script>

        <!-- DataTables JavaScript -->
        <script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
        <script src="vendor/datatables-responsive/dataTables.responsive.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="js/sb-admin-2.js"></script>

        <!-- Page-Level Demo Scripts - Tables - Use for reference -->
        <script>
                                                                    $(document).ready(function () {
                                                                        $('#dataTables-example').DataTable({
                                                                            responsive: true
                                                                        });
                                                                    });
        </script>

    </form>
</body>
</html>
