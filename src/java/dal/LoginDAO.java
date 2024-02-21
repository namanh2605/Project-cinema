/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Members;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author admin
 */
public class LoginDAO extends DBContext{
    public Members loginByEmail(String email, String password) {
        String sql = "SELECT * FROM Members WHERE email = ? AND password = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Members member = new Members();
                    member.setMember_id(rs.getInt("member_id"));
                    member.setUsername(rs.getString("username"));
                    member.setPassword(rs.getString("password"));
                    member.setPoints(rs.getInt("points"));
                    return member;
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }
    public static void main(String args[]){
    LoginDAO d = new LoginDAO();
        System.out.println(d.loginByEmail("test@example.com", "testpassword"));
    }
}
