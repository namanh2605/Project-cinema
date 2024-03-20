/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package dal;

import model.Room;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
/**
 *
 * @author admin
 */
public class RoomDAO extends DBContext{

    public Room getRoomById(int roomId) {
        Room room = null;
        String query = "SELECT * FROM room WHERE room_id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, roomId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    room = new Room();
                    room.setRoomId(resultSet.getInt("room_id"));
                    room.setRoomName(resultSet.getString("room_name"));
                    room.setCinemaId(resultSet.getInt("cinema_id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return room;
    }
    
}
