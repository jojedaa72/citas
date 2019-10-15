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


entrada = Request.form("entrada")

sqls = "select ds_curso, ds_seccion, nombre, rifa, st_rifa, st_asistencia, st_devueltos, id_familia "
sqls = sqls & "from  conducta "
sqls = sqls & " where rifa = '" & entrada & "'  "
Rs.Open sqls, Cn

if not rs.eof then
usuario1 = rs(7)
else 
usuario1 = ""
end if

Sql = "select id_person from usuario where ds_usuario =  '" & usuario1 & "' "
Rs1.Open Sql, Cn

'Response.write sqls
'response.end
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

<script language=javascript> 
function ventanaChica(codalum, Usuario, Usuario1){ 
   window.open("", "ventana1","width=488, height=540, top=53, left=60, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no") 
   frmAlumnos.codalum.value    = codalum;
   frmAlumnos.Usuario.value    = Usuario;
   frmAlumnos.Usuario1.value    = Usuario1;
   frmAlumnos.action = "consulta.adsp";
   frmAlumnos.target = "ventana1";
   frmAlumnos.submit();
} 

</script>
</head>
<body>
	<div class="container-fluid">
	  <div class="row">
			<div class="col-md-12">
      <br/>
        <form name="frmAlumnos" class="form-inline" method="POST" action="grabacontrol.asp">
          <div class="form-group form-group-lg">
            <label for="exampleInputName2">Name</label>
            <input type="text" class="form-control" name="entrada" id="exampleInputName2" placeholder="Número de rifa / Nombre" autofocus>
          </div>
          <button type="submit" class="btn btn-lg btn-primary">Enviar</button>
        </form>
        <br/>
        <table class="table table-sm table-dark">
          <tbody>
            <tr>
              <th>Nro</th>
        			<th>Grado</th>
        			<th>Secc.</th>
        	    <th>Nombre</th> 
        			<th>Nro Rifa</th>
        			<th >Estado</th>
              <th >Asistencia</th>
            </tr>
              <% cant = 1
              Do Until Rs.EOF %>
              <% If rs(3) >= "000100" and  rs(3) <= "011100" then %>
                <tr bgcolor="#8489ed">
                  <td><h3><%= cant %></h3></td>
                  <td><h3><%= Rs(0) %></h3></td>
                  <td><h3><%= Rs(1) %></h3></td>
                  <td><h3><%= Rs(2) %></h3></td>
                  <td><h3><%= Rs(3) %></h3></td>

                <% If rs(3) >= "000100" and  rs(3) <= "007494" then %>
                    <% If rs(4)= "1" Then %>
                        <td><h3><span class="label label-success">AUTORIZADO</span></h3></td>
                      <% Else %>
                        <td>
                          <input type="button"  onclick="window.location.replace('grabanuevo.asp?entrada=<%= Rs(3) %>')" ><span class="glyphicon glyphicon-barcode"></span></button>
                          <h2><span class="label label-danger" > NO PAGADA </span></h2>
                        </td>
                    <% End If %>

                    <% If Rs(5) = "1" Then %>
                         <td><h1><span class="glyphicon glyphicon-ok" style="color:green"></span></h1></td>
                      <% Else %>
                         <td><h1><span class="glyphicon glyphicon-remove" style="color:red"></span></h1></td>
                    <% End If %> 

                  </tr>

                    <% If rs(4) = "1" Then %>
                        <tr><td colspan="7"><a href="consulta.asp?usuario1=<%= Rs(7)%>&usuario=<%= Rs1(0)%>">Consulta de rifas</a></td></tr>
                    <% Else %>
                        <tr><td colspan="7">&nbsp;</td></tr>
                        <tr><td colspan="7">&nbsp;</td></tr>
                        <tr><td colspan="7">&nbsp;</td></tr>
                        <tr><td colspan="7"><a href="consulta.asp?usuario1=<%= Rs(7)%>&usuario=<%= Rs1(0)%>">Consulta de rifas</a></td></tr>
                        <tr bgcolor="#ed8484"><td colspan="7"  ALIGN="left"><h1>Falta pagar</h1></td></tr>
                    <% End If %>
                  <% Else %>
                        <td><h3><span class="label label-success">AUTORIZADO</span></h3></td>
                        <td><h1><span class="glyphicon glyphicon-ok" style="color:green"></span></h1></td>
                    </tr>
                <% End If %>

              <% Else %>  
                <tr bgcolor="#ed8484">
                  <td><h3><%= cant %></h3></td>
                  <td><h3><%= Rs(0) %></h3></td>
                  <td><h3><%= Rs(1) %></h3></td>
                  <td><h3><%= Rs(2) %></h3></td>
                  <td><h3><%= Rs(3) %></h3></td>
                  <td><h2><span class="label label-success">AUTORIZADO</span></h2></td>
                  <% If Rs(5) = "1" Then %>
                       <td><h1><span class="glyphicon glyphicon-ok" style="color:green"></span></h1></td>
                    <% Else %>
                       <td><h1><span class="glyphicon glyphicon-remove" style="color:red"></span></h1></td>
                  <% End If %> 
                </tr>
              <% End If %> 
              <%
              cant = cant + 1
              Rs.MoveNext  
              Loop
              Rs.Close
              Cn.Close
              Set Rs = Nothing
              Set Cn = Nothing%>
        </table>
			</div>
		</div>
	</div>
</body>
</html>