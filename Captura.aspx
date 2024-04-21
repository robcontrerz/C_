<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Captura.aspx.cs" Inherits="Captura" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-datepicker.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-year-calendar.min.css" />
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" type="text/css" href="css/estilosServicios.css" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="Content-Type" content="text/html; charset=utf-8" />
    <meta name="title" content="Captura IT" />
    <title>Captura</title>

    <script type="text/javascript" src="js/respond.min.js"></script>
    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-year-calendar.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-popover.js"></script>
    <script type="text/javascript" src="js/scripts.js"></script>
    <style type="text/css">
        .auto-style1 {
            overflow: auto;
            width: 95%;
            height: 420px;
        }

        .auto-style2 {
            margin-left: 30px;
        }

        .Jefe {
            width: 100%;
        }

        .auto-style3 {
            color: #666666;
        }

        .auto-style4 {
            color: #666666;
            font-size: x-small;
        }

        .auto-style5 {
            margin-left: 30px;
            width: 708px;
        }

        .auto-style6 {
            margin-left: 30px;
            width: 88px;
        }

        .auto-style7 {
            height: 31px;
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
            width: 20px;
            height: 20px;
        }

        .mastercard {
            background-image: url(img/prueba.PNG);
            width: 20px;
            height: 20px;
        }

        .juntas {
            background-image: url(img/junta.PNG);
            width: 20px;
            height: 20px;
        }

        .analisis {
            background-image: url(img/analisis2.PNG);
            width: 20px;
            height: 20px;
        }

        .desarrollo {
            background-image: url(img/desarro.PNG);
            width: 20px;
            height: 20px;
        }

        .pruebas {
            background-image: url(img/prueba.PNG);
            width: 20px;
            height: 20px;
        }

        .produccion {
            background-image: url(img/produccion.PNG);
            width: 20px;
            height: 20px;
        }

        .manto {
            background-image: url(img/manto.PNG);
            width: 20px;
            height: 20px;
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

    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: auto;
            height: auto;
        }
    </style>
    <script type="text/javascript">
        //function getMyData() {

        //    var myData= [];
        //    $.ajax({
        //        url: "Cap.aspx/GetChartData",
        //        success: function (response) {
        //            for (var i = 0; i < response.length; i++) {
        //                myData.push({
        //                    id: response[i].id,
        //                    title: response[i].title,
        //                    startDate: new Date(response[i].startDate),
        //                    endDate: new Date(response[i].endDate),
        //                    color: response[i].color,
        //                });
        //            }

        //        }
        //    });
        //    return myData;
        //}

        //$(function () {
        //    var currentYear = new Date().getFullYear();

        //    $('#calendar').calendar({
        //        enableContextMenu: true,
        //        enableRangeSelection: true,
        //        style:"background",
        //        customDataSourceRenderer: function(elt, date, events) {
        //            $(elt).addClass('has-data-source');
        //        },
        //        yearChanged: function(e) {
        //            e.preventRendering = true;

        //            $.ajax({ 
        //                url: "Cap.aspx/GetChartData",
        //                success: function(response) {
        //                    var myData = [];
        //                    for (var i = 0; i < response.length; i++) {
        //                        myData.push({
        //                            id: response[i].id,
        //                            title: response[i].title,
        //                            startDate: new Date(response[i].startDate),
        //                            endDate: new Date(response[i].endDate),
        //                            color: response[i].color,
        //                        });
        //                    }

        //                    $(e.target).data('calendar').setDataSource(myData);

        //                    // Disable the day on which there is no events
        //                    $('td.day:not([has-data-source]').addClass('disabled');
        //                } 
        //            });
        //        }
        //    });})
      </script>
  
    <style type="text/css">
        .auto-style1 {
            overflow: auto;
            width: 95%;
            height: 420px;
        }

        .auto-style2 {
            margin-left: 30px;
        }

        .Jefe {
            width: 100%;
        }

        .auto-style3 {
            color: #666666;
        }

        .auto-style4 {
            color: #666666;
            font-size: x-small;
        }

        .auto-style5 {
            margin-left: 30px;
            width: 708px;
        }

        .auto-style6 {
            margin-left: 30px;
            width: 88px;
        }

        .auto-style7 {
            height: 31px;
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
            width: 20px;
            height: 20px;
        }

        .mastercard {
            background-image: url(img/prueba.PNG);
            width: 20px;
            height: 20px;
        }

        .juntas {
            background-image: url(img/junta.PNG);
            width: 20px;
            height: 20px;
        }

        .analisis {
            background-image: url(img/analisis2.PNG);
            width: 20px;
            height: 20px;
        }

        .desarrollo {
            background-image: url(img/desarro.PNG);
            width: 20px;
            height: 20px;
        }

        .pruebas {
            background-image: url(img/prueba.PNG);
            width: 20px;
            height: 20px;
        }

        .produccion {
            background-image: url(img/produccion.PNG);
            width: 20px;
            height: 20px;
        }

        .manto {
            background-image: url(img/manto.PNG);
            width: 20px;
            height: 20px;
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

    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: auto;
            height: auto;
        }
    </style>

    <style >
       
