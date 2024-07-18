use jdbc_ex;

DROP TABLE todo;
DROP TABLE todo_user;

CREATE TABLE todo_user
(
    user_id    VARCHAR(50) PRIMARY KEY,
    name       VARCHAR(50)  NOT NULL UNIQUE,
    password   VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO todo_user (user_id, name, password)
VALUES ('yj', '이예지', '1234'),
       ('siwan', '김시완', '1234'),
       ('na', '나건우', '1234');

SELECT * FROM todo_user;


CREATE TABLE todo
(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    user_id      VARCHAR(50)  NOT NULL,
    todo         VARCHAR(255) NOT NULL,
    is_completed BOOLEAN   DEFAULT FALSE,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES todo_user (user_id) ON DELETE CASCADE
);

INSERT INTO todo (user_id, todo)
VALUES ('yj', '알고리즘 공부'),
       ('yj', '모듈평가 준비'),
       ('yj', '정처기 공부'),
       ('siwan', '강사님~'),
       ('na', '다트 우승하기'),
       ('na', 'RM 활동하기');

SELECT * FROM todo;