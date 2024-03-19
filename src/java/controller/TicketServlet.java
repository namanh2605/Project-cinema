/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CinemaDAO;
import dal.FilmDAO;
import dal.RoomDAO;
import dal.ShowtimeDAO;
import dal.TicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import model.Account;
import model.Cinema;
import model.Film;
import model.Room;
import model.Showtime;

/**
 *
 * @author admin
 */
public class TicketServlet extends HttpServlet {

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
            out.println("<title>Servlet TicketServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TicketServlet at " + request.getContextPath() + "</h1>");
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
        String cinemaIdStr = request.getParameter("cinemaId");
        String filmIdStr = request.getParameter("filmId");
        String showtimeIdStr = request.getParameter("showtimeId");
        String roomIdStr = request.getParameter("roomId");
        String selectedSeats = request.getParameter("selectedSeats");

        if (cinemaIdStr == null || filmIdStr == null || showtimeIdStr == null || roomIdStr == null) {
            // Xử lý khi một trong các tham số không tồn tại
            response.getWriter().println("One or more parameters are missing.");
            response.getWriter().println("cinemaIdStr: " + cinemaIdStr);
            response.getWriter().println("filmIdStr: " + filmIdStr);
            response.getWriter().println("showtimeIdStr: " + showtimeIdStr);
            response.getWriter().println("roomIdStr: " + roomIdStr);
            response.getWriter().println("selectedSeats: " + selectedSeats);
            return;
        }

        int cinemaId = Integer.parseInt(cinemaIdStr);
        int filmId = Integer.parseInt(filmIdStr);
        int showtimeId = Integer.parseInt(showtimeIdStr);
        int roomId = Integer.parseInt(roomIdStr);

        // Tạo các đối tượng DAO và lấy thông tin cần thiết từ cơ sở dữ liệu
        CinemaDAO cinemaDAO = new CinemaDAO();
        FilmDAO filmDAO = new FilmDAO();
        ShowtimeDAO showtimeDAO = new ShowtimeDAO();
        RoomDAO roomDAO = new RoomDAO();

        Cinema cinema = cinemaDAO.getCinemaById(cinemaId);
        Film film = filmDAO.getFilmById(filmId);
        Showtime showtime = showtimeDAO.getShowtimeByShowId(showtimeId);
        Room room = roomDAO.getRoomById(roomId);

        // Định dạng ngày trước khi đặt vào thuộc tính request
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String formattedDate = formatter.format(showtime.getDate());
        request.setAttribute("formattedDate", formattedDate);

        request.setAttribute("cinema", cinema);
        request.setAttribute("film", film);
        request.setAttribute("showtime", showtime);
        request.setAttribute("room", room);
        request.setAttribute("selectedSeats", selectedSeats);
        request.getRequestDispatcher("ticket.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");

    // Lấy showtimeId và selectedSeats từ request
     String showtimeIdStr = request.getParameter("showtimeId");
    String selectedSeats = request.getParameter("selectedSeats");

    // Kiểm tra xem username và showtimeId có tồn tại không
    if (username == null || showtimeIdStr == null || selectedSeats == null) {
        // Xử lý khi một trong các tham số không tồn tại
        // Ví dụ: hiển thị thông báo lỗi, chuyển hướng người dùng đến trang lỗi, vv.
        response.getWriter().println("Username or showtime ID is missing." + username + showtimeIdStr + selectedSeats);
        return;
    }

    // Chuyển đổi showtimeId từ String sang int
    int showtimeId = Integer.parseInt(showtimeIdStr);

    // Gọi phương thức thêm vé từ TicketDAO
    TicketDAO ticketDAO = new TicketDAO();
    boolean success = ticketDAO.addTicket(username, showtimeId, selectedSeats);

    // Kiểm tra và xử lý kết quả
    if (success) {
        // Nếu thêm vé thành công, chuyển hướng người dùng về trang chủ
        response.sendRedirect("home.jsp?success=true");
    } else {
        // Nếu thêm vé không thành công, hiển thị thông báo lỗi
        response.getWriter().println("Failed to add ticket." );
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
