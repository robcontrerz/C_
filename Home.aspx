<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 
        <h2>Línea 146 SA de CV</h2>  
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div>
   <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>

                 <fieldset>
                    <legend>Linea  Fecha actual: <asp:TextBox  ID = "txtDate"  runat = "server" /></legend>
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
                                    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                    
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
            </ContentTemplate>
        </asp:UpdatePanel>

        <!DOCTYPE html>

</div>
 
</asp:Content>

