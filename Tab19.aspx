<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Tab19.aspx.cs" Inherits="Tab19" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>


    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/run_prettify.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src=" js/jquery.mockjax.js"></script>
    <script type="text/javascript" src="js/bootstrap-typeahead.js"></script>
    <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<%--    <link rel="stylesheet" href="/resources/demos/style.css" />--%>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.css"/>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>


 <script type="text/javascript" >
     $(function() {
  var $table = $('#tableRoomList');
  $table.on('check.bs.table', toggleBtn);
  $table.on('uncheck.bs.table', toggleBtn);
  $table.on('check-all.bs.table', toggleBtn);
  $table.on('uncheck-all.bs.table', toggleBtn);
  toggleBtn();

  //

  function toggleBtn() {
    var rows = $table.bootstrapTable('getSelections');
    $('#btn-refill').prop('disabled', rows.length === 0);
  }

});
 </script>


    <script  type="text/javascript">
        $(function () {
            var availableTags = [
                "Acapulco",
                "Monterre",
                "Guadalajara",
                "Toronto",
                "Montreal",
                "New York",
                "Buffalo",
                "Boston",
                "Columbus",
                "Dallas",
                "Vancouver",
                "Seattle",
                "Los Angeles"
            ];
            $("#tags").autocomplete({
                source: availableTags
            });
            $("#tags1").autocomplete({
                source: availableTags
            });
        });
    </script>

 


   
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
    </style>

 


 
   
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


        <div class="well col-md-5">
            <input id="tags" type="text" class="col-md-12 form-control" placeholder="origen..." />
            <%--       <input id="demo1" type="text" class="col-md-12 form-control" placeholder="origen..." autocomplete="off" />--%>
        </div>
        <div class="well col-md-5">
            <input id="tags1" type="text" class="col-md-12 form-control" placeholder="destino..." />
            <%--   <input id="demo2" type="text" class="col-md-12 form-control" placeholder="destino..." autocomplete="off" />--%>
        </div>


        <div style="height: 80%" runat="server">

            <table class="auto-style1">
                <tr>
                    <td>



                        <div>
                            <div class="auto-style11" style="font-weight: bold">Fecha viaje.. </div>
                            <div>

 <%--                               <asp:TextBox ID="inicioTabla" runat="server" Height="23px" Text="Inicio" Width="90px" BorderColor="Silver" BorderStyle="Solid" ForeColor="Silver" OnTextChanged="inicioTabla_TextChanged2"></asp:TextBox>&#160;&#160;
                                                <asp:ImageButton ID="imgPopup" runat="server" ImageAlign="Bottom" ImageUrl="~/img/Calendarblue.PNG" Height="27px" Width="27px" OnClick="imgPopup_Click" /><br />
                                <br />
                                <cc1:CalendarExtender ID="Calendar1" PopupButtonID="imgPopup" runat="server" TargetControlID="inicioTabla" Format="yyyy/MM/dd" BehaviorID="_content_Calendar1"></cc1:CalendarExtender>--%>
                            </div>
                        </div>

                        <br />
        </div>
        <br />
        <br />

        </td>
                                                         
                                                        <td>
                                                            <div class="auto-style10">
                                                                <br />

                                                            </div>
                                                            &nbsp;</td>
        <td>
            <div class="auto-style10">

                        <input  class="form-control"type="date" name="viaje" placeholder="Fecha de viaje">
   
                                                
            </div>
            &nbsp;</td>
        </tr>
                                                </table>

             <asp:Button ID="Buscar" runat="server" BackColor="#009FDB" BorderStyle="None" CssClass="Button" ForeColor="White" Height="38px" OnClick="Buscar_Click" Text="BUSCAR" Width="110px" />
        <asp:Panel ID="Panel5" runat="server" Visible="false">
            <div class="box">
  <div class="box-header">
    <h3 class="box-title"><label>Todas las Terminales</label></h3>
  </div>
  <div class="box-body">
    <div class="header pull-left">
      <input type="button" id="btn-refill" class="btn btn-primary" value="Seleccionar" onclick="Ejecutar();" />
        <button onclick="demoPDF()" class="btn btn-success">    
            PAGAR</button>
    </div>
    <table data-toggle="table" data-click-to-select="true" data-pagination="true" data-page-list="[5, 10, 15, 20]" data-height="340" data-search="true" class="table-hover table-responsive" id="tableRoomList">
      <thead>
        <tr>
          <th data-field="state" data-checkbox="true" id="check"></th>
          <th data-field="name">Compañia</th>
          <th data-field="stargazers_count">Horario</th>
          <th data-field="forks_count">Terminales</th>
          <th data-field="description">Precio</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>ADO</td>
          <td>19:00</td>
          <td>Terminal TAPO ADO</td>
          <td>164</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check" class="auto-style1"></td>
          <td class="auto-style1">AV</td>
          <td class="auto-style1">19:00</td>
          <td class="auto-style1">Terminal TAPO ADO</td>
          <td class="auto-style1">1641</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>ADO1</td>
          <td>19:00</td>
          <td>Terminal TAPO ADO</td>
          <td>16</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>ADO2</td>
          <td>19:00</td>
          <td>Terminal TAPO ADO</td>
          <td>12</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>ADO3</td>
          <td>19:00</td>
          <td>Terminal TAPO ADO</td>
          <td>33</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>ADO4</td>
          <td>19:00</td>
          <td>Terminal TAPO ADO</td>
          <td>56</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>Jorge</td>
          <td>19:00</td>
          <td>Terminal CAPU</td>
          <td>53</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>Jorge</td>
          <td>19:00</td>
          <td>Terminal CAPU</td>
          <td>78</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>Jorge</td>
          <td>5:00</td>
          <td>Terminal CAPU</td>
          <td>45</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>Jorge</td>
          <td>5:00</td>
          <td>Terminal CAPU</td>
          <td>45</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>Jorge</td>
          <td>6:00</td>
          <td>Terminal CAPU</td>
          <td>43</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>Jorge</td>
          <td>3:00</td>
          <td>Terminal CAPU</td>
          <td>32</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>Jorge</td>
          <td>5:00</td>
          <td>Terminal CAPU</td>
          <td>3</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>Jorge</td>
          <td>5:00</td>
          <td>Terminal CAPU</td>
          <td>24</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>Jorge</td>
          <td>5</td>
          <td>Terminal CAPU</td>
          <td>64</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>Jorge</td>
          <td>5:00</td>
          <td>Terminal CAPU</td>
          <td>84</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>Jorge</td>
          <td>6:00</td>
          <td>Terminal CAPU</td>
          <td>23</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>Jorge</td>
          <td>5:00</td>
          <td>Terminal CAPU</td>
          <td>345</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>Jorge</td>
          <td>5:00</td>
          <td>Terminal CAPU</td>
          <td>23</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>Jorge</td>
          <td>5:00</td>
          <td>Terminal CAPU</td>
          <td>23</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>Jorge</td>
          <td>5:00</td>
          <td>Terminal CAPU</td>
          <td>234</td>
        </tr>
        <tr>
          <td data-field="state" data-checkbox="false" id="check"></td>
          <td>Jorge</td>
          <td>5:00</td>
          <td>Terminal CAPU</td>
          <td>234</td>
        </tr>

      </tbody>

      <tfoot>
        <tr>
          <th data-field="state" data-checkbox="true"></th>
          <th data-field="name">Compañia</th>
          <th data-field="stargazers_count">Horario</th>
          <th data-field="forks_count">Terminales</th>
          <th data-field="description">Precio</th>
        </tr>
      </tfoot>
    </table>

  </div>
