<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
		<%@page import="java.sql.*" %>    
		<%@page import="javax.swing.*" %>
		<%@page import="java.util.*" %>
		<%@page language="Java" import="database.BancoCuidador"%>
        <%@page language="Java" import="database.BancoAnimal"%>
		
		
<center>

<form action="salvarAnimal.jsp" method="post">
	<font color="#000">
		<b><n> ------------------------------------------------------ Cadastrar Animal ------------------------------------------------------</n></b>
		<table width="200" border="0" align="center">
		
			<tr>
				<td height="40">Id:</td>
				<td><input type="text" name="id_animal" size="35" value="<% out.println(BancoAnimal.pegaultimo()); %>" required disabled/></td>
			</tr>
			<tr>
				<td height="40">Nome</td>
				<td><input type="text" name="nome" size="35" value="" required /></td>
			</tr>
			<tr>
				<td height="40">Espécie:</td>
				<td><input type="text" name="especie" size="10" value="" required/></td>
			</tr>
			<tr>
				<td height="40">Idade:</td>
				<td><input type="text" name="idade" size="10" value="" required/></td>
			</tr>
			<tr>
				<td height="40">Alimentação:</td>
				<td><input type="text" name="alimentacao" size="10" value="" required /></td>
			</tr>
            <tr>
				<td height="40">Tipo de jaula:</td>
				<td><input type="text" name="tipo_jaula" size="10" value="" required /></td>
			</tr>
			<tr>
				<td height="40">Cuidador:</td>
				<td>
				
			   <select name="cuidador" id="cuidador" required>
				   <% 
				   try{
					String id, nome;	
					ArrayList vetor=new ArrayList();	
					vetor=BancoCuidador.getAll();
					if(!vetor.isEmpty())
					{
						for(int i=0; i<vetor.size(); i++)
						{
						   id=""+vetor.get(i);
						   i++;
						   nome=""+vetor.get(i);
					%>
					<br>
					<option size="20dp" value="<%out.print(id);%>" name="nome"><%out.print(nome);%></option>
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
				</td>
			</tr>
			<tr>
				<td height="40">Imagem:</td>
				<td>
					<input type="file" name="imagem" size="20" accept="image/jpg/bmp" value="" required>
				</td>
			</tr>
		</table>

		<input type="submit" name="teste" value="Enviar" align="top" />		
	</font>
</form>

</center>
</body>
</html>