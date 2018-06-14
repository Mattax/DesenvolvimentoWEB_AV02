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
        <title>Editar / Exluir</title>
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

        
        <%
        request.setCharacterEncoding("utf8");
                     
        String ra = request.getParameter("ra");
        String URL_CONEXAO = "jdbc:mysql://localhost/projeto";
        String USUARIO = "root";
        String SENHA = "";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexao = DriverManager.getConnection(URL_CONEXAO, USUARIO, SENHA);
        PreparedStatement ps = conexao.prepareStatement("delete from aluno where ra = '" + ra + "' ");
        ps.execute();       

        %>
        <div class="content">
        <h2>Deletado com sucesso!</h2>
        </div> 
        <div class="bott">
            <a> <br>® Mattax corporation  </a>
        </div>

    </body>
</html>
