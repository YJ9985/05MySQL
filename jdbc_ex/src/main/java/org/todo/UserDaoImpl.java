package org.todo;

import org.common.JDBCUtil;

import java.sql.*;

public class UserDaoImpl implements UserDao {
    //implement 약자
    //클래스는 사용자와 관련된 데이터베이스 작업을 담당
    // 사용자 정보를 생성, 조회, 업데이트, 삭제하는 메서드 포함
    private final Connection conn;

    public UserDaoImpl() {
        this.conn = JDBCUtil.getConnection();
    }

    @Override
    // 사용자 ID와 비밀번호로 사용자를 조회하여 반환
    public UserVo loginUser(String user_id, String password) {
        String sql = "SELECT * FROM todo_user WHERE user_id = ? AND password = ?";
        UserVo loginUser = null;

        try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, user_id);
            pstmt.setString(2, password);

            // ResultSet을 사용하여 쿼리 결과를 확인
            try (ResultSet rs = pstmt.executeQuery()) { //executeQuery: 쿼리 실행
                while (rs.next()) {
                    String loginUserId = rs.getString("user_id"); // "" 안에는 column명이 들어감
                    String loginName  = rs.getString("user_name");
                    String loginPassword = rs.getString("password");
                    Timestamp loginCreatedAt = rs.getTimestamp("login_created_at");

                    // 일치하는 사용자가 있으면 UserVo 객체를 생성하여 반환
                    loginUser = new UserVo(loginUserId, loginName, loginPassword, loginCreatedAt);
                };
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return loginUser;
    }
}
