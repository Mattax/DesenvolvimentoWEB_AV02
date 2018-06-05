<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
    
         <link href="<%=request.getContextPath()%>/css/estiloFormulario.css" rel="stylesheet" type="text/css"/>

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
        <div class="content">
        <h1>Mattax Corporation</h1>
        <h2>Sistemas</h2>
        <br><br><br>
        Nos contate para maiores informações, podemos criar um WEB SITE<br>
        com sistema integrado para você e sua empresa.<br>
        @facebook/MattaxComporation<br>
        @twitter/Mattaxcomporarion
        </div>
        <div class="bott">
            <a> <br>® Mattax corporation  </a>
        </div>

    </body>
</html>
