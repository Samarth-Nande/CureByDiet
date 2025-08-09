CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE UserSymptoms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    age INT NOT NULL,
    general_health ENUM('Excellent', 'Good', 'Fair', 'Poor') NOT NULL,
    symptoms TEXT NOT NULL,
    cardiovascular TEXT,
    respiratory TEXT,
    digestive TEXT,
    urinary TEXT,
    mental_health TEXT,
    sleep_hours ENUM('Less than 4', '4-6', '6-8', 'More than 8'),
    smoking ENUM('Yes', 'No', 'Occasionally'),
    alcohol ENUM('Yes', 'No', 'Occasionally'),
    diet VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
