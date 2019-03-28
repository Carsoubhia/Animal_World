<%@page language="Java" import="java.sql.*" %>    
<%@page language="Java" import="javax.swing.*" %>
<%@page language="Java" import="database.BancoAnimal"%>
<%@page language="Java" import="database.BancoCuidador"%>
<%@page language="Java" import="java.util.*" %>

<html>
       <%
 
        String xnome="",xespecie="",xalimentacao="",xtipojaula="",ximagem="";
        int xidade=0;
        Integer xcuidador;
        String num = request.getParameter("escolheId");
        Integer xid = Integer.parseInt(num);
        
	try
    	{
 			
    	if(BancoAnimal.procurar(xid))
    	{
			    xid=BancoAnimal.getId();
			    xnome=BancoAnimal.getNome();
				xespecie=BancoAnimal.getEspecie();
				xidade=BancoAnimal.getIdade();
				xalimentacao=BancoAnimal.getAlimentacao();
				xtipojaula=BancoAnimal.getTipojaula();
				xcuidador=BancoAnimal.getCuidador();
				ximagem=BancoAnimal.getImagem();

		}
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


<form action="alteraexclui.jsp" method="post">
<font color="#000">
<b>-- Alterar / Excluir ----</b>


	<table width="200" border="0" align="center">
	<tr>
		<td height="40">Id:</td>
		<td><input type="text" name="id" readonly="readonly" value="<%out.print(xid);%>" />
		</td>
		
	</tr>
	<tr>
		<td height="40">Nome:</td>
		<td><input type="text" name="nome" value="<%out.print(xnome);%>"/>
		</td>
       
	</tr>
	
	<tr>
		<td height="40">Especie:</td>
		<td><input type="text" name="especie" value="<%out.print(xespecie);%>"/>
		</td>
       
	</tr>
	<tr>
		<td height="40">Idade:</td>
		<td><input type="text" name="idade" value="<%out.print(xidade);%>"/>
		</td>
       
	</tr>	
	<tr>
		<td height="40">Alimentacao:</td>
		<td><input type="text" name="alimentacao" value="<%out.print(xalimentacao);%>"/>
		</td>
       
	</tr>
	<tr>
		<td height="40">Tipo de Jaula:</td>
		<td><input type="text" name="tipojaula" value="<%out.print(xtipojaula);%>"/>
		</td>
       
	</tr>
		<tr>
				<td height="40">Cuidador:</td>
				<td>
				
			   <select name="cuidador" id="cuidador" required>
				   <%
				   try{
					String id, nome;	
					ArrayList dados=new ArrayList();	
					dados=BancoCuidador.getAll();
					if(!dados.isEmpty())
					{
						for(int i=0; i<dados.size(); i++)
						{
						   id=""+dados.get(i); i++;
						   nome=""+dados.get(i);
					%>

					<br>
					<option size="20dp" value="<%out.print(xid);%>" name="nome" <% if(id.equals(xid)) out.print("selected"); %>> <%out.print(nome); %></option>
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
			<img src="<%out.print(ximagem);%>" width="100" >
		</td>
		<td>	    
		   <input type="file" size="50" name="imagem" title="Clique aqui para procurar arquivo" onchange="updateFilename(this.value)" >
		   <p>The name of the file you picked is: <span id="filename">(none)</span></p>
			<script>
			function updateFilename(path) {
				var ximagem = extractFilename(path);
				document.getElementById('filename').textContent = ximagem;
			}
			</script>
		
		
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