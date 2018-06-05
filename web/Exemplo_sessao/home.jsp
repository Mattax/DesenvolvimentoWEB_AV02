<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ClientesDAO"%>
<%@page import="java.util.List"%>
<%@page import="bean.ClientesBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%=request.getContextPath()%>/css/estiloFormulario.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <script>
        function fecha(){
                document.getElementById("altera").style.display = "none";
        }
        function fechain(){
                document.getElementById("inclui").style.display = "none";
        } 
        function abre(nom,e,t,c,cpf){
            document.getElementById("altera").style.display = "block";
            document.getElementById("tx").value = nom;
            document.getElementById("end").value = e;
            document.getElementById("tel").value = t;
            document.getElementById("cel").value = c;
            document.getElementById("cpf").value = cpf;
            document.getElementById("tx").focus();
        }
        function abrein(){
            document.getElementById("inclui").style.display = "block";
            document.getElementById("tx").focus();
        }
        function deletar(id){
             var answer = confirm ("Deseja realmente excluir?");
                if (answer)
                    location.href="?apagar="+id;
        }
    </script>
    <body>
        <div class="topnav">
          <a class="active" href="home.jsp">Início</a>
          <a href="listar.jsp">Buscar</a>
          <a href="cadastrar.jsp">Cadastrar</a>
          <a href="editar.jsp">Editar</a>
          <a href="excluirpage.jsp">Excluir</a>
          <a href="sobre.jsp">Sobre</a>
          
          
        </div>
        <div id="geral">
        <% 
            if (session.getAttribute("login") != null) {
        %>
        <div id="usuario">
           <form name="frmLogout" method="post" action="<%=request.getContextPath()%>/LoginServlet">
                <input type="hidden" name="acao" value="logout" />
                <b><% out.print(session.getAttribute("login")); %></b>, Bem vindo!
                <br>
                <input type="submit" value="Logout" />
            </form>
        <%
               List<ClientesBean> listClient = (List<ClientesBean>) request.getAttribute("listClientes");
        %>
        </div>
        <div id="busca">
            <form action="<%=request.getContextPath()%>/ClienteServlet">
            Buscar:
            <input type ='text' name="buscar" placeholder="nome/telefone/endereco">            
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
            </form>
        </div>
            
            <div id="inclui">
            <button onClick="fechain()">X</button>
            <form action="<%=request.getContextPath()%>/ClienteServlet" name='inclui' method="post">
                Nome: <input type="text" id='inome' name="inome"><br>
                Endereço: <input type="text" id='iend' name="iend"><br>
                Telefone: <input type="text" id='itel' name="itel"><br>
                Celular: <input type="text" id='icel' name="icel"><br>
                CPF: <input type="text" id='icpf' name="icpf"><br>
            <input type="submit" name="incluir" value="incluir">
            </form>
            </div>
            
            
            
            <div id="altera">
            <button onClick="fecha()">X</button>
            <form action="<%=request.getContextPath()%>/ClienteServlet" name='alterar' method="Post">
                Nome: <input type="text" id="tx" name="alter"><br>
                Endereço: <input type="text" id='end' name="end"><br>
                Telefone: <input type="text" id='tel' name="tel"><br>
                Celular: <input type="text" id='cel' name="cel"><br>
                CPF: <input type="text" id='cpf' name="cpf"><br>
            <input type="submit" name="alterar" value="alterar">
            </form>
            </div>
            
            <div id="tabela">
        <table>
            <% int qtd = 0;
            
                if(request.getParameter("qtd") != null || request.getParameter("pag") != null){%>
            <tr>
                <td>NOME</td>
                <td>ENDEREÇO</td>
                <td>TELEFONE</td>
                <td>CELULAR</td>
                <td>CPF</td>
                <td><input type="button" value="+" style='width:50px;height:30px;' onClick='abrein()'></td>
            </tr>    
            <%
                
                try{
                 qtd = Integer.valueOf(request.getParameter("qtd"));
                }catch(Exception e){
                }

                if(listClient!=null){
                    int i=0;
                    for(ClientesBean ab: listClient){
                        out.print("<tr><td>" + ab.getNome()+ "</td><td>" + ab.getEndereco()+ "</td>");
                        out.print("<td style='white-space: nowrap;'>" + ab.getTelefone()+ "</td><td style='white-space: nowrap;'>" + ab.getCelular()+ "</td>");
                        out.print("<td style='white-space: nowrap;'>" + ab.getCpf()+ "</td>");
                        out.print("<td style='white-space: nowrap; padding:10px'><input style='padding:3px' type='button' value='<>' onClick='abre(\""+ab.getNome()+"\",\""+ab.getEndereco()+"\",\""+ab.getTelefone()+"\",\""+ab.getCelular()+"\",\""+ab.getCpf()+"\")'>"
                        + "<input type='button' style='padding:3px; margin-left:5px' value='X' onClick='deletar("+ab.getId()+")'></td></tr>");
                        i++;
                        if(i == qtd)
                            break;
                    }
                }
                }
                ClientesDAO a = new ClientesDAO();
                if(request.getParameter("buscar") == null)
                    for(int i = 1; a.pg() >= i ;i++)
                        out.print("<input type='button' style='width:25px; margin:5px' onClick='location.href=\""+request.getContextPath()+"/ClienteServlet?pag="+i+"&qtd="+qtd+"\"' value='"+i+"'>");
                else
                     for(int i = 1; a.pgbsc(request.getParameter("buscar")) >= i ;i++)
                        out.print("<input type='button' style='width:25px; margin:5px' onClick='location.href=\""+request.getContextPath()+"/ClienteServlet?buscar="+request.getParameter("buscar")+"&pag="+i+"&qtd="+qtd+"\"' value='"+i+"'>");
                
            %> 
        </table>
        
        </div>
        <% }else{
            out.print("<h4>Usuário não logado!</h4>");
            out.print("<a href='" + request.getContextPath() + "/Exemplo_sessao/login.jsp'>Voltar</a>");
        }%>

        </div>
        </div>
        
        
         <div class="bott">
             <a> <br>® Mattax corporation  </a>
         </div>
        
        
    </body>
</html>
