
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="<%=request.getContextPath()%>/css/estiloFormulario.css" rel="stylesheet" type="text/css"/>
        <title>Salvar</title>
    </head>
    <body>
        <div class="topnav">
          <a class="active" href="home.jsp">Início</a>
          <a href="listar.jsp">Buscar</a>
          <a href="cadastrar.jsp">Cadastrar</a>
          <a href="editar.jsp">Editar</a>
          <a href="excluirpage.jsp">Excluir</a>
          <a href="sobre.jsp">Sobre</a>
        </div>
        <div id="usuario">
           <form name="frmLogout" method="post" action="<%=request.getContextPath()%>/LoginServlet">
                <input type="hidden" name="acao" value="logout" />
                <b><% out.print(session.getAttribute("login")); %></b>, Bem vindo!
                <br>
                <input type="submit" value="Logout" />
            </form>
        </div>
        <%
            request.setCharacterEncoding("utf8");
            
            String URL_CONEXAO = "jdbc:mysql://localhost/projeto";
            String USUARIO = "root";
            String SENHA = "";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexao = DriverManager.getConnection
                 (URL_CONEXAO, USUARIO, SENHA);
            PreparedStatement ps = null;                                
            
            Integer ra = null;
            if(request.getParameter("ra")!=null && !request.getParameter("ra").equals("")){
                ra = Integer.valueOf(request.getParameter("ra"));
            }
            String nome = request.getParameter("nome");
            String setor = request.getParameter("setor");            
            String marca = request.getParameter("marca");
            String perecivel = request.getParameter("perecivel");
            String fornecedor = request.getParameter("fornecedor");
            if(perecivel!=null && perecivel.equals("on")){
                perecivel = "Sim";
            }else{
                perecivel = "Não";
            }                  
                        
            if (ra!=null){
                ps = conexao.prepareStatement("update aluno set nome=?, setor=?,marca=?, perecivel=?, fornecedor=?, where ra=?");
                ps.setString(1, nome);                
                ps.setString(2, setor);
                ps.setString(3, marca);
                ps.setString(4, perecivel);
                ps.setString(5, fornecedor);
                ps.setInt(6, ra);
                ps.executeUpdate();        
            }else{                    
                ps = conexao.prepareStatement("insert into aluno(nome, setor, marca, perecivel, fornecedor) values (?,?,?,?,?)");
                ps.setString(1, nome);                
                ps.setString(2, setor);
                ps.setString(3, marca);
                ps.setString(4, perecivel);
                ps.setString(5, fornecedor);
                ps.executeUpdate(); 
            }
        %>    
        
        <div class="content"> 
            <h1>Cadastrado com sucesso!</h1>
        </div>
        <div class="bott">
            <a> <br>® Mattax corporation  </a>
        </div>
        
    </body>
</html>
