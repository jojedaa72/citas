<%@ language="vbscript" codepage="65001" %>
<%
Response.CharSet = "utf-8"
%>
<!-- #include file="includes/conn.inc" -->
<% 

Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")

Cn.Open CadenaConexion

Usuario   = Request("usuario")
Usuario1   = Request("usuario1")


Sql = "select * from persona where id_persona =  '" & Usuario & "' "
Rs.Open Sql, Cn

colabora = rs("colabora")

sqls = "select id_altacurso,ds_curso,id_persona,id_seccion,ds_seccion,nombre, "
sqls = sqls & "RIFA, ST_RIFA, st_condicion, st_asistencia "
sqls = sqls & "from  conducta "
sqls = sqls & " where id_persona = '" & Usuario1 & "'  order by cast(rifa as int) "
Rs1.Open sqls, Cn


 %>	

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
		<!-- Optimizar el sitio en dispositivos móviles -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Importar CSS de Bootstrap  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- Importar Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Importar Funciones JavaScript de Bootstrap -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script
        src="http://code.jquery.com/jquery-3.2.1.slim.min.js"
        crossorigin="anonymous">
    </script>
  	<!-- Cargamos nuesto archivo Java Script-->
	<script type="text/javascript" src="functions.js"></script>
	<!-- Cargamos la fuente de Google Raleway : visitar Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">
	<!-- Cargamos nuestra hoja de estilos -->
	<link rel="stylesheet" href="css/styles.css">

</head>

<script language="Javascript">
/* Bloquea el boton derecho del mouse */
 document.oncontextmenu = function(){return false}

function validar(){
var ok = 0;
var ckbox = document.getElementsByName('entrada');
    for (var i=0; i < ckbox.length; i++){
        if(ckbox[i].checked == true){
        ok = 1;
        }
    }
    
    if(ok == 0){
    alert('Seleccione como minimo un número de rifa para continual');
    return false;
    }
}

</script>

<body>

<div class="container">
  <div class="row">

	  <div class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
      <div class="alert alert-info" role="alert">
        <h2 class="text-center">Seleción de rifas Family Fun Day 2019 -  Alpamayo</h2>
			</div>
	  </div>

		<div style="height: 50px;" class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
			<label control-label">Familia :   <%= ucase(Rs("ds_apellidos")) %></label>
			<br><br>
			<label>Seccione o active las rifas que desea adquirir:</label>
			<br>
		</div>
				
<div class="col-sm-8 col-md-10 col-md-offset-2 col-sm-offset-2">				
<form name="frmAlumnos" class="form-horizontal" method="POST" action="grabacita1.asp" onsubmit="return validar();"">

		
<div id="wrapper">

<table class="table">
	<tr>
		<thead>
			<th scope="col" colspan="6">Rifa(s)</th>
    </thead>
  </tr>

		<% Do Until Rs1.EOF %>
    <tr>
     	<td style="width: 200px;">
    <% if rs1(9) = "1" then %><span class="glyphicon glyphicon-ok" style="color:green"></span><% End If %> 
        <strong> <%= Rs1(6) %></strong></td>
			<td style="width: 500px;">
  			<label for="<%= Rs1(6) %>" class="content-input">
  			<input type="checkbox" name="entrada" id="<%= Rs1(6) %>" value="<%= Rs1(6) %>"<% If Rs1(7) = "1" Then %> checked="checked" <% End If %>>
  			<i></i>
  			</label>
			</td>
    <% Rs1.MoveNext
      If Rs1.EOF Then
      Exit Do
      End If %>
     	<td style="width: 200px;">
    <% if rs1(9) = "1" then %><span class="glyphicon glyphicon-ok" style="color:green"></span><% End If %>
        <strong> <%= Rs1(6) %></strong>
      </td>
		  <td style="width: 500px;">
				<label for="<%= Rs1(6) %>" class="content-input">
				  <input type="checkbox" name="entrada" id="<%= Rs1(6) %>" value="<%= Rs1(6) %>"<% If Rs1(7) = "1" Then %> checked="checked" <% End If %>>
					<i></i>
				</label>
			</td>
		<% Rs1.MoveNext
      If Rs1.EOF Then
      Exit Do
      End If%>
		 	<td style="width: 200px;"> 
    <% if rs1(9) = "1" then %><span class="glyphicon glyphicon-ok" style="color:green"></span><% End If %> 
        <strong> <%= Rs1(6) %></strong></td>
		  <td style="width: 500px;">
				<label for="<%= Rs1(6) %>" class="content-input">
					<input type="checkbox" name="entrada" id="<%= Rs1(6) %>" value="<%= Rs1(6) %>"<% If Rs1(7) = "1" Then %> checked="checked" <% End If %>>
					<i></i>
				</label>
			</td>              
    </tr>
    <% Rs1.MoveNext
    Loop %>
</table>

  <div class="form-group">
    <label class="col-sm-4 control-label">Forma de donación:</label>
      <div class="col-sm-6">
        <select id="disabledSelect" class="form-control input-lg" name="condicion" required>
          <option value="" selected>Seleccionar</option>
          <option value="Efectivo">Pago en efectivo</option>
          <option value="Credito">Cargo en cuenta</option>
        </select>
      </div>
  </div>

</div>
			<div class="col-sm-12 text-center">
		<!--	<a class="btn btn-default btn-lg" href="../ingreso/salir.asp" role="button">Salir</a> -->
			<button type="submit" class="btn btn-primary btn-lg">Grabar Selección</button>
			</div>
<div>
</form>
	</div>
</div>	    
</body>
</html>
<%
Set Rs = Nothing
Set Rs1 = Nothing
Set Cn = Nothing
%>
