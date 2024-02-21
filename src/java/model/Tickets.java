/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Tickets {
    private int ticket_id;
    private Showtimes showtime_id;
    private String seat_number;
    private Double price;

    public Tickets() {
    }

    public Tickets(int ticket_id, Showtimes showtime_id, String seat_number, Double price) {
        this.ticket_id = ticket_id;
        this.showtime_id = showtime_id;
        this.seat_number = seat_number;
        this.price = price;
    }

    public int getTicket_id() {
        return ticket_id;
    }

    public void setTicket_id(int ticket_id) {
        this.ticket_id = ticket_id;
    }

    public Showtimes getShowtime_id() {
        return showtime_id;
    }

    public void setShowtime_id(Showtimes showtime_id) {
        this.showtime_id = showtime_id;
    }

    public String getSeat_number() {
        return seat_number;
    }

    public void setSeat_number(String seat_number) {
        this.seat_number = seat_number;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    
}
