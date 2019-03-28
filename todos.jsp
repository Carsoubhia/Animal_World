<%@page language="Java" import="java.sql.*" %>    
<%@page language="Java" import="javax.swing.*" %>
<%@page language="Java" import="database.BancoAnimal"%>
<%@page language="Java" import="java.util.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:: Consulta TODOS::</title>
</head>
<center>

<form action="principal.html" method="get">
<font color="#000">
<b>------------------- Consultar Todos ------------------------------------------------------</b>

<br>
<br>
<table width="200" hidth="200"  border="0" align="center" style="background-color:red"><tr>
<div style="width:500px; height: 200px; overflow: auto;">
   	<%
		try
	    	{
			ArrayList dados=new ArrayList();
			dados=BancoAnimal.getAll();
    		
    		if(!dados.isEmpty())
    		{
			 for(int j=0; j<dados.size(); j++)
    		   	{
    		   	String xid=""+dados.get(j); j++;
                String xnome=""+dados.get(j); j++;
				String xespecie=""+dados.get(j); j++;
				String xidade=""+dados.get(j); j++;
				String xalimentacao=""+dados.get(j); j++;
                String xtipojaula=""+dados.get(j); j++;
				String xfot=""+dados.get(j); j++;
                String xcuidador=""+dados.get(j);
				
				out.println(""+xid+"--"+xnome+"<br/><br>" );
    		   	}//for
    		}
    		else
    		{
    			out.println("| TABELA VAZIA ");
    		}    

         }//try
    	catch(Exception e)
    	{
    		out.println("ERRO="+e);
    		
    	}//catch
        %></div>
</tr>
</table>
<br>
<br>
 <input type="submit" name="teste" value="Fim" align="top" /><br>

</form>

</center>

</body>
</html>