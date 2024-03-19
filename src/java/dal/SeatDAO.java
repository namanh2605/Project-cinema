/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Seat;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class SeatDAO extends DBContext {

    public List<Seat> getSeatsByRoomId(int roomId) {
        List<Seat> seats = new ArrayList<>();
        String sql = "SELECT * FROM seat WHERE room_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, roomId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Seat seat = new Seat();
                    seat.setSeatId(rs.getInt("seat_id"));
                    seat.setSeatName(rs.getString("seat_name"));
                    seat.setRow(rs.getInt("row"));
                    seat.setSeatColumn(rs.getInt("seat_column"));
                    seat.setRoomId(rs.getInt("room_id"));
                    seat.setIsOccupied(rs.getBoolean("isOccupied"));
                    seats.add(seat);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return seats;
    }

    public void updateSeatOccupancy(int seatId, boolean isOccupied) {
        String sql = "UPDATE seat SET isOccupied = ? WHERE seat_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setBoolean(1, isOccupied);
            ps.setInt(2, seatId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean areSeatsBooked(String[] seatIds) {
        boolean result = false;
        String sql = "SELECT COUNT(*) FROM Seats WHERE seatId = ? AND isOccupied = 1";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            for (String seatId : seatIds) {
                // Kiểm tra xem seatId có rỗng không
                if (!seatId.isEmpty()) {
                    // Chuyển đổi seatId thành số nguyên chỉ khi không rỗng
                    ps.setInt(1, Integer.parseInt(seatId));
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            int count = rs.getInt(1);
                            if (count > 0) {
                                result = true;
                                break; // Break the loop if any seat is booked
                            }
                        }
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Handle SQLException if any
        } catch (NumberFormatException ex) {
            ex.printStackTrace(); // Handle NumberFormatException if seatId is not a valid integer
        }

        return result;
    }

    public static void main(String[] args) {
        SeatDAO d = new SeatDAO();
        // Cập nhật trạng thái ghế và sau đó kiểm tra trạng thái mới của ghế đó
        d.updateSeatOccupancy(280, true);
    }
}
