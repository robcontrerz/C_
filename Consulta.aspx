<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Consulta.aspx.cs" Inherits="Consulta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="100%" Height="90px"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Ejecutar" OnClick="Button1_Click" />
        <br />
        <br />
        <div style="overflow: scroll; height: 500px;  width: 100%;">
        <asp:GridView ID="GridView1" runat="server" Width="100%" Height="100%" >
        </asp:GridView>
        </div>
    </div>
    </form>
</body>
</html>
