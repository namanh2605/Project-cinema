/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Ticket {
     private int ticketId;
    private int showtimeId;
    private int seatId;
    private String customerId;
    private Showtime showtime;
    private Room room;
    private Seat seat;
    private String bookingDate;
    private Film film;
    private double price;
    private Cinema cinema;

    public Ticket() {
    }

    public Ticket(int ticketId, int showtimeId, int seatId, String customerId) {
        this.ticketId = ticketId;
        this.showtimeId = showtimeId;
        this.seatId = seatId;
        this.customerId = customerId;
    }

    public Ticket(int ticketId, int showtimeId, int seatId, String customerId, String code, Showtime showtime, Room room, Seat seat, String bookingDate) {
        this.ticketId = ticketId;
        this.showtimeId = showtimeId;
        this.seatId = seatId;
        this.customerId = customerId;
        this.showtime = showtime;
        this.room = room;
        this.seat = seat;
        this.bookingDate = bookingDate;
    }
    

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public int getShowtimeId() {
        return showtimeId;
    }

    public void setShowtimeId(int showtimeId) {
        this.showtimeId = showtimeId;
    }

    public int getSeatId() {
        return seatId;
    }

    public void setSeatId(int seatId) {
        this.seatId = seatId;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

   
 public Showtime getShowtime() {
        return showtime;
    }

    public void setShowtime(Showtime showtime) {
        this.showtime = showtime;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }
     public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Seat getSeat() {
        return seat;
    }

    public void setSeat(Seat seat) {
        this.seat = seat;
    }

    public String getBookingDate() {
        return bookingDate;
    }
    

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }
    public Film getFilm(){
    return film;
    }
    public void setFilm(Film film){
    this.film = film;
    }
    public Cinema getCinema(){
    return cinema;
    }
    public void setCinema(Cinema cinema){
    this.cinema = cinema;
    }
    
}