</div>

            <div class="container-lg">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-8"><h2>Detalle <b>Viaje</b></h2></div>
                    <div class="col-sm-4">
                        <asp:Button ID="Button1" runat="server" Text="Agregar Seguro" OnClick="Button1_Click1" class="btn btn-info add-new"/>
                        <button onclick="demoPDF()" class="btn btn-success">PAGAR</button>
                      
                                 <script type="text/javascript" src="js/jspdf.debug.js"></script>
    <script type="text/javascript" src="js/basic.js"></script>
                        <%--<button id="agregaseg" type="button" onclick="Button1_Click1" runat="server" class="btn btn-info add-new"><i class="fa fa-plus"></i> Agregar Seguro</button>--%>
                    </div>
                </div>
            </div>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Compañia</th>
                        <th>Horario</th>
                        <th>Precio</th>
                        <th>Precio</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>ADO</td>
                        <td>10:00</td>
                        <td>$222</td>
                        <td>
                            <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                            <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                            <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                        </td>
                    </tr>
    
                </tbody>
            </table>
        </div>
    </div>
</div>     
            <asp:GridView ID="GridView1" runat="server" VISIBLE="false" DataSourceID="viajes" AutoGenerateColumns="False" DataKeyNames="idcompania" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" Text="Seleccionar" OnClick="Button1_Click1" />

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="idcompania" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="idcompania" />
                    <asp:BoundField DataField="Compania" HeaderText="Compañia" SortExpression="Compania" />
                    <asp:BoundField DataField="Horario" HeaderText="Horario" SortExpression="Horario" />
                    <asp:BoundField DataField="Terminal" HeaderText="Terminal" SortExpression="Terminal" />
                    <asp:BoundField DataField="Duracion" HeaderText="Duracion" SortExpression="Duracion" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
                    <asp:BoundField DataField="Clase" HeaderText="Clase" SortExpression="Clase" />
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>

            <asp:SqlDataSource ID="viajes" runat="server" ConnectionString="<%$ ConnectionStrings:Iseguro %>" SelectCommand="SELECT * FROM [Rutas]"></asp:SqlDataSource>

        </asp:Panel>

        <asp:Panel ID="panel6" runat="server" Visible="false">
            <asp:Label ID="Label1" runat="server" Text="Seguro" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True"></asp:Label>
           <div class="form-check form-check-inline">
  <input
    class="form-check-input"
    type="radio"
    name="inlineRadioOptions"
    id="inlineRadio1"
    value="option1"
  />
  <label class="form-check-label" for="inlineRadio1">Basico $138</label>
