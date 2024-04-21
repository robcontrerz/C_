<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CS.aspx.cs" Inherits="CS" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="JS/gridviewScroll.min.js"></script>
    <link href="JS/GridviewScroll.css" rel="stylesheet" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/start/jquery-ui.css">
    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 10pt;
        }

        .Grid td {
            background-color: #A1DCF2;
            color: black;
            font-size: 10pt;
            line-height: 200%;
        }

        .Grid th {
            background-color: #3AC0F2;
            color: White;
            font-size: 10pt;
            line-height: 200%;
        }

        /*.ChildGrid td {
            background-color: #eee !important;
            color: black;
            font-size: 10pt;
            line-height: 200%;
        }

        .ChildGrid th {
            background-color: #6C6C6C !important;
            color: White;
            font-size: 10pt;
            line-height: 200%;
        }*/
    </style>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            font-family: Arial;
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
            height: 420px;
        }

        .auto-style2 {
            margin-left: 30px;
            width: 42%;
        }

        .Jefe {
            width: 100%;
        }

        .auto-style5 {
            margin-left: 30px;
            width: 708px;
        }

        .auto-style7 {
            height: 31px;
            width: 138%;
        }

        .cc-selector input {
            margin: 0;
            padding: 0;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }

        .visa {
            background-image: url(img/produccion.PNG);
            width: 10px;
            height: 10px;
        }

        .mastercard {
            background-image: url(img/prueba.PNG);
            width: 10px;
            height: 10px;
        }

        .cc-selector input:active + .drinkcard-cc {
            opacity: .9;
        }

        .cc-selector input:checked + .drinkcard-cc {
            -webkit-filter: none;
            -moz-filter: none;
            filter: none;
        }

        .drinkcard-cc {
            cursor: pointer;
            background-size: contain;
            background-repeat: no-repeat;
            display: inline-block;
            width: 100px;
            height: 70px;
            -webkit-transition: all 100ms ease-in;
            -moz-transition: all 100ms ease-in;
            transition: all 100ms ease-in;
            -webkit-filter: brightness(1.8) grayscale(1) opacity(.7);
            -moz-filter: brightness(1.8) grayscale(1) opacity(.7);
            filter: brightness(1.8) grayscale(1) opacity(.7);
        }

            .drinkcard-cc:hover {
                -webkit-filter: brightness(1.2) grayscale(.5) opacity(.9);
                -moz-filter: brightness(1.2) grayscale(.5) opacity(.9);
                filter: brightness(1.2) grayscale(.5) opacity(.9);
            }

        /* Extras */
        a:visited {
            color: #888;
        }

        a {
            color: #444;
            text-decoration: none;
        }

        p {
            margin-bottom: .3em;
        }
    </style>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $("[src*=plus]").live("click", function () {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("src", "img/minus.png");
        });
        $("[src*=minus]").live("click", function () {
            $(this).attr("src", "img/plus.png");
            $(this).closest("tr").next().remove();
        });
    </script>
