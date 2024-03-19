/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package model;

import java.text.DecimalFormat;

/**
 *
 * @author admin
 */
public class CurrencyFormatter {
    public String format(double amount) {
        // Logic để định dạng số tiền và thêm ký hiệu tiền tệ
        DecimalFormat formatter = new DecimalFormat("#,##0.00");
        return formatter.format(amount) + " VND"; // Thêm ký hiệu tiền tệ "VND" sau số tiền
    }
}
