<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cap.aspx.cs" Inherits="Cap" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <link href="css/fullcalendar/jquery-ui-1.7.3.custom.css" rel="stylesheet" type="text/css" />
    <link href="fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" />

    <script src="jquery/jquery-1.3.2.min.js" type="text/javascript"></script>

    <script src="jquery/jquery-ui-1.7.3.custom.min.js" type="text/javascript"></script>

    <script src="jquery/jquery.qtip-1.0.0-rc3.min.js" type="text/javascript"></script>
    <script src="jquery/es.js" type="text/javascript"></script>

    <script src="fullcalendar/fullcalendar.min.js" type="text/javascript"></script>

    <script src="scripts/calendarscript.js" type="text/javascript"></script>

    <script src="jquery/jquery-ui-timepicker-addon-0.6.2.min.js" type="text/javascript"></script>
    <script src='jquery/es.js' type="text/javascript"></script>
    <style type='text/css'>
        body {
            margin-top: 40px;
            text-align: center;
            font-size: 14px;
            font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
        }

        #calendar {
            width: 900px;
            margin: 0 auto;
        }
        /* css for timepicker */
        .ui-timepicker-div dl {
            text-align: left;
        }

            .ui-timepicker-div dl dt {
                height: 25px;
            }

            .ui-timepicker-div dl dd {
                margin: -25px 0 10px 65px;
            }

        .style1 {
            width: 100%;
        }

        /* table fields alignment*/
        .alignRight {
            text-align: right;
            padding-right: 10px;
            padding-bottom: 10px;
        }

        .alignLeft {
            text-align: left;
            padding-bottom: 10px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div id="calendar"/>
        
        <div id="updatedialog" style="font: 70% 'Trebuchet MS', sans-serif; margin: 10px;"
            title="Actualizar">
            <table cellpadding="0" class="style1">
                <tr>
                    <td class="alignRight">Nombre:</td>
                    <td class="alignLeft">
                        <input id="eventName" type="text" /><br />
                    </td>
                </tr>
                <tr>
                    <td class="alignRight">descripcion:</td>
                    <td class="alignLeft">
                        <textarea id="eventDesc" cols="30" rows="3"></textarea></td>
                </tr>
                <tr>
                    <td class="alignRight">Fecha inicial:</td>
                    <td class="alignLeft">
                        <span id="eventStart"></span></td>
                </tr>
                <tr>
                    <td class="alignRight">Fecha final: </td>
                    <td class="alignLeft">
                        <span id="eventEnd"></span>
                        <input type="hidden" id="eventId" /></td>
                </tr>
            </table>
        </div>

        <div id="addDialog" style="font: 70% 'Trebuchet MS', sans-serif; margin: 10px;" title="Captura">
            <iframe id="IframeDoctos" height="700" width="100%" src="tab.aspx" ></iframe>
         
 

     

        </div>
        <div runat="server" id="jsonDiv" />
        <input type="hidden" id="hdClient" runat="server" />
    </form>
</body>
</html>
