<!-- #include file="../includes/conn.inc" -->

<% 

Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Set Rs3 = Server.CreateObject("ADODB.Recordset")
Set Rs4 = Server.CreateObject("ADODB.Recordset")
Cn.Open CadenaConexion


Usuario = Session("usuario")
Usuario1 = Session("usuario1")

selhora = Request("selhora")
selfecha = Request("selfecha")


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
</head>
<body>


	<div class="container">
	    <div class="row">
	        <div class="col-sm-6 col-md-8 col-md-offset-2 col-sm-offset-2">
				<div class="alert alert-info" role="alert">
				   <h2 class="text-center">Citados por fecha</h1>
				</div>

					<form name="frmConsulta" class="form-horizontal" method="POST" action="listado.asp"">
						<div class="form-group">
						    <label class="col-sm-4 control-label">Fecha Cita:</label>
						    <div class="col-sm-6">
						        <select id="disabledSelect" class="form-control input-lg" name="selfecha"  required>
						          <option value="">Sel. Fecha cita</option><%
							        sSql = "select distinct(id_fecha), ds_fecha, st_fecha, ds_nivel, codigo from fecha  order by codigo"
							        Rs1.Open sSql, Cn
							        Do Until Rs1.EOF %>
							        	<option value="<% = Rs1(1) %>"<% if selfecha = Rs1(1) Then%> selected<%End If%>><% = Rs1(1) %></option>
							       	<% 
							        Rs1.MoveNext
							        Loop
							        Rs1.Close %>
						        </select>
						    </div>
						</div>

						<div class="col-sm-12 text-center">
					  		<button class="btn btn-primary btn-lg text-center" type="submit">Consultar</button>
					  	</div>


					</form>
	            </div>
	        </div>
	    </div>
    
</body>
</html>
<%
Set Rs = Nothing
Set Rs1 = Nothing
Set Rs2 = Nothing
Set Rs3 = Nothing
Set Cn = Nothing
%>
