package pttkhttt.libman.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pttkhttt.libman.dao.DocumentDAO;
import pttkhttt.libman.model.Document;
import pttkhttt.libman.model.Item;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "DocumentServlet", urlPatterns = {"/document/*"})
public class DocumentServlet extends HttpServlet {
    private DocumentDAO documentDAO;
    public void init(){
        this.documentDAO = new DocumentDAO();
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
        if(action == null || action.equals("/")){
            request.setAttribute("total", 0);
            request.getRequestDispatcher("/reader/ReaderSearchDoc.jsp").forward(request, response);
        }
        else if(action.equals("/search")){
            String pageParam = request.getParameter("page");
            String pageSizeParam = request.getParameter("pageSize");
            String key = request.getParameter("key");
            String status = "";

            int page = 1;
            int pageSize = 10;
            if(pageParam != null){
                page = Integer.parseInt(pageParam);
            }
            if(pageSizeParam != null){
                pageSize = Integer.parseInt(pageSizeParam);
            }
            int total = documentDAO.getTotalSearchResult(key);
            List<Document> documents = documentDAO.searchDocuments(key, page, pageSize);
            request.setAttribute("documents", documents);
            request.setAttribute("totalResults", total);
            request.setAttribute("curPage", page);
            request.setAttribute("totalPages", (total + pageSize - 1)/pageSize);
            request.setAttribute("key", key);
            request.getRequestDispatcher("/reader/ReaderSearchDoc.jsp").forward(request, response);

        }else if(action.equals("/detail")){
            Document d = documentDAO.getDocumentById(request.getParameter("id"));
            request.setAttribute("doc", d);
            request.getRequestDispatcher("/reader/ReaderDetailedDoc.jsp").forward(request, response);
        }else if(action.equals("/item/search")){
            String id = request.getParameter("q");
            List<Item> items = documentDAO.getDocumentItemsByDocOrItemId(id);
            String json = new com.google.gson.Gson().toJson(items);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
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