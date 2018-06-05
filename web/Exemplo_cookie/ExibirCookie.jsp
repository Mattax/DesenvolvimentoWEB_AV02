<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %> 
<%
    String cooNome = "nomeDoUsuario";
    Cookie cookies[] = request.getCookies();
    Cookie exemploCookieNome = null;
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals(cooNome)) {
                exemploCookieNome = cookies[i];
                break;
            }
        }
    }
%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
 
        <%
            if (exemploCookieNome == null) {
                out.println("Nao foi encontrado cookie com o nome: <b>"
                        + cooNome + "</b>");
            } else {
                out.println("Seja bem vindo: " + exemploCookieNome.getValue());
            }
        %> 
    </body>
</html>