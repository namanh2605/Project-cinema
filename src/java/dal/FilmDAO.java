/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Film;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Date;

/**
 *
 * @author admin
 */
public class FilmDAO extends DBContext {

    public List<Film> getAllFilms() {
        List<Film> films = new ArrayList<>();
        String sql = "SELECT * FROM film";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Film film = new Film();
                film.setFilmId(rs.getInt("film_id"));
                film.setFilmName(rs.getString("film_name"));
                film.setDuration(rs.getInt("duration"));
                film.setDescription(rs.getString("description"));
                film.setImage(rs.getString("image"));
                film.setTrailer(rs.getString("trailer"));
                film.setGenreId(rs.getInt("genre_id"));
                film.setDirector(rs.getString("director"));
                film.setCast(rs.getString("cast"));
                film.setReleaseDate(rs.getDate("release_date"));
                film.setAgeRating(rs.getString("age_rating"));
                films.add(film);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return films;
    }

    public Film getFilmById(int filmId) {
        Film film = null;
        String sql = "SELECT * FROM film WHERE film_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, filmId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    film = new Film();
                    film.setFilmId(rs.getInt("film_id"));
                    film.setFilmName(rs.getString("film_name"));
                    film.setDuration(rs.getInt("duration"));
                    film.setDescription(rs.getString("description"));
                    film.setImage(rs.getString("image"));
                    film.setTrailer(rs.getString("trailer"));
                    film.setGenreId(rs.getInt("genre_id"));
                    film.setDirector(rs.getString("director"));
                    film.setCast(rs.getString("cast"));
                    film.setReleaseDate(rs.getDate("release_date"));
                    film.setAgeRating(rs.getString("age_rating"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return film;
    }

    public boolean deleteFilmById(int filmId) {
        String sql = "DELETE FROM film WHERE film_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, filmId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateFilmById(int filmId, String filmName, int duration, String description, String image, String trailer, int genreId, String director, String cast, Date releaseDate, String ageRating) {
        String sql = "UPDATE film SET film_name = ?, duration = ?, description = ?, image = ?, trailer = ?, genre_id = ?, director = ?, cast = ?, release_date = ?, age_rating = ? WHERE film_id = ?";
        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, filmName);
            ps.setInt(2, duration);
            ps.setString(3, description);
            ps.setString(4, image);
            ps.setString(5, trailer);
            ps.setInt(6, genreId);
            ps.setString(7, director);
            ps.setString(8, cast);
            ps.setDate(9, releaseDate);
            ps.setString(10, ageRating);
            ps.setInt(11, filmId);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean addFilm(String filmName, int duration, String description, String image, String trailer, int genreId, String director, String cast, Date releaseDate, String ageRating) {
    try (
         PreparedStatement ps = connection.prepareStatement("INSERT INTO film (film_name, duration, description, image, trailer, genre_id, director, cast, release_date, age_rating) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {
        // Thiết lập các tham số cho câu lệnh SQL
        ps.setString(1, filmName);
        ps.setInt(2, duration);
        ps.setString(3, description);
        ps.setString(4, image);
        ps.setString(5, trailer);
        ps.setInt(6, genreId);
        ps.setString(7, director);
        ps.setString(8, cast);
        ps.setDate(9, releaseDate);
        ps.setString(10, ageRating);

        // Thực thi câu lệnh SQL
        int rowsAffected = ps.executeUpdate();

        return rowsAffected > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}

    public static void main(String[] args) {
        FilmDAO d = new FilmDAO();
        System.out.println(d.getAllFilms());
    }
}
