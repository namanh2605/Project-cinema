/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Vouchers {
    private int voucher_id;
    private String code;
    private Double discount_percent;

    public Vouchers() {
    }

    public Vouchers(int voucher_id, String code, Double discount_percent) {
        this.voucher_id = voucher_id;
        this.code = code;
        this.discount_percent = discount_percent;
    }

    public int getVoucher_id() {
        return voucher_id;
    }

    public void setVoucher_id(int voucher_id) {
        this.voucher_id = voucher_id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Double getDiscount_percent() {
        return discount_percent;
    }

    public void setDiscount_percent(Double discount_percent) {
        this.discount_percent = discount_percent;
    }
    
    
}
