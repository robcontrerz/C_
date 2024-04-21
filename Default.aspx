<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" EnableEventValidation="false" Inherits="_Default" %>

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
    <script type="text/javascript" src="jquery/1.9.0/jquery.min.js"></script>
    <script type="text/javascript" src="jquery/1.9.0/jquery-ui.min.js"></script>

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






    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet" />
    <link href="css/sb-admin-2.css" rel="stylesheet" />
    <link href="css/estilosRobert.css" rel="stylesheet" type="text/css" />
    <link href="vendor/morrisjs/morris.css" rel="stylesheet" />
    	<link rel="stylesheet" href="css/estilos.css"/>
	<link rel="stylesheet" href="../../../i.icomoon.io/public/temp/7d96e2500b/UntitledProject7/style.html"/>
	<link rel="stylesheet" href="css/fonts.css"/>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>

    <style type="text/css">
        .auto-style1 {
            right: 208px;
        }
        .auto-style2 {
            right: 0;
            top: 36px;
        }
    </style>

</head>
<body>
    <%--	<header>
		<div class="menu_bar">
			<a class="bt-menu" href="#"><span class="icon-list2"></span>Menu</a>
		</div>

<%--		<nav>
			<ul>
				<li><a href="#"><span class="icon-house"></span>Inicio</a></li>
				<li><a href="#"><span class="icon-suitcase"></span>Trabajos</a></li>
				<li><a href="#"><span class="icon-rocket"></span>Proyectos</a></li>
				<li><a href="#"><span class="icon-earth"></span>Servicios</a></li>
				<li><a href="#"><span class="icon-mail"></span>Contacto</a></li>
			</ul>
		</nav>--%>
	<%--</header>--%>--%>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

  <div class="contenedor">

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

 
                <nav class="navbar navbar-default navbar-static-top" role="navigation">
                    <div class="navbar-header">                       
                        <a class="navbar-brand" href="Default.aspx"><asp:Image ID="Image13" runat="server"  ImageUrl="~/img/logoATT.png" Height="43px" Width="71px" /></a>
                    </div>
                   
                    
                    <div class="perfil-header">
 
		<div class="menu_bar">
			<a class="bt-menu" href="#"><span class="icon-list2"></span>Menu</a>
		</div>

