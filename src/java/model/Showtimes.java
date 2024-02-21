/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author admin
 */
public class Showtimes {
    private int showtime_id;
    private Movies movie_id;
    private Date start_time;

    public Showtimes() {
    }

    public Showtimes(int showtime_id, Movies movie_id, Date start_time) {
        this.showtime_id = showtime_id;
        this.movie_id = movie_id;
        this.start_time = start_time;
    }

    public int getShowtime_id() {
        return showtime_id;
    }

    public void setShowtime_id(int showtime_id) {
        this.showtime_id = showtime_id;
    }

    public Movies getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(Movies movie_id) {
        this.movie_id = movie_id;
    }

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

}
