mysql -u root -p
SHOW DATABASES;
USE db_lesson;

CREATE TABLE departments (
    -> department_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    -> name VARCHAR(20) NOT NULL,
    -> created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -> updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    -> );

DESC departments;
DESC people;

ALTER TABLE people ADD department_id INT UNSIGNED AFTER email;

ALTER TABLE people MODIFY department_id INT(10) UNSIGNED;
warningと出たので、
ALTER TABLE people MODIFY department_id INT UNSIGNED;


INSERT INTO departments (name)
    -> VALUES
    -> ('営業'),('開発'),('経理'),('人事'),('情報システム');

INSERT INTO people (name,email,department_id,age,gender)
    -> VALUES
    -> ('一宮いち','ichi@mail.jp',1,26,1),
    -> ('二宮に','ni@mail.jp',2,31,2),
    -> ('三宮さん','san@mail.jp',3,46,1),
    -> ('四宮し','shi@mail.jp',4,22,2),
    -> ('五宮ご','go@mail.jp',5,34,1),
    -> ('六宮ろく','roku@mail.jp',1,25,2),
    -> ('七宮なな','nana@mail.jp',2,31,1),
    -> ('八宮はち','hachi@mail.jp',1,26,2),
    -> ('九宮く','ku@mail.jp',2,44,1),
    -> ('十宮じゅう','ju@mail.jp',2,24,2);

INSERT INTO reports (person_id,content)
    -> VALUES
    -> (7,' 1 を決定いたしました'),
    -> (8,'2を決定いたしました'),
    -> (9,'３を決定いたしました'),
    -> (10,'４を決定いたしました'),
    -> (11,'５を決定いたしました'),
    -> (12,'６を決定いたしました'),
    -> (13,'７を決定いたしました'),
    -> (15,'８を決定いたしました'),
    -> (16,'９を決定いたしました'),
    -> (17,'１０を決定いたしました');

UPDATE people SET department_id = 1 WHERE person_id = 1;
UPDATE people SET department_id = 2 WHERE person_id = 2;
UPDATE people SET department_id = 3 WHERE person_id = 3;
UPDATE people SET department_id = 4 WHERE person_id = 4;
UPDATE people SET department_id = 5 WHERE person_id = 6;

SELECT name,age FROM people WHERE gender = 1 ORDER BY age DESC;

-- Q6
peopleというテーブルのname,email,ageというカラムのデータを表示するための命令です。
このとき条件が指定されているので、department_idが１のレコードのみ表示されます。
順番はcreated_atが昇順で表示されます。

-- Q7
SELECT name FROM people WHERE (age BETWEEN 20 AND 29 AND gender = 2) 
OR (age BETWEEN 40 AND 49 AND gender = 1);

-- Q8
SELECT name,age FROM people WHERE department_id = 1 ORDER BY age;

-- Q9
SELECT AVG(age) AS average_age FROM people WHERE gender = 2 AND department_id = 2;

-- Q10
SELECT p.name,p.department_id,r.content FROM people p JOIN reports r USING(person_id);

-- Q11
SELECT p.person_id,p.name FROM people p LEFT OUTER JOIN reports r
USING (person_id) WHERE r.content IS NULL;