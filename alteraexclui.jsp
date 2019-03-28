<%@page language="Java" import="java.sql.*" %>    
<%@page language="Java" import="javax.swing.*" %>
<%@page language="Java" import="database.BancoAnimal"%>
<%@page language="Java" import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:: Alterar / Excluir::</title>
</head>

<center>
<form action="altera.jsp" method="get">
<font color="#000">
<b><n> ------------------------------------------------------ Cadastrar  ------------------------------------------------------</n></b>
<br>
<br>
<br>
<br>
<br>
<br>
			<%

   			String xid = request.getParameter("id");
   			String xnome = request.getParameter("nome");
			String xespecie = request.getParameter("especie");
			String xidade = request.getParameter("idade");
			String ximagem = request.getParameter("imagem");
			String xtipojaula =request.getParameter("tipojaula");
			String xalimentacao = request.getParameter("alimentacao");
			String xidcuidador = request.getParameter("cuidador");
			 
   			String altexc = request.getParameter("altexc");
   			JOptionPane.showMessageDialog(null,""+altexc);
  	 
        	if(altexc.equals("excluir")){
			   BancoAnimal.setId(xid);
			   BancoAnimal.excluir();
			
			out.println("\n Dados " + xnome + " Excluidos com sucesso !");
   			
			}else
			{
				BancoAnimal.setNome(xnome);
				BancoAnimal.setIdade(xidade);
				BancoAnimal.setEspecie(xespecie);
				BancoAnimal.setTipoJaula(xtipojaula);
				BancoAnimal.setAlimentacao(xalimentacao);
				BancoAnimal.setCuidador(xidcuidador);
				BancoAnimal.setImagem(ximagem);
			    BancoAnimal.alterar();
					

				
			out.println("\n Dados " + xnome + " Alterados com sucesso !");
   				
			}
      			
				 
			%>
 <input type="submit" name="teste" value="Continuar Alterando ou Excluindo >" align="top" /><br>

<br>
<br>

</form>

</center>
</body>
</html>