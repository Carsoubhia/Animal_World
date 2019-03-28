package database;

import java.sql.*;
import javax.swing.*;
import java.util.*;	

public class BancoCuidador {
    private static String bdNome;
    private static String fsql;
    private static String url, usuario, senha, drive;
    private static Connection con;
    private static ResultSet rs;
    private static PreparedStatement pstmt;
    private static Statement stmt;
    private static String cuidadorNome;
    private static Integer cuidadorId;
    
    public static void setId(String c)
    {  
    	cuidadorId = Integer.parseInt(c);
    }	
    	
    public static void setNome(String n)	
    { 
    	cuidadorNome = n; 
    }	
    	
    public static int getId()
    {
    	return cuidadorId;
    }
    		
    public static String getNome()
    {
    	return cuidadorNome;
    }	
    public static boolean procurar(int xid)
    {
    	connect();
    	JOptionPane.showMessageDialog(null,"procurando");
    	fsql="select * from cuidador where id_cuidador=?";
    	try
    	{
    	  pstmt=con.prepareStatement(fsql);
   		  pstmt.setInt(1,xid);
    	  rs=pstmt.executeQuery();
    	  if(rs.next())
          { 
          	setId(rs.getString(1));
            setNome(rs.getString(2));
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
    	
    		fsql="insert into cuidador(id_cuidador,nome) values(default,?)";
    
    		pstmt=con.prepareStatement(fsql);
    		JOptionPane.showMessageDialog(null, "totototogravando:" +cuidadorNome);
    		pstmt.setString(1, cuidadorNome);
    		pstmt.execute();
			JOptionPane.showMessageDialog(null, "gravou:" +cuidadorNome);
    		pstmt.close();
       	}
    	catch(Exception erro)
    	{
    		JOptionPane.showMessageDialog(null, "Erro na inclusao cuidador:" + erro);
    	}
    }	

    public static void excluir()
    {
    
    	try
    	{
    		connect();
    			fsql="delete from cuidador where id_cuidador=?";
    		pstmt=con.prepareStatement(fsql);
    		pstmt.setInt(1, cuidadorId);
    		pstmt.execute();
    		pstmt.close();
    		disconnect();
    	}
    	catch(Exception erro)
    	{
    		JOptionPane.showMessageDialog(null, "Erro na exclusao:"+erro);
    	}
    }	

    public static void alterar()
    { 
    	
    	try
    	{
    		connect();
    		fsql="update cuidador set nome=? where id_cuidador=?";
    		pstmt=con.prepareStatement(fsql);
    		pstmt.setString(1, cuidadorNome);
    		pstmt.setInt(2, cuidadorId);
    		pstmt.execute();
    		pstmt.close();
    		disconnect();
    	} 
    	catch(Exception erro)
    	{
    		JOptionPane.showMessageDialog(null, "Erro na alteracao cuidador:"+erro);
    	}	
    }	

	public static void connect()
	{ 
		
    	fsql = "";
		con = null;
		usuario = "postgres";
		senha = "sqladmin";
		url = "jdbc:postgresql://localhost:5432/Animal_World"; 
		JOptionPane.showMessageDialog(null, "conectado");
			
		try
		{  
			DriverManager.registerDriver(new org.postgresql.Driver()); 
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(url, usuario, senha);
		}
		catch(Exception erro)
		{  
			JOptionPane.showMessageDialog(null, "Erro na2 conexao:"+erro);
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
			JOptionPane.showMessageDialog(null, "Erro na desconexao:"+erro);
		}	
	}
   
	public static ArrayList getAll()
	{  
		ArrayList dados;
		dados=new ArrayList();
	
		try
		{
			connect();
			fsql="select * from cuidador";
			stmt=con.createStatement();
			rs=stmt.executeQuery(fsql);
			while(rs.next())
			{
				cuidadorId=rs.getInt("id_cuidador");
				cuidadorNome=rs.getString("nome");
				dados.add(String.valueOf(cuidadorId));
				dados.add(cuidadorNome);
			}
			stmt.close();
			disconnect();
		}
		catch(Exception erro)
		{
			JOptionPane.showMessageDialog(null, "Erro na leitura cuidador:"+erro);
		}
		return dados;
	}

    public static boolean exists(String id)
    {
        fsql="Select * from cuidador where id_cuidador=?";
        try
        {
        	connect();
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
        	JOptionPane.showMessageDialog(null, "Erro procura:"+erroi);
        }
        return false;
	}

    public static String getNome(String id)
    {
        fsql="Select * from cuidador where id_cuidadores=?";
        try
        {
        	connect();
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
        	JOptionPane.showMessageDialog(null, "Erro procura:"+erroi);
        }
        return "vazio";
	} 
    
    public BancoCuidador()
    { 
    } 

	public static void main(String oi[])
	{ 
		new BancoCuidador();
	}
}
