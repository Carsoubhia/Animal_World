<%@page language="Java" import="java.sql.*" %>    
<%@page language="Java" import="javax.swing.*" %>
<%@page language="Java" import="database.BancoAnimal"%>
<%@page language="Java" import="java.util.*" %>

<html>
       <%-- comentario em JSP aqui: nossa primeira p�gina JSP --%>
<head>
<link rel="icon" href="urso.png" type="image/png" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:: Alterar / Excluir::</title>
</head>
<center>
<form action="relaciona.jsp" method="get">
<font color="#000">
<b>------------------------------------------------------ Alterar / Excluir ------------------------------------------------------</b>

<br>
<br>

Selecione o Id a ser alterada:
<select name="escolheId">
    <%
	String xid,xnome,xespecie, xidade, xalimentacao, xtipo_jaula,xcuidador,ximagem;
	try{
        		
		ArrayList dados=new ArrayList();
		
         dados=BancoAnimal.getAll();
		 BancoAnimal.disconnect();
        if(!dados.isEmpty())
		{	
		for(int j=0; j<dados.size();j++)
    		   	{
				 xid=""+dados.get(j); j++;
                 xcuidador=""+dados.get(j);j++;
				 xnome=""+dados.get(j); j++;
                 ximagem=""+dados.get(j); j++;
                 xidade=""+dados.get(j); j++; 
                 xalimentacao=""+dados.get(j); j++;
                 xtipo_jaula=""+dados.get(j); j++;
                 xespecie=""+dados.get(j);
    	%>	        
    		   		
	<br>
	<option size="20dp" value="<%out.print(xid);%>" name="nome"><%out.print(xid+" - "+xnome);%>
	</option>

	<%
    		}//for
    	}//if
    		 else
    		 {
    		       out.println("tabela vazia");
    		 }
        }//try
    	catch(Exception e)
    	{
    		out.println("ERRO="+e);
    		
    	}//catch		 
    %>
</select>


</font>&nbsp;&nbsp;&nbsp;
<input type="submit" name="teste" value="Enviar" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
<br>
<br>

</form>

</center>
</body>
</html>