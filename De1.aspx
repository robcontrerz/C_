<%@ Page Language="C#" AutoEventWireup="true" CodeFile="De1.aspx.cs" EnableEventValidation="false" Inherits="_De1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
    <%--    <script type="text/javascript" src="JS/gridviewScroll.min.js"></script>--%>
    <%--  <link href="JS/GridviewScroll.css" rel="stylesheet" />--%>
    <script language="javascript" type="text/javascript">
        function divexpandcollapse(divname) {
            var div = document.getElementById(divname);
            var img = document.getElementById('img' + divname);
            if (div.style.display == "none") {
                div.style.display = "inline";
                img.src = "img/minus.gif";
            } else {
                div.style.display = "none";
                img.src = "img/plus.gif";
            }
        }
        function divexpandcollapseChild(divname) {
            var div1 = document.getElementById(divname);
            var img = document.getElementById('img' + divname);
            if (div1.style.display == "none") {
                div1.style.display = "inline";
                img.src = "img/minus.gif";
            } else {
                div1.style.display = "none";
                img.src = "img/plus.gif";;
            }
        }
    </script>

    <!--link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-datepicker.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-year-calendar.min.css" />
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/style1.css" />

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script-->

    <!--link href="JS/GridviewScroll.css" rel="stylesheet" /-->

    <!--script type="text/javascript" src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script-->


    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
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
                height: 30px;
                width: 30px;
            }

        .auto-style1 {
            overflow: auto;
            width: 95%;
            height: 170px;
        }

        .Jefe {
            width: 100%;
        }

        .auto-style6 {
            margin-left: 30px;
            width: 80px;
        }


        .auto-style7 {
            right: 0;
            top: 36px;
        }


    </style>




    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet" />
    <link href="css/sb-admin-2.css" rel="stylesheet" />
    <link href="css/estilosRobert.css" rel="stylesheet" type="text/css" />
    <link href="vendor/morrisjs/morris.css" rel="stylesheet" />
    <!--link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" /-->


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



        <div>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <div class="modal">
                        <div class="center">
                            <img alt="" src="img/load2.gif" />
                        </div>
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>

            <div id="wrapper">

                <!-- Navigation -->
                <nav class="navbar navbar-default navbar-static-top" role="navigation">
                    <div class="navbar-header">                       
                        <a class="navbar-brand" href="Default.aspx"><asp:Image ID="Image13" runat="server"  ImageUrl="~/img/logoATT.png" Height="52px" Width="143px" /></a>
                    </div>
                    <!-- /.navbar-header -->
                    
                    <div class="perfil-header">
                        
                        <asp:Label ID="NOMBREEMP" runat="server" Text=""></asp:Label>
                        <div class="rojo-header">Estatus: <span><asp:Label ID="ESTADOCOLOR" runat="server" Text=""></asp:Label></span></div>
                    </div>
                  </nav>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">


                        <ul class="nav" id="side-menu">
                            <%--    <li class="sidebar-search">
                                    <div class="input-group custom-search-form">
                                        <input type="text" class="form-control" placeholder="Search...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </span>
                                    </div>
                                    <!-- /input-group -->
                                </li>--%>
                            <li>
                                <a href="Default.aspx"><i class="fa fa-dashboard fa-fw"></i>Horas</a>
                            </li>
                            <li>
                                <a href="#" class="estructura-ico"><i class="fa fa-sitemap fa-fw"></i>
                                    <asp:Label ID="Label7" runat="server" Text="Estructura" Font-Size="14pt"></asp:Label><span class="fa arrow"></span></a>

                                <ul class="nav nav-second-level">
                                    <li>

                                        <asp:DataList ID="DataList1" runat="server" RepeatColumns="1" RepeatDirection="Horizontal"
                                            Width="95%" BorderColor="Transparent" BorderStyle="Solid" BorderWidth="3px">

                                            <ItemTemplate>

                                                <table cellspacing="11" class="Jefe">
                                                    <tr>
                                                        <td class="auto-style6" rowspan="3">
                                                            <asp:ImageButton ID="A1" runat="server" Width="40px" Height="40px" ImageUrl='<%# "~/img/" + Eval("ID") + ".PNG" %> ' ToolTip='<%# Eval("Cargo") %>' class="img-circle" ForeColor="#1780c3" OnClick="A2_Click" /></td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Image ID="Image2" runat="server" Width="15px" Height="15px" ImageUrl="~/img/personas1.png" />
                                                            <span class="id-span">
                                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("CA") %>' ForeColor="#169ddb" Font-Size="10" Font-Bold="True" /></span>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Nombre") %>' Font-Size="8"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        </asp:DataList>
                                    </li>
                                </ul>
                            </li>
                            <%--CAPTURA MENU--%>
                            <li>
                                <a href="#" class="captura-ico"><i class="fa fa-wrench fa-fw"></i>Captura<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a id="A13" runat="server" onserverclick="ImageButton2_Click">Horas</a>
                                    </li>
                                    <li>
                                        <a id="A16" runat="server" onserverclick="ImageButton2_Click">Resumen</a>
                                        <%--<a id="A14" runat="server" onserverclick="ImageButton2_Click">Busqueda</a> </li>--%>
