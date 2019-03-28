<%@page language="Java" import="java.sql.*" %>    
<%@page language="Java" import="javax.swing.*" %>
<%@page language="Java" import="java.util.*" %>
<%@page language="Java" import="database.BancoCuidador"%>
<html>
		  <%-- comentario em JSP aqui: nossa primeira p�gina JSP --%>
		
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>:: Alterar / Excluir::</title>
		</head>
		
		
		<center>
		<form action="relacionacuidador.jsp" method="get">
		<b>------------------------------------------------------ Alterar / Excluir ------------------------------------------------------</b>
		
		<br>
		<br>
		
		Selecione a cuidador a ser alterada:
		<select name="escolhecuidador">
			<%
			String xid,xnome;
			try{
				ArrayList dados=new ArrayList();
				
				 dados=BancoCuidador.getAll();
				 BancoCuidador.disconnect();
				if(!dados.isEmpty())
				{	
				for(int j=0; j<dados.size();j++)
			    {
					xid=""+dados.get(j); j++;
					xnome=""+dados.get(j);
				%>	        
							   
			<br>
			<option size="20dp" value="<%out.print(xid);%>" name="nome"><%out.print(xid);%>-<%out.print(xnome);%>
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