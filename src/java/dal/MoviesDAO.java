package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Movies;

/**
 *
 * @author admin
 */
public class MoviesDAO extends DBContext {

    public List<Movies> PlayingMovies() {
        List<Movies> movies = new ArrayList<>();
        String sql = "Select * from Movies";
        try (
                PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery();) {
            while (rs.next()) {
                Movies movie = new Movies();
                movie.setMovie_id(rs.getInt("movie_id"));
                movie.setTitle(rs.getString("title"));
                movie.setDirector(rs.getString("director"));
                movie.setGenre(rs.getString("genre"));
                movie.setPoster(rs.getString("poster"));
                movie.setRelease_date(rs.getDate("release_date")); // Đọc giá trị release_date từ ResultSet
                movie.setTrailerLink(rs.getString("trailerLink"));
                movies.add(movie);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return movies;
    }

    public Movies getMovieById(String movieId) {
        Movies movie = null;
        String query = "SELECT * FROM Movies WHERE movie_id = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, movieId);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    movie = new Movies();
                    movie.setMovie_id(rs.getInt("movie_id"));
                    movie.setTitle(rs.getString("title"));
                    movie.setGenre(rs.getString("genre"));
                    movie.setPoster(rs.getString("poster"));
                    movie.setRelease_date(rs.getDate("release_date"));
                    movie.setDirector(rs.getString("director"));
                    movie.setTrailerLink(rs.getString("trailerLink"));
                    //Thêm các thông tin khác tương ứng với cột trong bảng Movies
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return movie;
    }
    

    public static void main(String[] args) {
        MoviesDAO d = new MoviesDAO();
        System.out.println(d.getMovieById("1").getPoster());
    }
}
