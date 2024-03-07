/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Cinema;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author admin
 */
public class CinemaDAO extends DBContext{
    public List<Cinema> getAllCinemas() {
        List<Cinema> cinemas = new ArrayList<>();
        String sql = "SELECT * FROM cinema";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Cinema cinema = new Cinema();
                    cinema.setCinemaId(rs.getInt("cinema_id"));
                    cinema.setCinemaName(rs.getString("cinema_name"));
                    cinema.setAddress(rs.getString("address"));
                    cinemas.add(cinema);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cinemas;
    }
    public Cinema getCinemaById(int cinemaId) {
    Cinema cinema = null;
    String sql = "SELECT * FROM cinema WHERE cinema_id = ?";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, cinemaId);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                cinema = new Cinema();
                cinema.setCinemaId(rs.getInt("cinema_id"));
                cinema.setCinemaName(rs.getString("cinema_name"));
                cinema.setAddress(rs.getString("address"));
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return cinema;
}
    public static void main(String[] args) {
        CinemaDAO d = new CinemaDAO();
        System.out.println(d.getCinemaById(1).getCinemaName());
    }
}
