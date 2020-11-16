CREATE DATABASE IF NOT EXISTS laravel_master;

USE laravel_master;

CREATE TABLE IF NOT EXISTS users(
id                  int(255) auto_increment not null,
role                VARCHAR(20),
name                VARCHAR(100),
surname             VARCHAR(200),
nick                VARCHAR(100),
email               VARCHAR(255),
password            VARCHAR(255),
image               VARCHAR(255),
created_at          datetime,
updated_at           datetime,
remember_token      VARCHAR(255),
CONSTRAINT pk_users PRIMARY KEY(id)
)ENGINE=InnoDB;

INSERT INTO users VALUES(NULL, 'user', 'administrador1', 'dePrueba1', 'Admin1', 'administrador1@admin.com', 'a1a2a3a4a5', null, CURTIME(), CURTIME(), null);
INSERT INTO users VALUES(NULL, 'user', 'administrador2', 'dePrueba2', 'Admin2', 'administrador2@admin.es', 'a1a2a3a4a5', null, CURTIME(), CURTIME(), null);
INSERT INTO users VALUES(NULL, 'user', 'administrador3', 'dePrueba3', 'Admin3', 'administrador3@admin.net', 'a1a2a3a4a5', null, CURTIME(), CURTIME(), null);

CREATE TABLE IF NOT EXISTS images(
id                  int(255) auto_increment not null,
user_id             int(255),
image_path          VARCHAR(255),
description         text,
created_at          datetime,
updated_at           datetime,
CONSTRAINT pk_images PRIMARY KEY(id),
CONSTRAINT fk_images_users FOREIGN KEY(user_id) REFERENCES users(id)
)ENGINE=InnoDB;

INSERT INTO images VALUES(NULL, 1, 'test.jpg', 'description of test', CURTIME(), CURTIME());
INSERT INTO images VALUES(NULL, 1, 'test2.jpg', 'description2 of test2', CURTIME(), CURTIME());
INSERT INTO images VALUES(NULL, 1, 'test3.jpg', 'description3 of test3', CURTIME(), CURTIME());
INSERT INTO images VALUES(NULL, 3, 'test4.jpg', 'description4 of test4', CURTIME(), CURTIME());


CREATE TABLE IF NOT EXISTS comments(
id                  int(255) auto_increment not null,
user_id             int(255),
image_id            int(255),
content             text,
created_at          datetime,
updated_at           datetime,
CONSTRAINT pk_comments PRIMARY KEY(id),
CONSTRAINT fk_comments_users FOREIGN KEY(user_id) REFERENCES users(id),
CONSTRAINT fk_comments_images FOREIGN KEY(image_id) REFERENCES images(id)
)ENGINE=InnoDB;

INSERT INTO comments VALUES(NULL, 1, 4, 'Buena foto de familia!!', CURTIME(), CURTIME());
INSERT INTO comments VALUES(NULL, 2, 1, 'Buena foto de test1!!', CURTIME(), CURTIME());
INSERT INTO comments VALUES(NULL, 2, 4, 'Que buenoo!!', CURTIME(), CURTIME());

CREATE TABLE IF NOT EXISTS likes(
id                  int(255) auto_increment not null,
user_id             int(255),
image_id            int(255),
created_at          datetime,
updated_at           datetime,
CONSTRAINT pk_likes PRIMARY KEY(id),
CONSTRAINT fk_likes_users FOREIGN KEY(user_id) REFERENCES users(id),
CONSTRAINT fk_likes_images FOREIGN KEY(image_id) REFERENCES images(id)
)ENGINE=InnoDB;

INSERT INTO likes VALUES(NULL, 1, 4, CURTIME(), CURTIME());
INSERT INTO likes VALUES(NULL, 2, 4, CURTIME(), CURTIME());
INSERT INTO likes VALUES(NULL, 3, 1, CURTIME(), CURTIME());
INSERT INTO likes VALUES(NULL, 3, 2, CURTIME(), CURTIME());
INSERT INTO likes VALUES(NULL, 2, 1, CURTIME(), CURTIME());