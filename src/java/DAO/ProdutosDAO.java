package DAO;


import bean.ProdutosBean;
import br.com.ConexaoBanco.ConexaoMySQL;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProdutosDAO {
    Connection conexao = ConexaoMySQL.getConexaoMySQL();
    public void insert(ProdutosBean in){
        try{
        Statement is = conexao.createStatement();
        String sql = "INSERT INTO aluno (nome,setor,perecivel,marca,fornecedor) VALUES ('"+in.getNome()+"','"+in.getSetor()+"','"+in.getPerecivel()+"','"+in.getMarca()+"','"+in.getFornecedor()+"')";
        is.executeUpdate(sql);
        is.close();
        }catch(SQLException e){}
    }
    public List<ProdutosBean> read(int p){
        ArrayList list = new ArrayList();
        try{
        PreparedStatement ps = conexao.prepareStatement("SELECT c.* FROM aluno c order by nome limit "+p+",7");
        ResultSet r = ps.executeQuery();
        while(r.next()){
            ProdutosBean al = new ProdutosBean(r.getString("nome"),r.getString("setor"),r.getString("´perecivel"),r.getString("marca"),r.getString("fornecedor"));            
            list.add(al);
        }
        }catch(SQLException e){}
        return list;
    }
    public List<ProdutosBean> buscar(int p, String s){
        ArrayList list = new ArrayList();
        try{
        PreparedStatement ps = conexao.prepareStatement("SELECT c.* FROM clientes c where LOCATE('"+s+"',c.nome)>0 or LOCATE('"+s+"',c.setor)>0 or LOCATE('"+s+"',c.perecivel)>0 or LOCATE('"+s+"',c.marca)>0 or LOCATE('"+s+"',c.fornecedor)>0 order by nome limit "+p+",7");
        ResultSet r = ps.executeQuery();
        while(r.next()){
            ProdutosBean al = new ProdutosBean(r.getString("nome"),r.getString("setor"),r.getString("perecivel"),r.getString("marca"),r.getString("fornecedor"));            
            list.add(al);
        }
        }catch(SQLException e){}
        return list;
    }
    public int pg(){
        int pg;
        try{
        PreparedStatement ps = conexao.prepareStatement("SELECT ceiling((COUNT(*)/7)) as pg FROM aluno");
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
        PreparedStatement ps = conexao.prepareStatement("SELECT ceiling((COUNT(*)/7)) as pg FROM aluno where LOCATE('"+s+"',nome)>0 or LOCATE('"+s+"',c.setor)>0 or LOCATE('"+s+"',perecivel)>0 or LOCATE('"+s+"',marca)>0 or LOCATE('"+s+"',fornecedor)>0");
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
        int i = dl.executeUpdate("DELETE FROM aluno WHERE ra = "+id+";");
        }catch(SQLException e){}
    }
    public void update(ProdutosBean in){
        try{
        Statement al = conexao.createStatement();
        int i = al.executeUpdate("UPDATE aluno SET nome = '"+in.getNome()+"', endereco = '"+in.getSetor()+"', telefone = '"+in.getPerecivel()+"', celular = '"+in.getMarca()+"', cpf = '"+in.getMarca()+"' where id = '"+in.getId()+"'");
        }catch(SQLException e){}    
    }
    
}
