package pttkhttt.libman.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pttkhttt.libman.dao.*;
import pttkhttt.libman.dao.LibraryCardDAO;
import pttkhttt.libman.model.*;
import pttkhttt.libman.model.Librarian;

import java.io.IOException;
import java.time.LocalDate;
import java.util.*;

@WebServlet(name = "BorrowDocumentServlet", urlPatterns = {"/librarian/borrow-doc/*"})
public class BorrowDocumentServlet extends HttpServlet {

    private final LibraryCardDAO libraryCardDAO;
    private final BorrowSlipDAO borrowSlipDAO;
    private final DocumentDAO documentDAO;
    public BorrowDocumentServlet() {
        this.libraryCardDAO = new LibraryCardDAO();
        this.borrowSlipDAO = new BorrowSlipDAO();
        this.documentDAO = new DocumentDAO();
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();
        if(action == null) action = "/";
        if(action.equals("/")){
            request.getRequestDispatcher("/librarian/LendDocument.jsp").forward(request, response);
        }else if(action.equals("/slip")){
            request.getRequestDispatcher("/librarian/BorrowSlipInfo.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();
        if(action == null) action = "/";
        if(action.equals("/")){
            // Handle form submission for borrowing documents
            String cardId = request.getParameter("cardId");
            String[] itemIds = request.getParameterValues("itemIds");
            String borrowDate = request.getParameter("borrowDate");
            String dueDate = request.getParameter("dueDate");

            Librarian librarian = (Librarian) request.getSession().getAttribute("librarian");

            LibraryCard lc = libraryCardDAO.getLibraryCardById(cardId);

            BorrowSlip bs = new BorrowSlip(LocalDate.parse(borrowDate),LocalDate.parse(dueDate),lc,librarian);


            List<BorrowedItem> borrowedItems = new ArrayList<>();
            for (int i=0; i<itemIds.length; i++ ) {
                Item item = documentDAO.getItemById(itemIds[i]);
                BorrowedItem bi = new BorrowedItem(bs, item);
                borrowedItems.add(bi);
            }
            bs = borrowSlipDAO.saveBorrowSlip(bs, borrowedItems);
            if(bs != null){
                request.getSession().setAttribute("borrowDate", bs.getBorrowDate().format(java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy")));
                request.getSession().setAttribute("dueDate", bs.getDueDate().format(java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy")));
                request.getSession().setAttribute("borrowSlip", bs);
                request.getSession().setAttribute("borrowedItems", borrowedItems);
                response.sendRedirect(request.getContextPath() + "/librarian/borrow-doc/slip");
            }
        }
    }


}