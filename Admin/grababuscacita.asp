<!-- #INCLUDES FILE="../includes/conn.inc" --><% 
Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Cn.Open CadenaConexion 

c_matricula    = Request("matricula")
c_fecha =  now()


	ssql = "UPDATE alumno2018 SET estadoalumno ='Matriculado' "
	ssql = ssql & " where codalum =  '" & c_matricula & "' "
	Cn.Execute(ssql)


Cn.Close
Set Cn = Nothing
%>
<html>
<head>
<script>
function redirect(){
   frmNotas.submit();
}
</script>
</HEAD>
<BODY class="textobody" onload="redirect()">
<form name="frmNotas" method="post" action="buscacita.asp">
<!-- Campos tipo HIDDEN -->
<input type="hidden" name="selAsigna"   value="<%= c_asigna %>">
<input type="hidden" name="selAno"      value="<%= c_ano %>">
<input type="hidden" name="selseccion"  value="<%= c_seccion %>">
</form>
<!-- Campos tipo HIDDEN -->
</BODY>
</html><%
Set Rs = Nothing
Set Cn = Nothing
%>
