<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registro1.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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
    <script type="text/javascript">
<!--
    function Check_Click(objRef) {
        //Get the Row based on checkbox
        var row = objRef.parentNode.parentNode;

        //Get the reference of GridView
        var GridView = row.parentNode;

        //Get all input elements in Gridview
        var inputList = GridView.getElementsByTagName("input");

        for (var i = 0; i < inputList.length; i++) {
            //The First element is the Header Checkbox
            var headerCheckBox = inputList[0];

            //Based on all or none checkboxes
            //are checked check/uncheck Header Checkbox
            var checked = true;
            if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
                if (!inputList[i].checked) {
                    checked = false;
                    break;
                }
            }
        }
        headerCheckBox.checked = checked;

    }
    function checkAll(objRef) {
        var GridView = objRef.parentNode.parentNode.parentNode;
        var inputList = GridView.getElementsByTagName("input");
        for (var i = 0; i < inputList.length; i++) {
            var row = inputList[i].parentNode.parentNode;
            if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                if (objRef.checked) {
                    inputList[i].checked = true;
                }
                else {
                    if (row.rowIndex % 2 == 0) {
                        row.style.backgroundColor = "#C2D69B";
                    }
                    else {
                        row.style.backgroundColor = "white";
                    }
                    inputList[i].checked = false;
                }
            }
        }
    }
//-->
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div>
                            <div class="panel-heading" style="font-weight: bold">Selecciona un dia</div>
                            <asp:TextBox ID="inicioTabla" runat="server" Height="23" Width="90" Text="Inicio"></asp:TextBox>
                            <asp:ImageButton ID="imgPopup" ImageUrl="img/calendar.png" ImageAlign="Bottom" runat="server" />
                            <ajaxtoolkit:CalendarExtender ID="Calendar1" PopupButtonID="imgPopup" runat="server" TargetControlID="inicioTabla" Format="MM/dd/yyyy"></ajaxtoolkit:CalendarExtender>
                        </div>
                    </div>
                    <!-- .panel-heading -->
                    <div class="panel-body">
                        <div style="overflow: scroll; height: 300px;">


                            <table class="nav-justified">
                                <tr>
                                    <td>FOLIOS/PRETICKETS ASIGNADOS&nbsp;</td>
                                    <td>FOLIOS/PRETICKETS TODOS&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvAll" runat="server"
                                            AutoGenerateColumns="false" Font-Names="Arial"
                                            Font-Size="11pt" GridLines="Horizontal"
                                            HeaderStyle-BackColor="#c8c8c8"
                                            OnPageIndexChanging="OnPaging" Width="100%">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="chkAll" runat="server" onclick="checkAll(this);"
                                                            AutoPostBack="true" OnCheckedChanged="CheckBox_CheckChanged" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chk" runat="server" onclick="Check_Click(this)"
                                                            AutoPostBack="true" OnCheckedChanged="CheckBox_CheckChanged" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="FOLIO" HeaderText="Folio"
                                                    HtmlEncode="false" />
                                                <asp:BoundField DataField="ASUNTO" HeaderText="Descripcion"
                                                    HtmlEncode="false" />
                                                <%--                                    <asp:BoundField DataField="City" HeaderText="City"
                                        HtmlEncode="false" />--%>
                                            </Columns>

                                        </asp:GridView>
                                        &nbsp;</td>
                                    <td>
                                        <asp:GridView ID="GRIDTODOS" runat="server"
                                            AutoGenerateColumns="false" Font-Names="Arial"
                                            Font-Size="11pt" GridLines="Horizontal"
                                            HeaderStyle-BackColor="#c8c8c8"
                                            OnPageIndexChanging="OnPaging" Width="100%">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="chkAll" runat="server" onclick="checkAll(this);"
                                                            AutoPostBack="true" OnCheckedChanged="CheckBox_CheckChanged" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chk" runat="server" onclick="Check_Click(this)"
                                                            AutoPostBack="true" OnCheckedChanged="CheckBox_CheckChanged" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="FOLIO" HeaderText="Folio"
                                                    HtmlEncode="false" />
                                                <asp:BoundField DataField="ASUNTO" HeaderText="Descripcion"
                                                    HtmlEncode="false" />
                                                <%--                                    <asp:BoundField DataField="City" HeaderText="City"
                                        HtmlEncode="false" />--%>
                                            </Columns>

                                        </asp:GridView>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <br />
                        </div>

                        <div style="overflow: scroll; height: 300px;">
                            <asp:Button runat="server" ID="Btnfolios" Text="Grabar" OnClick="Btnfolios_Click" />
                            <asp:Label ID="lblTemp" runat="server" ForeColor="green" Font-Bold="true" Font-Names="Courier New"
                                Font-Size="Large">
                            </asp:Label>
                            <asp:Label ID="Totalhrs" runat="server" Text="0"></asp:Label>

                            <asp:GridView ID="gvSelected" runat="server"
                                AutoGenerateColumns="False" Font-Names="Arial"
                                GridLines="Horizontal"
                                Font-Size="11pt" AlternatingRowStyle-BackColor="#66ccff"
                                HeaderStyle-BackColor="#c8c8c8" EmptyDataText="Sin folio/Preticket" Width="966px">

                                <Columns>

                                    <asp:BoundField DataField="CustomerID" HeaderText="Folio" />
                                    <asp:BoundField DataField="ContactName" HeaderText="Descripción" />
                                    <asp:TemplateField HeaderText="Analisis">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TBox1" runat="server" MaxLength="2" Width="20px" Text="0" onkeypress="return numbersonly(event);" placeholder="0"></asp:TextBox>
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
                                    <asp:TemplateField HeaderText="Producción">
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

                                    <%--<asp:CommandField ButtonType="Button" HeaderText="Eliminar" ShowDeleteButton="True" ShowHeader="True" />--%>
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

                    </div>
                </div>
                <!-- .panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </form>
</body>
</html>
