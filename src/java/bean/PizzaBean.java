package bean;

public class PizzaBean {
            String nome;
            String ingredientes;
            Double preco;

    public PizzaBean(String nome, String ingredientes, Double preco) {
        this.nome = nome;
        this.ingredientes = ingredientes;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getIngredientes() {
        return ingredientes;
    }

    public void setIngredientes(String ingredientes) {
        this.ingredientes = ingredientes;
    }

    public Double getPreco() {
        return preco;
    }

    public void setPreco(Double preco) {
        this.preco = preco;
    }
            
            

            
}
