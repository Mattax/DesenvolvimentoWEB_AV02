/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletPackage;


import DAO.ProdutosDAO;
import bean.ProdutosBean;
import java.io.IOException;

import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ProdutosServlet extends HttpServlet {
    
 
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
           String teste = request.getParameter("buscar");
            
            if(request.getParameter("buscar") == ""){       
                ProdutosDAO ad = new ProdutosDAO();
                List<ProdutosBean> listBean = ad.read(pag);
                request.setAttribute("listProduto", listBean);
            }else{
                 ProdutosDAO ad = new ProdutosDAO();
                List<ProdutosBean> listBean = ad.buscar(pag,request.getParameter("buscar"));
                request.setAttribute("listProduto", listBean);
            }
            
            if(request.getParameter("apagar") != null){
                    int s = Integer.valueOf(request.getParameter("apagar"));
                    ProdutosDAO ab = new ProdutosDAO();
                    ab.delete(s);
            }
            if(request.getParameter("alterar") != null){
                    ProdutosBean s = new ProdutosBean(request.getParameter("id"),request.getParameter("alter"),request.getParameter("end"),request.getParameter("tel"),request.getParameter("cel"),request.getParameter("cpf"));
                    ProdutosDAO ab = new ProdutosDAO();
                    ab.update(s);
            }
            if(request.getParameter("incluir") != null){
                    ProdutosBean i = new ProdutosBean(request.getParameter("idi"),request.getParameter("inome"),request.getParameter("iend"),request.getParameter("itel"),request.getParameter("icel"),request.getParameter("icpf"));
                    ProdutosDAO a = new ProdutosDAO();
                    a.insert(i);
            }
            
            
            request.getRequestDispatcher("Exemplo_sessao/listar.jsp").forward(request, response);            
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
