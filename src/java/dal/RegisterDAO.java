/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author admin
 */
public class RegisterDAO extends DBContext{
        //boolean tránh trường hợp trùng email
     public boolean registerMember(String username, String email, String password) {
        String sql = "INSERT INTO Members (username, email, password, points) VALUES (?, ?, ?, 0)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }
     public static void main(String[] args) {
        RegisterDAO d = new RegisterDAO();
         System.out.println(d.registerMember("ducanh2605","ducanh2605@gmail.com", "123"));
    }
}
