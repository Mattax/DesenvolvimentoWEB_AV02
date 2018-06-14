package bean;


import br.com.ConexaoBanco.ConexaoMySQL;
import java.sql.*;

public class ProdutosBean {
            int id;
            String setor;
            String perecivel;
            String nome;
            String marca;
            String fornecedor;

    public ProdutosBean(String nome, String setor, String perecivel, String marca, String fornecedor) {
        this.nome = nome;
        this.setor = setor;
        this.perecivel = perecivel;
        this.marca = marca;
        this.fornecedor = fornecedor;
    }
            
   
    private int getID(String nome){
        try{   
         Connection conexao = ConexaoMySQL.getConexaoMySQL();    
         PreparedStatement ps = conexao.prepareStatement("select * from aluno where nome like '%" + nome + "%' ");
         ResultSet r = ps.executeQuery();
         r.next();
         int a = r.getInt("id");
         return a;
        }catch(SQLException e){
         return 0;
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSetor() {
        return setor;
    }

    public void setSetor(String setor) {
        this.setor = setor;
    }

   

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getFornecedor() {
        return fornecedor;
    }

    public void setFornecedor(String fornecedor) {
        this.fornecedor = fornecedor;
    }

    public String getPerecivel() {
        return perecivel;
    }

    public void setPerecivel(String perecivel) {
        this.perecivel = perecivel;
    }
    
    

   
   
            
            
}
