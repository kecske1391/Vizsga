CREATE DATABASE IF NOT EXISTS book_review
  CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE book_review;

-- 1. Felhasználók
CREATE TABLE IF NOT EXISTS users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    -- username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL
);

-- 2. Címkék (műfajok) – a books előtt kell létrehozni!
CREATE TABLE IF NOT EXISTS tags (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    genres VARCHAR(50) NOT NULL UNIQUE
);

-- 3. Könyvek (a feltöltő felhasználóhoz kötve)
CREATE TABLE IF NOT EXISTS books (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    book_language VARCHAR(30) NOT NULL,
    user_id INT UNSIGNED NOT NULL,  -- ki töltötte fel
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 4. Kapcsolótábla: könyv <-> címke (több-a-többhöz)
CREATE TABLE IF NOT EXISTS book_tags (
    book_id INT UNSIGNED NOT NULL,
    tag_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (book_id, tag_id),
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- 5. Banki adatok (felhasználónként)
CREATE TABLE IF NOT EXISTS data_bank (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    card_last4 CHAR(4) NOT NULL,          -- csak az utolsó 4 számjegy
    szamlaszam VARCHAR(34) NOT NULL,      -- szöveg, mert van benne kötőjel/IBAN betű
    price DECIMAL(10,2) NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 6. Be- és kijelentkezések
CREATE TABLE IF NOT EXISTS be_ki (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    bejelentkezes TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    kijelentkezes TIMESTAMP NULL DEFAULT NULL,  -- kitöltés kijelentkezéskor
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
