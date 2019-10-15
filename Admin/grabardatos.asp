<%@ language="vbscript" codepage="65001" %>
<%
Response.CharSet = "utf-8"
%>
<!-- #include file="../includes/conn.inc" -->

<%
Usuario = Session("usuario")

c_apellido   = Request("txtapellido")
c_nombre     = Request("txtnombre")
c_fechanac   = Request("fechanac")
c_tipodoc    = Request("tipodoc")
c_documento  = Request("txtdocumento")
c_direccion  = Request("txtdireccion")
c_refdir     = Request("txtrefdir")
c_distrito   = Request("txtdistrito")
c_celular    = Request("txtcelular")
c_telfijo    = Request("txttelfijo")
c_tiempo     = Request("txttiempo")
c_optradio   = Request("optradio")




Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Set Cn = Server.CreateObject("ADODB.Connection")
Cn.Open CadenaConexion

	Sqls = "UPDATE persona  SET ds_tipodoc = '"& c_tipodoc &"', "
	Sqls = Sqls & "nu_dni	    = '"& c_documento &"', "	
	Sqls = Sqls & "ds_direcc    = '"& c_direccion &"', "
	Sqls = Sqls & "ds_refdir    = '"& c_refdir &"', "
	Sqls = Sqls & "id_distrito  = '"& c_distrito &"', "	
	Sqls = Sqls & "fe_fenac     = '"& c_fechanac &"', "
	Sqls = Sqls & "nu_celular   = '"& c_celular &"', "
	Sqls = Sqls & "nu_telcasa   = '"& c_telfijo &"', "
	Sqls = Sqls & "tiempodir    = '"& c_tiempo &"', "
	Sqls = Sqls & "tipovivienda = '"& c_optradio &"', "
	Sqls = Sqls & "st_repro     = '1' " 
	Sqls = Sqls & "where id_persona =  '" & Usuario & "' "
	Cn.Execute(Sqls)

Cn.Close
%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="refresh" content="5; url=../ingreso/salir.asp">
	<script>
	function redirect(){
	   frmcurso.submit();
	}
	</script>
	</HEAD>
	<BODY class="textobody" >
		<form name="frmcurso" method="post" action="../ingreso/salir.asp">
			<h2>Dados Actualizados Correctamente<h2>
			<h3>Se cerrará en 5 segundos...<h3>
			<!-- Campos tipo HIDDEN -->
			<input type="hidden" name="txtbusca" value= <%=nombre%>>
			<input type="hidden" name="colegio" value= <%=c_colegio%>>
			<input type="hidden" name="grado" value= <%=c_grado%>>
			<input type="hidden" name="seccion" value= <%=c_seccion%>>
			<input type="hidden" name="distrito" value= <%= c_distrito%>>
			<!-- Campos tipo HIDDEN -->
		</form>
	</BODY>
</html>

<%
Set Rs = Nothing
Set Cn = Nothing
%>

