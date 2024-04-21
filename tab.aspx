<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tab.aspx.cs" Inherits="tab" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
        <script src="js/jquery-1.9.1.js" type="text/javascript"></script>
    <link href="css/custom-theme/jquery-ui-1.10.1.custom.min.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-ui-1.10.1.custom.js" type="text/javascript"></script>
</head>
 


<body>
    <form id="form1" runat="server">
          <script type="text/javascript">
        //var currentTab = 0;
        //$(function () {
        //    $("#tabs").tabs({
        //        select: function (e, i) {
        //            currentTab = i.index;
        //        }
        //    });
        //});
     <%--   $(function () {

            $("#tabContainer").tabs();
            var currTab = $("#<%= HFCurrTabIndex.ClientID %>").val();
                 $("#tabContainer").tabs({ selected: currTab });
 });--%>
</script>

    <style type="text/css">
        .auto-style1 {
            width: 89px;
        }

        .auto-style2 {
            overflow: scroll;
            height: 200px;
            width: 100%;
        }

        .auto-style3 {
            text-align: right;
        }

        .auto-style4 {
            width: 994px;
        }

        .auto-style5 {
            width: 994px;
            text-align: right;
        }

        .auto-style6 {
            text-align: center;
        }

        .auto-style7 {
            width: 207px;
        }

        .auto-style9 {
            height: 27px;
        }

        .auto-style10 {
            text-align: left;
        }

        .auto-style11 {
            text-align: justify;
        }

        .auto-style12 {
            text-align: justify;
            font-weight: bold;
        }

        .auto-style13 {
            text-align: left;
            width: 226px;
            height: 70px;
        }

        .auto-style14 {
            width: 100%;
        }

        .auto-style16 {
            height: 77px;
        }

        .auto-style18 {
            text-align: left;
            width: 839px;
        }

        .auto-style19 {
            text-align: left;
            width: 165px;
        }
    </style>

 <script language="javascript" type="text/javascript">
     $(document).ready(function () {

         $('#tabs').tabs({
             activate: function () {
                 var newIdx = $('#tabs').tabs('option', 'active');
                 $('#<%=hidLastTab.ClientID%>').val(newIdx);

             }, heightStyle: "auto",
             active: previouslySelectedTab,
             show: { effect: "fadeIn", duration: 1000 }
         });

     });
 </script>

        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>

          <asp:TreeView ID="TreeView1" runat="server" LineImagesFolder="~/TreeLineImages" ShowLines="True">
          </asp:TreeView>

        <div id="tabs" style="margin:0 auto;  margin-bottom:2px;">
            <ul>
                <li><a href="#tabs-1">Asignados</a></li>
                <li><a href="#tabs-2">Por   Busqueda</a></li>
                <li><a href="#tabs-3">Actividades</a></li>
                <li><a href="#tabs-4">Mi reporte</a></li>

            </ul>
            <%--                ASIGNADOS--%>
            <div id="tabs-1">
               <fieldset>
                    <legend>Asignados</legend>
                    <table style="width: 100%">
                        <tr>

                            <td valign="top" class="auto-style7">

                                <div class="auto-style6">
                                    <div class="auto-style11" style="font-weight: bold">
                                        Selecciona un día
                                    </div>
                                    <div class="auto-style10">
                                        <asp:TextBox ID="inicioTabla" runat="server" Height="23" Text="Inicio" Width="90" BorderColor="Silver" BorderStyle="Solid" ForeColor="Silver" OnTextChanged="imgPopup_Click"></asp:TextBox>
                                        &nbsp;
                    <asp:ImageButton ID="imgPopup" runat="server" ImageAlign="Bottom" ImageUrl="~/img/Calendargrey.PNG" Height="27px" Width="27px" OnClick="imgPopup_Click" />
                                        <br />
                                        <br />
                                        <ajaxtoolkit:CalendarExtender ID="Calendar1" PopupButtonID="imgPopup" runat="server" TargetControlID="inicioTabla" Format="dd/MM/yyyy"></ajaxtoolkit:CalendarExtender>

                                    </div>

                                </div>


                            </td>

                            <td></td>

                            <td colspan="2" class="auto-style3">
                                <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Size="10" ForeColor="#148BD0" Text=""></asp:Label>
                                <br />
                                <asp:Label ID="hORASLBL" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="#148BD0" Text="0  hrs."></asp:Label>
                                <br />
                            </td>

                        </tr>

                        <tr>
                            <td valign="top" colspan="4">
                                <div class="auto-style2">

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
                                            <%--                            <asp:TemplateField HeaderText="" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:CheckBox runat="server" ID="chk" />
                                </ItemTemplate>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>--%>

                                            <asp:BoundField DataField="FOLIO" HeaderText="Folio" ItemStyle-Width="400px" ItemStyle-HorizontalAlign="Center">
                                                <ItemStyle HorizontalAlign="Center" Width="400px"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ASUNTO" HeaderText="Descripción" ItemStyle-Width="100%" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Wrap="False">
                                                <ItemStyle HorizontalAlign="Left" Width="100%"></ItemStyle>
                                            </asp:BoundField>

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

                            <td valign="top" class="auto-style3">
                                <asp:Button runat="server" ID="cmdRight" Text="Agregar" OnClick="cmdRight_Click" BackColor="#E1611C" ForeColor="White" CssClass="roundCorner" Height="38px" Width="101px" />
                            </td>
                        </tr>

                        <tr>
                            <td valign="top" colspan="4">
                                <div style="overflow: scroll; height: 100%; width: 100%;">
                                    <asp:GridView runat="server" ID="gvRight" EmptyDataText="Sin registros" DataKeyNames="ID" AutoGenerateColumns="False"
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

                            <td class="auto-style5">
                                <asp:Button runat="server" ID="cmdLeft" Text="Eliminar" OnClick="cmdLeft_Click" BackColor="#148BD0" Font-Bold="True" ForeColor="White" CssClass="roundCorner" Height="38px" Width="100px" />
                            </td>

                            <td valign="top" class="auto-style3">
                                <asp:Button runat="server" ID="cmdUpdate" Text="Grabar" BackColor="#E1611C" OnClick="cmdUpdate_Click" Font-Bold="True" ForeColor="White" BorderStyle="None" CssClass="roundCorner" Height="38px" Width="100px" />
                            </td>
                        </tr>
                    </table>
                </fieldset>



            </div>
            <%--                ASIGNADOS--%>
            <%--                BUSQUEDA--%>
            <div id="tabs-2">

                <fieldset>
                    <legend>Por busqueda</legend>
                    <table style="width: 100%">
                        <tr>
                            <td valign="top" class="auto-style7">

                                <div class="auto-style6">
                                    <div class="auto-style11" style="font-weight: bold">
                                        Buscar
                                    </div>
                                    <div class="auto-style13">
                                        <asp:TextBox ID="busquedabt" runat="server" Height="28px" Width="132px"></asp:TextBox>
                                        &nbsp;&nbsp;
                                             <asp:ImageButton ID="ImageButton3" runat="server" Width="27px" OnClick="ImageButton3_Click" ImageUrl="~/img/lupa.png" />
                                        <br />
                                        <br />
                                    </div>


                                </div>
                            </td>

                            <td>
                                <asp:Panel ID="busqueda" runat="server" Visible="false">
                                    <div class="auto-style12">
                                        Selecciona un día  
                                    </div>
                                    <div class="auto-style19">
                                        <asp:TextBox ID="TextBox1" runat="server" Height="23" Text="Inicio" Width="90" BorderColor="Silver" BorderStyle="Solid" ForeColor="Silver"></asp:TextBox>
                                        &nbsp;
                                        <asp:ImageButton ID="ImageButton2" runat="server" ImageAlign="Bottom" ImageUrl="~/img/Calendargrey.PNG" Height="27px" Width="32px" />
                                        <br />
                                        <br />
                                        <ajaxtoolkit:CalendarExtender ID="CalendarExtender2" PopupButtonID="ImageButton2" runat="server" TargetControlID="TextBox1" Format="dd/MM/yyyy"></ajaxtoolkit:CalendarExtender>

                                    </div>
                                </asp:Panel>
                            </td>

                            <td colspan="2" class="auto-style3">
                                <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="10" ForeColor="#148BD0" Text=""></asp:Label>
                                <br />
                                <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="#148BD0" Text="0  hrs."></asp:Label>
                                <br />
                            </td>

                        </tr>
                        <tr>
                            <td valign="top" colspan="4">
                                <div class="auto-style2">

                                    <asp:GridView runat="server" ID="busquedag" DataKeyNames="ID" EmptyDataText="Sin registros"
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
                                            <%--                            <asp:TemplateField HeaderText="" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:CheckBox runat="server" ID="chk" />
                                </ItemTemplate>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>--%>

                                            <asp:BoundField DataField="FOLIO" HeaderText="Folio" ItemStyle-Width="400px" ItemStyle-HorizontalAlign="Center">
                                                <ItemStyle HorizontalAlign="Center" Width="400px"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ASUNTO" HeaderText="Descripción" ItemStyle-Width="100%" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Wrap="False">
                                                <ItemStyle HorizontalAlign="Left" Width="100%"></ItemStyle>
                                            </asp:BoundField>

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

                            <td valign="top" class="auto-style3">
                                <asp:Button runat="server" ID="busquedamas" Text="Agregar" OnClick="busquedamas_Click" BackColor="#E1611C" ForeColor="White" CssClass="roundCorner" Height="38px" Width="101px" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" colspan="4">
                                <div style="overflow: scroll; height: 100%; width: 100%;">
                                    <asp:GridView runat="server" ID="busquedag2" EmptyDataText="Sin registros" DataKeyNames="ID" AutoGenerateColumns="False"
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

                            <td class="auto-style5">
                                <asp:Button runat="server" ID="borrarbusqueda" Text="Eliminar" OnClick="borrarbusqueda_Click" BackColor="#148BD0" Font-Bold="True" ForeColor="White" CssClass="roundCorner" Height="38px" Width="100px" />
                            </td>

                            <td valign="top" class="auto-style3">
                                <asp:Button runat="server" ID="busquedagrabar" Text="Grabar" BackColor="#E1611C" OnClick="busquedagrabar_Click" Font-Bold="True" ForeColor="White" BorderStyle="None" CssClass="roundCorner" Height="38px" Width="100px" />
                            </td>
                        </tr>
                    </table>
                </fieldset>

            </div>
            <%--                BUSQUEDA--%>

            <div id="tabs-3">
                <div class="auto-style6">
                    <div class="auto-style11" style="font-weight: bold">
                        Selecciona un día
                    </div>
                    <div class="auto-style10">
                        <asp:TextBox ID="actividaddia" runat="server" Height="23" Text="Inicio" Width="90" BorderColor="Silver" BorderStyle="Solid" ForeColor="Silver"></asp:TextBox>
                        &nbsp;
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="Bottom" ImageUrl="~/img/Calendargrey.PNG" Height="27px" Width="27px" />
                        <br />
                        <br />
                        <ajaxtoolkit:CalendarExtender ID="CalendarExtender1" PopupButtonID="ImageButton1" runat="server" TargetControlID="actividaddia" Format="dd/MM/yyyy"></ajaxtoolkit:CalendarExtender>

                    </div>

                </div>
                <fieldset>
                    <legend>Actividades</legend>
                    <asp:Button ID="Buttactividad" runat="server" Text="Grabar" OnClick="Buttactividad_Click" BackColor="#E1611C" Font-Bold="True" ForeColor="White" BorderStyle="None" CssClass="roundCorner" Height="38px" Width="100px" />

                    <table cellpadding="0" class="style1">
                        <tr>
                            <td class="alignRight">Folio o Usuario: </td>
                            <td class="alignLeft">
                                <asp:TextBox ID="addEventName" runat="server" Text="" Width="315px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">Actividad: </td>
                            <td class="auto-style9">
                                <asp:TextBox ID="addEventDesc" runat="server" Text="" Width="314px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="alignRight">Horas: </td>
                            <td class="alignLeft">
                                <asp:TextBox ID="addhrs" runat="server" MaxLength="2" Width="25px" Text="0" onkeypress="return numbersonly(event);" placeholder="0" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                                <%-- <input id="addhrs" type="text" size="2" runat="server" onkeypress="return numbersonly(event);" class="auto-style8" />--%>
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

                </fieldset>
            </div>

            <div id="tabs-4">
                <fieldset>
                    <legend>Resumen</legend>
                    <table class="auto-style14">
                        <tr>
                            <td class="auto-style16">
                                <div class="auto-style6">
                                    <div class="auto-style11" style="font-weight: bold">
                                        Selecciona rango de fechas :
                                    </div>
                                    <div class="auto-style18">
                                        <asp:TextBox ID="TextBox2" runat="server" Height="23" Text="Inicio" Width="90" BorderColor="Silver" BorderStyle="Solid" ForeColor="Silver"></asp:TextBox>
                                        &nbsp;
                            <asp:ImageButton ID="ImageButton4" runat="server" ImageAlign="Bottom" ImageUrl="~/img/Calendargrey.PNG" Height="27px" Width="27px" OnClick="imgPopup_Click" />
                                        &nbsp;<ajaxtoolkit:CalendarExtender ID="CalendarExtender3" PopupButtonID="ImageButton4" runat="server" TargetControlID="TextBox2" Format="dd/MM/yyyy"></ajaxtoolkit:CalendarExtender>
                                        <asp:TextBox ID="TextBox3" runat="server" Height="23" Text="Fin" Width="90" BorderColor="Silver" BorderStyle="Solid" ForeColor="Silver"></asp:TextBox>
                                        &nbsp;
                            <asp:ImageButton ID="ImageButton5" runat="server" ImageAlign="Bottom" ImageUrl="~/img/Calendargrey.PNG" Height="27px" Width="27px" OnClick="imgPopup_Click" />
                                        &nbsp;
                            <ajaxtoolkit:CalendarExtender ID="CalendarExtender4" PopupButtonID="ImageButton5" runat="server" TargetControlID="TextBox3" Format="dd/MM/yyyy"></ajaxtoolkit:CalendarExtender>

                                        <asp:Button ID="Buttactividad0" runat="server" BackColor="#E1611C" BorderStyle="None" CssClass="roundCorner" Font-Bold="True" ForeColor="White" Height="38px" Text="Buscar" Width="100px" OnClick="Buttactividad0_Click" CausesValidation="true" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;
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
                                        HeaderStyle-BackColor="Silver" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="black" GridLines="Horizontal"
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

                </fieldset>
            </div>
             <asp:HiddenField runat="server" ID="hidLastTab" /> 
        </div>


        
        <input type="hidden" id="hdClient" runat="server" />
    </form>
</body>
</html>
