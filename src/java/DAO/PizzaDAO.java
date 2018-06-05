package DAO;

import bean.PizzaBean;
import br.com.ConexaoBanco.ConexaoMySQL;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PizzaDAO {
    Connection conexao = ConexaoMySQL.getConexaoMySQL();
    public void insert(PizzaBean in){
        try{
        Statement is = conexao.createStatement();
        int i = is.executeUpdate("INSERT INTO pizzas (nome,ingredientes,preco) VALUES ('"+in.getNome()+"','"+in.getIngredientes()+"',"+in.getPreco()+");");
        }catch(SQLException e){}
    }
    public List<PizzaBean> read(){
        ArrayList list = new ArrayList();
        try{
        PreparedStatement ps = conexao.prepareStatement("SELECT * FROM pizzas;");
        ResultSet resultSet = ps.executeQuery();
        while(resultSet.next()){
            PizzaBean al = new PizzaBean(resultSet.getString("nome"), resultSet.getString("ingredientes"),resultSet.getDouble("preco"));            
            list.add(al);
        }
        }catch(SQLException e){}
        return list;
    }
    public void delete(int id){
        try{
        Statement dl = conexao.createStatement();
        int i = dl.executeUpdate("DELETE FROM pizzas WHERE id = '"+id+"'");
        }catch(SQLException e){}
    }
    public void update(PizzaBean in, int id){
        try{
        Statement al = conexao.createStatement();
        int i = al.executeUpdate("UPDATE pizzas SET nome = '"+in.getNome()+"', ingredientes = '"+in.getIngredientes()+"', double = '"+in.getPreco()+"' where id = '"+id+"';");
        }catch(SQLException e){}    
    }
}
