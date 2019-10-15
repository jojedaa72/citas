<!-- #include file="../includes/conn.inc" -->

<% 
If Session("perfil") = "" Then
   Response.Redirect("../default.asp")
End If

Usuario = Session("usuario")
Usuario1 = Session("usuario1")
nombre =  Session("nombre")

colabora  = Request("colabora")

Set Rs = Server.CreateObject("ADODB.Recordset")
Set Cn = Server.CreateObject("ADODB.Connection")
Cn.Open CadenaConexion


	Sql = "UPDATE persona  SET id_cita	    = '" & idcita & "', colabora	= '" & colabora & "' , "	
	Sql = Sql & "citado   = '1' where id_persona =  '" & Usuario & "' " 
	Cn.Execute(Sql) %>

<!DOCTYPE html>
<html>

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

<script>
/* Bloquea el boton derecho del mouse */
 document.oncontextmenu = function(){return false}

function redirect(){
	frmNotas.submit();
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
</script>

</head>

<% 
	Sql = "select * from persona where  id_persona =  '" & Usuario & "' "
	Rs.Open Sql, Cn  %>

<% If Rs("citado") = "1" and Rs("colabora") = "1"  then  %>
	
		<% Response.Redirect "menu2.asp" %>

<% Else %>

	<BODY>
		<div class="container">
	    <div class="row">
		    <div class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
					<div class="alert alert-info" role="alert">
					  <h2 class="text-center">Seleción de rifas Family Fun Day 2019 -  Alpamayo</h2>
					</div>
		    </div>

				<div class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
					<label control-label">Familia :   <%= ucase(Rs("ds_apellidos")) %></label>
				</div>
					
				<div class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">	
					<br><br>
					<div class="panel panel-danger">
					  <div class="panel-heading">Información:</div>
					  <div class="panel-body">Por favor, agradeceremos realizar la devolución de las 15 rifas no adquiridas hasta el miercoles 5 de junio.<br><br>En caso que posteriormente desee adquirir rifas deberá hacerlo con pago en efectivo en la recepción del colegio:<br><br>Puede realizar consultas al siguiente correo:  <a href="mailto:sistemas@alpamayo.edu.pe">sistemas@alpamayo.edu.pe</a></div>
					</div>
				<div class="col-sm-12 text-center">
					<a class="btn btn-default btn-danger" href="../ingreso/salir.asp" role="button">Salir</a>
				</div>
			</div>
		</div>
	</div>
	</BODY>

<% End If %>

</html>
<%
Set Rs = Nothing
Set Cn = Nothing
%>