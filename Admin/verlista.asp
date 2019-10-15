<%@ language="vbscript" codepage="65001" %>
<%
Response.CharSet = "utf-8"
%><!-- #INCLUDES FILE="../includes/conn.inc" -->


<% 
Response.Expires = 0
Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Cn.Open CadenaConexion


selhora = Request("c_hora")
selfecha = Request("c_fecha")

sSql = "select * from persona  where fechacita = '" & selfecha & "' and horacita = '" & selhora & "' order by st_repro desc  "
Rs.Open sSql, Cn 


%>	


<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Venta</title>
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

<div class="container-fluid">
	<div class="row">
		<div  class="col-sm-6 col-md-6 col-md-offset-3 col-sm-offset-3">
						<div class="table-responsive">
							<table class="table table border=1">
                                 <tr>
                                     <th>Nro</th>
                                     <th>Familia</th>
                                     <th>Fecha</th>
                                     <th>Hora</th>
                                     <th>citado</th>
                                 </tr>
                              <% 
                              a = 0
                              Do Until Rs.EOF 
                              a = a + 1 %>
                              <tr>

                                 <td><%= a %></td>
                                 <td><%= Rs(2)%></td>
                                 <td><%= Rs("fechacita")%></td>
                                 <td><%= Rs("horacita")%></td>
                                 <% if rs("citado") = 1 Then %>
                                 <td>Si</td>
                                 <%End If%>



                              </tr><%
                                ' End If
                                 Rs.MoveNext
                              Loop
                              Rs.Close %>
                           </table>
                       </div>
		</div>
	</div>
</div>
	
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
Set Rs4 = Nothing
Set Rs1 = Nothing
Set Cn = Nothing
%>