</head>
<body>

    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <%--         <asp:GridView ID="GridView1" HeaderStyle-CssClass="GridviewScrollHeader" runat="server" RowStyle-CssClass="GridviewScrollItem" >
             <HeaderStyle CssClass="GridviewScrollHeader" />
             <RowStyle CssClass="GridviewScrollItem"  />
         </asp:GridView>--%>

        <asp:Panel ID="PInfoempleado" runat="server" Visible="true" BorderStyle="Double" BorderColor="Silver">
            <div class="auto-style1">

                <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false" CssClass="Grid"
                    DataKeyNames="ID" OnRowDataBound="OnRowDataBound" HeaderStyle-CssClass="GridviewScrollHeader" RowStyle-CssClass="GridviewScrollItem">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <img alt="" style="cursor: pointer" src="images/plus.png" />
                                <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                                    <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="false" CssClass="ChildGrid">
                                        <Columns>

                                            <asp:BoundField ItemStyle-Width="10px" DataField="Id" HeaderText="Id" />
                                            <asp:BoundField ItemStyle-Width="150px" DataField="Nombre" HeaderText="Nombre" />
                                            <asp:TemplateField ItemStyle-Width="50" HeaderText="Sem 1">
                                                <ItemTemplate>
                                                    <div class='progress'>
                                                        <div class="progress-label">
                                                            <%# Eval("1") %>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="50" HeaderText="Sem 2">
                                                <ItemTemplate>
                                                    <div class='progress'>
                                                        <div class="progress-label">
                                                            <%# Eval("2") %>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:BoundField ItemStyle-Width="10px" DataField="ID" HeaderText="ID" />

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LMarcas" runat="server" HeaderText="Nombre" ToolTip='<%# Eval("ID") %>' Text='<%# Eval("Nombre") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="50" HeaderText="Sem 1">
                            <ItemTemplate>
                                <div class='progress'>
                                    <div class="progress-label">
                                        <%# Eval("1") %>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="50" HeaderText="Sem 2">
                            <ItemTemplate>
                                <div class='progress'>
                                    <div class="progress-label">
                                        <%# Eval("2") %>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="50" HeaderText="Sem 3">
                            <ItemTemplate>
                                <div class='progress'>
                                    <div class="progress-label">
                                        <%# Eval("3") %>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--                        <asp:BoundField DataField="1" HeaderText="Sem 1" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="2" HeaderText="Sem 2" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="3" HeaderText="Sem 3" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />--%>
                        <asp:BoundField DataField="4" HeaderText="Sem 4" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="5" HeaderText="Sem 5" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="6" HeaderText="Sem 6" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="7" HeaderText="Sem 7" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="8" HeaderText="Sem 8" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="9" HeaderText="Sem 9" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="10" HeaderText="Sem 10" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />

                        <asp:BoundField DataField="11" HeaderText="Sem 11" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="12" HeaderText="Sem 12" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="13" HeaderText="Sem 13" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="14" HeaderText="Sem 14" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="15" HeaderText="Sem 15" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="16" HeaderText="Sem 16" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="17" HeaderText="Sem 17" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="18" HeaderText="Sem 18" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="19" HeaderText="Sem 19" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="20" HeaderText="Sem 20" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />

                        <asp:BoundField DataField="21" HeaderText="Sem 21" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="22" HeaderText="Sem 22" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="23" HeaderText="Sem 23" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="24" HeaderText="Sem 24" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="25" HeaderText="Sem 25" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="26" HeaderText="Sem 26" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="27" HeaderText="Sem 27" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="28" HeaderText="Sem 28" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="29" HeaderText="Sem 29" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="30" HeaderText="Sem 30" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />

                        <asp:BoundField DataField="31" HeaderText="Sem 31" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="32" HeaderText="Sem 32" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="33" HeaderText="Sem 33" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="34" HeaderText="Sem 34" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="35" HeaderText="Sem 35" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="36" HeaderText="Sem 36" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="37" HeaderText="Sem 37" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="38" HeaderText="Sem 38" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="39" HeaderText="Sem 39" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="40" HeaderText="Sem 40" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />

                        <asp:BoundField DataField="41" HeaderText="Sem 41" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="42" HeaderText="Sem 42" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="43" HeaderText="Sem 43" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="44" HeaderText="Sem 44" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="45" HeaderText="Sem 45" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="46" HeaderText="Sem 46" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="47" HeaderText="Sem 47" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="48" HeaderText="Sem 48" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="49" HeaderText="Sem 49" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="50" HeaderText="Sem 50" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />

                        <asp:BoundField DataField="51" HeaderText="Sem 51" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="52" HeaderText="Sem 50" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="51" HeaderText="Sem 51" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="52" HeaderText="Sem 52" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:N0}" />

                    </Columns>
                </asp:GridView>

            </div>
            <script type="text/javascript">
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
            </script>
            <style type="text/css">
                .ui-progressbar {
                    position: relative;
                }

                .progress-label {
                    position: absolute;
                    left: 20%;
                    top: 2px;
                    /*font-weight: bold;*/
                    text-shadow: 1px 1px 0 #fff;
                }

                body {
                    font-family: Arial;
                    font-size: 6pt;
                }
            </style>

            <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.js"></script>
            <script type="text/javascript" src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
            <script type="text/javascript">
                $(function () {
                    $(".progress").each(function () {
                        $(this).progressbar({
                            value: parseInt($(this).find('.progress-label').text())
                        });
                    });
                });
            </script>
        </asp:Panel>
  

    <div>
        <div>
        <table class="auto-style5" style="border-spacing: 2px">
            <tr>
                <td class="auto-style12">

                    <select id="" name="clasProductos" class="auto-style11">
                        <option value="1">1234</option>
                        <option value="2">1234</option>
                        <option value="3">1234</option>
                        <option value="4">1234</option>
                        <option value="5">1234</option>
                        <option value="6">1234</option>
                        <option value="6">1234</option>
                        <option value="6">1234</option>
                        <option value="6">1234</option>
                        <option value="6">1234</option>
                        <option value="6">1234</option>
                        <option value="6">1234</option>
                    </select>

                </td>
                <td class="auto-style8">
                    <div class="auto-style8">
                        <input id="visa" type="radio" name="credit-card" value="visa" />
                        <label title="Analisis" class="drinkcard-cc visa" for="visa"></label>
                        <input id="mastercard" type="radio" name="credit-card" value="mastercard" />
                        <label class="drinkcard-cc mastercard" for="mastercard"></label>
                        <input id="mastercard" type="radio" name="credit-card" value="mastercard" />
                        <label class="drinkcard-cc mastercard" for="mastercard"></label>
                        <input id="mastercard" type="radio" name="credit-card" value="mastercard" />
                        <label class="drinkcard-cc mastercard" for="mastercard"></label>

                    </div>

                </td>

            </tr>
            <tr>
                <td class="auto-style12">

                    <select id="" name="clasProductos" class="auto-style11">
                        <option value="1">1234</option>
                        <option value="2">1234</option>
                        <option value="3">1234</option>
                        <option value="4">1234</option>
                        <option value="5">1234</option>
                        <option value="6">1234</option>
                        <option value="6">1234</option>
                        <option value="6">1234</option>
                        <option value="6">1234</option>
                        <option value="6">1234</option>
                        <option value="6">1234</option>
                        <option value="6">1234</option>
                    </select>

                </td>
                <td class="auto-style8">
                    <div class="auto-style8">
                        <input id="visa" type="radio" name="credit-card" value="visa" />
                        <label class="drinkcard-cc visa" for="visa"></label>
                        <input id="mastercard" type="radio" name="credit-card" value="mastercard" />
                        <label class="drinkcard-cc mastercard" for="mastercard"></label>
                        <input id="mastercard" type="radio" name="credit-card" value="mastercard" />
                        <label class="drinkcard-cc mastercard" for="mastercard"></label>
                        <input id="mastercard" type="radio" name="credit-card" value="mastercard" />
                        <label class="drinkcard-cc mastercard" for="mastercard"></label>

                    </div>

                </td>
            </tr>
            <tr>
                <td class="auto-style12">

                    <select id="" name="clasProductos" class="auto-style11">
                        <option value="1">1234</option>
                        <option value="2">1234</option>
                        <option value="3">1234</option>
                        <option value="4">1234</option>
                        <option value="5">1234</option>
                        <option value="6">1234</option>
                        <option value="6">1234</option>
                        <option value="6">1234</option>
                        <option value="6">1234</option>
                        <option value="6">1234</option>
                        <option value="6">1234</option>
                        <option value="6">1234</option>
                    </select>

                </td>
                <td class="auto-style8">
                    <div class="auto-style8">
                        <input id="visa" type="radio" name="credit-card" value="visa" />
                        <label class="drinkcard-cc visa" for="visa"></label>
                        <input id="mastercard" type="radio" name="credit-card" value="mastercard" />
                        <label class="drinkcard-cc mastercard" for="mastercard"></label>
                        <input id="mastercard" type="radio" name="credit-card" value="mastercard" />
                        <label class="drinkcard-cc mastercard" for="mastercard"></label>
                        <input id="mastercard" type="radio" name="credit-card" value="mastercard" />
                        <label class="drinkcard-cc mastercard" for="mastercard"></label>

                    </div>

                </td>
            </tr>

        </table>
        </div>
        <div class="modal-footer">
            <asp:Button ID="Button2" runat="server" data-dismiss="modal" class="btn" Text="Salir" />
            <button type="button" id="btnPopupSave" data-dismiss="modal" class="btn btn-primary">Guardar</button>
        </div>
    </div>
    <div id="a">
        <div>

            <table cellspacing="1" class="nav-justified">
                <tr>
                    <td>
                        <label>Preticket:</label>
                        <div class="parte1">
                            <select name="clasProductos" id="">
                                <option value="1">1234</option>
                                <option value="2">1234</option>
                                <option value="3">1234</option>
                                <option value="4">1234</option>
                                <option value="5">1234</option>
                                <option value="6">1234</option>
                                <option value="6">1234</option>
                                <option value="6">1234</option>
                                <option value="6">1234</option>
                                <option value="6">1234</option>
                                <option value="6">1234</option>
                                <option value="6">1234</option>
                            </select>
                        </div>
                    </td>
                    <td>

                        <div id="radio">
                            <input type="radio" id="radio1" name="radio"><label for="radio1"><img src="~/Images/bullet.png" /></label>
                            <input type="radio" id="radio2" name="radio" checked="checked"><label for="radio2"><img src="~/Images/bullet.png" /></label>
                            <input type="radio" id="radio3" name="radio"><label for="radio3"><img src="~/Images/bullet.png" /></label>
                        </div>
                    </td>

                </tr>
                <caption>
                    <label>
                        Preticket:</label>
                    <div class="parte1">
                        <select id="" name="clasProductos">
                            <option value="1">1234</option>
                            <option value="2">1234</option>
                            <option value="3">1234</option>
                            <option value="4">1234</option>
                            <option value="5">1234</option>
                            <option value="6">1234</option>
                            <option value="6">1234</option>
                            <option value="6">1234</option>
                            <option value="6">1234</option>
                            <option value="6">1234</option>
                            <option value="6">1234</option>
                            <option value="6">1234</option>
                        </select>
                    </div>
                    </td>
                <tr>
                    <td>
                        <input name="gender" type="radio" value="male">Analisis<br>
                        </input>
                    </td>
                    <td>
                        <input name="gender" type="radio" value="other">Desarrollo&nbsp;&nbsp;</input></td>
                    <td>
                        <input name="gender" type="radio" value="other">Pruebas&nbsp;&nbsp;</input></td>
                </tr>
                </caption>
                </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            </table>

            <input type="hidden" id="eventID">

            <label>Hora</label>
            <input type="text" id="eventTime"><br />
            <label>Minutos</label>
            <input type="text" id="eventDuration" placeholder="15"><br />

        </div>
        <div class="modal-footer">
            <asp:Button ID="Button1" runat="server" data-dismiss="modal" class="btn" Text="Salir" />
            <button type="button" id="btnPopupSave" data-dismiss="modal" class="btn btn-primary">Guardar</button>
        </div>
    </div>
  </form>
</body>
</html>


