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
public class SeatBookings {
     private int booking_id;
    private Showtimes showtime_id;
    private char row_char;
    private int seat_number;
    private Members member_id;
    private Date booking_time;

    public SeatBookings() {
    }

    public SeatBookings(int booking_id, Showtimes showtime_id, char row_char, int seat_number, Members member_id, Date booking_time) {
        this.booking_id = booking_id;
        this.showtime_id = showtime_id;
        this.row_char = row_char;
        this.seat_number = seat_number;
        this.member_id = member_id;
        this.booking_time = booking_time;
    }

    public int getBooking_id() {
        return booking_id;
    }

    public void setBooking_id(int booking_id) {
        this.booking_id = booking_id;
    }

    public Showtimes getShowtime_id() {
        return showtime_id;
    }

    public void setShowtime_id(Showtimes showtime_id) {
        this.showtime_id = showtime_id;
    }

    public char getRow_char() {
        return row_char;
    }

    public void setRow_char(char row_char) {
        this.row_char = row_char;
    }

    public int getSeat_number() {
        return seat_number;
    }

    public void setSeat_number(int seat_number) {
        this.seat_number = seat_number;
    }

    public Members getMember_id() {
        return member_id;
    }

    public void setMember_id(Members member_id) {
        this.member_id = member_id;
    }

    public Date getBooking_time() {
        return booking_time;
    }

    public void setBooking_time(Date booking_time) {
        this.booking_time = booking_time;
    }

    
    
   
}
