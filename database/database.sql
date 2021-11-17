CREATE SCHEMA `E-Commerce`;

USE `E-Commerce`;

CREATE TABLE users 
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    username NVARCHAR(50) UNIQUE NOT NULL,
    address NVARCHAR(100) NOT NULL,
    password NVARCHAR(100) NOT NULL,
    role SMALLINT NOT NULL
)

CREATE TABLE proizvodi 
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    naziv NVARCHAR(50) NOT NULL,
    cijena FLOAT NOT NULL,
    opis NVARCHAR(1000) NOT NULL
)

CREATE TABLE narudzbe 
(
	narudzba_id INT PRIMARY KEY AUTO_INCREMENT,
    proizvodi NVARCHAR(500) NOT NULL,
    total_cijena FLOAT NOT NULL,
    status INT NOT NULL,
    n_date NVARCHAR(450) NOT NULL,
    user_id INT NOT NULL
)

SELECT * FROM users;
SELECT * FROM proizvodi;
SELECT * FROM narudzbe;

INSERT INTO users (username, address, password, role) VALUES ('admin', 'internet', 'admin', 1);

