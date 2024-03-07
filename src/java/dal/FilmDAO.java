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
    public static void main(String[] args) {
        FilmDAO d = new FilmDAO();
        System.out.println(d.getAllFilms());
    }
}
