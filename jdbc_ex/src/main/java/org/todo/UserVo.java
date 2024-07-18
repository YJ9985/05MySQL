package org.todo;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.sql.Timestamp;

@Data //Getter Setter
@AllArgsConstructor //매개변수 생성자
public class UserVo { //User Value Object 약자
    // todo.sql 의 값 생성
    private final String user_id;
    private final String name;
    private final String password;
    private final Timestamp created_at;
}
