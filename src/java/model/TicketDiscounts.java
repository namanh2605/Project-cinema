/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class TicketDiscounts {
    private int ticket_id;
    private Vouchers voucher_id;

    public TicketDiscounts() {
    }

    public TicketDiscounts(int ticket_id, Vouchers voucher_id) {
        this.ticket_id = ticket_id;
        this.voucher_id = voucher_id;
    }

    public int getTicket_id() {
        return ticket_id;
    }

    public void setTicket_id(int ticket_id) {
        this.ticket_id = ticket_id;
    }

    public Vouchers getVoucher_id() {
        return voucher_id;
    }

    public void setVoucher_id(Vouchers voucher_id) {
        this.voucher_id = voucher_id;
    }
    
    
}
