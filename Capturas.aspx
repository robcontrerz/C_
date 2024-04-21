<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Capturas.aspx.cs" Inherits="Capturas" %>

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
                                        <asp:Button runat="server" ID="Btnfolios" Text="Grabar" OnClick="Btnfolios_Click" />
                                        <asp:Label ID="lblTemp" runat="server" ForeColor="green" Font-Bold="true" Font-Names="Courier New"
                                            Font-Size="Large">
                                        </asp:Label>
                                        <asp:Label ID="Totalhrs" runat="server" Text="0"></asp:Label>
                                        <div style="overflow: auto; height: 300px;" id="Div2" runat="server">

                                            <asp:GridView ID="GridView2" runat="server" ForeColor="Black" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False"
                                                DataKeyNames="ID" AllowSorting="True" EnableViewState="true" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
                                                GridLines="Horizontal" Width="787px" PageSize="4"  >
                                                <FooterStyle BackColor="#CCCC99"></FooterStyle>

                                                <RowStyle BackColor="#F9F9F9"></RowStyle>
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="ProductSelector" runat="server" />
                                                        </ItemTemplate>
                                                        <ItemStyle Width="20px" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="FOLIO" HeaderText="Folio" ReadOnly="True" InsertVisible="False" SortExpression="FOLIO">
                                                        <HeaderStyle BorderWidth="1px"></HeaderStyle>

                                                        <ItemStyle Width="70px"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ASUNTO" HeaderText="Asunto" ReadOnly="True" InsertVisible="False" SortExpression="ASUNTO">
                                                        <HeaderStyle BorderWidth="1px"></HeaderStyle>

                                                        <ItemStyle Width="70px"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="Analisis">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox1" MaxLength="2" runat="server" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Desarrollo">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox2" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Junta">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox3" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Mantenimiento">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox4" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Produccion">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox5" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Prueba">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox6" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Seguimiento">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox7" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>


                                                </Columns>


                                                <PagerStyle HorizontalAlign="Right" BackColor="#CCFFFF" ForeColor="Black"></PagerStyle>



                                                <HeaderStyle HorizontalAlign="Left" BackColor="#00A0DE" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                                <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
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
                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Busquedas</a>
                                    </h4>
                                </div>

                                <div id="collapseTwo" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="auto-style13">
                                            <asp:TextBox ID="busquedabt" runat="server" Height="28px" Width="132px"></asp:TextBox>&#160;&#160;
                                             <asp:ImageButton ID="ImageButton3" runat="server" Width="27px" OnClick="ImageButton3_Click" ImageUrl="~/img/lupa.png" /><br />
                                            <br />
                                        </div>
                                        <asp:Button runat="server" Text="Grabar" OnClick="Butpreti_Click" ID="Butpreti" />
                                        <asp:Label ID="Label1" runat="server" ForeColor="green" Font-Bold="true" Font-Names="Courier New"
                                            Font-Size="Large">
                                        </asp:Label>
                                        <div style="overflow: auto; height: 300px;" id="Div4" runat="server">

                                            <asp:GridView ID="GridView3" runat="server" ForeColor="Black" BorderWidth="1px"
                                                CellPadding="4" AutoGenerateColumns="False"
                                                DataKeyNames="ID" AllowSorting="True"
                                                GridLines="Horizontal"
                                                CssClass="gvTheGrid"
                                                EnableViewState="true" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
                                                Width="787px" PageSize="4">
                                                <FooterStyle BackColor="#CCCC99"></FooterStyle>

                                                <RowStyle BackColor="#F9F9F9"></RowStyle>
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="ProductSelector" runat="server" />
                                                        </ItemTemplate>
                                                        <ItemStyle Width="20px" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="FOLIO" HeaderText="Preticket" ReadOnly="True" InsertVisible="False" SortExpression="FOLIO">
                                                        <HeaderStyle BorderWidth="1px"></HeaderStyle>

                                                        <ItemStyle Width="70px"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ASUNTO" HeaderText="Asunto" ReadOnly="True" InsertVisible="False" SortExpression="ASUNTO">
                                                        <HeaderStyle BorderWidth="1px"></HeaderStyle>

                                                        <ItemStyle Width="70px"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="Analisis">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox7" MaxLength="2" runat="server" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Desarrollo">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox8" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Junta">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox9" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Mantenimiento">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox10" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Produccion">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox11" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Prueba">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox12" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Seguimiento">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TBox13" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0"></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="70px" />
                                                    </asp:TemplateField>
                                                </Columns>


                                                <PagerStyle HorizontalAlign="Right" BackColor="#F7F7DE" ForeColor="Black"></PagerStyle>
                                                <HeaderStyle HorizontalAlign="Left" BackColor="#00A0DE" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                                <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
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
                                        <%--  <contenttemplate>--%>
                                        <asp:Button ID="Buttactividad" runat="server" Text="Grabar" OnClick="Buttactividad_Click" />

                                        <table cellpadding="0" class="style1">
                                            <tr>
                                                <td class="alignRight">Folio o Usuario: </td>
                                                <td class="alignLeft">
                                                    <asp:TextBox ID="addEventName" runat="server" Text=""></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="alignRight">Actividad: </td>
                                                <td class="alignLeft">
                                                    <asp:TextBox ID="addEventDesc" runat="server" Text=""></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="alignRight">Horas: </td>
                                                <td class="alignLeft">
                                                    <input id="addhrs" type="text" size="2" runat="server" onkeypress="return numbersonly(event);" />
                                                </td>
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

                                        <%--</contenttemplate>--%>
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
                                                            <asp:TextBox ID="TextBox2" runat="server" Height="23" Text="Inicio" Width="90" BorderColor="Silver" BorderStyle="Solid" ForeColor="Silver"></asp:TextBox>&#160;&#160;<asp:ImageButton ID="ImageButton4" runat="server" ImageAlign="Bottom" ImageUrl="~/img/Calendargrey.PNG" Height="27px" Width="27px"  />&#160;<ajaxtoolkit:calendarextender id="CalendarExtender3" popupbuttonid="ImageButton4" runat="server" targetcontrolid="TextBox2" format="dd/MM/yyyy"></ajaxtoolkit:calendarextender>
                                                            <asp:TextBox ID="TextBox3" runat="server" Height="23" Text="Fin" Width="90" BorderColor="Silver" BorderStyle="Solid" ForeColor="Silver"></asp:TextBox>&#160;&#160;<asp:ImageButton ID="ImageButton5" runat="server" ImageAlign="Bottom" ImageUrl="~/img/Calendargrey.PNG" Height="27px" Width="27px" />&#160;&#160;<ajaxtoolkit:calendarextender id="CalendarExtender4" popupbuttonid="ImageButton5" runat="server" targetcontrolid="TextBox3" format="dd/MM/yyyy"></ajaxtoolkit:calendarextender>
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
