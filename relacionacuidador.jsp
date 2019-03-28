<html>
<%@page language="Java" import="java.sql.*" %>    
<%@page language="Java" import="javax.swing.*" %>
<%@page language="Java" import="java.util.*" %>
<%@page language="Java" import="database.BancoCuidador"%>
<head>
	<title>relaciona</title>
</head>

       <%-- comentario em JSP aqui: nossa primeira p gina JSP --%>

       <%
        String xnome="";	
        String num = request.getParameter("escolhecuidador");
        Integer xid = Integer.parseInt(num);
	    try
    	{
		if(BancoCuidador.procurar(xid))
			{
				xid=BancoCuidador.getId();
			    xnome=BancoCuidador.getNome();
			}
		BancoCuidador.disconnect();
      	}//try
    	catch(Exception e)
    	{
    		out.println("ERRO="+e);
    		
    	}//catch
 	
	%>

<head>
<link rel="icon" href="imagens/jogador.png" type="image/png" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:: Alterar / Excluir::</title>
</head>
<center>


<form action="alteraexcluicuidador.jsp" method="post">
<b>-- Alterar / Excluir ----</b>


	<table width="200" border="0" align="center">
	<tr>
		<td height="40">id:</td>
		<td><input type="text" name="id" value="<%out.print(xid);%>" />
		</td>
		
	</tr>
	<tr>
		<td height="40">nome:</td>
		<td><input type="text" name="nome" value="<%out.print(xnome);%>"/>
		</td>
       
	</tr>
	</table>

	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<label for="altera">
 	<input type="radio" id="altera" name="altexc" value="alterar" checked="true"> Alterar
 	<label for="exclui">
	<input type="radio" id="exclui" name="altexc" value="excluir"> Excluir

</font>&nbsp;&nbsp;&nbsp;
<input type="submit" name="teste" value="Enviar" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
<br>

</form>

</center>

</body>
</html>