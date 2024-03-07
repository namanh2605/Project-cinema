/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
/**
 *
 * @author admin
 */
public class GenreDAO extends DBContext{
    public String getGenreNameById(int genreId) {
    String genreName = null;
    String sql = "SELECT genre_name FROM genre WHERE genre_id = ?";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, genreId);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                genreName = rs.getString("genre_name");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return genreName;
}
}