.event-tooltip-content:not(:last-child) {
	border-bottom:1px solid #ddd;
	padding-bottom:5px;
	margin-bottom:5px;
}

.event-tooltip-content .event-title {
	font-size:18px;
}

.event-tooltip-content .event-location {
	font-size:12px;
}
</style>




    <script type="text/javascript">




        function editEvent(event) {
            $('#event-modal input[name="event-index"]').val(event ? event.id : '');
            $('#event-modal input[name="event-name"]').val(event ? event.name : '');
            $('#event-modal input[name="event-location"]').val(event ? event.location : '');
            $('#event-modal input[name="event-start-date"]').datepicker('update', event ? event.startDate : '');
            $('#event-modal input[name="event-end-date"]').datepicker('update', event ? event.endDate : '');
            $('#event-modal').modal();
        }

        function deleteEvent(event) {
            var dataSource = $('#calendar').data('calendar').getDataSource();

            for (var i in dataSource) {
                if (dataSource[i].id == event.id) {
                    dataSource.splice(i, 1);
                    break;
                }
            }

            $('#calendar').data('calendar').setDataSource(dataSource);
        }

        function saveEvent() {
            var event = {
                id: $('#event-modal input[name="event-index"]').val(),
                name: $('#event-modal input[name="event-name"]').val(),
                location: $('#event-modal input[name="event-location"]').val(),
                startDate: $('#event-modal input[name="event-start-date"]').datepicker('getDate'),
                endDate: $('#event-modal input[name="event-end-date"]').datepicker('getDate')
            }

            var dataSource = $('#calendar').data('calendar').getDataSource();

            if (event.id) {
                for (var i in dataSource) {
                    if (dataSource[i].id == event.id) {
                        dataSource[i].name = event.name;
                        dataSource[i].location = event.location;
                        dataSource[i].startDate = event.startDate;
                        dataSource[i].endDate = event.endDate;
                    }
                }
            }
            else {
                var newId = 0;
                for (var i in dataSource) {
                    if (dataSource[i].id > newId) {
                        newId = dataSource[i].id;
                    }
                }

                newId++;
                event.id = newId;

                dataSource.push(event);
            }

            $('#calendar').data('calendar').setDataSource(dataSource);
            $('#event-modal').modal('hide');
        }




        $(function () {
            $(document).ready(function () {
                // load Bootstrap Year Calendar JS and initialize calendar
                $.getScript("http://localhost/assets/bootstrap-year-calendar/js/bootstrap-year-calendar.js", function () {

                    // show current year by default
                    var currentYear = new Date().getFullYear();

                    $('#calendar')
                        .calendar({
                            weekStart: 1,
                            minDate: new Date(currentYear - 1, 0, 1),
                            maxDate: new Date(currentYear + 1, 11, 31),
                            style: 'border',
                            yearChanged: function (e) {
                                e.preventRendering = true;
                                $.ajax({
                                    url: "http://localhost?product_sid=15&year=" + e.currentYear,
                                    dataType: "json",
                                    success: function (response) {
                                        var data = [];
                                        for (var i = 0; i < response.length; i++) {
                                            data.push({
                                                id: response[i].id,
                                                name: response[i].name,
                                                location: response[i].location,
                                                startDate: new Date(response[i].startDate),
                                                endDate: new Date(response[i].endDate),
                                                color: response[i].color
                                            });
                                        }
                                        $(e.target).data('calendar').setDataSource(data);
                                    }
                                });
                            }
                        });
                });
            });
        });


        //prueba fasdfadsfa

        //$(function () {
        //    var currentYear = new Date().getFullYear();

        //    $('#calendar').calendar({
        //        enableContextMenu: true,
        //        enableRangeSelection: true,
        //        language: 'es',
        //        contextMenuItems: [
        //            {
        //                text: 'Update',
        //                click: editEvent
        //            },
        //            {
        //                text: 'Delete',
        //                click: deleteEvent
        //            }
        //        ],
        //        selectRange: function (e) {
        //            editEvent({ startDate: e.startDate, endDate: e.endDate });
        //        },

        //        clickDay: function (date, allDay, jsEvent, view) {

        //            //alert('dayClick');
        //            ShowEventPopup(date);
        //        },
        //        mouseOnDay: function (e) {

        //            if (e.events.length > 0) {
        //                var content = '';

        //                for (var i in e.events) {
        //                    content += '<div class="event-tooltip-content">'
        //                                    + '<div class="event-name" style="color:' + e.events[i].color + '">' + e.events[i].name + '</div>'
        //                                    + '<div class="event-location">' + e.events[i].location + '</div>'
        //                                + '</div>';
        //                }

        //                $(e.element).popover({
        //                    trigger: 'manual',
        //                    container: 'body',
        //                    html: true,
        //                    content: content
        //                });

        //                $(e.element).popover('show');
        //            }
        //        },


        //        mouseOutDay: function (e) {
        //            if (e.events.length > 0) {
        //                $(e.element).popover('hide');
        //            }
        //        },
        //        dayContextMenu: function (e) {
        //            $(e.element).popover('hide');
        //        },
    
        //        dataSource: [
        //            {
        //                id: 0,
        //                name: 'Desarrollo De Siscob Att',
        //                location: '9',
        //                startDate: new Date(currentYear, 1, 28),
        //                endDate: new Date(currentYear, 1, 29)
        //            },
        //            {
        //                id: 1,
        //                name: 'Desarrollo De Siscob Att',
        //                location: '2',
        //                startDate: new Date(currentYear, 1, 16),
        //                endDate: new Date(currentYear, 1, 19)
        //            },
        //            {
        //                id: 2,
        //                name: 'Desarrollo De Siscob Att',
        //                location: '3',
        //                startDate: new Date(currentYear, 2, 29),
        //                endDate: new Date(currentYear, 2, 1)
        //            },
        //            {
        //                id: 3,
        //                name: 'Desarrollo De Siscob Att',
        //                location: '4',
        //                startDate: new Date(currentYear, 2, 1),
        //                endDate: new Date(currentYear, 2, 1)
        //            },
        //            {
        //                id: 4,
        //                name: 'Desarrollo De Siscob Att',
        //                location: '2',
        //                startDate: new Date(currentYear, 1, 9),
        //                endDate: new Date(currentYear, 1, 9)
        //            },
        //            {
        //                id: 5,
        //                name: 'Desarrollo De Siscob Att',
        //                location: '9 hrs',
        //                startDate: new Date(currentYear, 3, 17),
        //                endDate: new Date(currentYear, 3, 18)
        //            },
        //            {
        //                id: 6,
        //                name: 'Desarrollo De Siscob Att',
        //                location: '2',
        //                startDate: new Date(currentYear, 2, 25),
        //                endDate: new Date(currentYear, 2, 26)
        //            },
        //            {
        //                id: 7,
        //                name: 'Desarrollo De Siscob Att',
        //                location: '11 hrs',
        //                startDate: new Date(currentYear, 1, 17),
        //                endDate: new Date(currentYear, 2, 17)
        //            },
        //            {
        //                id: 8,
        //                name: 'Desarrollo De Siscob Att',
        //                location: '9 hrs',
        //                startDate: new Date(currentYear, 1, 17),
        //                endDate: new Date(currentYear, 2, 17)
        //            },
        //            {
        //                id: 9,
        //                name: 'Desarrollo De Siscob Att',
        //                location: '9 hrs',
        //                startDate: new Date(currentYear, 1, 17),
        //                endDate: new Date(currentYear, 2, 17)
        //            }
        //        ]
        //    });

        //    $('#save-event').click(function () {
        //        saveEvent();
        //    });
        //});


        //prueba fasdfadsfa

        $('#element').clickDay(function (e) {
            alert('dayClick');
            ShowEventPopup(date);
        });

        function ShowEventPopup(date) {
            $('#fullCalModal').modal();
            //$('#popupEventForm').show();
            $('#eventTitle').focus();
        }
        function ClearPopupFormValues() {
            $('#eventID').val("");
            $('#eventTitle').val("");
            $('#eventDateTime').val("");
            $('#eventDuration').val("");
        }
        (function ($) {
            $.fn.calendar.dates['es'] = {
                days: ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"],
                daysShort: ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb"],
                daysMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"],
                months: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
                monthsShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
                weekShort: 'S',
                weekStart: 1
            };
        }(jQuery));
    </script>

 



