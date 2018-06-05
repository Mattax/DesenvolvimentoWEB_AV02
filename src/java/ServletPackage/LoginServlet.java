
package ServletPackage;

import br.com.ConexaoBanco.ConexaoMySQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

                    // Por default chamarei a pagina index e passarei o parametro erro=1
        String pagina = request.getContextPath()+"/Exemplo_sessao/login.jsp?erro=1";
  
        String oAcao = request.getParameter("acao");
 
        
    Connection conexao = ConexaoMySQL.getConexaoMySQL();
    ArrayList list = new ArrayList();
        try{
        PreparedStatement ps = conexao.prepareStatement("select * from usuarios where nome = '"+request.getParameter("login")+"' AND pwd = MD5('"+request.getParameter("senha")+"');");
        ResultSet resultSet = ps.executeQuery();
        while(resultSet.next()){
            list.add(resultSet.getString("nome"));
        }
        }catch(SQLException e){}
        
        
        if (list.size() > 0) {
            HttpSession sessao = request.getSession();
            sessao.setAttribute("login", request.getParameter("login"));
            pagina = request.getContextPath()+"/Exemplo_sessao/home.jsp";
        } else if (oAcao.equals("logout")) {
            HttpSession sessao = request.getSession();
            sessao.invalidate();
            pagina = request.getContextPath()+"/Exemplo_sessao/login.jsp";
        }

        response.sendRedirect(pagina);
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
