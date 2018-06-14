
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.ProdutosBean"%>
<%@page import="java.util.List"%>
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
                
        <%
               List<ProdutosBean> listClient = (List<ProdutosBean>) request.getAttribute("listProdutos");
        %>
                
         
        </div>
        <div class="content">
        <form action="" method="post">                       
            Nome do Produto:<input type="text" name="buscar"/>       
                            Qtd: 
                            <select name = 'qtd'>
                                <option type="text" value="2">2</option>               
                                <option type="text" value="3">3</option>               
                                <option type="text" value="4">4</option>               
                                <option type="text" value="5">5</option>               
                                <option type="text" value="6">6</option>               
                                <option type="text" value="7" selected>7</option>               
                            </select>
                            <input type="submit" value="Buscar"/>
                            <br><br>
                            <input type="submit" value="Ver Itens Cadastrados"/> 
            <br><br>
        </form>
        
        <table>
            <% /** int qtd = 0;
            
                if(request.getParameter("qtd") != null || request.getParameter("pag") != null){ **/%>
            <tr>
                <th>ID PRODUTO</th>
                <th>NOME</th>
                <th>MARCA</th>
                <th>FORNECEDOR</th>
                <th>SETOR</th>
                <th>PERECÍVEL  </th>
                
            </tr> 
                
            </tr>    
            <% /**
                
                try{
                 qtd = Integer.valueOf(request.getParameter("qtd"));
                }catch(Exception e){
                }

                if(listProduto!=null){
                    int i=0;
                    for(ProdutosbEAN pt: listProduto){
                        out.print("<tr><td>" + pt.getId()+ "</td><td>" + pt.getNome()+ "</td>");
                        out.print("<td style='white-space: nowrap;'>" + pt.getMarca()+ "</td><td style='white-space: nowrap;'>" + pt.getFornecedor()+ "</td>");
                        out.print("<td style='white-space: nowrap;'>" + pt.getSetor()+ "</td><td style='white-space: nowrap;'>" + pt.getPerecivel()+ "</td>");
                        
                        i++;
                        if(i == qtd)
                            break;
                    }
                }
                }
                ProdutosDAO a = ProdutosDAO();
                if(request.getParameter("buscar") == null)
                    for(int i = 1; a.pg() >= i ;i++)
                        out.print("<input type='button' style='width:25px; margin:5px' onClick='location.href=\""+request.getContextPath()+"/ProdutosServlet?pag="+i+"&qtd="+qtd+"\"' value='"+i+"'>");
                else
                     for(int i = 1; a.pgbsc(request.getParameter("buscar")) >= i ;i++)
                        out.print("<input type='button' style='width:25px; margin:5px' onClick='location.href=\""+request.getContextPath()+"/ProdutosServlet?buscar="+request.getParameter("buscar")+"&pag="+i+"&qtd="+qtd+"\"' value='"+i+"'>");
                
             **/ %> 
        </table>

        <%
            request.setCharacterEncoding("utf8");

            String nome = request.getParameter("nome");
            String nome2 = request.getParameter("nome2");

            String URL_CONEXAO = "jdbc:mysql://localhost/projeto";
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
