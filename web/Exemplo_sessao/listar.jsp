<%-- 
    Document   : listar.jsp
    Created on : 06/04/2018, 18:43:21
    Author     : Leandro
--%>

<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar</title>
        
        <link href="<%=request.getContextPath()%>/css/estiloFormulario.css" rel="stylesheet" type="text/css"/>
      
    </head>
    <body >
        
        <div class="topnav">
          <a class="active" href="home.jsp">Início</a>
          <a href="listar.jsp">Buscar</a>
          <a href="cadastrar.jsp">Cadastrar</a>
          <a href="editar.jsp">Editar</a>
          <a href="excluirpage.jsp">Excluir</a>
          <a href="sobre.jsp">Sobre</a>
        </div>
        <br>
        <div id="usuario">
           <form name="frmLogout" method="post" action="<%=request.getContextPath()%>/LoginServlet">
                <input type="hidden" name="acao" value="logout" />
                <b><% out.print(session.getAttribute("login")); %></b>, Bem vindo!
                <br>
                <input type="submit" value="Logout" />
            </form>
        </div>
        <div class="content">
        <form action="" method="post">                       
            Nome do Produto:<input type="text" name="nome"/>       
                            <input type="submit" value="Buscar"/>
                            <br><br>
                            <input type="submit" value="Ver Itens Cadastrados"/> 
            <br><br>
        </form>
        
       

        <%
            request.setCharacterEncoding("utf8");

            String nome = request.getParameter("nome");
            String nome2 = request.getParameter("nome2");

            String URL_CONEXAO = "jdbc:mysql://localhost/uninove_vila_prudente";
            String USUARIO = "root";
            String SENHA = "";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexao = DriverManager.getConnection(URL_CONEXAO, USUARIO, SENHA);
            PreparedStatement ps = conexao.prepareStatement("select * from aluno where nome like '%" + nome + "%' ");
            PreparedStatement ps1 = conexao.prepareStatement("select * from aluno where nome like '%" + nome2 + "%' ");
            ResultSet resultSet = ps.executeQuery();        
            ResultSet resultSet2 = ps1.executeQuery();  

            out.print("<table align='center'>");  
            out.print("<tr><th>ID PRODUTO</th><th>NOME</th><th>MARCA</th><th>FORNECEDOR</th><th>SETOR</th><th>PERECÍVEL</th></tr>"); 
             while(resultSet.next()){            
                    out.print("<tr>");                
                           out.print("<td>" + resultSet.getString("ra") + "</td>");
                           out.print("<td>" + resultSet.getString("nome") + "</td>");
                           out.print("<td>" + resultSet.getString("marca") + "</td>");
                           out.print("<td>" + resultSet.getString("fornecedor") + "</td>");
                           out.print("<td>" + resultSet.getString("setor") + "</td>");
                           out.print("<td>" + resultSet.getString("perecivel") + "</td>");
                    out.print("</tr>");     
            }
            out.print("</table>");
            
             while(resultSet2.next()){            
                    out.print("<tr>");                
                           out.print("<td>" + resultSet.getString("ra") + "</td>");
                           out.print("<td>" + resultSet.getString("nome") + "</td>");
                           out.print("<td>" + resultSet.getString("marca") + "</td>");
                           out.print("<td>" + resultSet.getString("setor") + "</td>");
                           out.print("<td>" + resultSet.getString("perecivel") + "</td>");
                    out.print("</tr>");     
            }
            out.print("</table>"); 
            conexao.close();
        %>
    </div>
    <div class="bott">
            <a> <br>® Mattax corporation  </a>
    </div>
    </body>
</html>
