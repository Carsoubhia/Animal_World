package database;
import java.sql.*;
import javax.swing.*;
import java.util.*;	

public class BancoAnimal{
    private static String bdNome;
    private static String fsql;
    private static String url, usuario, senha, drive;
    private static Connection con;
    private static ResultSet rs;
    private static PreparedStatement pstmt;
    private static Statement stmt;
 	
    private static String animalNome, animalImagem, animalAlimentacao, animalTipoJaula, animalEspecie;
    private static int animalCuidador, animalId, animalIdade;
    
    public static void setId(String c)
    {  
    	animalId = Integer.parseInt(c);
    }	
    	
    public static void setNome(String n)	
    { 
    	animalNome = n; 
    }

    public static void setCuidador(String cuidador)
    {
        animalCuidador = Integer.parseInt(cuidador);
    }

    public static void setImagem(String Imagem)
    {
        animalImagem = Imagem;
    }
    
    public static void setIdade(String idade)
    {
        animalIdade = Integer.parseInt(idade);
    }

    public static void setTipoJaula(String tipoJaula)
    {
        animalTipoJaula = tipoJaula;
    }

    public static void setEspecie(String especie)
    {
        animalEspecie = especie;
    }

    public static void setAlimentacao(String alimentacao)
    {
        animalAlimentacao = alimentacao;
    }
    	
    public static int getId()
    {
    	return animalId;
    }
    
    public static String getEspecie()
    {
    	return animalEspecie;
    }
    public static String getNome()
    {
    	return animalNome;
    }	

    public static Integer getCuidador()
    {
        return animalCuidador;
    }
    

    public static String getImagem()
    {
        return animalImagem;
    }

    public static int getIdade()
    {
        return animalIdade;
    }

    public static String getAlimentacao()
    {
        return animalAlimentacao;
    }
    
    public static String getTipojaula()
   	{
   		return animalTipoJaula;
   	}
    
    public static boolean procurar(int xid)
    {
    	connect();
    	JOptionPane.showMessageDialog(null,"procurando");
    	fsql="select * from animal where id_animal=?";
    	try
    	{
    	  pstmt=con.prepareStatement(fsql);
   		  pstmt.setInt(1,xid);
    	  rs=pstmt.executeQuery();
    	  if(rs.next())
          { 
          	setId(rs.getString(1));
            setNome(rs.getString(2));
            setEspecie(rs.getString(3));
            setIdade(rs.getString(4));
            setAlimentacao(rs.getString(5));
            setTipoJaula(rs.getString(6)); 
            setImagem(rs.getString(7));
            setCuidador(rs.getString(8));
    		return true;
          }
    	}catch(Exception errp)
   	    {
   		JOptionPane.showMessageDialog(null,"Erro Procura:"+errp);
	 	}
	 	return false;
    }	
    public static void incluir()
    {
    	try
    	{	
    		connect();
    		fsql="insert into animal (id_cuidador, nome, imagem, idade, tipo_jaula, especie, alimentacao) values (?, ?, ?, ?, ?, ?, ?)";
    
    		pstmt=con.prepareStatement(fsql);
    		pstmt.setInt(1, animalCuidador);
    		pstmt.setString(2, animalNome);
    		pstmt.setString(3, animalImagem);
    		pstmt.setInt(4, animalIdade);
    		pstmt.setString(5, animalTipoJaula);
    		pstmt.setString(6, animalEspecie);
    		pstmt.setString(7, animalAlimentacao);
    		pstmt.execute();
    		pstmt.close();
    		disconnect();
    	}
    	catch(Exception erro)
    	{
    		JOptionPane.showMessageDialog(null, "Erro na inclusao do animal:" + erro);
    	}
    }	

    public static void excluir()
    {
    
    	try
    	{
    		connect();
    			fsql="delete from animal where id_animal=?";
    		pstmt=con.prepareStatement(fsql);
    		pstmt.setInt(1, animalId);
    		pstmt.execute();
    		pstmt.close();
    		disconnect();
    	}
    	catch(Exception erro)
    	{
    		JOptionPane.showMessageDialog(null, "Erro na exclusao do animal: "+erro);
    	}
    }	

    public static void alterar()
    { 
    	try
    	{
    		connect();
    		fsql="update animal set nome=?, especie=?, idade=?, alimentacao=?, tipo_jaula=?, imagem=?, id_cuidador=? where id_animal=?";
    
    		pstmt=con.prepareStatement(fsql); 
    		pstmt.setString(1, animalNome);
    		pstmt.setString(2, animalEspecie);
    		pstmt.setInt(3, animalIdade);
            pstmt.setString(4,animalAlimentacao);
    		pstmt.setString(5, animalTipoJaula);
    		pstmt.setString(6, animalImagem);
            pstmt.setInt(7, animalCuidador);
            pstmt.setInt(8, animalId);
    		pstmt.execute();
    		pstmt.close();
    		disconnect();
    	} 
    	catch(Exception erro)
    	{
    		JOptionPane.showMessageDialog(null, "Erro na alteracao do animal: "+erro);
    	}	
    }	

