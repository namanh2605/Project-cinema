/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Showtime;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

/**
 *
 * @author admin
 */
public class ShowtimeDAO extends DBContext {

    public List<Showtime> getShowtimesByFilmId(int filmId) {
        List<Showtime> showtimes = new ArrayList<>();
        String sql = "SELECT * FROM showtime WHERE film_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, filmId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Showtime showtime = new Showtime();
                    // Đọc thông tin từ ResultSet và thiết lập cho đối tượng Showtime
                    showtime.setShowtimeId(rs.getInt("showtime_id"));
                    showtime.setFilmId(rs.getInt("film_id"));
                    showtime.setRoomId(rs.getInt("room_id"));
                    showtime.setDate(rs.getDate("date"));
                    showtime.setStartTime(rs.getTime("start_time"));
                    showtime.setTicketPrice(rs.getInt("ticket_price"));
                    // Thêm showtime vào danh sách
                    showtimes.add(showtime);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return showtimes;
    }

    public static void main(String[] args) {
        ShowtimeDAO d = new ShowtimeDAO();
        System.out.println(d.getShowtimesByFilmId(2));
    }
}
