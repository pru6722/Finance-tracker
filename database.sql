-- Create the database
CREATE DATABASE IF NOT EXISTS fintracker;
USE fintracker;

-- Table: users
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    username VARCHAR(50) UNIQUE,
    password_hash VARCHAR(255),
    phone VARCHAR(15),
    dob DATE,
    profile_pic VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: budget
CREATE TABLE budget (
    budget_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total_budget DECIMAL(10,2),
    total_expense DECIMAL(10,2),
    budget_left DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Table: expenses
CREATE TABLE expenses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(100),
    amount DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Table: goals
CREATE TABLE goals (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    goal_name VARCHAR(255) NOT NULL,
    target_amount DECIMAL(10, 2) NOT NULL,
    saved_amount DECIMAL(10, 2) DEFAULT 0.00,
    deadline DATE,
    completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: investments
CREATE TABLE investments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    type VARCHAR(50),
    name VARCHAR(100),
    amount DECIMAL(10,2),
    current_value DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
CREATE TABLE admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);
CREATE TABLE goal_saving (
    id INT AUTO_INCREMENT PRIMARY KEY,
    goal_id INT,
    amount DECIMAL(10, 2),
    date DATE,
    FOREIGN KEY (id) REFERENCES users(user_id),
    FOREIGN KEY (goal_id) REFERENCES goals(id)
);
INSERT INTO admin (username, password)
VALUES ('admin', '$2y$10$1sTO2mnNmFsPT4/JHkl9yO.mplzF70dKORHJvciSJjZNFqxkopRzq');