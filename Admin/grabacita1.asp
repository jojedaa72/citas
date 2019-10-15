<%@ language="vbscript" codepage="65001" %>
<%
Response.CharSet = "utf-8"
%>
<!-- #include file="../includes/conn.inc" -->

<% 
If Session("perfil") = "" Then
   Response.Redirect("../default.asp")
End If

Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Set Rs3 = Server.CreateObject("ADODB.Recordset")
Set Cnnu = Server.CreateObject("ADODB.Connection")
Cnnu.Open CadenaConexion

Usuario      = Session("usuario")
Usuario1     = Session("usuario1")
nombre       =  Session("nombre")
c_rifa       = Request("entrada")
c_condicion  = Request("condicion")
colabora     = Request("colabora")
entrada      = Request("")


If c_rifa <> "" Then
	ssql = "UPDATE conducta SET st_rifa ='1' , st_condicion = '" & c_condicion & "' , st_usuario = '" & usuario1 & "' ,fecha = getdate() "
	ssql = ssql & " where id_persona = '" & usuario1& "' and  rifa in (" & c_rifa & ") " 
	Cnnu.Execute(ssql)


'	ssql = "UPDATE conducta SET st_rifa =NULL , st_usuario = '" & usuario & "',  fecha= getdate() "
'	ssql = ssql & " where id_persona = '" & alumno& "' and not rifa in (" & c_rifa & ")  " 
'	Cnnu.Execute(ssql)
 
'	ssql = "UPDATE conducta SET st_condicion = '" & c_condicion & "' ,  st_usuario = '" & usuario1 & "'  , fecha= getdate() "
''	ssql = ssql & " where id_persona = '" & usuario1& "'  " 
''	Cnnu.Execute(ssql)
Else
	'ssql = "UPDATE conducta SET st_rifa ='' , st_usuario = '" & usuario & "' , fecha= getdate() "
	'ssql = ssql & " where id_persona = '" & alumno& "' " 
	'Cnnu.Execute(ssql)

End If


Sql = "select * from persona where id_persona =  '" & Usuario & "' "
Rs.Open Sql, Cnnu

sqls = "select id_altacurso,ds_curso,id_persona,id_seccion,ds_seccion,nombre, "
sqls = sqls & "RIFA, ST_RIFA "
sqls = sqls & "from  conducta "
sqls = sqls & " where id_persona = '" & Usuario1 & "'  order by cast(rifa as int) "
Rs1.Open sqls, Cnnu   

sqqls = "select id_altacurso,ds_curso,id_persona,id_seccion,ds_seccion,nombre, "
sqqls = sqqls & "RIFA, ST_RIFA "
sqqls = sqqls & "from  conducta "
sqqls = sqqls & " where id_persona = '" & Usuario1 & "'  and ST_RIFA = '1'  order by cast(rifa as int) "
Rs2.Open sqqls, Cnnu 


sqqlas = "select count(ST_RIFA),id_altacurso, id_seccion "
sqqlas = sqqlas & "from  conducta "
sqqlas = sqqlas & " where id_persona = '" & Usuario1 & "'  and ST_RIFA = '1' group by ST_RIFA,id_altacurso, id_seccion "
Rs3.Open sqqlas, Cnnu 

c_ano		  = rs3(1)
c_seccion = rs3(2)

tssql = "update estadistica set cant_vendidas = (select sum(CAST(st_rifa AS int)) from conducta where id_altacurso = '" & c_ano & "' and id_seccion = '"& c_seccion &"') "
tssql = tssql & " where id_altacurso = '" & c_ano & "' and id_seccion = '"& c_seccion &"' "
Cnnu.Execute(tssql) %>

<!DOCTYPE html>
<html>

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
	<script
        src="http://code.jquery.com/jquery-3.2.1.slim.min.js"
        crossorigin="anonymous">
    </script>
  	<!-- Cargamos nuesto archivo Java Script-->
	<script type="text/javascript" src="functions.js"></script>
	<!-- Cargamos la fuente de Google Raleway : visitar Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">
	<!-- Cargamos nuestra hoja de estilos -->
	<link rel="stylesheet" href="../css/styles.css">

<script>
/* Bloquea el boton derecho del mouse */
 document.oncontextmenu = function(){return false} 

function redirect(){
  frmNotas.submit();
}


/* Anula el botón retroceder del navegador */
$(document).ready(function(){
 
  window.onhashchange = function(){
    if (typeof (window.stop) != 'undefined')
      window.stop();
    if (typeof (document.execCommand) != 'undefined')
      document.execCommand('Stop');
 
    if (document.location.hash.length < 10)
      history.go(1);
  };
   /* Push 10 History */
  document.location += "#";
  for(i = 0; i < 10; i++)
    document.location += "@";
});
</script>

</head>

	<BODY>
	<div class="container">
	    <div class="row">
		    <div class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
				<div class="alert alert-info" role="alert">
				   <h2 class="text-center" >Seleción de rifas Family Fun Day 2019 -  Alpamayo</h2>
				</div>
		    </div>

  			<div style="height: 50px;" class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
  				<label control-label">Familia :   <%= ucase(Rs("ds_apellidos")) %></label>
  			</div>
			
  			<div style="height: 50px;" class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
  				<label control-label">Usted colaboró con <strong>( <%= rs3(0)%> )</strong> rifas(s): </label>
  			</div>

        <div style="height: 50px;" class="col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">
          <label control-label">Por favor, separe las rifas seleccionadas, recuerde que para ingresar al Family Fun Day deberá mostrar la(s) rifa(s) que seleccionó, el ingreso será solo por la puerta 4.</label>
        </div>
        <br>

<div class="table-responsive col-sm-8 col-md-8 col-md-offset-2 col-sm-offset-2">       
			
	<table  class="table table-bordered">
			<tr><th colspan="3">Rifas(s) seleccionada(s)</th></tr>
			<% Do Until Rs2.EOF %>

             <tr>
               <td align="center"><h2><span class="label label-success">  <%= Rs2("RIFA") %> </span>  </h2><br></td><%
               Rs2.MoveNext
               If Rs2.EOF Then
                  Exit Do
               End If%>
               <td align="center"><h2><span class="label label-success"><%= Rs2("RIFA") %></span> </h2></td>
			   <% Rs2.MoveNext
               If Rs2.EOF Then
                  Exit Do
               End If%>
               <td align="center"><h2><span class="label label-success"><%= Rs2("RIFA") %></span></h2></td>               
             </tr>
             <% Rs2.MoveNext
            Loop %>
           </table>


		</div>

    <div class="col-sm-12 text-center">
  	<a class="btn btn-default btn-danger btn-lg" href="../ingreso/salir.asp" role="button">Salir</a>
  	</div>
	</div>
</div>
	</BODY>

</html>
<%
Set Rs = Nothing
Set Rs3 = Nothing
Set Cn = Nothing
%>