</div>

<div class="form-check form-check-inline">
  <input
    class="form-check-input"
    type="radio"
    name="inlineRadioOptions"
    id="inlineRadio2"
    value="option2"
  />
                   <label class="form-check-label" for="inlineRadio2">Medio $213</label>
</div>

<div class="form-check form-check-inline">
  <input
    class="form-check-input"
    type="radio"
    name="inlineRadioOptions"
    id="inlineRadio3"
    value="option3"
     
  />
  <label class="form-check-label" for="inlineRadio3">Total $382</label>
</div>



            &nbsp;

        <p>
         DATOS DEL ASEGURADO
            &nbsp;</p>

 	<div class="container" >
		<form action="pagina.php" method="GET" style="margin:5%; background-color:#F2F2F2; padding: 5%; ">
			<!-- primera fila -->
			<div class="form-group">
				<div class="row">
					<!-- primera columna -->
					<div class="col-md-4">
						<input  class="form-control"type="text" name="nombres" placeholder="Nombres">
					</div>
					<!-- segunda columna -->
					<div class="col-md-4">
						<input  class="form-control"type="text" name="apellidos" placeholder="Apellidos">
					</div>
					<!-- tercera columna -->
					<div class="col-md-4">
						<input  class="form-control"type="date" name="nacimiento" placeholder="Fecha de nacimiento">
					</div>
				</div>
			</div>
			<!-- segunda fila -->
			<div class="form-group">
				<div class="row">
					<!-- primera columna -->
					<div class="col-md-4">
						<select class="form-control">
							<option>Femenino</option>
							<option>Masculino</option>
						</select>
					</div>
					<!-- segunda columna -->
					<div class="col-md-4">
						<input  class="form-control" type="text" name="rh" placeholder="RH">
					</div>
					<!-- tercera columna -->
					<div class="col-md-4">	
					</div>
				</div>
			</div>
			<!-- tercera fila -->
			<div class="form-group">
				<div class="row">
					<!-- primera columna -->
					<div class="col-md-4">
						<select  class="form-control">
							<option>Registro civil</option>
							<option>Tarjeta de identidad</option>
							<option>Cedula</option>
						</select>
					</div>
					<!-- segunda columna -->
					<div class="col-md-4">
						<input  class="form-control"type="number" name="ndocumento" placeholder="Numero de documentó">
					</div>
					<!-- tercera columna -->
					<div class="col-md-4">
						<input class="form-control" type="date" name="expedicion" placeholder="Expedición">
					</div>
				</div>
			</div>
			<%--<button id="btnCrearPdf" class="btn btn-default" type="submit"  onclick="demoPDF()" >Guardar</button>--%>
            <button class="btn btn-default" onclick="demoPDF()">Imprimir</button> 
         <script type="text/javascript" src="js/jspdf.debug.js"></script>
    <script type="text/javascript" src="js/basic.js"></script>

              <%--<button id="btnCrearPdf" name="btn_enviar" class="btn btn-default">Enviar</button>--%>
		</form>
	</div>
        <p>
         DATOS DEL BENEFICIARIO
            &nbsp;</p>
       <div class="form-row">
            <div class="form-group col-md-4">
                <label for="Cedula">Nombre</label>
                <input type="text" name="cedula" class="form-control">
            </div>
            <div class="form-group col-md-4">            
                <label for="Nombre">Paterno</label>
                <input type="text" name="cedula" class="form-control">
            </div>
            <div class="form-group col-md-4">
                <label for="Apellido">Materno</label>
                <input type="text" name="cedula" class="form-control">
            </div>
            <div class="form-group col-md-4">
                <label for="fecha">Fecha</label>
                <select name="fecha" id="tasking" class="form-control">
                    <option value="" selected>Seleccione fecha</option>
                    <option value="value1">value1</option>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label for="Municipio_idMunicipio">Estado</label>
                <select name="Municipio_idMunicipio" id="Municipio_idMunicipio" class="form-control">
                    <option value="" selected>Municipio</option>
                    <option value="value">value</option>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label for="Area_idArea">Area </label>
                <select name="Area_idArea" id="Area_idArea" class="form-control">
                    <option value="" selected>Area_idArea</option>
                    <option value="value">value</option>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label for="Cargo_idCargo">Cargo </label>
                <select name="Cargo_idCargo" id="Cargo_idCargo" class="form-control">
                    <option value="" selected>Cargo_idCargo</option>
                    <option value="value">value</option>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label for="Salario">Beneficiario</label>
                <input type="text" name="cedula" class="form-control">
            </div>
            <div class="form-group col-md-4">
                <label for="fecha2">Fecha Nacimiento Beneficiario</label>
                <select name="fecha" id="tasking" class="form-control" class="form-control">
                    <option value="" selected>Seleccione fecha</option>
                    <option value="value1">value1</option>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label for="Genero">Genero</label>
                <select name="Genero" id="Genero" class="form-control">
                    <option value="" selected>Genero</option>
                    <option value="value">value</option>
                </select>
            </div>
        </div> 
        <!-- dejo fuera a submit -->
        <div class="form-group">
            <%--<input type="submit" value="Comprar" class="btn btn-success"/>--%>
            <button id="pago" runat="server" onclick="Button1_Click1" class="btn btn-success">    
            PAGAR</button> 
        </div>
        </asp:Panel>

        <asp:Panel ID="pagos" runat="server" >
