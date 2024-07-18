package org.todo;

import java.util.List;

public interface UserDao {
    UserVo loginUser(String user_id, String password);
}