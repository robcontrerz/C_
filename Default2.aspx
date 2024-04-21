<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>BOLETOS</title> 
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous"/>
</head>
<body>
  <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <%-- <nav class="navbar navbar-expand-sm navbar-light bg-light">--%>
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#opciones">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <!-- logo -->
    <a class="navbar-brand" href="#" >
        
      <img src="img/logoATT.png" width="30" height="30" alt=""/>
    </a>
    
    <!-- enlaces -->
    <div class="collapse navbar-collapse" id="opciones">   
      <ul class="navbar-nav">
        <li class="nav-item">
          
            <a id="A10" class="nav-link" href="#" runat="server" onserverclick="A13_ServerClick" >Boletos Autobus <i class="fas fa-bus"></i></a>
        </li>
        <li class="nav-item">
           
          <a id="A11" class="nav-link" href="#" runat="server" onserverclick="A13_ServerClick" >Boletos Avion<i class="fas fa-plane"></i></a>
        </li>
        <li class="nav-item">
            <a id="A12" class="nav-link" href="#" runat="server" onserverclick="A13_ServerClick" >Boletos Barco<i class="fas fa-ship"></i></a>
           
        </li>
        <li class="nav-item">
            <a id="A13" class="nav-link" href="#" runat="server" onserverclick="A13_ServerClick" >Boletos Tren<i class="fas fa-subway"></i></a>
          
        </li>            
      </ul>
    </div>
  </nav>

                       <asp:Panel ID="Panel6" runat="server" Visible="false">
   

 
                                            <div class="panel-body">
                                                <div id="morris-area-chart2">
                                                    <asp:Panel ID="Panel7" runat="server" Visible="true">
                                                        <div style="height: 800px; width: 100%;">
                                                     <%--       <asp:UpdatePanel ID="UpdatePanel5" runat="server">--%>
                                                                <ContentTemplate>
                                                                    <iframe id="IframeDoctos" runat="server" height="800px" width="100%"></iframe>
                                                                </ContentTemplate>
                                                        <%--    </asp:UpdatePanel>--%>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
 
                        </asp:Panel>
      </form>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>  
</body>
</html>