</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>



        <div id='calendar' class="nav-justified"></div>

        <div id="fullCalModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
                        <h4 id="modalTitle" class="modal-title">
                            <asp:Label ID="Label1" runat="server" Text="eventDate"></asp:Label></h4>

                    </div>
                    <div id="modalBody" class="modal-body">
                        <div class="eligeFecha">
                            <div style="overflow: scroll; height: 400px;">
                                <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
                                    <ajaxToolkit:TabPanel runat="server" HeaderText="Folio" ID="TabPanel1">
                                        <ContentTemplate>
                                            <div class="activoFIjo">

                                                <asp:Repeater ID="Repeater1" runat="server">
                                                    <HeaderTemplate>
                                                        <table>
                                                            <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                                            <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                                            <th>
                                                                <asp:Label ID="Label3" runat="server" Text="Analisis"></asp:Label>
                                                                <img height="30" width="30" src="img/analisis2.PNG">
                                                            </th>
                                                            <th>
                                                                <asp:Label ID="Label2" runat="server" Text="Desarrollo"></asp:Label>
                                                                <img height="30" width="30" src="img/desarro.PNG"></th>
                                                            <th>
                                                                <asp:Label ID="Label4" runat="server" Text="Junta"></asp:Label>
                                                                <img height="30" width="30" src="img/junta.PNG"></th>
                                                            <th>
                                                                <asp:Label ID="Label5" runat="server" Text="Manto"></asp:Label>
                                                                <img height="30" width="30" src="img/manto.PNG"></th>
                                                            <th>
                                                                <asp:Label ID="Label6" runat="server" Text="Produccion"></asp:Label>
                                                                <img height="30" width="30" src="img/produccion.PNG"></th>
                                                            <th>
                                                                <asp:Label ID="Label7" runat="server" Text="Prueba"></asp:Label>
                                                                <img height="30" width="30" src="img/prueba.PNG"></th>
                                                        </table>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <table>
                                                            <tr>
                                                                <td><a>
                                                                    <asp:CheckBox ID="CheckBox2" runat="server" /></a> </td>
                                                                <td><%# Eval("ID_REQUERIMIENTO") %></td>
                                                                <td>
                                                                    <asp:TextBox ID="TextBox6" runat="server" Width="40" onkeypress="return numbersonly(event);" Height="30" TextMode="SingleLine" Text="00.00" MaxLength="5"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="TextBox7" runat="server" Width="40" onkeypress="return numbersonly(event);" Height="30" TextMode="SingleLine" Text="00.00" MaxLength="5"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="TextBox8" runat="server" Width="40" onkeypress="return numbersonly(event);" Height="30" TextMode="SingleLine" Text="00.00" MaxLength="5"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="TextBox9" runat="server" Width="40" onkeypress="return numbersonly(event);" Height="30" TextMode="SingleLine" Text="00.00" MaxLength="5"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="TextBox10" runat="server" Width="40" onkeypress="return numbersonly(event);" Height="30" TextMode="SingleLine" Text="00.00" MaxLength="5"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="TextBox11" runat="server" Width="40" onkeypress="return numbersonly(event);" Height="30" TextMode="SingleLine" Text="00.00" MaxLength="5"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>

                                                </asp:Repeater>


                                            </div>
                                            <div>
                                                <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" />
                                            </div>

                                        </ContentTemplate>

                                    </ajaxToolkit:TabPanel>
                                    <ajaxToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="Preticket">
                                        <ContentTemplate>
                                            <div class="activoFIjo">

                                                <asp:Repeater ID="rptTable" runat="server">
                                                    <HeaderTemplate>
                                                        <table>
                                                            <th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                                            <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                                            <th>
                                                                <img height="30" width="30" src="img/analisis2.PNG">
                                                            </th>
                                                            <th>
                                                                <img height="30" width="30" src="img/desarro.PNG"></th>
                                                            <th>
                                                                <img height="30" width="30" src="img/junta.PNG"></th>
                                                            <th>
                                                                <img height="30" width="30" src="img/manto.PNG"></th>
                                                            <th>
                                                                <img height="30" width="30" src="img/produccion.PNG"></th>
                                                            <th>
                                                                <img height="30" width="30" src="img/prueba.PNG"></th>
                                                        </table>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <table>
                                                            <tr>
                                                                <td><a>
                                                                    <asp:CheckBox ID="CheckBox2" runat="server" /></a> </td>
                                                                <td><%# Eval("FOLIO_PRETICKET") %></td>
                                                                <td>
                                                                    <asp:TextBox ID="TextBox6" runat="server" Width="40" onkeypress="return numbersonly(event);" Height="30" TextMode="SingleLine" Text="00.00" MaxLength="5"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="TextBox7" runat="server" Width="40" onkeypress="return numbersonly(event);" Height="30" TextMode="SingleLine" Text="00.00" MaxLength="5"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="TextBox8" runat="server" Width="40" onkeypress="return numbersonly(event);" Height="30" TextMode="SingleLine" Text="00.00" MaxLength="5"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="TextBox9" runat="server" Width="40" onkeypress="return numbersonly(event);" Height="30" TextMode="SingleLine" Text="00.00" MaxLength="5"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="TextBox10" runat="server" Width="40" onkeypress="return numbersonly(event);" Height="30" TextMode="SingleLine" Text="00.00" MaxLength="5"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="TextBox11" runat="server" Width="40" onkeypress="return numbersonly(event);" Height="30" TextMode="SingleLine" Text="00.00" MaxLength="5"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>

                                                </asp:Repeater>


                                            </div>
                                        </ContentTemplate>
                                    </ajaxToolkit:TabPanel>
                                    <ajaxToolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="Actividad">
                                        <ContentTemplate>
                                            <table cellpadding="0" class="style1">
                                                <tr>
                                                    <td class="alignRight">Folio:</td>
                                                    <td class="alignLeft">
                                                        <input id="addEventName" type="text" size="50" /><br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="alignRight">Descripcion:</td>
                                                    <td class="alignLeft">
                                                        <textarea id="addEventDesc" cols="30" rows="3"></textarea></td>
                                                </tr>
                                                <tr>
                                                    <td class="alignRight">Inicio:</td>
                                                    <td class="alignLeft">
                                                        <span id="addEventStartDate"></span></td>
                                                </tr>
                                                <tr>
                                                    <td class="alignRight">Fin:</td>
                                                    <td class="alignLeft">
                                                        <span id="addEventEndDate"></span></td>
                                                </tr>
                                            </table>

                                        </ContentTemplate>

                                    </ajaxToolkit:TabPanel>
                                </ajaxToolkit:TabContainer>



                            </div>

                        </div>

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Salir</button>
                    <button class="btn btn-primary"><a id="eventUrl" target="_blank">Guardar</a></button>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function numbersonly(e) {
                var unicode = e.charCode ? e.charCode : e.keyCode
                if (unicode != 8 && unicode != 44) {
                    if (unicode < 48 || unicode > 57) //if not a number
                    { return false } //disable key press    
                }
            }
        </script>
    </form>
</body>
</html>
