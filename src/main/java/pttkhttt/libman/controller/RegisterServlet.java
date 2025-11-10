package pttkhttt.libman.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pttkhttt.libman.dao.LibraryCardDAO;
import pttkhttt.libman.model.LibraryCard;
import pttkhttt.libman.model.LibraryCardStatus;
import pttkhttt.libman.model.Member;
import pttkhttt.libman.model.Reader;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    private LibraryCardDAO libraryCardDAO;
    public void init(){
        this.libraryCardDAO = new LibraryCardDAO();
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
        LocalDate now = LocalDate.now();
        Reader r = new Reader(
                (String)request.getParameter("fullname"),
                (String)request.getParameter("email"),
                (String)request.getParameter("address"),
                now,
                (String) request.getParameter("username"),
                BCrypt.hashpw((String) request.getParameter("password"), BCrypt.gensalt(12))
        );
        LibraryCard lc = new LibraryCard("C0001", 10, LibraryCardStatus.ACTIVE.toString(), now, r,0);
        libraryCardDAO.addReader(lc);
    }



}