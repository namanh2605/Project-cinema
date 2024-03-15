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

    public static void main(String[] args) {
        SeatDAO d = new SeatDAO();
        System.out.println(d.getSeatsByRoomId(2));
    }
}
