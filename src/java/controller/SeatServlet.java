/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.SeatDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

import model.Seat;

/**
 *
 * @author admin
 */
public class SeatServlet extends HttpServlet {

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
            out.println("<title>Servlet SeatServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SeatServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession sessionObj = request.getSession(); // Lấy hoặc tạo một session
        String cinemaId = request.getParameter("cinemaId");
        String filmId = request.getParameter("filmId");
        String showtimeId = request.getParameter("showtimeId");
        String roomId = request.getParameter("roomId");
        String selectedSeatsStr = request.getParameter("selectedSeatsString");
        sessionObj.setAttribute("cinemaId", cinemaId);
        sessionObj.setAttribute("filmId", filmId);
        sessionObj.setAttribute("showtimeId", showtimeId);
        sessionObj.setAttribute("roomId", roomId);
        sessionObj.setAttribute("selectedSeatsStr", selectedSeatsStr);
        
        SeatDAO d = new SeatDAO();
        List<Seat> seats = d.getSeatsByRoomId(Integer.parseInt(roomId));

        request.setAttribute("seats", seats);
        request.getRequestDispatcher("bookseat.jsp").forward(request, response);

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
         PrintWriter out = response.getWriter();
        String cinemaId = request.getParameter("cinemaId");
        String filmId = request.getParameter("filmId");
        String showtimeId = request.getParameter("showtimeId");
        String roomId = request.getParameter("roomId");
        String selectedSeatsStr = request.getParameter("selectedSeatsString");

        if (selectedSeatsStr != null && !selectedSeatsStr.isEmpty()) {
            String[] selectedSeatsArray = selectedSeatsStr.split(",");
            updateSeatOccupancy(selectedSeatsArray);
            String redirectUrl = "ticket?cinemaId=" + cinemaId + "&filmId=" + filmId + "&showtimeId=" + showtimeId + "&roomId=" + roomId + "&selectedSeats=" + selectedSeatsStr;
        response.sendRedirect(redirectUrl);
        } else {
            out.print("No seats selected.");
        }
    }

    private void updateSeatOccupancy(String[] selectedSeatsArray) {
        SeatDAO seatDAO = new SeatDAO();
        for (String seatIdStr : selectedSeatsArray) {
            int seatId = Integer.parseInt(seatIdStr);
            seatDAO.updateSeatOccupancy(seatId, true);
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
