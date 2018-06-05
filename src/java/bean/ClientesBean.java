package bean;


import br.com.ConexaoBanco.ConexaoMySQL;
import java.sql.*;

public class ClientesBean {
            int id;
            String nome;
            String endereco;
            String telefone;
            String celular;
            String cpf;

    public ClientesBean(String nome, String endereco, String telefone, String celular, String cpf) {
        this.nome = nome;
        this.endereco = endereco;
        this.telefone = telefone;
        this.celular = celular;
        this.cpf = cpf;
        this.id = getID(cpf);
    }
    
    private int getID(String cpf){
        try{   
         Connection conexao = ConexaoMySQL.getConexaoMySQL();    
         PreparedStatement ps = conexao.prepareStatement("SELECT id FROM clientes where cpf = '"+cpf+"'");
         ResultSet r = ps.executeQuery();
         r.next();
         int a = r.getInt("id");
         return a;
        }catch(SQLException e){
         return 0;
        }
    }

    public String getNome() {
        return nome;
    }


    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
    
    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
   
            
            
}
