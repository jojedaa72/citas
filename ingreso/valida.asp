<!-- #include file="../includes/conn.inc" -->
<%
activo = "A"

Session("strMsg") =""

strUsr = Replace(Request.Form("txtUsr"), "'", "")
strUsr = Replace(strUsr, chr(34), "")
strPsw = Request.Form("sclave2")


Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Rs2 = Server.CreateObject("ADODB.Recordset")

Cn.Open CadenaConexion

On Error Resume Next


Sqlingreso = "select id_person, ds_usuario from usuario where ds_usuario = '" & strUsr & "' and ds_clave = '" & strPsw & "' and st_estado = '" & activo & "'"
Rs.Open Sqlingreso, Cn

response.write Sqlingreso





If Err.number<>0 Then 
      Session("strMsg") = "Usuario o clave incorrecto."

      Response.Redirect("../default.asp")
      Err.Clear
      Response.end
End If

idpersona = rs(0)
preceptor = rs(1)


If idpersona  = "" Then
   response.write "Usuario no existe"

   Session("strMsg") = "Usuario o clave incorrecto!"
   Response.Redirect("../default.asp")
Else


SQLPersona= "SELECT g.ds_abrgradomil, p.ds_nombres, p.ds_apellidos, p.st_rolvir, p.ds_sexo, p.st_repro, p.st_nivel, substring (p.st_nivel,1,1) "
SQLPersona=SQLPersona&" FROM PERSONA as p, GRADOMIL as g, DETAMILITAR as d "
SQLPersona=SQLPersona&" WHERE p.id_persona = '" & idpersona & "' AND d.id_gradomil = g.id_gradomil AND p.id_persona = d.id_persona"
 Rs1.Open SQLPersona, Cn 

 response.write SQLPersona
 'response.end

rolvir = Rs1(3)
  
  If Rs1(4)= "M" Then
    'Session("saludo") = "Bienvenido " & Rs1(1) & " " & Rs1(2)    
    Session("saludo") = " Bienvenido "
    Session("nombre") = " " & Rs1(1) & " " & Rs1(2) 
  Else
    If cod_usuario="00274" Then
      Session("saludo") = "Bienvenida " & Rs1(1) & " " & Rs1(2)
    Else
    Session("saludo") = " Bienvenida "
    Session("nombre") = " " & Rs1(1) & " " & Rs1(2) 
    End If
  End If

ipvisita = Request.ServerVariables("REMOTE_ADDR") 
  
SQLvisita = "insert into controlvisita(fe_horaing, id_person, ip_visita)values(getdate(), '"& idpersona &"', '" & ipvisita & "')"
Cn.Execute(SQLvisita)



SQLsesvisita = "select top 1 id_visita from controlvisita where id_person = '" & idpersona & "' order by fe_horaing desc"

Rsvisita.Open SQLsesvisita, Cn  

  Session("usuario") = Rs(0)
  Session("usuario1") = Rs(1)

  Session("codigo") = idpersona
  Session("preceptor") = preceptor
  Session("perfil") = Rs1(3)      'Cual es el Rol Virtual del Usuario
  Session("repro") = Rs1(5)
  Session("tutor") = Rs1(6)
  Session("nivel") = Rs1(7)
  Session("nombre") = Rs1(2)

    Session("codvisita") = Rsvisita(0)
  Session("ventanaFlotante") = "0"

  
  If Rs1(3) = "A" Then
  
    SQLstmatri = "select id_altacurso from matricurso "
    SQLstmatri = SQLstmatri & "where id_persona = '" & idpersona & "' "
    SQLstmatri = SQLstmatri & "and st_matricula = 'A'"
  
    Rsmatri.Open SQLPersona, Cn 
  Session("altacurso") = Rsmatri(0)
  
  Else
  
  Session("altacurso") = "00000"
  
  End If

  Set Session("strMsg") = Nothing
  Rs.Close
  Rs1.Close
  Rsmatri.Close
  Rsvisita.close
  Cn.Close
  Set Rs = Nothing  
  Set Rs1 = Nothing 
  Set Rsmatri = Nothing
  Set Rsvisita  = Nothing
  Set Cn = Nothing

  Response.Redirect("../admin/menu1.asp")
End If
%>