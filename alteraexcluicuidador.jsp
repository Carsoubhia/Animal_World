<html>

<body background="urso.png" style="background-color:#594E36">
<%@page language="Java" import="java.sql.*" %>    
<%@page language="Java" import="javax.swing.*" %>
<%@page language="Java" import="java.util.*" %>
<%@page language="Java" import="database.BancoCuidador"%>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:: Alterar / Excluir::</title>
</head>

<center>
<form action="alteracuidador.jsp" method="get">
<b><n> ------------------------------------------------------ Cadastrar  ------------------------------------------------------</n></b>
<br>
<br>
<br>
<br>
<br>
<br>
			<font color="#FF0000" style='font-weight:bold;'>
			<%

   			String id = request.getParameter("id");
   			String nome = request.getParameter("nome");
   			String altexc = request.getParameter("altexc");

        	BancoCuidador fsql=new BancoCuidador();
			fsql.connect();
			if(altexc.equals("excluir")){
				fsql.setId(id);
				fsql.excluir();
			
			out.println("\n Dados " + id + " Excluidos com sucesso !");
   			
			}else
			{
				fsql.setNome(nome);
			    fsql.alterar();		
			out.println("\n Dados " + id + " Alterados com sucesso !");
   				
			}
      			
				 
			%>
 <input type="submit" name="teste" value="Continuar Alterando ou Excluindo >" align="top" /><br>

<br>
<br>

</form>

</center>
</body>
</html>