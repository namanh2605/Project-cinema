/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.FilmDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import model.Film;

/**
 *
 * @author admin
 */
public class UpdateFilmServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateFilmServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateFilmServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        int filmId = Integer.parseInt(request.getParameter("filmId"));
        FilmDAO d = new FilmDAO();
        Film film = d.getFilmById(filmId);
        request.setAttribute("film", film);
        request.getRequestDispatcher("updateFilm.jsp").forward(request, response);
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
        int filmId = Integer.parseInt(request.getParameter("filmId"));
        String filmName = request.getParameter("filmName");
        int duration = Integer.parseInt(request.getParameter("duration"));
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        String trailer = request.getParameter("trailer");
        int genreId = Integer.parseInt(request.getParameter("genreId"));
        String director = request.getParameter("director");
        String cast = request.getParameter("cast");
        Date releaseDate = Date.valueOf(request.getParameter("releaseDate")); // Chú ý: Đây là cách đơn giản, không an toàn cho tất cả các định dạng ngày, bạn nên xử lý ngoại lệ và kiểm tra ngày đầu vào
        String ageRating = request.getParameter("ageRating");
        FilmDAO d = new FilmDAO();
         boolean updateSuccess = d.updateFilmById(filmId, filmName, duration, description, image, trailer, genreId, director, cast, releaseDate, ageRating);

        if (updateSuccess) {
            // Nếu cập nhật thành công, chuyển hướng về trang admin.jsp và gửi thông báo thành công
            response.sendRedirect("admin.jsp?updateSuccess=true");
        } else {
            // Nếu không cập nhật được, chuyển hướng về trang admin.jsp và gửi thông báo không thành công
            response.sendRedirect("admin.jsp?updateSuccess=false");
        }
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
