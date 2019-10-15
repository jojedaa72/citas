<%@ language="vbscript" codepage="65001" %>
<%
Response.CharSet = "utf-8"
%>
<!-- #include file="../includes/conn.inc" -->

<% 
If Session("perfil") = "" Then
   Response.Redirect("../default.asp")
End If

Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Set Rs3 = Server.CreateObject("ADODB.Recordset")
Cn.Open CadenaConexion

Usuario = Session("usuario")
Usuario1 = Session("usuario1")

Sql = "select * from persona where id_persona =  '" & Usuario & "' "
Rs.Open Sql, Cn

sqls = "select id_altacurso,ds_curso,id_persona,id_seccion,ds_seccion,nombre, "
sqls = sqls & "RIFA, ST_RIFA "
sqls = sqls & "from  conducta "
sqls = sqls & " where id_persona = '" & Usuario1 & "'  order by cast(rifa as int) "
Rs1.Open sqls, Cn 	

sqqls = "select id_altacurso,ds_curso,id_persona,id_seccion,ds_seccion,nombre, "
sqqls = sqqls & "RIFA, ST_RIFA "
sqqls = sqqls & "from  conducta "
sqqls = sqqls & " where id_persona = '" & Usuario1 & "'  and ST_RIFA = '1'  order by cast(rifa as int) "
Rs2.Open sqqls, Cn 

sqqlas = "select count(ST_RIFA)"
sqqlas = sqqlas & "from  conducta "
sqqlas = sqqlas & " where id_persona = '" & Usuario1 & "'  and ST_RIFA = '1' "
Rs3.Open sqqlas, Cn 

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
	<link rel="stylesheet" href="../css/styles.css">
</head>


<script language="Javascript">

function buscar_marca(){
   frmConsulta.target = "_self"
   frmConsulta.action = "menu1.asp"
   frmConsulta.submit();   
}


function Validar(form)
{
var errores="";
with(form){
if ((Radio1.checked)||(Radio2.checked)){
}
else {errores+="- Debe seleccionar una opción.\n ";}
/* FIN DE CONDICIONES */
if (errores){
alert("Por favor, revise lo siguiente:\n"+errores);
document.ResultadoForm=false;
}
else document.ResultadoForm=true;
}
}

/* Anula el botón retroceder del navegador */
$(document).ready(function(){
 
  window.onhashchange = function(){
    if (typeof (window.stop) != 'undefined')
      window.stop();
    if (typeof (document.execCommand) != 'undefined')
      document.execCommand('Stop');
 
    if (document.location.hash.length < 10)
      history.go(1);
  };
   /* Push 10 History */
  document.location += "#";
  for(i = 0; i < 10; i++)
    document.location += "@";
});

/* Bloquea el boton derecho del mouse */
document.oncontextmenu = function(){return false}
</script>

<body>

<% If Rs("citado") = "A"  Then %>

  <% If Rs("colabora") = "A"  Then %>

    	<div class="container">
    	    <div class="row">
    		    <div class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
    				<div class="alert alert-info" role="alert">
    				   <h2 class="text-center">Seleción de rifas Family Fun Day 2019 - Alpamayo</h2>
    				</div>
    		    </div>

    			<div style="height: 50px;" class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
    				<label control-label">Familia :   <%= ucase(Rs("ds_apellidos")) %></label>
    			</div>
    			
    			<div style="height: 50px;" class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
    				<label control-label">Usted colaboró con <strong>(<%= rs3(0)%>)</strong> rifas(s): </label>
    			</div>
 
        <div style="height: 50px;" class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
          <label control-label">Por favor, separe las rifas seleccionadas, recuerde que para ingresar al Family Fun Day deberá mostrar la(s) rifa(s) que seleccionó, el ingreso será solo por la puerta 4.</label>
        </div>
  
        <br>
          <div class="table-responsive col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">  
    			
    			<table  class="table table-bordered">
    			<tr><th colspan="3">Rifas(s) seleccionada(s)</th></tr>
    			<% Do Until Rs2.EOF %>

                 <tr>
                   <td align="center"><strong><%= Rs2("RIFA") %></strong></td><%
                   Rs2.MoveNext
                   If Rs2.EOF Then
                      Exit Do
                   End If%>
                   <td align="center"><strong><%= Rs2("RIFA") %></strong></td>
    			   <% Rs2.MoveNext
                   If Rs2.EOF Then
                      Exit Do
                   End If%>
                   <td align="center"><strong><%= Rs2("RIFA") %></strong></td>               
                 </tr>
                 <% Rs2.MoveNext
                Loop %>
               </table>
    		</div>

    			<div class="col-sm-12 text-center">
    	<a class="btn btn-default btn-danger" href="../ingreso/salir.asp" role="button">Salir</a>
    	</div>
    	</div>

   <% Else %>

    <BODY>
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
          <div class="alert alert-info" role="alert">
             <h2 class="text-center">Seleción de rifas Family Fun Day 2019 - Alpamayo</h2>
          </div>
            </div>

        <div class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
          <label control-label">Familia :   <%= ucase(Rs("ds_apellidos")) %></label>
        </div>
          
        <div class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2"> 
        <br><br>
        <div class="panel panel-danger">
          <div class="panel-heading">Información:</div>
          <div class="panel-body">Por favor, agradeceremos realizar la devolución de las 15 rifas hasta el miércoles 5 de junio.<br><br>En caso que posteriormente desee adquirir rifas deberá hacerlo con pago en efectivo en la recepción del colegio:<br><br>Puede realizar consultas al siguiente correo:  <a href="mailto:sistemas@alpamayo.edu.pe">sistemas@alpamayo.edu.pe</a></div>
        </div>
        <div class="col-sm-12 text-center">
        <a class="btn btn-default btn-danger" href="../ingreso/salir.asp" role="button">Salir</a>
        </div>
      </BODY>

  <% End If %>
<% Else %>

	<div class="container">
    	<div class="row">
	        <div class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
				<div class="alert alert-info" role="alert">
				   <h2 class="text-center">Seleción de rifas Family Fun Day 2019 -  Alpamayo</h2>
				</div>
	        </div>

			<div class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
				<label control-label">Familia : <%= ucase(Rs("ds_apellidos")) %></label>
			</div>
				
<div class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">	
	<form id="form1" name="frmNotas" class="form-horizontal" method="POST" action="grabacita.asp" onsubmit="Validar(this);return document.ResultadoForm">		
	<div id="wrapper">
		<br><br>
		<div class="panel panel-default">
			<div class="panel-heading">Desea Colaborar con la compra de rifas del Family Fun Day 2019</div>
			<div class="panel-body">
			<label for="Radio1" class="content-input">
			<input type="radio" name="colabora" id="Radio1" value="1">SI deseo colaborar
			<i></i>
			</label>
			<label for="Radio2" class="content-input">
			<input type="radio" name="colabora" id="Radio2" value="0">NO deseo colaborar
			<i></i>
			</label>
		  </div>
		</div>
	</div>
	<div class="col-sm-12 text-center">
<!--	<a class="btn btn-default btn-lg" href="../ingreso/salir.asp" role="button">Salir</a> -->
	<input type="submit" id="Radio" class="btn btn-primary btn-lg" name="Submit" value="Continuar" />
	</div>
</form>

<% End If %>


</div>
</div>
</div>  



</body>
</html>

