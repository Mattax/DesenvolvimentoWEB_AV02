
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="<%=request.getContextPath()%>/css/estiloFormulario.css" rel="stylesheet" type="text/css"/>
        <title>Cadastrar</title>
    </head>
    <body> 
        <div class="topnav">
          <a class="active" href="homejsp">Início</a>
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
            String ra = request.getParameter("ra")==null?"":request.getParameter("ra");
            String nome = request.getParameter("nome")==null?"":request.getParameter("nome");
            String marca = request.getParameter("marca")==null?"":request.getParameter("marca");
            String fornecedor = request.getParameter("fornecedor")==null?"":request.getParameter("fornecedor");
            
            String sexo = request.getParameter("sexo")==null?"":request.getParameter("sexo");
           
            String setor = request.getParameter("setor")==null?"":request.getParameter("setor");
            String setor1 = (setor.equals("Comidass")?"selected":"");
            String setor2 = (setor.equals("Bebidas")?"selected":"");
            String setor3 = (setor.equals("Limpeza")?"selected":"");
            String setor4 = (setor.equals("Frios")?"selected":"");            
            
            String perecivel = request.getParameter("perecivel");
            if(perecivel!=null){
                perecivel = perecivel.equals("sim")?"checked":"";
            }else{
                perecivel = "não";
            }
            
        %>
        <div class="content"> 
        <h2>Cadastrar Produtos</h2>                                
                <form action="salvar.jsp" method="get">
                     <!--   RA: <input style="background-color: #dddddd;border:1px solid black;" type="text" name="ra" value="<%=ra%>" readonly/> Este campo é gerado pelo sistema!!!<br><br> -->
                        Nome : <input type="text" name="nome"  value="<%=nome%>"/><br><br>
                        Marca: <input type="text" name="marca"  value="<%=marca%>"/><br><br>
                        Fornecedor: <input type="text" name="fornecedor"  value="<%=fornecedor%>"/><br><br>
                        
                        Setor:  
                        <select name="setor">
                                <option <%=setor1%> value="Comidas">Comidas</option>
                                <option <%=setor2%> value="Bebidas">Bebidas</option>
                                <option <%=setor3%> value="Limpeza">Limpeza</option>
                                <option <%=setor4%> value="Frios e Laticíneos">Frios e Laticíneos</option>
                        </select>
                        <input type="checkbox" name="perecivel" <%=perecivel%> />Perecível<br><br>
                        <input type="submit" value="Cadastrar"/>                
                </form>
       </div>
        <div class="bott">
            <a> <br>® Mattax corporation  </a>
        </div>
    </body>
</html>