	public  static void connect()
	{ 
	   
		con = null;
		usuario = "postgres";
		senha = "sqladmin";
		url = "jdbc:postgresql://localhost:5432/Animal_World";


		try
		{  
			DriverManager.registerDriver(new org.postgresql.Driver()); 
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(url, usuario, senha);
		}
		catch(Exception erro)
		{  
			JOptionPane.showMessageDialog(null, "Erro na conexao: "+erro);
		}
	}

	public static void disconnect()
	{  
		try
		{ 
			con.close();
		}
		catch(Exception erro)
		{ 
			JOptionPane.showMessageDialog(null, "Erro na desconexao: "+erro);
		}	
	}
   
	public static ArrayList getAll()
	{  
		ArrayList dados;
		dados=new ArrayList();
	
		try
		{
			connect();
			fsql="select * from animal";
			stmt=con.createStatement();
			rs=stmt.executeQuery(fsql);
			while(rs.next())
			{
				animalId=rs.getInt("id_animal");
				animalNome=rs.getString("nome");
				animalEspecie=rs.getString("especie");
				animalIdade=rs.getInt("idade");
				animalAlimentacao=rs.getString("alimentacao");
				animalTipoJaula=rs.getString("tipo_jaula");
				animalImagem=rs.getString("Imagem");
				animalCuidador=rs.getInt("id_cuidador");
				dados.add(animalId);
				dados.add(animalNome);
				dados.add(animalEspecie);
				dados.add(animalIdade);
                dados.add(animalAlimentacao);
				dados.add(animalTipoJaula);
				dados.add(animalImagem);
				dados.add(animalCuidador);
			}
			stmt.close();
			disconnect();
		}
		catch(Exception erro)
		{
			JOptionPane.showMessageDialog(null, "Erro na leitura dos animais: "+erro);
		}
		return dados;
	}

    public static boolean exists(String id)
    {
       
        try
        {
        	connect();
        	 fsql="Select * from animal where id_animal=?";
        	pstmt = con.prepareStatement(fsql);
            int idd = Integer.parseInt(id);
            pstmt.setInt(1, idd);

            rs = pstmt.executeQuery();

            if(rs.next())
            	return true;

            pstmt.close();
            disconnect();    
        }    
        catch(Exception erroi)
        {
        	JOptionPane.showMessageDialog(null, "Erro procura do animal: "+erroi);
        }
        return false;
	}

    public static String getNome(String id)
    {
       
        try
        {
        	connect();
        	 fsql="Select * from animal where id_animal=?";
        	pstmt = con.prepareStatement(fsql);
            int idd = Integer.parseInt(id);
            pstmt.setInt(1, idd);

            rs = pstmt.executeQuery();

            if(rs.next())
            	return rs.getString("nome");
            pstmt.close();
            disconnect();
        }    
        catch(Exception erroi)
        {
        	JOptionPane.showMessageDialog(null, "Erro procura do animal: "+erroi);
        }
        return "vazio";
    }
    
    public static ArrayList getRow(String id)
    {
        ArrayList row;
        row = new ArrayList();
         try
        {
        	connect();
        	  fsql = "Select * from animal, cuidador where animal.id_cuidador = cuidador.id_cuidador and animal.id_animal=?";
     
            pstmt = con.prepareStatement(fsql);
            pstmt.setInt(1, Integer.parseInt(id));

            rs = pstmt.executeQuery();
            if(rs.next()) {
                row.add(rs.getString("nome"));
                row.add(String.valueOf(rs.getInt("id_cuidador")));
                row.add(rs.getString("Imagem"));
                row.add(String.valueOf(rs.getInt("idade")));
                row.add(rs.getString("alimentacao"));
                row.add(rs.getString("tipo_jaula"));
                disconnect();
                return row;
            }
            pstmt.close();
        }
        catch(Exception erroi)
        {
        	JOptionPane.showMessageDialog(null, "Erro procura do animal: "+erroi);
            row.add("vazio");
            return row;
        }
        disconnect();
        return  row;
    }
    
    private BancoAnimal()
    { 
    	 animalId = 0;
    	animalNome = "";
    	bdNome = "Animal_World";
      	fsql = "";
    } 

    public static String pegaultimo()
    {
    	connect();
       fsql="select * from animal";
   	  try{
  	
   	  stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
   	  rs=stmt.executeQuery(fsql);  
   	   if(rs.last())
            { 
            	  disconnect();
		          return ""+(rs.getInt("id_animal")+1);//achou
            }    
            pstmt.close();    
        }    catch(Exception erroi)
        {
             JOptionPane.showMessageDialog(null,
                " Erro ultimo animal:"+erroi);
        }
        disconnect();
        return "ultimo";
}//procura 
    
    
    
	public static void main(String oi[])
	{ 
		new BancoAnimal();
	}
}