<div id="paypal-button-container"></div>
<script type="text/javascript" src="https://www.paypal.com/sdk/js?client-id=SB_CLIENT_ID&currency=MXN"> </script>

<script type="text/javascript">
  paypal.Buttons({
    createOrder: function(data, actions) {
      return actions.order.create({
        purchase_units: [{
          amount: {
            value: '50.00' //Pues 50 pesitos
          }
        }]
      });
    },
    onApprove: function(data, actions) {
      return actions.order.capture().then(function(details) {
        alert('Transaction completed by ' + details.payer.name.given_name);
        // Call your server to save the transaction
        return fetch('/paypal-transaction-complete', {
          method: 'post',
          headers: {
            'content-type': 'application/json'
          },
          body: JSON.stringify({
            orderID: data.orderID
          })
        });
      });
    }
  }).render('#paypal-button-container');
</script>
        </asp:Panel>

<%--        <asp:panel runat="server" Visible="false">
            <form class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Form Name</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="text_nom1">Primer nombre</label>  
  <div class="col-md-4">
  <input id="text_nom1" name="text_nom1" placeholder="Primer nombre" class="form-control input-md" type="text">

  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="text_nom2">Segundo nombre</label>  
  <div class="col-md-4">
  <input id="text_nom2" name="text_nom2" placeholder="Segundo nombre" class="form-control input-md" type="text">

  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="text_ape1">Primer apellido</label>  
  <div class="col-md-4">
  <input id="text_ape1" name="text_ape1" placeholder="Primer apellido" class="form-control input-md" type="text">

  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="text_ape2">Segundo apellido</label>  
  <div class="col-md-4">
  <input id="text_ape2" name="text_ape2" placeholder="Segundo apellido" class="form-control input-md" type="text">

  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="text_ciu_nom">Ciudad nombre</label>  
  <div class="col-md-4">
  <input id="text_ciu_nom" name="text_ciu_nom" placeholder="Ciudad nombre" class="form-control input-md" type="text">

  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="text_dep">Departamento</label>  
  <div class="col-md-4">
  <input id="text_dep" name="text_dep" placeholder="Departamento" class="form-control input-md" type="text">

  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="text_ciu_cod">Ciudad Código</label>  
  <div class="col-md-4">
  <input id="text_ciu_cod" name="text_ciu_cod" placeholder="Ciudad Código" class="form-control input-md" type="text">

  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="btn_enviar"></label>
  <div class="col-md-4">
  
      
  </div>
</div>

</fieldset>
</form>
        </asp:panel>--%>

    </form>
</body>
</html>
