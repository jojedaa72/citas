<!-- #include file="../includes/conn.inc" -->

<%
Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Cn.Open CadenaConexion
a = 0



Sql = "select DAY(fecha) AS PEPE, COUNT(DAY(FECHA)) from reserva where not ds_familia = 'DIRECCION' GROUP BY DAY(fecha) "
Rs.Open Sql, Cn


sSql = "select DAY(fecha) AS PEPE, COUNT(DAY(FECHA)) from reserva1 where not ds_familia = 'DIRECCION' GROUP BY DAY(fecha)"
Rs1.Open sSql, Cn
%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>

</head>
<body>
	<TABLE border='1' cellpadding = '4' cellspacing = '2'>
		<TR>
			<th>Día</th>
			<th>Cantidad</th>
		</TR>
		<% do while not rs.eof 
		a = a + 1 %>
			<TR>
				<td style=" font-family: sans-serif;" width="50"><%= Rs(0) %></td>
				<td style=" font-family: sans-serif;" width="300"><%= Rs(1) %></td>
				<% rs.movenext 
				loop
				rs.close %>
			</TR>
		<% rs.movenext
		loop
		<% rs.close %>
	</TABLE>
	<br>
	<TABLE border='1' cellpadding = '4' cellspacing = '2'>
		<TR>
			<th>Día</th>
			<th>Cantidad</th>
		</TR>
		<% do while not rs1.eof 
		a = a + 1 %>
			<TR>
				<td style=" font-family: sans-serif;" width="50"><%= Rs1(0) %></td>
				<td style=" font-family: sans-serif;" width="300"><%= Rs1(1) %></td>
				<% rs1.movenext %>
				loop
				<% rs1.close %>
			</TR>
		<% rs1.movenext
		loop
		rs1.close %>
	</TABLE>
</body>
</html>
