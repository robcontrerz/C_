<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Personas.aspx.cs" Inherits="Personas" %>
    <%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
        <!DOCTYPE html>
        <html xmlns="http://www.w3.org/1999/xhtml">

        <head id="Head1" runat="server">
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
            <link href="css/estilosRobert.css" rel="stylesheet" type="text/css" />
            <!--link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet" />
    <link href="vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet" /-->
            <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
            <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
            <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
            <style type="text/css">
                .auto-style1 {
                    position: absolute;
                    right: 40px;
                    text-align: right;
                    top: 40px;
                    z-index: 500;
                }
            </style>
        </head>

        <body>
            <div class="iframe-reportes">
            
            <form id="form1" runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:HiddenField runat="server" ID="hidLastTab" />
                <div class="row">
                    <h4 class="panel-title">
                        <a href="#collapseOne">Reporte&nbsp; personas x proyecto</a>   
                        <p style="font-size: x-small">Reporte de Facturación Semana
                            <asp:Label ID="lblsemanax" runat="server" Font-Size="Small"></asp:Label>
                        </p>
                        <%--<p>Reporte de Facturación Semana
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>--%>
                  
                    </h4>
                    <div class="auto-style1">
                        <span>Seleccciona el perido  </span>
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="Fecha inicio"></asp:TextBox>
                        <ajaxtoolkit:CalendarExtender ID="Calendar1" PopupButtonID="ImageButton1" runat="server" TargetControlID="TextBox1" Format="yyyy/MM/dd"></ajaxtoolkit:CalendarExtender>
                        <asp:TextBox ID="finTabla" runat="server" placeholder="Fecha fin"></asp:TextBox>
                        <ajaxtoolkit:CalendarExtender ID="CalendarExtender2" PopupButtonID="ImageButton2" runat="server" TargetControlID="finTabla" Format="yyyy/MM/dd"></ajaxtoolkit:CalendarExtender>
                        <asp:Button ID="busqueda" class="btnFechas" runat="server" Text="Buscar" OnClick="busqueda_Click" OnCommand="busqueda_Click" />
                    </div>
                    <asp:Label ID="lblTemp" runat="server" visible="false" ForeColor="#00a0de" Font-Bold="true" Font-Names="Courier New" Font-Size="Large"></asp:Label>
                    
                    <div id="Div2" runat="server">
                        <asp:GridView ID="GridView2" runat="server" EnableViewState="true" BackColor="White" AutoGenerateColumns="false" >
                            <HeaderStyle HorizontalAlign="Center" BackColor="#00A0DE" Font-Bold="True" VerticalAlign="Middle" ForeColor="White"></HeaderStyle>
                            
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="1" Visible="false">
                                    <HeaderTemplate>Id</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblId" runat="server" Text='<%#Bind("id")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>Responsable</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblNombre" runat="server" Text='<%#Bind("Nombre")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>Empleados a Requerimientos</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblEMPLEADOS_REQUERIMIENTO" runat="server" Text='<%#Bind("EMPLEADOS_REQUERIMIENTO")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>Empleados Facturaron</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblEMPLEADOS_facturaron" runat="server" Text='<%#Bind("EMPLEADOS_facturaron")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>Fact %</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblEMPLEADOS_facturaron1" runat="server" Text='<%#Bind("Fact")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>Horas Planeadas Semana</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblHORAS_PLANEADAS" runat="server" Text='<%#Bind("HORAS_PLANEADAS")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>Horas Reales</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblHORAS_REALES" runat="server" Text='<%#Bind("HORAS_REALES")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>Real %</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblHORAS_REALES1" runat="server" Text='<%#Bind("Real")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>Horas a Requerimientos</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblHORAS_A_REQUERIMIENTOS" runat="server" Text='<%#Bind("HORAS_A_REQUERIMIENTOS")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>Req %</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblHORAS_A_REQUERIMIENTOS1" runat="server" Text='<%#Bind("Req")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </div>
                    <div id="datosGrafica" runat="server"></div>
                    <div style="overflow: auto; height: 300px;" id="Div1" runat="server">
                        <asp:Chart ID="Chart1" runat="server" Width="1242px" BorderlineWidth="0">
                            <Series>
                                <asp:Series Name="Series1" LegendText="Planeadas" XValueMember="1" YValueMembers="6" Font="Microsoft Sans Serif, 8pt, style=Bold" IsValueShownAsLabel="True" LabelBackColor="Transparent" LabelForeColor="DarkBlue" Legend="Legend1">
                                </asp:Series>
                                <asp:Series Name="Series2" LegendText="Reales" XValueMember="1" YValueMembers="7" Font="Microsoft Sans Serif, 8pt, style=Bold" IsValueShownAsLabel="True" LabelForeColor="Goldenrod" Legend="Legend1">
                                </asp:Series>
                                <asp:Series Name="Series3" LegendText="Empleados a Requerimientos" XValueMember="1" YValueMembers="3" ChartType="Line" Legend="Legend1" YAxisType="Secondary" Color="#33CC33">
                                </asp:Series>
                                <asp:Series Name="Series4" LegendText="Empleados Facturaron" XValueMember="1" YValueMembers="4" ChartType="Line" Legend="Legend1" YAxisType="Secondary">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                    <AxisY LineColor="Black">
                                    </AxisY>
                                </asp:ChartArea>
                            </ChartAreas>
                            <Legends>
                                <asp:Legend Name="Legend1" Title="Horas">
                                </asp:Legend>
                            </Legends>
                            <BorderSkin BackColor="Transparent" BorderColor="Transparent" />
                        </asp:Chart>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- jQuery -->
               
            </form>
            </div>
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
        </body>

        </html>