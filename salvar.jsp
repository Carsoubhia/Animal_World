
<%@page language="Java" import="java.sql.*" %>    
<%@page language="Java" import="javax.swing.*" %>
<%@page language="Java" import="database.BancoCuidador"%>

<html>

<body background="unesp.jpg">
       <%-- coment�rio em JSP aqui: nossa primeira p�gina JSP --%>
       <%
		String cuidadorNome = request.getParameter("cuidadornome");
		
		JOptionPane.showMessageDialog(null,"ok"+cuidadorNome);

		BancoCuidador.setNome(cuidadorNome);
          BancoCuidador.connect();
		BancoCuidador.incluir();
          BancoCuidador.disconnect();
         %>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<form action="cadastrar.html" method="get">

<font color="#000">
<b><n> -- Cadastrar novos  ------------------------------------------------------</n></b>
<br>
<br>
<br>
<font color="#FF0000" style='font-weight:bold;'>
Dados do <% out.print(cuidadorNome);  %> adicionados com sucesso! <input 

type="submit" name="teste" value="Continuar Cadastrando >" align="top" /><br>


<br>
<br>
<br>
<br>
<br>
<br>
</form>

</center>

</body>
</html>