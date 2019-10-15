<%@ language="vbscript" codepage="65001" %>
<%
Response.CharSet = "utf-8"
%>
<!-- #include file="includes/conn.inc" -->

<%
Set Rs = Server.CreateObject("ADODB.Recordset")
Set Cn = Server.CreateObject("ADODB.Connection")
Cn.Open CadenaConexion

entrada = Request.form("entrada")

sqls = "select ds_curso, ds_seccion, nombre, rifa, st_rifa, st_asistencia, st_devueltos "
sqls = sqls & "from  conducta "
sqls = sqls & " where rifa = '" & entrada & "'  "
Rs.Open sqls, Cn


If rs(3) >= "000100" and  rs(3) <= "007494" then 

  If rs(4)= "1" Then 
		Sql = "UPDATE conducta  SET st_asistencia = '1', fecasis = getdate() "	
		Sql = Sql & "where rifa =  '" & entrada & "' " 
	  Cn.Execute(Sql) 
	Else
		Sql = "UPDATE conducta  SET st_asistencia = NULL "	
		Sql = Sql & "where rifa =  '" & entrada & "' " 
	  Cn.Execute(Sql) 
	End If
Else
	Sql = "UPDATE conducta  SET st_asistencia = '1', fecasis = getdate()  "	
	Sql = Sql & "where rifa =  '" & entrada & "' " 
  Cn.Execute(Sql) 
End If
Cn.Close
%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<script>
	function redirect(){
	   frmcurso.submit();
	}
	</script>
	</head>

	<body class="textobody" onload="redirect()">
			<form name="frmcurso" method="post" action="control.asp">
			<!-- Campos tipo HIDDEN -->
			<input type="hidden" name="entrada" value= <%=entrada%>>
			<!-- Campos tipo HIDDEN -->
		</form>
	</body>
</html>

<%
Set Rs = Nothing
Set Cn = Nothing
%>

