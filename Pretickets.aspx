<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pretickets.aspx.cs" Inherits="Pretickets" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet" />
    <link href="vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet" />
    <link href="css/estilosRobert.css" rel="stylesheet" type="text/css" />
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
        <asp:HiddenField runat="server" ID="hidLastTab" />


        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">

   
                    <!-- .panel-heading -->
                    <div class="panel-body">
                        <div class="panel-group" id="accordion">
                            <div class="panel panel-default">
                                <div id="collapseOne" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <asp:Label ID="lblTemp" runat="server" ForeColor="#00a0de" Font-Bold="true" Font-Names="Courier New"
                                            Font-Size="Large">
                                        </asp:Label>
                                        <p style="background-color: #000000; color: #FFFFFF; font-size: 16px; text-align: center;">Reporte</p>
                                        <div style="overflow: auto; height: 300px;" id="Div2" runat="server">
                                           <asp:GridView ID="GridView2" runat="server" EnableViewState="true" BackColor="White" AutoGenerateColumns="false" 
                                             OnRowCommand="gvCustomers_SelectedIndexChanged1"
                                                 Width="100%" PageSize="5" Height="200px" EnableSortingAndPagingCallbacks="false">
                                                 <HeaderStyle HorizontalAlign="Center" BackColor="#00A0DE" Font-Bold="True" VerticalAlign="Middle" ForeColor="White"></HeaderStyle>
                                                <Columns>

                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Preticket</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LMarcas1" runat="server" HeaderText="Nombre" CausesValidation="false" ToolTip='<%# Eval("FOLIO_PRETICKET") %>' Text='<%# Eval("FOLIO_PRETICKET") %>' CommandName="Semanas" CommandArgument='<%# Eval("FOLIO_PRETICKET") %>'></asp:LinkButton>
                                                            <%--<asp:Label ID="lblId" runat="server" Text='<%#Bind("ID_REQUERIMIENTO")%>'></asp:Label>--%>
                                                        </ItemTemplate>

                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Requerimiento</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNombre" runat="server" Text='<%#Bind("ID_REQUERIMIENTO")%>'></asp:Label>
                                                        </ItemTemplate>

                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Asunto</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAsunto" runat="server" Text='<%#Bind("ASUNTO")%>'></asp:Label>
                                                        </ItemTemplate>

                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Categoria de Negocio</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEMPLEADOS_REQUERIMIENTO" runat="server" Text='<%#Bind("CATEGORIA_NEGOCIO")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Tipo</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEMPLEADOS_facturaron" runat="server" Text='<%#Bind("TIPO_SOLICITUD")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                                        <HeaderTemplate>Fecha creación</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblfac_factura" DataFormatString="{0:d}" runat="server" Text='<%#Bind("fecha")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Estado</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblHORAS_PLANEADAS" runat="server" Text='<%#Bind("ESTADO")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Horas</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblHORAS_REALES" runat="server" Text='<%#Bind("Horas")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Personas que participaron</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblreal_REAL" runat="server" Text='<%#Bind("Personas")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                                                        <HeaderTemplate>Ultima fecha de registro</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblHORAS_A_REQUERIMIENTOS" runat="server" Text='<%#Bind("fecha1", "{0:d}")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>


                                        </div>
                                        <p></p>
                                        <p style="background-color: #000000; color: #FFFFFF; font-size: 16px; text-align: center;">
                                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label></p>
                                        <div id="Div1" runat="server" style="overflow: auto; height: 250px;">
                                            <asp:GridView ID="GridView3" runat="server" ForeColor="Black" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="true"
                                                EnableViewState="true" BackColor="White" BorderColor="White" BorderStyle="None" OnRowCommand="gvCustomers_SelectedIndexChanged1"
                                                GridLines="Vertical" Width="100%" PageSize="5" Height="200px" EnableSortingAndPagingCallbacks="false">
                                                <FooterStyle BackColor="#CCCC99"></FooterStyle>
                                                <RowStyle BackColor="#F9F9F9"></RowStyle>

                                                <HeaderStyle HorizontalAlign="Center" BackColor="#00A0DE" Font-Bold="True" VerticalAlign="Middle"
                                                    ForeColor="White"></HeaderStyle>
                                                <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                               
                                            </asp:GridView>


                                        </div>
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
