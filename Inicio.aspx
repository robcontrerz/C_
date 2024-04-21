<%@ Page Title="" Language="C#" MasterPageFile="~/costo.master" AutoEventWireup="true" CodeFile="Inicio.aspx.cs" Inherits="Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
        <div id="wrapper">

                <!-- Navigation -->

                <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="Default.aspx">Costos IT</a>
                    </div>
                    <!-- /.navbar-header -->

                    <ul class="nav navbar-top-links navbar-right">
                        <%--                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="fa fa-envelope fa-fw"></i><i class="fa fa-caret-down"></i>
                            </a>
                          <%--  <ul class="dropdown-menu dropdown-messages">
                                <li>
                                    <a href="#">
                                        <div>
                                            <strong>John Smith</strong>
                                            <span class="pull-right text-muted">
                                                <em>Yesterday</em>
                                            </span>
                                        </div>
                                        <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <div>
                                            <strong>John Smith</strong>
                                            <span class="pull-right text-muted">
                                                <em>Yesterday</em>
                                            </span>
                                        </div>
                                        <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <div>
                                            <strong>John Smith</strong>
                                            <span class="pull-right text-muted">
                                                <em>Yesterday</em>
                                            </span>
                                        </div>
                                        <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a class="text-center" href="#">
                                        <strong>Read All Messages</strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </li>
                            </ul>--%>
                        <!-- /.dropdown-messages -->
                        <%--  </li>--%>
                        <!-- /.dropdown -->
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="fa fa-tasks fa-fw"></i><i class="fa fa-caret-down"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-tasks">
                                <li>
                                    <a href="Captura.aspx"></a>
                                </li>
                            </ul>
                            <%--                            barras avance
                            <ul class="dropdown-menu dropdown-tasks">
                                <li>
                                    <a href="#">
                                        <div>
                                            <p>
                                                <strong>Task 1</strong>
                                                <span class="pull-right text-muted">40% Complete</span>
                                            </p>
                                            <div class="progress progress-striped active">
                                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                                    <span class="sr-only">40% Complete (success)</span>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <div>
                                            <p>
                                                <strong>Task 2</strong>
                                                <span class="pull-right text-muted">20% Complete</span>
                                            </p>
                                            <div class="progress progress-striped active">
                                                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                                    <span class="sr-only">20% Complete</span>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <div>
                                            <p>
                                                <strong>Task 3</strong>
                                                <span class="pull-right text-muted">60% Complete</span>
                                            </p>
                                            <div class="progress progress-striped active">
                                                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                                    <span class="sr-only">60% Complete (warning)</span>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <div>
                                            <p>
                                                <strong>Task 4</strong>
                                                <span class="pull-right text-muted">80% Complete</span>
                                            </p>
                                            <div class="progress progress-striped active">
                                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                                    <span class="sr-only">80% Complete (danger)</span>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a class="text-center" href="#">
                                        <strong>See All Tasks</strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </li>
                            </ul>--%>
                            <!-- /.dropdown-tasks -->
                        </li>
                        <!-- /.dropdown -->
                        <%--                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="fa fa-bell fa-fw"></i><i class="fa fa-caret-down"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-alerts">
                                <li>
                                    <a href="#">
                                        <div>
                                            <i class="fa fa-comment fa-fw"></i>New Comment
                                   
                                            <span class="pull-right text-muted small">4 minutes ago</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <div>
                                            <i class="fa fa-twitter fa-fw"></i>3 New Followers
                                   
                                            <span class="pull-right text-muted small">12 minutes ago</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <div>
                                            <i class="fa fa-envelope fa-fw"></i>Message Sent
                                   
                                            <span class="pull-right text-muted small">4 minutes ago</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <div>
                                            <i class="fa fa-tasks fa-fw"></i>New Task
                                   
                                            <span class="pull-right text-muted small">4 minutes ago</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <div>
                                            <i class="fa fa-upload fa-fw"></i>Server Rebooted
                                   
                                            <span class="pull-right text-muted small">4 minutes ago</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a class="text-center" href="#">
                                        <strong>See All Alerts</strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                            <!-- /.dropdown-alerts -->
                        </li>--%>
                        <!-- /.dropdown -->
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="fa fa-user fa-fw"></i><i class="fa fa-caret-down"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <%--                                <li><a href="#"><i class="fa fa-user fa-fw"></i>User Profile</a>
                                </li>
                                <li><a href="#"><i class="fa fa-gear fa-fw"></i>Settings</a>
                                </li>--%>
                                <li class="divider"></li>
                                <li><a href="Login.aspx"><i class="fa fa-sign-out fa-fw"></i>Salir</a>
                                </li>
                            </ul>
                            <!-- /.dropdown-user -->
                        </li>
                        <!-- /.dropdown -->
                    </ul>
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
                                        <a href="#"><i class="fa fa-sitemap fa-fw"></i>
                                            <asp:Label ID="Label7" runat="server" Text="Estructura" Font-Size="14pt"></asp:Label><span class="fa arrow"></span></a>

                                        <ul class="nav nav-second-level">
                                            <li>
                                                <div>
                                                    <table cellspacing="11" class="Jefe">
                                                        <tr>
                                                            <td class="auto-style6" rowspan="3">
                                                                <asp:ImageButton ID="A1" runat="server" Width="75px" Height="83px" ImageUrl="~/img/Pablo.png" ToolTip="Vp Chief Information" class="img-circle" ForeColor="#1780c3" OnClick="A2_Click" /></td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Image ID="Image2" runat="server" Width="15px" Height="20px" ImageUrl="~/img/Perso1azul.png" />
                                                                <span class="id-span">
                                                                    <asp:Label ID="Label6" runat="server" Text="1109" ForeColor="#169ddb" Font-Size="10PT" Font-Bold="True" /></span>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td><span class="auto-style3"><strong>Pablo Salazar</strong></span> </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </li>
                                            <li>
                                                <div>
                                                    <table cellspacing="11" class="Jefe">
                                                        <tr>
                                                            <td class="auto-style5" rowspan="3">
                                                                <asp:ImageButton ID="A4" runat="server" Width="50px" Height="50px" ImageUrl="~/img/Efra.png" ToolTip="Director Ej Gestion  y Real de Serv" class="img-circle" ForeColor="#0066FF" OnClick="A2_Click" />
                                                                <td class="auto-style7">
                                                                    <asp:Image ID="Image3" runat="server" Height="15px" ImageUrl="~/img/Perso1azul.png" Width="15px" />
                                                                    <span class="id-span">
                                                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="10PT" ForeColor="#169ddb" Text="80" />
                                                                    </span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span class="auto-style4"><strong>Maria Eugenia Ayala Porras</strong></span> </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </div>

                                            </li>
                                            <li>
                                                <div>
                                                    <table cellspacing="11" class="Jefe">
                                                        <tr>
                                                            <td class="auto-style5" rowspan="3">
                                                                <asp:ImageButton ID="A2" runat="server" Width="50px" Height="50px" ImageUrl="~/img/wagner.png" ToolTip="Director Ejecutivo IT Quality" class="img-circle" ForeColor="#EB7400" OnClick="A2_Click" />
                                                                <td>
                                                                    <asp:Image ID="Image4" runat="server" Height="15px" ImageUrl="~/img/Perso1azul.png" Width="15px" />
                                                                    <span class="id-span">
                                                                        <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="10PT" ForeColor="#169ddb" Text="106" />
                                                                    </span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span class="auto-style4"><strong>Ernesto Wagner Echeagaray</strong></span> </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </div>

                                            </li>
                                            <li>
                                                <div>
                                                    <table cellspacing="11" class="Jefe">
                                                        <tr>
                                                            <td class="auto-style5" rowspan="3">
                                                                <asp:ImageButton ID="A28" runat="server" Width="50px" Height="50px" ImageUrl="~/img/richard.png" ToolTip="Director Ej Desarrollo y Soporte Aplicac" class="img-circle" ForeColor="#FFB71C" OnClick="A2_Click" />
                                                                <td>
                                                                    <asp:Image ID="Image5" runat="server" Height="15px" ImageUrl="~/img/Perso1azul.png" Width="15px" />
                                                                    <span class="id-span">
                                                                        <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="10PT" ForeColor="#169ddb" Text="311" />
                                                                    </span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span class="auto-style4"><strong>Ricardo Salas Cobos</strong></span> </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </div>


                                            </li>
                                            <li>
                                                <div>
                                                    <table cellspacing="11" class="Jefe">
                                                        <tr>
                                                            <td class="auto-style5" rowspan="3">
                                                                <asp:ImageButton ID="A5" runat="server" Width="50px" Height="50px" ImageUrl="~/img/fernando.png" ToolTip="Director Ej Arquitectura Empresarial" class="img-circle" ForeColor="#007B3F" OnClick="A2_Click" />
                                                                <td>
                                                                    <asp:Image ID="Image6" runat="server" Height="15px" ImageUrl="~/img/Perso1azul.png" Width="15px" />
                                                                    <span class="id-span">
                                                                        <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="10PT" ForeColor="#169ddb" Text="137" />
                                                                    </span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span class="auto-style4"><strong>Luis Fernando Valdeon Villalba</strong></span> </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </div>

                                            </li>
                                            <%----------------------------------------------------------------------------------------------------------%>
                                            <li>
                                                <div>
                                                    <table cellspacing="11" class="Jefe">
                                                        <tr>
                                                            <td class="auto-style5" rowspan="3">
                                                                <asp:ImageButton ID="A7" runat="server" Width="50px" Height="50px" ImageUrl="~/img/josechan.png" ToolTip="Director Ej de Operaciones IT" class="img-circle" ForeColor="#1780c3" OnClick="A2_Click" />
                                                                <td>
                                                                    <asp:Image ID="Image7" runat="server" Height="15px" ImageUrl="~/img/Perso1azul.png" Width="15px" />
                                                                    <span class="id-span">
                                                                        <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="10PT" ForeColor="#169ddb" Text="413" />
                                                                    </span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span class="auto-style4"><strong>Jose Chan Leo</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </div>



                                            </li>

                                            <li>

                                                <div>
                                                    <table cellspacing="11" class="Jefe">
                                                        <tr>
                                                            <td class="auto-style5" rowspan="3">
                                                                <asp:ImageButton ID="A29" runat="server" Width="50px" Height="50px" ImageUrl="~/img/azul.png" ToolTip="Director Ej Compliance" class="img-circle" ForeColor="#0066FF" OnClick="A2_Click" />
                                                                <td>
                                                                    <asp:Image ID="Image8" runat="server" Height="15px" ImageUrl="~/img/Perso1azul.png" Width="15px" />
                                                                    <span class="id-span">
                                                                        <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="10PT" ForeColor="#169ddb" Text="30" />
                                                                    </span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span class="auto-style4"><strong>Raphael Valerio Estrada Foucher</strong></span> </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </div>


                                            </li>
                                            <li>
                                                <div>
                                                    <table cellspacing="11" class="Jefe">
                                                        <tr>
                                                            <td class="auto-style5" rowspan="3">
                                                                <asp:ImageButton ID="A6" runat="server" Width="50px" Height="50px" ImageUrl="~/img/heidi.png" ToolTip="Exejutive Director Technology" class="img-circle" ForeColor="#EB7400" OnClick="A2_Click" />
                                                                <td>
                                                                    <asp:Image ID="Image9" runat="server" Height="15px" ImageUrl="~/img/Perso1azul.png" Width="15px" />
                                                                    <span class="id-span">
                                                                        <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="10PT" ForeColor="#169ddb" Text="1" />
                                                                    </span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span class="auto-style4"><strong>Heidi Febles</strong></span> </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </div>



                                            </li>
                                            <li>
                                                <div>
                                                    <table cellspacing="11" class="Jefe">
                                                        <tr>
                                                            <td class="auto-style5" rowspan="3">
                                                                <asp:ImageButton ID="A27" runat="server" Width="50px" Height="50px" ImageUrl="~/img/fermiranda.png" ToolTip="Director It" class="img-circle" ForeColor="#FFB71C" OnClick="A2_Click" />
                                                                <td>
                                                                    <asp:Image ID="Image10" runat="server" Height="15px" ImageUrl="~/img/Perso1azul.png" Width="15px" />
                                                                    <span class="id-span">
                                                                        <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="10PT" ForeColor="#169ddb" Text="1" />
                                                                    </span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span class="auto-style4"><strong>Fernando Miranda</strong></span> </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </div>


                                            </li>
                                            <li>
                                                <div>
                                                    <table cellspacing="11" class="Jefe">
                                                        <tr>
                                                            <td class="auto-style5" rowspan="3">
                                                                <asp:ImageButton ID="A3" runat="server" Width="50px" Height="50px" ImageUrl="~/img/etson.png" ToolTip="Director Ejecutivo Seguridad De La Inf" class="img-circle" ForeColor="#007B3F" OnClick="A2_Click" />
                                                                <td>
                                                                    <asp:Image ID="Image11" runat="server" Height="15px" ImageUrl="~/img/Perso1azul.png" Width="15px" />
                                                                    <span class="id-span">
                                                                        <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="10PT" ForeColor="#169ddb" Text="50" />
                                                                    </span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span class="auto-style4"><strong>Etson Jose Luis Ramirez Hernandez</strong></span> </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </div>


                                            </li>
                                            <li>
                                                <div>
                                                    <table cellspacing="11" class="Jefe">
                                                        <tr>
                                                            <td class="auto-style5" rowspan="3">
                                                                <asp:ImageButton ID="A31" runat="server" Width="50px" Height="50px" ImageUrl="~/img/jeffrey.png" ToolTip="AVP Tech" class="img-circle" ForeColor="#007B3F" OnClick="A2_Click" />
                                                                <td>
                                                                    <asp:Image ID="Image12" runat="server" Height="15px" ImageUrl="~/img/Perso1azul.png" Width="15px" />
                                                                    <span class="id-span">
                                                                        <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="10PT" ForeColor="#169ddb" Text="1" />
                                                                    </span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span class="auto-style4"><strong>Jeffrey Seymour</strong></span> </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </div>


                                            </li>


                                        </ul>

                                        <!-- /.nav-second-level -->
                                    </li>
                                    <%--                               <li>
                                    <a href="tables.html"><i class="fa fa-table fa-fw"></i>Tables</a>
                                </li>
                                <li>
                                    <a href="forms.html"><i class="fa fa-edit fa-fw"></i>Forms</a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-wrench fa-fw"></i>UI Elements<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li>
                                            <a href="panels-wells.html">Panels and Wells</a>
                                        </li>
                                        <li>
                                            <a href="buttons.html">Buttons</a>
                                        </li>
                                        <li>
                                            <a href="notifications.html">Notifications</a>
                                        </li>
                                        <li>
                                            <a href="typography.html">Typography</a>
                                        </li>
                                        <li>
                                            <a href="icons.html">Icons</a>
                                        </li>
                                        <li>
                                            <a href="grid.html">Grid</a>
                                        </li>
                                    </ul>
                                    <!-- /.nav-second-level -->
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-sitemap fa-fw"></i>Multi-Level Dropdown<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li>
                                            <a href="#">Second Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Second Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level <span class="fa arrow"></span></a>
                                            <ul class="nav nav-third-level">
                                                <li>
                                                    <a href="#">Third Level Item</a>
                                                </li>
                                                <li>
                                                    <a href="#">Third Level Item</a>
                                                </li>
                                                <li>
                                                    <a href="#">Third Level Item</a>
                                                </li>
                                                <li>
                                                    <a href="#">Third Level Item</a>
                                                </li>
                                            </ul>
                                            <!-- /.nav-third-level -->
                                        </li>
                                    </ul>
                                    <!-- /.nav-second-level -->
                                </li>--%>
                                    <%--                                <li>
                                    <a href="#"><i class="fa fa-files-o fa-fw"></i>Sample Pages<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li>
                                            <a href="blank.html">Blank Page</a>
                                        </li>
                                        <li>
                                            <a href="login.html">Login Page</a>
                                        </li>
                                    </ul>
                                    <!-- /.nav-second-level -->
                                </li>--%>
                                </ul>
                           
                        </div>

                        <!-- /.sidebar-collapse -->
                    </div>
                    <!-- /.navbar-static-side -->
                </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
   
</asp:Content>

