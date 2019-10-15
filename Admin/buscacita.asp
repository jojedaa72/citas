<%@ language="vbscript" codepage="65001" %>
<%
Response.CharSet = "utf-8"
%><!-- #INCLUDES FILE="../includes/conn.inc" -->


<% 
Response.Expires = 0
Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Cn.Open CadenaConexion

ssSql = "select a.codigofamilia, u.ds_clave, a.grado, a.nombrecompleto, a.fechacita, a.horacita, a.citado, a.estadoalumno, a.codalum from alumno2018 a, usuario u where a.codigofamilia = u.ds_usuario"
Rs.Open ssSql, Cn %>	

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Buscador de Citas</title>
	<!-- Optimizar el sitio en dispositivos móviles -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Importar CSS de Bootstrap  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	<!-- Importar Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

	<!-- Importar Funciones JavaScript de Bootstrap -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- Sweet Alert 2 -->
	<script src="https://limonte.github.io/sweetalert2/dist/sweetalert2.min.js"></script>
	<link rel="stylesheet" href="https://limonte.github.io/sweetalert2/dist/sweetalert2.min.css">

	<!-- Datatables -->
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">

<style>
.glyphicon {
    font-size: 25px;
}
</style>
</head>
<body>

<form action="grababuscacita.asp" method="POST" accept-charset="utf-8">



<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
		        <thead>
		            <tr>
		            	<th>Nr.</th>
		                <th>Usuario</th>
		                <th>Clave</th>
		                <th>Grado</th>
		                <th>Apellidos y Nombres</th>
		                <th>Fec_Cita</th>
		                <th>Hora Cita</th>
		                <th>Estado</th>
		            </tr>
		        </thead>
		        <tfoot>
		            <tr>
		            	<th>Nr.</th>
		                <th>Usuario</th>
		                <th>Clave</th>
		                <th>Grado</th>
		                <th>Apellidos y Nombres</th>
		                <th>Fec_Cita</th>
		                <th>Hora Cita</th>
		                <th>Estado</th>
		            </tr>
		        </tfoot>
		        <tbody>
		        	<% Do Until Rs.EOF
		      			a = a + 1 %>
				    <tr>
				    	<td><%= a %></td> 
				    	<td><%= ucase(Rs(0)) %></td>
				        <td><%= Rs(1) %></td>
				        <td><%= ucase(Rs(2)) %></td>
				    	<td><%= ucase(Rs(3)) %></td>
				    	<td><%= ucase(Rs(4)) %></td>
				    	<td><%= ucase(Rs(5)) %></td>
				    	<td class="text-center">
				    		<% If rs(7) = "Matriculado"  then%>
				    			<span class="glyphicon glyphicon-ok" style="color:green"></span>
				    		<% Else %>
				    		      <input type="checkbox" name="matricula" value="<%= Rs(8) %>">
				    		<% end If%>
				    	</td>
				    </tr>
						<% Rs.MoveNext 
					    Loop
					     Rs.Close
				     %>
		        </tbody>
    		</table>
		</div>
	</div>
</div>
<button type="submit" class="btn btn-primary">Matricular</button>
</form>
</body>
	<script type="text/javascript" class="init">
			$(document).ready(function() {
			$('#example').DataTable();
		} );
	</script>
</html>
<%
Cn.Close
Set Rs = Nothing
Set Rs1 = Nothing
Set Cn = Nothing
%>