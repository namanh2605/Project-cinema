/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Ticket;
import java.sql.ResultSet;
import java.sql.Date;
import model.Film;
import model.Room;
import model.Showtime;
import java.sql.Time;
import java.util.HashMap;
import java.util.Map;
import model.Cinema;
import model.Seat;

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

    public List<Ticket> getTicketsByCustomerId(String customerId) {
        List<Ticket> ticketList = new ArrayList<>();
        String sql = "SELECT t.ticket_id, t.showtime_id, t.seat_id, s.date, s.start_time, r.room_name, f.film_name, s.room_id, s.film_id, se.seat_name, c.cinema_name "
                + "FROM ticket t "
                + "JOIN showtime s ON t.showtime_id = s.showtime_id "
                + "JOIN room r ON s.room_id = r.room_id "
                + "JOIN film f ON s.film_id = f.film_id "
                + "JOIN seat se ON t.seat_id = se.seat_id "
                + "JOIN cinema c ON r.cinema_id = c.cinema_id " // Join bảng cinema để lấy cinema_name
                + "WHERE t.customer_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, customerId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int ticketId = rs.getInt("ticket_id");
                    int showtimeId = rs.getInt("showtime_id");
                    int seatId = rs.getInt("seat_id");
                    Date date = rs.getDate("date");
                    Time startTime = rs.getTime("start_time");
                    String roomName = rs.getString("room_name");
                    String filmName = rs.getString("film_name");
                    int roomId = rs.getInt("room_id");
                    int filmId = rs.getInt("film_id");
                    String seatName = rs.getString("seat_name");
                    String cinemaName = rs.getString("cinema_name"); // Lấy cinema_name từ kết quả truy vấn

                    Ticket ticket = new Ticket(ticketId, showtimeId, seatId, customerId);

                    Showtime showtime = new Showtime();
                    showtime.setDate(date);
                    showtime.setStartTime(startTime);
                    showtime.setRoomId(roomId);
                    showtime.setFilmId(filmId);

                    Room room = new Room();
                    room.setRoomName(roomName);

                    Seat seat = new Seat();
                    seat.setSeatId(seatId);
                    seat.setSeatName(seatName);

                    Film film = new Film();
                    film.setFilmName(filmName);

                    Cinema cinema = new Cinema();
                    cinema.setCinemaName(cinemaName);

                    ticket.setFilm(film);
                    ticket.setShowtime(showtime);
                    ticket.setRoom(room);
                    ticket.setSeat(seat);
                    ticket.setCinema(cinema); // Thiết lập cinema_name

                    ticketList.add(ticket);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ticketList;
    }

   public List<Ticket> getAllTickets() {
    List<Ticket> tickets = new ArrayList<>();
    String sql = "SELECT t.ticket_id, t.showtime_id, t.seat_id, t.customer_id, s.ticket_price, f.film_name \n"
               + "FROM ticket t \n"
               + "JOIN showtime s ON t.showtime_id = s.showtime_id \n"
               + "JOIN film f ON s.film_id = f.film_id";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ResultSet rs = ps.executeQuery();
        Map<String, Double> filmRevenueMap = new HashMap<>();
        while (rs.next()) {
            String filmName = rs.getString("film_name");
            Double ticketPrice = rs.getDouble("ticket_price");
            // Tính tổng doanh thu cho mỗi bộ phim
            filmRevenueMap.put(filmName, filmRevenueMap.getOrDefault(filmName, 0.0) + ticketPrice);
        }
        // Tạo đối tượng Ticket cho mỗi bộ phim và tổng doanh thu của nó
        for (String filmName : filmRevenueMap.keySet()) {
            Ticket ticket = new Ticket();
            Film film = new Film();
            film.setFilmName(filmName);
            ticket.setFilm(film);
            ticket.setPrice(filmRevenueMap.get(filmName));
            tickets.add(ticket);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return tickets;
}

    public static void main(String[] args) {
        TicketDAO d = new TicketDAO();
        System.out.println(d.getAllTickets());
    }
}
