<!-- #include file="../includes/conn.inc" --><%
Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")

Cn.Open CadenaConexion

sSql = "select orden from contador "
Rs.Open sSql, Cn

struser = "I"+Rs("orden") %>

<HTML>
<HEAD>

<style type="text/css">
.auto-style1 {
	text-align: center;
	font-size: x-large;
	font-family: Arial, Helvetica, sans-serif;
	color: #1D0909;
}
.auto-style2 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: x-large;
	color: #FF0000;
}
</style>

</HEAD>
<BODY>
<form action="crear.asp" method="post">  
<table>

	<tr>
		<td class="auto-style1" colspan="2">
			<strong>GRATIS</strong></td>
	</tr>

	<tr>
		<td>
			Nombre de Usuario:  
		</td>
		<td font-size: 22px; class="auto-style2" style="width: 317px">
			<strong>
			<%= struser %> 
			</strong> 
		</td>
	</tr>

	<tr>
		<td>
			Ingresar Apellidos y Nombre:  
		</td>
		<td style="width: 317px">
			<input name="usuario" type="text" value="" style="width: 314px; height: 28px">  
		</td>
	</tr>
</table>
	<input id="enviar" name="Grabar" type="submit" value="Grabar">  
</form>  
</div>  
</BODY>
</HTML>
