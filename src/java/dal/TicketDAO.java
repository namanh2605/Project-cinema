/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TicketDAO extends DBContext {

    public boolean addTicket(String customerId, int showtimeId, String selectedSeats) {
        // Tách chuỗi selectedSeats thành mảng các số ghế được chọn
        String[] seats = selectedSeats.split(",");

        // Lặp qua mỗi số ghế và thêm một bản ghi vào bảng ticket cho mỗi số ghế
        for (String seat : seats) {
            int seatId = Integer.parseInt(seat);
            String sql = "INSERT INTO ticket (customer_id, showtime_id, seat_id) VALUES (?, ?, ?)";
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, customerId);
                ps.setInt(2, showtimeId);
                ps.setInt(3, seatId);
                ps.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
                return false;
            }
        }
        return true; // Trả về true nếu tất cả các bản ghi được thêm thành công
    }

    public static void main(String[] args) {
        TicketDAO d = new TicketDAO();
    }
}
