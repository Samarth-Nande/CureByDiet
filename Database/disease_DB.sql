-- Create Diseases Table
CREATE TABLE Diseases (
    disease_id INT PRIMARY KEY AUTO_INCREMENT,
    disease_name VARCHAR(255) UNIQUE NOT NULL
);

-- Create Symptoms Table
CREATE TABLE Symptoms (
    symptom_id INT PRIMARY KEY AUTO_INCREMENT,
    symptom_name VARCHAR(255) UNIQUE NOT NULL
);

-- Create Disease-Symptom Mapping Table (Many-to-Many Relationship)
CREATE TABLE DiseaseSymptoms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    disease_id INT NOT NULL,
    symptom_id INT NOT NULL,
    FOREIGN KEY (disease_id) REFERENCES Diseases(disease_id) ON DELETE CASCADE,
    FOREIGN KEY (symptom_id) REFERENCES Symptoms(symptom_id) ON DELETE CASCADE,
    INDEX(disease_id, symptom_id) -- Index for faster lookup
);

-- Insert diseases
INSERT INTO Diseases (disease_name) VALUES
('Diabetes'),
('Hypertension'),
('Tuberculosis'),
('Pneumonia'),
('COVID-19'),
('Asthma'),
('COPD'),
('Heart Failure'),
('Arrhythmia'),
('Anemia'),
('Hepatitis'),
('Jaundice'),
('UTI'),
('Kidney Stones'),
('Gastritis'),
('IBS'),
('Food Poisoning'),
('Lung Cancer'),
('Liver Cirrhosis'),
('Alcoholic Hepatitis'),
('Stroke'),
('Hyperthyroidism'),
('Hypothyroidism'),
('Depression'),
('Bipolar Disorder');

-- Insert symptoms
INSERT INTO Symptoms (symptom_name) VALUES
('Fatigue'),
('Unexplained Weight Loss'),
('Fever'),
('Night Sweats'),
('Loss of Appetite'),
('Chest Pain'),
('Shortness of Breath'),
('Irregular Heartbeat'),
('Swelling in Ankles or Legs'),
('Persistent Cough'),
('Wheezing'),
('Difficulty Breathing'),
('Cough Productive'),
('Cough Dry'),
('Nausea'),
('Diarrhea'),
('Constipation'),
('Abdominal Pain'),
('Frequent Urination'),
('Painful Urination'),
('Blood in Urine'),
('Use of Tobacco'),
('Consumption of Alcohol'),
('Anxiety'),
('Depression'),
('Mood Swings');

-- Link diseases to symptoms
INSERT INTO DiseaseSymptoms (disease_id, symptom_id) VALUES
(1, 1), (1, 2), (1, 19), (1, 5), (1, 26), (1, 25), -- Diabetes
(2, 6), (2, 7), (2, 8), (2, 1), (2, 24), (2, 26), -- Hypertension
(3, 10), (3, 3), (3, 4), (3, 2), (3, 5), (3, 1), -- Tuberculosis
(4, 3), (4, 6), (4, 10), (4, 12), (4, 1), (4, 4), -- Pneumonia
(5, 3), (5, 14), (5, 7), (5, 1), (5, 5), (5, 24), -- COVID-19
(6, 11), (6, 7), (6, 14), (6, 6), (6, 12), (6, 1), -- Asthma
(7, 11), (7, 7), (7, 10), (7, 13), (7, 1), (7, 6), -- COPD
(8, 6), (8, 7), (8, 9), (8, 1), (8, 8), (8, 24), -- Heart Failure
(9, 8), (9, 6), (9, 7), (9, 1), (9, 24), (9, 26), -- Arrhythmia
(10, 1), (10, 2), (10, 7), (10, 26), (10, 25), (10, 5), -- Anemia
(11, 1), (11, 15), (11, 18), (11, 5), (11, 4), (11, 25), -- Hepatitis
(12, 5), (12, 18), (12, 1), (12, 15), (12, 26), (12, 25), -- Jaundice
(13, 19), (13, 21), (13, 23), (13, 2), (13, 17), (13, 18), -- UTI
(14, 1), (14, 2), (14, 4), (14, 5), (14, 6), (14, 9), -- Kidney Stones
(15, 1), (15, 2), (15, 6), (15, 17), (15, 3), (15, 18), -- Gastritis
(16, 18), (16, 17), (16, 2), (16, 9), (16, 15), (16, 1), -- IBS
(17, 18), (17, 3), (17, 5), (17, 6), (17, 7), (17, 8), -- Food Poisoning
(18, 10), (18, 12), (18, 3), (18, 5), (18, 1), (18, 6), -- Lung Cancer
(19, 18), (19, 6), (19, 13), (19, 17), (19, 1), (19, 2), -- Liver Cirrhosis
(20, 18), (20, 4), (20, 7), (20, 8), (20, 6), (20, 1), -- Alcoholic Hepatitis
(21, 6), (21, 8), (21, 1), (21, 7), (21, 5), (21, 24), -- Stroke
(22, 19), (22, 7), (22, 6), (22, 1), (22, 3), (22, 12), -- Hyperthyroidism
(23, 19), (23, 7), (23, 6), (23, 1), (23, 10), (23, 12), -- Hypothyroidism
(24, 24), (24, 26), (24, 25), (24, 18), (24, 6), (24, 1), -- Depression
(25, 24), (25, 26), (25, 23), (25, 22), (25, 1), (25, 4); -- Bipolar Disorder
