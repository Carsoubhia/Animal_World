<html>

<body>

       <%-- coment�rio em JSP aqui: nossa primeira p�gina JSP --%>
    
       <%@page import="java.sql.*" %>    
       <%@page import="javax.swing.*" %>
	   
		<%@page import="java.io.*" %>
		<%@page import="javax.servlet.*" %>
      <%@page language="Java" import="database.BancoAnimal"%>
		

       <%
	    
		String nome = request.getParameter("nome");
		String especie = request.getParameter("especie");
		String idade = request.getParameter("idade");
        String alimentacao = request.getParameter("alimentacao");
        String tipo_jaula = request.getParameter("tipo_jaula");
		String id_cuidador = request.getParameter("cuidador");
		String imagem = request.getParameter("imagem");
		
        BancoAnimal.setNome(nome);
		BancoAnimal.setEspecie(especie);
		BancoAnimal.setIdade(idade);
		BancoAnimal.setAlimentacao(alimentacao);
        BancoAnimal.setTipoJaula(tipo_jaula);
		BancoAnimal.setCuidador(id_cuidador);
		BancoAnimal.setImagem(imagem);
		BancoAnimal.incluir();
		
		/*File arquivo = imagem;
		
		try {
					String l = arquivo.getAbsolutePath(); // De onde vem a imagem
					FileInputStream fisDe = new FileInputStream(l);
					
					String i = "./imagens/"+txtfoto.getText()+""; // Para onde vai a imagem
					FileOutputStream fisPara = new FileOutputStream(i);
		
					FileChannel fcPara = fisDe.getChannel();
					FileChannel fcDe = fisPara.getChannel();
					
					if( fcPara.transferTo(0, fcPara.size(), fcDe ) == 0L ) { // Transferência
						fcPara.close();
						fcDe.close();
					}
					
					arquivo = null;
					
			   } catch (Exception e) {

				   JOptionPane.showMessageDialog(null, "Erro de Transferência:"+e );

			   }*/

         %>
		<br>

<center>
<form action="cadastrar2.jsp" method="get">

<font color="#000">
<b><n> ---------- Cadastrar Animal  ------------------------------------------------------</n></b>
<br>
<br>
<br>
<br>
<br>
<br>
<font color="#FF0000" style='font-weight:bold;'>
Carro <%-- out.print(nome);  --%> adicionado com sucesso! <input 

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