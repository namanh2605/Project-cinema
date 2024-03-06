/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author admin
 */
public class Showtime {
    private int showtimeId;
    private int filmId;
    private int roomId;
    private Date date;
    private Time startTime;
    private int ticketPrice;

    public Showtime() {
    }

    public Showtime(int showtimeId, int filmId, int roomId, Date date, Time startTime, int ticketPrice) {
        this.showtimeId = showtimeId;
        this.filmId = filmId;
        this.roomId = roomId;
        this.date = date;
        this.startTime = startTime;
        this.ticketPrice = ticketPrice;
    }

    public int getShowtimeId() {
        return showtimeId;
    }

    public void setShowtimeId(int showtimeId) {
        this.showtimeId = showtimeId;
    }

    public int getFilmId() {
        return filmId;
    }

    public void setFilmId(int filmId) {
        this.filmId = filmId;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public int getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(int ticketPrice) {
        this.ticketPrice = ticketPrice;
    }
    
    
}