<%--		<nav>
			<ul>
				<li><a href="#"><span class="icon-house"></span>Inicio</a></li>
				<li><a href="#"><span class="icon-suitcase"></span>Trabajos</a></li>
				<li><a href="#"><span class="icon-rocket"></span>Proyectos</a></li>
				<li><a href="#"><span class="icon-earth"></span>Servicios</a></li>
				<li><a href="#"><span class="icon-mail"></span>Contacto</a></li>
			</ul>
		</nav>--%>
 
                                 
		</div>

                    </div>
                 </nav>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">


                        <ul class="nav" id="side-menu">

                            <li>
                                <a href="Default.aspx"><i class="fa fa-dashboard fa-fw"></i>Seguros</a>
                            </li>
                            <li>

                            </li>
                            <%--CAPTURA MENU--%>
                            <li>
                                <a href="#" class="captura-ico"><i class="fa fa-wrench fa-fw"></i>Venta<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a id="A13" runat="server" onserverclick="ImageButton2_Click">Boletos Autobus</a>
                                    </li>
                                    <li>
                                        <a id="A21" runat="server" onserverclick="ImageButton2_Click">Boletos Avion</a>
                                    </li>
                                    <li>
                                        <a id="A16" runat="server" onserverclick="ImageButton2_Click">Boletos Barco</a>

                                    </li>
                                    <li>
                                        <a id="A1" runat="server" onserverclick="ImageButton2_Click">Boletos Tren</a>
                                    </li>


                                </ul>

                            </li>




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
                            </div>

                            <%-- <div class="col-lg-12">--%>
                            <div class="sub-content-container direccion-it" style="left: 0px; top: 0px">

                                <h2 id="H1" class="page-header" runat="server"></h2>

                                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                <asp:Label ID="Lablid" runat="server" Text="Label" Style="display: none"></asp:Label>
                                <span class="light">| </span>
                                <asp:Label ID="Label1" runat="server" class="light" Text=""></asp:Label>

                                <h3>&nbsp;</h3>
                                <div class="container-fluid">
 
                                      <asp:TextBox ID="TextBox1" runat="server" placeholder="Origen" class="pure-input-rounded"></asp:TextBox>
                                    <asp:TextBox ID="TextBox2" runat="server" placeholder="Destino" class="pure-input-rounded"></asp:TextBox>
                                    <asp:TextBox ID="inicioTabla" runat="server" Text="Fecha de inicio" placeholder="Fecha de inicio..."></asp:TextBox>
                                    <%--<asp:ImageButton ID="imgPopup" ImageUrl="img/calendar.png" ImageAlign="Bottom" runat="server" />--%>
                                    <ajaxtoolkit:CalendarExtender ID="Calendar1" PopupButtonID="imgPopup" runat="server" TargetControlID="inicioTabla" Format="yyyy/MM/dd"></ajaxtoolkit:CalendarExtender>
                                    <asp:TextBox ID="finTabla" runat="server" Text="Fecha fin" placeholder="Fecha fin..."></asp:TextBox>
                                    <%--<asp:ImageButton ID="ImageButton1" ImageUrl="img/calendar.png" ImageAlign="Bottom" runat="server" />--%>
                                    <ajaxtoolkit:CalendarExtender ID="CalendarExtender1" PopupButtonID="ImageButton1" runat="server" TargetControlID="finTabla" Format="yyyy/MM/dd"></ajaxtoolkit:CalendarExtender>
                                    <asp:Button ID="Button1" class="btnFechas" runat="server" Text="Buscar" OnClick="Button1_Click" />
                                </div>
                                <section>

                                </section>


                                <div id="estatusHoras" runat="server" visible="false">
                                    <asp:Label ID="Lblazul" runat="server" Text="0" visible="false"></asp:Label>
                                    <asp:Label ID="Lblsemana" runat="server" Text="Semana " visible="false"></asp:Label>
                                    <asp:Label ID="Lblanio" runat="server" Text="" visible="false"></asp:Label>
                                    <asp:Label ID="lblazultot" runat="server" DataFormatString="{0:###,###}" Text="0" visible="false"></asp:Label>
                                    <asp:Label ID="Lblazultotal" runat="server" Text="Totales" visible="false" CssClass="auto-style1"></asp:Label>
                                </div>







                            </div>
                            <!-- /.col-lg-12 -->
                        </div>


                        <%--<div class="col-lg-3 col-md-5">--%>
              <%--          <div class="col-md-3" >
                            <div class="panel panel-green" >
                                <div class="panel-heading">
                                    <div class="row" visible="false">
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
                        </div>--%>

                    </div>
                    <div class="row tabla-colaboradores" visible="false">
                        <div class="titulo-tabla">
                            <h2>Colaboradores por semanas</h2>
                            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Exportar a excel</asp:LinkButton>
                        </div>

                        <!-- Tabla colaboradores -->
                        <div id="morris-area-chart">
                            <asp:Panel ID="PInfoempleado" runat="server" Visible="true">
                                <div class="tabla-wrapper">
                                    <%--ImageUrl='<%#("~\\img\\")+Eval("Estatus")+(".png")--%>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                </div>
                            
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


                        <%--     </div>--%>
                        <!-- /.row -->
                        <%--             </div>
                </asp:Panel>--%>
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

                </asp:Panel>

                <!-- /#wrapper -->



                <!-- Bootstrap Core JavaScript -->
                <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
                <script src="jquery/jquery-ui-1.7.3.custom.min.js" type="text/javascript"></script>

                <script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>

                <!-- Metis Menu Plugin JavaScript -->
                <script type="text/javascript" src="vendor/metisMenu/metisMenu.min.js"></script>



                <!-- Custom Theme JavaScript -->
                <script type="text/javascript" src="js/sb-admin-2.js"></script>
            </div>
        </div>

       
    </form>
</body>
</html>

