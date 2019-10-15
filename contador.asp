<!-- #INCLUDES FILE="includes/conn.inc" --><% 
Dim Cn, Rs, alum, cant, c_seccion, c_bimestre
Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Set Rs3 = Server.CreateObject("ADODB.Recordset")
Set Rs4 = Server.CreateObject("ADODB.Recordset")
Set Rs5 = Server.CreateObject("ADODB.Recordset")
Cn.Open CadenaConexion 

  SQL = "SELECT nu_intfall, id_person from USUARIO WHERE ID_PERSON = '" & PROFESOR & "'  "
	Rs1.Open SQL, Cn

	alum = "select ds_altacurso, ds_seccion,tutor, cant_alum, cant_rifas,cant_vendidas, ROUND( ((cant_vendidas * 100)/cant_rifas),2) as pepe "
	alum = alum & "from  estadistica order by pepe desc "
	Rs.Open alum, Cn

  Sqls = "select count(st_rifa) from conducta where st_rifa = '1' "
	Rs2.Open Sqls, Cn

 Sqls = "SELECT count(st_asistencia) FROM CONDUCTA WHERE st_asistencia = '1' AND RIFA BETWEEN '000100' AND '007494'"
  Rs3.Open Sqls, Cn

   Sqls = "SELECT count(st_asistencia) FROM CONDUCTA WHERE st_asistencia = '1' AND RIFA BETWEEN '007495' AND '011099'"
  Rs4.Open Sqls, Cn

   Sqls = "SELECT count(st_asistencia) FROM CONDUCTA WHERE st_asistencia = '1' AND RIFA BETWEEN '011100' AND '015100' "
  Rs5.Open Sqls, Cn


%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
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
</head>

</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-md-12"> 

    <ul class="list-group">
      <li class="list-group-item"><span class="badge"><%= Rs3(0) %></span>Familias</li>
      <li class="list-group-item"><span class="badge"><%= Rs4(0) %></span>Ventas</li>
      <li class="list-group-item"><span class="badge"><%= Rs5(0) %></span>Cortesia</li>
</ul>

      <table class="table">
        <tr>
          <td colspan="7" align="center"><h4> ** TOTAL DE ENTRADAS VENDIDAS :  <%= Rs2(0) %> ** </h4></td>
        </tr>
        <tr>
    			<th>Grado</th>
    			<th>Secc.</th>
    	    <th>Tutor</th> 
    			<th>Cant. Alum.</th>
    			<th>Cant. Rifas.</th>
    			<th>Rifas Vendidas</th>
    			<th>Porcentaje<br>Rifa Vendidas</th>
        </tr>
      <% cant = 1
 
      Do Until Rs.EOF %>
        <tr>
          <td><%= Rs(0) %></td>
          <td><%= Rs(1) %></td>
          <td><%= Rs(2) %></td>
          <td><%= Rs(3) %></td>
          <td><%= Rs(4) %></td>
          <% If Rs(5) < "0" then %> <td></td> <% Else %> <td><strong><%= Rs(5) %></strong></td> <% End If%>
          <% If Rs(6) < "0" then %> <td></td> <% Else %> <td><strong><%= Rs(6) %>&nbsp;%</strong></td> <% End If%>
        </tr><%
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