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
    public BorrowDocumentServlet() {
        this.libraryCardDAO = new LibraryCardDAO();
        this.borrowSlipDAO = new BorrowSlipDAO();
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
            request.getRequestDispatcher("/librarian/LendBook.jsp").forward(request, response);
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
            int readerId = Integer.parseInt(request.getParameter("readerId"));
            String readerFullname = request.getParameter("readerFullname");
            String readerEmail = request.getParameter("readerEmail");

            String[] itemIds = request.getParameterValues("itemIds");
            String[] titles = request.getParameterValues("titles");
            String[] authors = request.getParameterValues("authors");
            String[] publishYears = request.getParameterValues("publishYears");


            String borrowDate = request.getParameter("borrowDate");
            String dueDate = request.getParameter("dueDate");

            Librarian librarian = (Librarian) request.getSession().getAttribute("librarian");

            BorrowSlip bs = new BorrowSlip();
            bs.setBorrowDate(LocalDate.parse(borrowDate));
            bs.setDueDate(LocalDate.parse(dueDate));
            bs.setLibrarian(librarian);

            Reader r = new Reader(readerId, readerFullname, readerEmail);
            LibraryCard lc = new LibraryCard(cardId, r);

            bs.setLibraryCard(lc);

            List<BorrowedItem> borrowedItems = new ArrayList<>();
            for (int i=0; i<itemIds.length; i++ ) {
                Document d = new Document(titles[i], authors[i], Integer.parseInt(publishYears[i]));
                Item item = new Item(itemIds[i], d);
                BorrowedItem borrowedItem = new BorrowedItem(bs, item);
                borrowedItems.add(borrowedItem);
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