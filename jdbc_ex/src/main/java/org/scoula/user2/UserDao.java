package org.scoula.user2;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.common.JDBCUtil;

public class UserDao {
    private final Connection conn;

    public UserDao() {
        this.conn = JDBCUtil.getConnection();
    }

    public void addUser(UserVO User) {
        String sql = "INSERT INTO user_table (userid, name, password, age, membership) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, User.getUserid()); // 첫 번째 물음표에 userid 전달
            pstmt.setString(2, User.getName());
            pstmt.setString(3, User.getPassword());
            pstmt.setInt(4, User.getAge());
            pstmt.setBoolean(5, User.isMembership());
            pstmt.executeUpdate();

            System.out.println("회원이 성공적으로 추가되었습니다.");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public List<UserVO> getAllUsers() {
        String sql = "SELECT * FROM user_table";
        List<UserVO> users = new ArrayList<>();

        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                UserVO user = new UserVO (
                        rs.getInt("id"),
                        rs.getString("userid"),
                        rs.getString("name"),
                        rs.getString("password"),
                        rs.getInt("age"),
                        rs.getBoolean("membership"),
                        rs.getTimestamp("signup_date")
                        );

                users.add(user);
            }
            users.forEach(System.out::println);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }
}
