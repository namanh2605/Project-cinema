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
        String roomIdStr = request.getParameter("roomId");
        int roomId = 0;
        if (roomIdStr != null && !roomIdStr.isEmpty()) {
            try {
                roomId = Integer.parseInt(roomIdStr);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        SeatDAO d = new SeatDAO();
        List<Seat> seats = d.getSeatsByRoomId(roomId);

        // Kiểm tra nếu request có chứa parameter "selectedSeats"
        String[] selectedSeats = request.getParameterValues("selectedSeats");
        if (selectedSeats != null) {
            // Lặp qua các ghế đã chọn và cập nhật trạng thái của chúng trong cơ sở dữ liệu
            for (String seatIdStr : selectedSeats) {
                int seatId = Integer.parseInt(seatIdStr);
                d.updateSeatOccupancy(seatId, true); // Cập nhật trạng thái ghế đã chọn
            }
        }

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