<%--                                    <li>
                                        <%--<a id="A15" runat="server" onserverclick="ImageButton2_Click">Actividades</a>--%>
                                    </li>
<%--                                    <li>
                                        
                                    </li>--%>
                                </ul>

                            </li>

                            <%--CAPTURA MENU--%>
                            <li>
                                <a href="#" class="reportes-ico"><i class="fa fa-tasks fa-fw"></i>
                                    <asp:Label ID="Label10" runat="server" Text="Reportes" Font-Size="14pt"></asp:Label><span class="fa arrow"></span></a>

                                <ul class="nav nav-second-level">
                                    <li>

                                        <asp:DataList ID="DataList2" runat="server" RepeatColumns="1" RepeatDirection="Horizontal"
                                            Width="95%" BorderColor="Transparent" BorderStyle="Solid" BorderWidth="3px">

                                            <ItemTemplate>

                                                <table cellspacing="11" class="Jefe">
                                                    <tr>
                                                        <td class="auto-style6" rowspan="3">
                                                            <asp:ImageButton ID="A1" runat="server" Width="40px" Height="40px" ImageUrl='<%# "~/img/" + Eval("ID") + ".PNG" %> ' ToolTip='<%# Eval("Cargo") %>' class="img-circle" ForeColor="#1780c3" OnClick="A1_Click1" onmouseover="this.style.cursor='hand'" onmouseout="this.style.cursor='default'" /></td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Image ID="Image2" runat="server" Width="15px" Height="15px" ImageUrl="~/img/Proyectos.png" />
                                                            <span class="id-span">
                                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("CA") %>' ForeColor="#169ddb" Font-Size="10" Font-Bold="True" /></span>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Nombre") %>' Font-Size="8"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        </asp:DataList>

                                    </li>
                                </ul>
                            </li>
                            <%--CAPTURA MENU fin--%>
                            <%--Proyectos--%>
                            <li>
                                <a href="#" class="proyectos-ico"><i class="fa fa-tasks fa-fw"></i>
                                    <asp:Label ID="Label11" runat="server" Text="Proyectos" Font-Size="14pt"></asp:Label><span class="fa arrow"></span></a>

                                <ul class="nav nav-second-level">
                                    <li>

                                        <asp:DataList ID="DataList3" runat="server" RepeatColumns="1" RepeatDirection="Horizontal"
                                            Width="95%" BorderColor="Transparent" BorderStyle="Solid" BorderWidth="3px">

                                            <ItemTemplate>

                                                <table cellspacing="11" class="Jefe">
                                                    <tr>
                                                        <td class="auto-style6" rowspan="3">
                                                            <asp:ImageButton ID="A4" runat="server" Width="40px" Height="40px" ImageUrl="~/img/Proyectos.png" ToolTip='<%# Eval("Cargo") %>' class="img-circle" ForeColor="#1780c3" OnClick="A4_Click" /></td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Image ID="Image2" runat="server" Width="15px" Height="15px" ImageUrl="~/img/Proyectos.png" />
                                                            <span class="id-span">
                                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("CA") %>' ForeColor="#169ddb" Font-Size="10" Font-Bold="True" /></span>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Cargo") %>' Font-Size="8"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        </asp:DataList>

                                    </li>
                                </ul>
                            </li>
                            <%--Proyectos fin--%>
                            <%--Pretickets--%>
                            <li>
                                <a href="#" class="pretickets-ico"><i class="fa fa-tasks fa-fw"></i>
                                    <asp:Label ID="Label13" runat="server" Text="Pretickets" Font-Size="14pt"></asp:Label><span class="fa arrow"></span></a>

                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="#">Abiertos<span class="fa arrow"></span></a>
                                        <asp:DataList ID="DataList6" runat="server" RepeatColumns="1" RepeatDirection="Horizontal"
                                            Width="95%" BorderColor="Transparent" BorderStyle="Solid" BorderWidth="3px">

                                            <ItemTemplate>

                                                <table cellspacing="11" class="Jefe">
                                                    <tr>
                                                        <td class="auto-style6" rowspan="3">
                                                            <asp:ImageButton ID="A6" runat="server" Width="40px" Height="40px" ImageUrl="~/img/Proyectos.png" ToolTip='<%# Eval("Cargo") %>' class="img-circle" ForeColor="#1780c3" OnClick="A6_Click" /></td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Image ID="Image2" runat="server" Width="15px" Height="15px" ImageUrl="~/img/Proyectos.png" />
                                                            <span class="id-span">
                                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("CA") %>' ForeColor="#169ddb" Font-Size="10" Font-Bold="True" /></span>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Cargo") %>' Font-Size="8"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        </asp:DataList>

                                    </li>
                                </ul>
                            </li>
                            <%--Pretickets fin--%>


                            <%--EXTERNOS--%>
                            <li>
                                <a href="#"><i class="fa fa-tasks fa-fw"></i>
                                    <asp:Label ID="Label12" runat="server" Text="Externos" Font-Size="14pt"></asp:Label><span class="fa arrow"></span></a>

                                <ul class="nav nav-second-level">
                                    <li>

                                        <asp:DataList ID="DataList4" runat="server" RepeatColumns="1" RepeatDirection="Horizontal"
                                            Width="95%" BorderColor="Transparent" BorderStyle="Solid" BorderWidth="3px">

                                            <ItemTemplate>

                                                <table cellspacing="11" class="Jefe">
                                                    <tr>
                                                        <td class="auto-style6" rowspan="3">
                                                            <asp:ImageButton ID="A5" runat="server" Width="40px" Height="40px" ImageUrl='<%# "~/img/" + Eval("ID") + ".PNG" %> ' ToolTip='<%# Eval("Cargo") %>' class="img-circle" ForeColor="#1780c3" OnClick="A5_Click" /></td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Image ID="Image2" runat="server" Width="15px" Height="15px" ImageUrl="~/img/99.png" />
                                                            <span class="id-span">
                                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Total") %>' ForeColor="#169ddb" Font-Size="10" Font-Bold="True" /></span>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Nombre") %>' Font-Size="8"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        </asp:DataList>

                                    </li>
                                </ul>

                            </li>
                            <%--EXTERNOS fin--%>
                        </ul>
                    </div>
                </div>

                <!-- Navigation -->

                <!-- ESTRUCTURA -->
                <asp:Panel ID="Panel5" runat="server" Visible="true">
                    <div id="page-wrapper">
                        <div class="row">
                            <div class="fecha-it">
                                <%--<div class="tit">
                                <asp:Label ID="Label8" runat="server" Text="Selecciona rango de fechas"></asp:Label>
                            </div>--%>
                                <h2>Filtrar por rango de fechas</h2>
                                <div>
                                    <asp:TextBox ID="inicioTabla" runat="server" Text="Fecha de inicio" placeholder="Fecha de inicio..."></asp:TextBox>
                                    <%--<asp:ImageButton ID="imgPopup" ImageUrl="img/calendar.png" ImageAlign="Bottom" runat="server" />--%>
                                    <ajaxtoolkit:CalendarExtender ID="Calendar1" PopupButtonID="imgPopup" runat="server" TargetControlID="inicioTabla" Format="yyyy/MM/dd"></ajaxtoolkit:CalendarExtender>
                                    <asp:TextBox ID="finTabla" runat="server" Text="Fecha fin" placeholder="Fecha fin..."></asp:TextBox>
                                    <%--<asp:ImageButton ID="ImageButton1" ImageUrl="img/calendar.png" ImageAlign="Bottom" runat="server" />--%>
                                    <ajaxtoolkit:CalendarExtender ID="CalendarExtender1" PopupButtonID="ImageButton1" runat="server" TargetControlID="finTabla" Format="yyyy/MM/dd"></ajaxtoolkit:CalendarExtender>
                                    <asp:Button ID="Button1" class="btnFechas" runat="server" Text="Buscar" OnClick="Button1_Click" />
                                </div>
                            </div>

                            <%-- <div class="col-lg-12">--%>
                            <div class="sub-content-container direccion-it">

                                <h1 id="H1" class="page-header" runat="server">

                                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                    <asp:Label ID="Lablid" runat="server" Text="Label" Style="display: none"></asp:Label>
                                    <span class="light">| </span>
                                    <asp:Label ID="Label1" runat="server" class="light" Text=""></asp:Label>




                                </h1>
                                <div id="estatusHoras" runat="server">
                                    <asp:Label ID="Lblazul" runat="server" Text="0"></asp:Label>
                                    <asp:Label ID="Lblsemana" runat="server" Text="Semana "></asp:Label>
                                    <asp:Label ID="Lblanio" runat="server" Text=""></asp:Label>
                                    <asp:Label ID="lblazultot" runat="server" Text="0" DataFormatString="{0:###,###}"></asp:Label>
                                    <asp:Label ID="Lblazultotal" runat="server" Text="Totales"></asp:Label>
                                </div>

                            </div>
                            <!-- /.col-lg-12 -->
                        </div>

                        <div class="row">
                            <%--AZUL--%>

                            <%--                         <div class="col-lg-3 col-md-5">
                                <div id="panelazul" class="panel panel-primary" runat="server">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <i class="fa fa-user fa-2x"></i>
                                            </div>
                                            <div class="col-xs-9 text-right">
                                                <div class="huge">
                                                    <asp:Label ID="Lblazul" runat="server" Text="0"></asp:Label>
                                                </div>
                                                <div>
                                                    <div>
                                                        <asp:Label ID="Lblazultotal" runat="server" Font-Size="15pt" Text="Totales"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-3">
                                                <i class="fa fa-clock-o fa-2x"></i>
                                            </div>
                                            <div class="col-xs-9 text-right">
                                                <div class="huge">
                                                    <asp:Label ID="lblazultot" runat="server" Text="0" DataFormatString="{0:###,###}"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="#">
                                        <div class="panel-footer">
                                            <span class="pull-left">
                                                <asp:LinkButton ID="BotonTotaldetalle" runat="server">Detalles</asp:LinkButton></span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                            <div class="clearfix"></div>
                                            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Totaldetalle" TargetControlID="BotonTotaldetalle" CancelControlID="btnClose" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
                                            <asp:Panel ID="Totaldetalle" runat="server" CssClass="modalPopup" align="center" Style="display: none">
                                                <br />
                                                <div style="overflow: scroll; height: 500px">
                                                    <asp:GridView ID="Dadetelletot" AutoGenerateColumns="false" runat="server" HeaderStyle-ForeColor="#337AB7" BackColor="#337AB7">

                                                        <HeaderStyle ForeColor="White" BackColor="#009FDB" />
                                                        <RowStyle BackColor="White" Font-Size="14pt" ForeColor="Gray" />
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-Width="30" HeaderText="">
                                                                <ItemTemplate>
                                                                    <asp:Image ID="Image1" runat="server" Height="20px" Width="20px"
                                                                        ImageUrl='~/img/azul.png'
                                                                        CssClass="img-circle"></asp:Image>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                                            <asp:BoundField DataField="cargo" HeaderText="Puesto" />
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                                <asp:Button ID="btnClose" runat="server" Text="Salir" />
                                                <br />
                                            </asp:Panel>

                                        </div>
                                    </a>
                                </div>
                            </div>--%>

                            <%--VERDE--%>

                            <%--<div class="col-lg-3 col-md-5">--%>
                            <div class="col-md-3">
                                <div class="panel panel-green">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="titulo-panel">Cumple</div>
                                            <asp:Label ID="Lblverde" runat="server" Text="0"></asp:Label>
                                            <asp:Label ID="Lblverdehrs" runat="server" Text="0" DataFormatString="{0:###,###}"></asp:Label>
                                        </div>
                                    </div>
                                    <a href="#">
                                        <div class="panel-footer">
                                            <span class="pull-left">
                                                <asp:LinkButton ID="Linkverde" runat="server">Ver detalles</asp:LinkButton></span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                            <div class="clearfix"></div>
                                            <ajaxtoolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="Panel1" TargetControlID="Linkverde" CancelControlID="Button2" BackgroundCssClass="modalBackground"></ajaxtoolkit:ModalPopupExtender>
                                            <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" Style="display: none">
                                                <div class="titulo-modal">Cumple</div>
                                                <div class="tabla-modal-wrapper">
                                                    <asp:GridView ID="Gridverde" runat="server" AutoGenerateColumns="False">
                                                        <Columns>
                                                            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                                            <asp:BoundField DataField="Hrs_Work" HeaderText="Horas Trabajadas" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                                                        </Columns>

                                                    </asp:GridView>
                                                </div>
                                                <asp:Button ID="Button2" runat="server" Text="Cerrar" />

                                            </asp:Panel>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <%--AMARILLO--%>
                            <div class="col-md-3">
                                <div class="panel panel-yellow">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="titulo-panel">Parcial</div>
                                            <asp:Label ID="Lblamarillo" runat="server" Text="0"></asp:Label>
                                            <asp:Label ID="Lblamarillohrs" runat="server" Text="0" DataFormatString="{0:###,###}"></asp:Label>
                                        </div>
                                    </div>
                                    <a href="#">
                                        <div class="panel-footer">
                                            <span class="pull-left">
                                                <asp:LinkButton ID="Linkamarillo" runat="server">Ver detalles</asp:LinkButton></span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                            <div class="clearfix"></div>
                                            <ajaxtoolkit:ModalPopupExtender ID="ModalPopupExtender3" runat="server" PopupControlID="Panel2" TargetControlID="Linkamarillo" CancelControlID="Button3" BackgroundCssClass="modalBackground"></ajaxtoolkit:ModalPopupExtender>
                                            <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" align="center" Style="display: none">
                                                <div class="titulo-modal">Parcial</div>
                                                <div class="tabla-modal-wrapper">
                                                    <asp:GridView ID="Gridamarillo" runat="server" AutoGenerateColumns="False">


                                                        <Columns>


                                                            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                                            <asp:BoundField DataField="Hrs_Work" HeaderText="Horas trabajadas" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                                                        </Columns>


                                                    </asp:GridView>
                                                </div>
                                                <asp:Button ID="Button3" runat="server" Text="Cerrar" />
                                                <br />
                                            </asp:Panel>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <%--ROJO--%>
                            <div class="col-md-3">
                                <div class="panel panel-red">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="titulo-panel">No cumple</div>
                                            <asp:Label ID="Lblrojo" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="Lblrojohrs" runat="server" Text="" DataFormatString="{0:###,###}"></asp:Label>
                                        </div>

                                    </div>
                                    <a href="#">
                                        <div class="panel-footer">
                                            <span class="pull-left">
                                                <asp:LinkButton ID="Linkrojo" runat="server">Ver detalles</asp:LinkButton>
                                            </span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                            <div class="clearfix"></div>
                                            <ajaxtoolkit:ModalPopupExtender ID="ModalPopupExtender4" runat="server" PopupControlID="Panel3" TargetControlID="Linkrojo" CancelControlID="Button4" BackgroundCssClass="modalBackground"></ajaxtoolkit:ModalPopupExtender>
                                            <asp:Panel ID="Panel3" runat="server" CssClass="modalPopup" Style="display: none">
                                                <div class="titulo-modal">No cumplen</div>
                                                <div class="tabla-modal-wrapper">
                                                    <asp:GridView ID="Gridrojo" runat="server" AutoGenerateColumns="False">
                                                        <Columns>
                                                            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                                            <asp:BoundField DataField="Hrs_Work" HeaderText="Horas trabajadas" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                                <asp:Button ID="Button4" runat="server" Text="Cerrar" />
                                            </asp:Panel>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <%--IGUALA--%>
                            <div class="col-md-3">
                                <div class="panel panel-gris">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="titulo-panel">Soporte | Operación</div>
                                            <asp:Label ID="Lbliguala" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="Lbliguala1" runat="server" Text="0" DataFormatString="{0:###,###}"></asp:Label>


                                        </div>

                                    </div>
                                    <a href="#">
                                        <div class="panel-footer">
                                            <span class="pull-left">
                                                <asp:LinkButton ID="LinkButton1" runat="server">Ver detalles</asp:LinkButton></span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                            <div class="clearfix"></div>
                                            <ajaxtoolkit:ModalPopupExtender ID="ModalPopupExtender5" runat="server" PopupControlID="Panel4" TargetControlID="LinkButton1" CancelControlID="Button5" BackgroundCssClass="modalBackground"></ajaxtoolkit:ModalPopupExtender>
                                            <asp:Panel ID="Panel4" runat="server" CssClass="modalPopup" align="center" Style="display: none">
                                                <div class="titulo-modal">Soporte | Operacion</div>
                                                <div class="tabla-modal-wrapper">
                                                    <asp:GridView ID="Gridgris" runat="server" AutoGenerateColumns="False">


                                                        <Columns>

                                                            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                                            <asp:BoundField DataField="Hrs_Work" HeaderText="Horas trabajadas" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                                                        </Columns>

                                                    </asp:GridView>
                                                </div>
                                                <asp:Button ID="Button5" runat="server" Text="Cerrar" />

                                            </asp:Panel>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="row tabla-colaboradores">
                            <div class="titulo-tabla">
                                <h2>Colaboradores por semanas</h2>
                                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" CssClass="auto-style7">Exportar a excel</asp:LinkButton>
                            </div>

                            <!-- Tabla colaboradores -->
                            <div id="morris-area-chart">
                                <asp:Panel ID="PInfoempleado" runat="server" Visible="true">
                                    <div class="tabla-wrapper">
                                        <%--ImageUrl='<%#("~\\img\\")+Eval("Estatus")+(".png")--%>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false"
                                                    CssClass="Grid" OnRowCommand="gvCustomers_SelectedIndexChanged1"
                                                    DataKeyNames="ID" OnRowDataBound="OnRowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-Width="20px">
                                                            <ItemTemplate>
                                                                <a href="JavaScript:divexpandcollapse('div<%# Eval("ID") %>');">
                                                                    <img id="imgdiv<%# Eval("ID") %>" width="9px" border="1" src="img/plus.gif"
                                                                        alt="" /></a>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="20px" HorizontalAlign="Right"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Nombre">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LMarcas" runat="server" HeaderText="Nombre" ToolTip='<%# Eval("ID") %>' Text='<%# Eval("nombre") %>' CausesValidation="false" CommandName="Semanas" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                                                                <%--  <asp:Label ID="lblPrCode" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,
                                                                "ID") %>'></asp:Label>--%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="1">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl1" runat="server" Text='<%# Eval("1") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="2">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl2" runat="server" Text='<%# Eval("2") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="3">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl3" runat="server" Text='<%# Eval("3") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="4">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl4" runat="server" Text='<%# Eval("4") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="5">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl5" runat="server" Text='<%# Eval("5") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="6">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl6" runat="server" Text='<%# Eval("6") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="7">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl7" runat="server" Text='<%# Eval("7") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="8">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl8" runat="server" Text='<%# Eval("8") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="9">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl9" runat="server" Text='<%# Eval("9") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="10">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl10" runat="server" Text='<%# Eval("10") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="11">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl11" runat="server" Text='<%# Eval("11") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="12">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl12" runat="server" Text='<%# Eval("12") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="13">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl13" runat="server" Text='<%# Eval("13") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="14">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl14" runat="server" Text='<%# Eval("14") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="15">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl15" runat="server" Text='<%# Eval("15") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="16">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl16" runat="server" Text='<%# Eval("16") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="17">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl17" runat="server" Text='<%# Eval("17") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="18">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl18" runat="server" Text='<%# Eval("18") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="19">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl19" runat="server" Text='<%# Eval("19") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="20">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl20" runat="server" Text='<%# Eval("20") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="21">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl21" runat="server" Text='<%# Eval("21") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="22">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl22" runat="server" Text='<%# Eval("22") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="23">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl23" runat="server" Text='<%# Eval("23") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="24">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl24" runat="server" Text='<%# Eval("24") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="25">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl25" runat="server" Text='<%# Eval("25") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="26">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl26" runat="server" Text='<%# Eval("26") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="27">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl27" runat="server" Text='<%# Eval("27") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="28">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl28" runat="server" Text='<%# Eval("28") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="29">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl29" runat="server" Text='<%# Eval("29") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="30">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl30" runat="server" Text='<%# Eval("30") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="31">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl31" runat="server" Text='<%# Eval("31") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="32">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl32" runat="server" Text='<%# Eval("32") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="33">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl33" runat="server" Text='<%# Eval("33") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="34">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl34" runat="server" Text='<%# Eval("34") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="35">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl35" runat="server" Text='<%# Eval("35") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="36">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl36" runat="server" Text='<%# Eval("36") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="37">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl37" runat="server" Text='<%# Eval("37") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="38">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl38" runat="server" Text='<%# Eval("38") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="39">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl39" runat="server" Text='<%# Eval("39") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="40">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl40" runat="server" Text='<%# Eval("40") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="41">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl41" runat="server" Text='<%# Eval("41") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="42">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl42" runat="server" Text='<%# Eval("42") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="43">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl43" runat="server" Text='<%# Eval("43") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="44">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl44" runat="server" Text='<%# Eval("44") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="45">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl45" runat="server" Text='<%# Eval("45") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="46">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl46" runat="server" Text='<%# Eval("46") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="47">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl47" runat="server" Text='<%# Eval("47") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="48">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl48" runat="server" Text='<%# Eval("48") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="49">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl49" runat="server" Text='<%# Eval("49") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="50">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl50" runat="server" Text='<%# Eval("50") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="51">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl51" runat="server" Text='<%# Eval("51") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="52">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl52" runat="server" Text='<%# Eval("52").ToString() %>'></asp:Label>
                                                                </td>
                                <tr>
                                    <td colspan="100%">
                                        <div id="div<%# Eval("ID") %>" style="overflow: auto; display: none; position: relative; left: 15px; overflow: auto">
                                            <asp:GridView ID="gvOrders" runat="server" Width="760px" AutoGenerateColumns="false" OnRowCommand="gvCustomers_SelectedIndexChanged1">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Nombre" HeaderStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LMarcas" runat="server" HeaderText="Nombre" ToolTip='<%# Eval("ID") %>' Text='<%# Eval("nombre") %>' CausesValidation="false" CommandName="Semanas" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="proyecto" HeaderText="Proyecto"  />
                                                    <asp:BoundField DataField="1" HeaderText="  1" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="2" HeaderText="  2" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="3" HeaderText="  3" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="4" HeaderText="  4" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="5" HeaderText="  5" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="6" HeaderText="  6" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="7" HeaderText="  7" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="8" HeaderText="  8" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="9" HeaderText="  9" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="10" HeaderText="  10" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="11" HeaderText="  11" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="12" HeaderText="  12" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="13" HeaderText="  13" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="14" HeaderText="  14" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="15" HeaderText="  15" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="16" HeaderText="  16" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="17" HeaderText="  17" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="18" HeaderText="  18" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="19" HeaderText="  19" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="20" HeaderText="  20" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="21" HeaderText="  21" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="22" HeaderText="  22" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="23" HeaderText="  23" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="24" HeaderText="  24" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="25" HeaderText="  25" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="26" HeaderText="  26" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="27" HeaderText="  27" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="28" HeaderText="  28" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="29" HeaderText="  29" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="30" HeaderText="  30" DataFormatString="{0:N0}" />


                                                    <asp:BoundField DataField="31" HeaderText="  31" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="32" HeaderText="  32" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="33" HeaderText="  33" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="34" HeaderText="  34" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="35" HeaderText="  35" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="36" HeaderText="  36" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="37" HeaderText="  37" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="38" HeaderText="  38" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="39" HeaderText="  39" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="40" HeaderText="  40" DataFormatString="{0:N0}" />

                                                    <asp:BoundField DataField="41" HeaderText="  41" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="42" HeaderText="  42" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="43" HeaderText="  43" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="44" HeaderText="  44" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="45" HeaderText="  45" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="46" HeaderText="  46" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="47" HeaderText="  47" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="48" HeaderText="  48" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="49" HeaderText="  49" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="50" HeaderText="  50" DataFormatString="{0:N0}" />

                                                    <asp:BoundField DataField="51" HeaderText="  51" DataFormatString="{0:N0}" />
                                                    <asp:BoundField DataField="52" HeaderText="  52" DataFormatString="{0:N0}" />


                                                </Columns>
                                                <%-- <HeaderStyle BackColor="#95B4CA" ForeColor="White" />--%>
                                            </asp:GridView>
                                        </div>
                                    </td>
                                </tr>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                    </div>
                                    <%--     <script type="text/javascript">
                                        $(document).ready(function () {
                                            gridviewScroll();
                                        });

                                        function gridviewScroll() {
                                            GridView = $('#gvCustomers').gridviewScroll({
                                                width: 1800,
                                                height: 400,
                                                //railcolor: "#F0F0F0",
                                                //barcolor: "#CDCDCD",
                                                //barhovercolor: "#606060",
                                                //bgcolor: "#F0F0F0",
                                                freezesize: 1,
                                                arrowsize: 30,
                                                varrowtopimg: "img/arrowvt.png",
                                                varrowbottomimg: "img/arrowvb.png",
                                                harrowleftimg: "img/arrowhl.png",
                                                harrowrightimg: "img/arrowhr.png",
                                                headerrowcount: 1,
                                                railsize: 16,
                                                barsize: 8
                                            });
                                        }
                                    </script>--%>
                                </asp:Panel>

                            </div>

                            <!-- Jefe detalle -->
                            <h2>Detalle de colaborador</h2>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <table class="Jefe">
                                        <tr>
                                            <td colspan="2" class="text-center">
                                                <asp:Label ID="Lblname" runat="server" Text="Label" Font-Bold="True"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">
                                                <asp:Label ID="lblp" runat="server" Text="Label"></asp:Label>
                                            </td>
                                            <td class="text-center">
                                                <asp:Label ID="Lblt" runat="server" Text="Label"></asp:Label></td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <!-- Tabla Detalle -->
                            <div id="divGrid" class="auto-style1">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="Grid" RowStyle-HorizontalAlign="Left"
                                            HeaderStyle-CssClass="GridviewScrollHeader" RowStyle-CssClass="GridviewScrollItem">
                                            <Columns>
                                                <asp:BoundField DataField="proyecto" HeaderText="Proyectos" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField DataField="horas" HeaderText="Hrs reportadas" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                                                <asp:BoundField DataField="asunto" HeaderText="Nombre" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" />

                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <!-- tabla detalle 2 -->
                            <%-- <asp:Panel ID="Panel11" runat="server" ScrollBars="Auto" Width="98%" Height="418px" CssClass="auto-style2">--%>
                            <div>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="GridViewTareas" runat="server" AutoGenerateColumns="false" CssClass="Grid"
                                            HeaderStyle-CssClass="GridviewScrollHeader" RowStyle-CssClass="GridviewScrollItem">
                                            <Columns>
                                                <asp:BoundField DataField="tiporegistro" HeaderText="Actividades" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField DataField="horas" HeaderText="Hrs reportadas" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />

                                            </Columns>

                                        </asp:GridView>




                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <%--  </asp:Panel>--%>

                            <%--                            <div class="col-xs-12">


                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <i class="fa fa-clock-o fa-fw"></i>Detalle
                                           <div>
                                           </div>
                                    </div>

                                    <!-- /.panel-heading  primero -->
                                    <div class="panel-body">

                                        <ul class="timeline">
                                            <li>

                                                <div class="timeline-panel">
                                                </div>
                                                <div class="timeline-panel">
                                                    <div class="timeline-heading">
                                                    </div>

                                                </div>


                                            </li>



                                        </ul>
                                    </div>
                                    <!-- /.panel-body -->
                                </div>
                                <!-- /.panel -->
                            </div>--%>
                        </div>
                        <!-- /.row -->
                    </div>
                </asp:Panel>
                <!-- ESTRUCTURA -->

                <!-- Captura -->
                <asp:Panel ID="Panel6" runat="server" Visible="false">
                    <div id="page-wrapper1">
                        <div class="row">
                            <div class="tit">
                                <%-- <asp:Label ID="Label19" runat="server" Text="Selecciona rango de fechas"></asp:Label>--%>
                            </div>
                            <div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <i class="fa fa-user fa-fw"></i>Captura<div class="eligeFecha">
                                        </div>
                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <div id="morris-area-chart2">
                                            <asp:Panel ID="Panel7" runat="server" Visible="true">
                                                <div style="height: 800px; width: 100%;">
                                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                        <ContentTemplate>
                                                            <iframe id="IframeDoctos" runat="server" height="800px" width="100%"></iframe>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    <!-- /.panel-body -->
                                </div>
                                <!-- /.panel -->
                            </div>
                        </div>
                    </div>
                </asp:Panel>
                <!-- CAPTURA -->

                <!--PROYECTOS -->
                <asp:Panel ID="Panel9" runat="server" Visible="false">
                    <div id="page-wrapper">
                        <div id="Div1" class="row">
                            <asp:Panel ID="Panel10" runat="server" Visible="true">
                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                    <ContentTemplate>

                                        <iframe id="Iframe1" height="800" width="100%" src="Personas.aspx"></iframe>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </asp:Panel>

                        </div>
                    </div>
                </asp:Panel>
                <!--PROYECTOS -->

                <!-- /#page-wrapper -->
                <!--PROYECTOS PERSONAS -->

                <asp:Panel ID="Panel12" runat="server" Visible="false">
                    <div id="page-wrapper">
                        <div class="row">
                            <div class="tit">
                                <%-- <asp:Label ID="Label19" runat="server" Text="Selecciona rango de fechas"></asp:Label>--%>
                            </div>
                            <div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <i class="fa fa-user fa-fw"></i>Proyectos
                                        <div class="eligeFecha">
                                        </div>

                                    </div>

                                    <div class="panel-body">
                                        <div id="morris-area-chart3">
                                            <asp:Panel ID="Panel13" runat="server" Visible="true" BorderStyle="Double" BorderColor="Silver">
                                                <div style="height: 800px; width: auto;">

                                                    <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                                        <ContentTemplate>

                                                            <iframe id="Iproyect" height="800" width="100%" src="Proyectos.aspx"></iframe>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                </div>





                                            </asp:Panel>

                                        </div>
                                    </div>
                                    <!-- /.panel-body -->
                                </div>


                                <!-- /.panel -->
                            </div>

                        </div>


                    </div>

                </asp:Panel>
                <!-- CAPTURA -->
                <!--PROYECTOS PERSONAS-->
                <!--PRETICKETS -->

                <asp:Panel ID="Panel14" runat="server" Visible="false">
                    <div id="page-wrapper">
                        <div class="row">
                            <div class="tit">
                                <%-- <asp:Label ID="Label19" runat="server" Text="Selecciona rango de fechas"></asp:Label>--%>
                            </div>
                            <div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <i class="fa fa-user fa-fw"></i>Pretickets<div class="eligeFecha">
                                        </div>

                                    </div>

                                    <div class="panel-body">
                                        <div id="morris-area-chart3">
                                            <asp:Panel ID="Panel15" runat="server" Visible="true" BorderStyle="Double" BorderColor="Silver">
                                                <div style="height: 800px; width: auto;">

                                                    <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                                        <ContentTemplate>

                                                            <iframe id="Ipreticket" height="800" width="100%" src="Pretickets.aspx"></iframe>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                </div>





                                            </asp:Panel>

                                        </div>
                                    </div>
                                    <!-- /.panel-body -->
                                </div>


                                <!-- /.panel -->
                            </div>

                        </div>


                    </div>

                </asp:Panel>
                <!-- CAPTURA -->
                <!--PROYECTOS PERSONAS-->
                <!--EXTERNOS -->
                <asp:Panel ID="Panel16" runat="server" Visible="false">
                    <div id="page-wrapper">
                        <div class="row">
                            <div class="tit">
                                <%-- <asp:Label ID="Label19" runat="server" Text="Selecciona rango de fechas"></asp:Label>--%>
                            </div>
                            <div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <i class="fa fa-user fa-fw"></i>Externos<div class="eligeFecha">
                                        </div>

                                    </div>

                                    <div class="panel-body">
                                        <div id="morris-area-chart3">
                                            <asp:Panel ID="Panel17" runat="server" Visible="true" BorderStyle="Double" BorderColor="Silver">
                                                <div style="height: 800px; width: auto;">

                                                    <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                                                        <ContentTemplate>

                                                            <iframe id="Iexternos" height="800" width="100%" src="Externos.aspx"></iframe>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                </div>





                                            </asp:Panel>

                                        </div>
                                    </div>
                                    <!-- /.panel-body -->
                                </div>


                                <!-- /.panel -->
                            </div>

                        </div>


                    </div>

                </asp:Panel>
                <!--EXTERNOS FIN -->




            </div>



            <!-- /#wrapper -->

            <!-- jQuery -->
            <%--            <script type="text/javascript">
                $(document).ready(function () {
                    //GaugeMeter
                    $(".GaugeMeter").gaugeMeter();
                });
            </script>--%>
            <!--script src="vendor/jquery/jquery.min.js"></script-->

            <!-- Bootstrap Core JavaScript -->
            <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
            <script src="jquery/jquery-ui-1.7.3.custom.min.js" type="text/javascript"></script>
            <%--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>
            <%--  <script type="text/javascript">
                                        $("[src*=plus]").live("click", function () {
                                            $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
                                            $(this).attr("src", "img/minus.png");
                                        });
                                        $("[src*=minus]").live("click", function () {
                                            $(this).attr("src", "img/plus.png");
                                            $(this).closest("tr").next().remove();
                                        });
            </script>--%>
            <script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>

            <!-- Metis Menu Plugin JavaScript -->
            <script type="text/javascript" src="vendor/metisMenu/metisMenu.min.js"></script>

            <!-- Morris Charts JavaScript -->
            <script type="text/javascript" src="vendor/raphael/raphael.min.js"></script>
            <script type="text/javascript" src="vendor/morrisjs/morris.min.js"></script>
            <script type="text/javascript" src="data/morris-data.js"></script>

            <!-- Custom Theme JavaScript -->
            <script type="text/javascript" src="js/sb-admin-2.js"></script>
        </div>
    </form>
</body>
</html>

