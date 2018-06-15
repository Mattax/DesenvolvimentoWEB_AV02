
<%@page import="DAO.ProdutosDAO"%>
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
     <script>
        function fecha(){
                document.getElementById("alterar").style.display = "none";
        }
        function fechain(){
                document.getElementById("incluir").style.display = "none";
        } 
        function abre(nom,e,t,c,cpf){
            document.getElementById("altera").style.display = "block";
            document.getElementById("nome").value = nom;
            document.getElementById("marca").value = e;
            document.getElementById("setor").value = t;
            document.getElementById("fornecedor").value = c;
            document.getElementById("perecivel").value = cpf;
            document.getElementById("nome").focus();
        }
        function abrein(){
            document.getElementById("incluir").style.display = "block";
            document.getElementById("tx").focus();
        }
        function deletar(id){
             var answer = confirm ("Deseja realmente excluir?");
                if (answer)
                    location.href="?apagar="+id;
        }
    </script>
    <body >
        
        <div class="topnav">
          <a class="active" href="home.jsp">Início</a>
          <a href="listar.jsp">Controle</a>
         
          <a href="sobre.jsp">Sobre</a>
        </div>
        <% 
            if (session.getAttribute("login") != null) {
        %>
        <br>
        <div id="usuario">
           <form name="frmLogout" method="post" action="<%=request.getContextPath()%>/LoginServlet">
                <input type="hidden" name="acao" value="logout" />
                <b><% out.print(session.getAttribute("login")); %></b>, Bem vindo!
                <br>
                <input type="submit" value="Logout" />
            </form>
                
        <%
               List<ProdutosBean> listProduto = (List<ProdutosBean>) request.getAttribute("listProduto");
        %>
                
         
        </div>
        <div class="content">
        <form action="<%=request.getContextPath()%>/ProdutosServlet">                       
            Nome do Produto:<input type="text" name="buscar"/> 
            <input type ='hidden' name="pag" value='1'>
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
                            
            <br><br>
        </form>
          <div id="inclui">
            <button onClick="fechain()" > x </button>
            <form action="<%=request.getContextPath()%>/ProdutosServlet" name='incluir' method="post">
                ID <input type="text" id='iid' name="iid"><br>
                Nome: <input type="text" id='inome' name="inome"><br>
                Marca <input type="text" id='imarca' name="imarca"><br>
                Fornecedor <input type="text" id='ifornecedor' name="ifornecedor"><br>
                Setor <input type="text" id='isetor' name="isetor"><br>
                Perecível <input type="text" id='iperecivel' name="iperecivel"><br>
            <input type="submit" name="incluir" value=" Cadastrar ">
            </form>
            </div>
            
            
            
            <div id="altera">
            <button onClick="fecha()">X</button>
            <form action="<%=request.getContextPath()%>/ProdutosServlet" name='alterar' method="Post">
                Nome: <input type="text" id='nome' name="nome"><br>
                Marca <input type="text" id='marca' name="marca"><br>
                Fornecedor <input type="text" id='fornecedor' name="fornecedor"><br>
                Setor <input type="text" id='setor' name="setor"><br>
                Perecível <input type="text" id='perecivel' name="perecivel"><br>
            <input type="submit" name="altera" value="Editar">
            </form>
            </div>
            
        <table>
            <%  int qtd = 0;
            
                if(request.getParameter("qtd") != null || request.getParameter("pag") != null){ %>
            <tr>
                <th>ID PRODUTO</th>
                <th>NOME</th>
                <th>MARCA</th>
                <th>FORNECEDOR</th>
                <th>SETOR</th>
                <th>PERECÍVEL  </th>
                <th><input type="button" value="Cadastrar" style='width:70px;height:30px;' onClick='abrein()'></th>
                
            </tr> 
                
            </tr>    
            <% 
                
                try{
                 qtd = Integer.valueOf(request.getParameter("qtd"));
                }catch(Exception e){
                }

                if(listProduto!=null){
                    int i=0;
                    for(ProdutosBean pt: listProduto){
                        out.print("<tr><td>" + pt.getId()+ "</td><td>" + pt.getNome()+ "</td>");
                        out.print("<td style='white-space: nowrap;'>" + pt.getMarca()+ "</td><td style='white-space: nowrap;'>" + pt.getFornecedor()+ "</td>");
                        out.print("<td style='white-space: nowrap;'>" + pt.getSetor()+ "</td><td style='white-space: nowrap;'>" + pt.getPerecivel()+ "</td>");
                        out.print("<td style='white-space: nowrap; padding:10px'><input style='padding:3px' type='button' value='Editar' onClick='abre(\""+pt.getNome()+"\",\""+pt.getMarca()+"\",\""+pt.getFornecedor()+"\",\""+pt.getSetor()+"\",\""+pt.getPerecivel()+"\")'>"
                        + "<input type='button' style='padding:3px; margin-left:5px' value='X' onClick='deletar("+pt.getId()+")'></td></tr>");
                        i++;
                        if(i == qtd)
                            break;
                    }
                }
                }
               /** ProdutosDAO a = new ProdutosDAO();
                if(request.getParameter("buscar") == null)
                    for(int i = 1; a.pg() >= i ;i++)
                        out.print("<input type='button' style='width:25px; margin:5px' onClick='location.href=\""+request.getContextPath()+"/ProdutosServlet?pag="+i+"&qtd="+qtd+"\"' value='"+i+"'>");
                else
                     for(int i = 1; a.pgbsc(request.getParameter("buscar")) >= i ;i++)
                        out.print("<input type='button' style='width:25px; margin:5px' onClick='location.href=\""+request.getContextPath()+"/ProdutosServlet?buscar="+request.getParameter("buscar")+"&pag="+i+"&qtd="+qtd+"\"' value='"+i+"'>");
                 **/
             %> 
        </table>
    
    </div>
    
     <% }else{
            out.print("<h4>Usuário não logado!</h4>");
            out.print("<a href='" + request.getContextPath() + "/Exemplo_sessao/login.jsp'>Voltar</a>");
            }%>

        
    <div class="bott">
            <a> <br>® Mattax corporation  </a>
          
            
    </div>
    
    
    </body>
</html>
