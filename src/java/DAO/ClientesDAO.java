package DAO;

import bean.ClientesBean;
import br.com.ConexaoBanco.ConexaoMySQL;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClientesDAO {
    Connection conexao = ConexaoMySQL.getConexaoMySQL();
    public void insert(ClientesBean in){
        try{
        Statement is = conexao.createStatement();
        String sql = "INSERT INTO clientes (nome,endereco,telefone,celular,cpf) VALUES ('"+in.getNome()+"','"+in.getEndereco()+"','"+in.getTelefone()+"','"+in.getCelular()+"','"+in.getCpf()+"')";
        is.executeUpdate(sql);
        is.close();
        }catch(SQLException e){}
    }
    public List<ClientesBean> read(int p){
        ArrayList list = new ArrayList();
        try{
        PreparedStatement ps = conexao.prepareStatement("SELECT c.* FROM clientes c order by nome limit "+p+",7");
        ResultSet r = ps.executeQuery();
        while(r.next()){
            ClientesBean al = new ClientesBean(r.getString("nome"),r.getString("endereco"),r.getString("telefone"),r.getString("celular"),r.getString("cpf"));            
            list.add(al);
        }
        }catch(SQLException e){}
        return list;
    }
    public List<ClientesBean> buscar(int p, String s){
        ArrayList list = new ArrayList();
        try{
        PreparedStatement ps = conexao.prepareStatement("SELECT c.* FROM clientes c where LOCATE('"+s+"',c.nome)>0 or LOCATE('"+s+"',c.telefone)>0 or LOCATE('"+s+"',c.celular)>0 or LOCATE('"+s+"',c.endereco)>0 order by nome limit "+p+",7");
        ResultSet r = ps.executeQuery();
        while(r.next()){
            ClientesBean al = new ClientesBean(r.getString("nome"),r.getString("endereco"),r.getString("telefone"),r.getString("celular"),r.getString("cpf"));            
            list.add(al);
        }
        }catch(SQLException e){}
        return list;
    }
    public int pg(){
        int pg;
        try{
        PreparedStatement ps = conexao.prepareStatement("SELECT ceiling((COUNT(*)/7)) as pg FROM clientes");
        ResultSet r = ps.executeQuery();
        r.next();
        pg = Integer.valueOf(r.getString("pg"));
        return pg;
        }catch(SQLException e){
            return 0;
        }
    }
    public int pgbsc(String s){
        int pg;
        try{
        PreparedStatement ps = conexao.prepareStatement("SELECT ceiling((COUNT(*)/7)) as pg FROM clientes where LOCATE('"+s+"',nome)>0 or LOCATE('"+s+"',c.celular)>0 or LOCATE('"+s+"',telefone)>0 or LOCATE('"+s+"',endereco)>0");
        ResultSet r = ps.executeQuery();
        r.next();
        pg = Integer.valueOf(r.getString("pg"));
        return pg;
        }catch(SQLException e){
            return 0;
        }
    }
    public void delete(int id){
        try{
        Statement dl = conexao.createStatement();
        int i = dl.executeUpdate("DELETE FROM clientes WHERE id = "+id+";");
        }catch(SQLException e){}
    }
    public void update(ClientesBean in){
        try{
        Statement al = conexao.createStatement();
        int i = al.executeUpdate("UPDATE clientes SET nome = '"+in.getNome()+"', endereco = '"+in.getEndereco()+"', telefone = '"+in.getTelefone()+"', celular = '"+in.getCelular()+"', cpf = '"+in.getCpf()+"' where id = '"+in.getId()+"'");
        }catch(SQLException e){}    
    }
    
}
