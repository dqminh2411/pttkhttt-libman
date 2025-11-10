package pttkhttt.libman.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pttkhttt.libman.dao.LibraryCardDAO;
import pttkhttt.libman.model.LibraryCard;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "LibraryCardServlet", urlPatterns = {"/card/*"})
public class LibraryCardServlet extends HttpServlet {
        private LibraryCardDAO libraryCardDAO;

        public void init(){
                libraryCardDAO = new LibraryCardDAO();
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
        String action = request.getPathInfo();
        if (action == null) {
            action = "/";
        }else if(action.equals("/search")){
            String cardId = request.getParameter("cardId");
            List<LibraryCard> result;
            if (cardId != null && !cardId.isEmpty()) {
                result = libraryCardDAO.searchCards(cardId);
            } else {
                result = java.util.Collections.emptyList();
            }
            ObjectMapper mapper = new ObjectMapper();
            mapper.findAndRegisterModules();
//            String json = mapper.writeValueAsString(result);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
//            response.getWriter().write(json);
            mapper.writeValue(response.getWriter(), result);
            return;
           
        }
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
        
    }



}