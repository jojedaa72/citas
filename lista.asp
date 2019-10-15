<%@ language="vbscript" codepage="65001" %>
<%
Response.CharSet = "utf-8"
%>
<!-- #INCLUDES FILE="includes/conn.inc" --><% 

Dim Cn, Rs, alum, cant, c_seccion, c_bimestre
Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Cn.Open CadenaConexion 

Profesor   = Session("codigo")
c_bimestre = Request.form("selBimestre")
c_Ano      = Request.form("selAno")
c_seccion  = Request.form("selseccion")
c_asigna   = Request.form("selAsigna")

   '' SQL = "SELECT nu_intfall, id_person from USUARIO WHERE ID_PERSON = '" & PROFESOR & "'  "
	'Rs1.Open SQL, Cn

	alum = "select distinct(id_persona), id_altacurso,ds_curso,id_seccion,ds_seccion,nombre, st_condicion, st_usuario, fecha "
	alum = alum & "from  conducta   where rifa between '000100' and '007494' "
	'alum = alum & "where id_altacurso = '" & c_Ano & "' and id_seccion = '" & c_seccion & "'"
	alum = alum & "order by ds_curso,ds_seccion,nombre "
	Rs.Open alum, Cn
	
	response.write alum
	'response.end

	
	%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Document</title>

<STYLE>
body
{
scrollbar-face-color: #ffffff;
scrollbar-arrow-color: #000000;
scrollbar-highlight-color: #ffffff;
scrollbar-3dlight-color: #3B73AC;
scrollbar-shadow-color: #3B73AC;
scrollbar-darkshadow-color: #3B73AC;
scrollbar-track-color: #ffffff;
}
.cabecera  {font: bold   11px Arial;   color: #FFFFFF;}
.normal    {font: normal 11px Verdana; color: #666666;}
.red       {font: normal 11px Verdana; color: #CC0000;}
.auto-style1 {
	text-align: center;
}
</STYLE>
<script language=javascript> 
function ventanaChica(codalum, c_Ano, c_seccion, c_asigna, c_bimestre){ 
   window.open("", "ventana1","width=488, height=590, top=53, left=60, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no") 
   frmAlumnos.codalum.value    = codalum;
   frmAlumnos.c_Ano.value      = c_Ano;
   frmAlumnos.c_seccion.value  = c_seccion;
   frmAlumnos.c_asigna.value   = c_asigna;
   frmAlumnos.c_bimestre.value = c_bimestre;
   frmAlumnos.action = "ingrenotaCon.asp";
   frmAlumnos.target = "ventana1";
   frmAlumnos.submit();
} 
function ventananew(codalum){ 
   window.open("", "ventana2","width=668, height=165, top=53, left=60, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no") 
   frmAlumnos.codalum.value    = codalum;
   frmAlumnos.action = "NotaDocente.asp";
   frmAlumnos.target = "ventana2";
   frmAlumnos.submit();
}

function ventanagrande (URL){ 
   window.open(URL,"ventana1","width=640, height=280, top=20, left=90, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no") 
} 
</script>
</head>
<body text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0 marginheight="0" marginwidth="0" background="fondo_derecha.gif" rightmargin="0" vlink="#0066cc" alink="#ff0000" >
<form name="frmAlumnos" method="post">
<input type="hidden" name="codalum">
<input type="hidden" name="c_Ano">
<input type="hidden" name="c_seccion">
<input type="hidden" name="c_asigna">
<input type="hidden" name="c_bimestre" style="WIDTH: 169px; HEIGHT: 22px" size=21>
<TABLE class="textosup" border=0 cellPadding=0 cellSpacing=0 height=21>
  <TR>
    <TD height=21>
   <b><font face="Arial, Helvetica, sans-serif" size="4"></font></b><FONT 
      face="Arial, Helvetica, sans-serif" size=4><B> Alumnos Alpamayo:</B></FONT></TD></TR></TABLE>
<HR color=#ff0000 width="100%">
<table border="0" width="100%">
  <tr>
    <td>
      <table align="center" border="0" width="527" cellpadding="0" style="WIDTH: 527px; HEIGHT: 20px">
        <tr>
          <td align="right" width="86"><font size="2" face="Arial" color="#000099">Grado :</font></td>
          <td width="209"><font size="2" face="Arial Narrow" color="#ff0000"><%= UCase(Rs(1))%></font></td>
          <td width="92"><font size="2" face="Arial" color="#000099">Seccion :</font></td>
          <td width="92"><font size="2" face="Arial Narrow" color="#ff0000"><%=Rs(4)%></font></td>
          <td width="92">&nbsp;</td>
          <td width="204"><font size="2" face="Arial Narrow" color="#ff0000"><% = Response.Write(c_bimestre) %></font></td>
        </tr>
        </table>
      <table class="normal" align=center border=1 cellpadding=1 cellspacing=2 bordercolordark="#e4e8f7" bordercolorlight="#c0c0c0" style="WIDTH: 924px; HEIGHT: 46px">
        <TBODY>
		<tr class="cabecera" bgcolor=#0066cc>
			<th width=11>Nro.</th>
			<th width=11>Grado</th>
			<th width=11>Seccion</th>

			<th width=350>Apellidos y Nombres</th>
			<th width=5 bgcolor="#ffffff"></td>
			<th width=20 colspan="15" bgcolor="#0066cc" class="auto-style1">15 RIFAS X FAMILIA</th>

         </tr><%
      cant = 1
 
      Do Until Rs.EOF %>
         <tr>
           <td align=middle><%= cant %></td>
           <td width=350><%= Rs(2) %></td>
           <td width=350><%= Rs(4) %></td>
           <td width=350><%= Rs(5) %></td>
           <td width="5"></td>
           
	        <% pepe = Rs(0)
    			sSql = "select rifa,st_rifa   from  conducta where  id_persona = '" & pepe & "' "
    			sSql = sSql & "order by cast(rifa as int) "
    			Rs2.Open sSql , Cn  
            Do Until Rs2.EOF
               If Rs2(1)= "1" Then %>
	               <td width="20" bgcolor="yellow"><strong><%= Rs2(0) %></strong></td>
	               <% Else %>
	               <td width="20"><font size="2" face="Arial Narrow" color="#afb7ae"><%= Rs2(0) %></font></td>
	           <% End If
            Rs2.MoveNext  
            Loop
            Rs2.Close %>
           <% If trim(Rs(6)) = "Efectivo" Then %>
              <td bgcolor="GreenYellow" align="center" ><b> <%= Rs(6) %> </b></td>
            <% End If %>
           <% If trim(Rs(6)) = "Credito" Then %>
              <td bgcolor="Coral" align="center" ><b> <%= Rs(6) %> </b></td>
            <% End If %>

           <% If trim(Rs(6)) = "Anulado" Then %>
              <td bgcolor="Crimson" align="center" ><b> <%= Rs(6) %> </b></td>
            <% End If %>
           <% If trim(Rs(6)) = "Devuelto" Then %>
              <td bgcolor="red" align="center" ><b> <%= Rs(6) %> </b></td>
            <% End If %>

          <td align="center" ><b> <%= Rs(7) %> </b></td>

          <td align="center" ><b> <%= Rs(8) %> </b></td>



         </tr><%
         

               
         
         cant = cant + 1
         
 
      Rs.MoveNext  
      Loop
      Rs.Close
      Cn.Close
      Set Rs = Nothing
      Set Cn = Nothing%>
      </table></TD></TR></TBODY></TABLE>
</form>
</body>
</html>
