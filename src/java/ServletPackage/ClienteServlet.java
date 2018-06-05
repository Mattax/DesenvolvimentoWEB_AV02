/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletPackage;


import DAO.ClientesDAO;
import bean.ClientesBean;
import java.io.IOException;
import static java.lang.System.out;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Leandro
 */
public class ClienteServlet extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * 
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            
            response.setContentType("text/html;charset=UTF-8");
            int pag=0;
            if(request.getParameter("pag") != null){
                int pagina = Integer.valueOf(request.getParameter("pag"));
                for(int i=1;pagina>i;i++){
                    pag += 7;
                    i++;
                }
            }else{
                pag = 1;
            }
            
            
            if(request.getParameter("buscar") == null){       
                ClientesDAO ad = new ClientesDAO();
                List<ClientesBean> listBean = ad.read(pag);
                request.setAttribute("listClientes", listBean);
            }else{
                ClientesDAO ad = new ClientesDAO();
                List<ClientesBean> listBean = ad.buscar(pag,request.getParameter("buscar"));
                request.setAttribute("listClientes", listBean);
            }
            
            if(request.getParameter("apagar") != null){
                    int s = Integer.valueOf(request.getParameter("apagar"));
                    ClientesDAO ab = new ClientesDAO();
                    ab.delete(s);
            }
            if(request.getParameter("alterar") != null){
                    ClientesBean s = new ClientesBean(request.getParameter("alter"),request.getParameter("end"),request.getParameter("tel"),request.getParameter("cel"),request.getParameter("cpf"));
                    ClientesDAO ab = new ClientesDAO();
                    ab.update(s);
            }
            if(request.getParameter("incluir") != null){
                    ClientesBean i = new ClientesBean(request.getParameter("inome"),request.getParameter("iend"),request.getParameter("itel"),request.getParameter("icel"),request.getParameter("icpf"));
                    ClientesDAO a = new ClientesDAO();
                    a.insert(i);
            }
            
            
            request.getRequestDispatcher("Exemplo_sessao/home.jsp").forward(request, response);            
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
