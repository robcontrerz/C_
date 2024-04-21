<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Costo.aspx.cs" Inherits="Costo" %>

<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-datepicker.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-year-calendar.min.css" />
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/style1.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="Content-Type" content="text/html; charset=utf-8" />
    <meta name="title" content="Costos IT" />
    <meta name="description" content="Costos IT" />
    <meta name="keywords" content="bootstrap, jquery, javascript, widget, calendar, year, component, library, framework, html, css, api" />
    <meta name="author" content="RCZ" />
    <title>Costos IT</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            min-width: 200px;
            margin-left: 0px;
            margin-right: auto;
            margin-top: auto;
            margin-bottom: auto;
            padding: 0 5px;
        }

        .auto-style2 {
            width: 100%;
            min-width: 200px;
            margin-right: auto;
            margin-top: auto;
            margin-bottom: auto;
            padding: 0 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

          

            <div id="banner">
                <div class="auto-style1">
                    <a href=".">
                        <div class="logo">
                            Costo IT
                        </div>
                    </a>
                    <span class="menu-button fa fa-bars"></span>
                    <ul class="menu">
                        <li data-url="cap.aspx"" data-subtitle="Estructura">Estructura</li>
                        <li data-url="examples.html" data-subtitle="Captura" data-full-page="true">Captura</li>
                        <li data-url="examples.html" data-subtitle="Proyectos">Proyectos</li>
                        <li data-url="examples.html" data-subtitle="An open-source project">Graficas</li>
                         <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="fa fa-tasks fa-fw"></i><i class="fa fa-caret-down"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-tasks">
                                <li>
                                    <a href="Captura.aspx"></a>
                                </li>
                            </ul>
                      
                        </li>

                    </ul>

                </div>
            </div>
            <%--		<div id="title">
			<div class="site-content">
				<h1> Horas</h1>
				<h2> !</h2>
			</div>
		</div>--%>
            <div id="main">
                
                    <div class="sub-content-container">


	<div class="sub-content">
	</div>

                </div>
            </div>
                            </div>
            <div id="footer">
                <div class="site-content">
                </div>
            </div>

            <script src="js/respond.min.js"></script>
            <script src="js/jquery-1.10.2.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/bootstrap-datepicker.min.js"></script>
            <script src="js/bootstrap-year-calendar.min.js"></script>
            <script src="js/bootstrap-popover.js"></script>
            <script src="js/scripts.js"></script>

            <script>
                (function (i, s, o, g, r, a, m) {
                    i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                        (i[r].q = i[r].q || []).push(arguments)
                    }, i[r].l = 1 * new Date(); a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
                })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

                ga('create', 'UA-48764819-2', 'auto');
                ga('send', 'pageview');

            </script>
        </div>
    </form>
</body>
</html>
