-- Extended diet_lifestyle_prevention.sql with Data Inserts

-- Create Diet Plans Table
CREATE TABLE DietPlans (
    diet_id INT PRIMARY KEY AUTO_INCREMENT,
    disease_id INT NOT NULL,
    diet_details TEXT NOT NULL,
    recommended_foods TEXT,
    foods_to_avoid TEXT,
    meal_plan_example TEXT,
    FOREIGN KEY (disease_id) REFERENCES Diseases(disease_id) ON DELETE CASCADE
);

-- Create Lifestyle Changes Table
CREATE TABLE LifestyleChanges (
    lifestyle_id INT PRIMARY KEY AUTO_INCREMENT,
    disease_id INT NOT NULL,
    lifestyle_details TEXT NOT NULL,
    exercise_recommendations TEXT,
    stress_management_tips TEXT,
    sleep_recommendations TEXT,
    FOREIGN KEY (disease_id) REFERENCES Diseases(disease_id) ON DELETE CASCADE
);

-- Create Preventative Measures Table
CREATE TABLE PreventativeMeasures (
    prevention_id INT PRIMARY KEY AUTO_INCREMENT,
    disease_id INT NOT NULL,
    prevention_details TEXT NOT NULL,
    early_detection_tests TEXT,
    vaccination_details TEXT,
    general_health_tips TEXT,
    FOREIGN KEY (disease_id) REFERENCES Diseases(disease_id) ON DELETE CASCADE
);

-- Insert Diet Plans
INSERT INTO DietPlans (disease_id, diet_details) VALUES
('1. Low-carb, high fiber, whole grains, lean protein for Diabetes.'),
('2. Low sodium, potassium-rich foods, DASH diet for Hypertension.'),
('3. High protein, vitamin D, calcium-rich foods for Tuberculosis.'),
('4. Nutrient-dense foods with lean protein, fruits, vegetables for Pneumonia.'),
('5. Hydration, zinc, vitamin C, garlic, turmeric for COVID-19.'),
('6. Omega-3, anti-inflammatory foods, avoiding allergens for Asthma.'),
('7. Balanced diet, avoiding pollution, anti-inflammatory foods for COPD.'),
('8. Low sodium, high potassium, heart-healthy fats for Heart Failure.'),
('9. Avoid caffeine, eat magnesium-rich foods for Arrhythmia.'),
('10. Iron-rich foods, vitamin C-rich foods for Anemia.'),
('11. Lean protein, whole grains, beets, carrots for Hepatitis.'),
('12. Low-fat, high fiber, vitamin B-rich foods for Jaundice.'),
('13. Cranberry juice, probiotics, high water intake for UTI.'),
('14. Hydration, low sodium, avoiding oxalate-rich foods for Kidney Stones.'),
('15. Anti-inflammatory diet, avoiding spicy foods for Gastritis.'),
('16. High fiber, low-FODMAP diet, probiotics for IBS.'),
('17. Electrolytes, hydration, bland diet for Food Poisoning.'),
('18. Antioxidants, cruciferous vegetables, lean protein for Lung Cancer.'),
('19. Liver-detox foods, beetroot, walnuts for Liver Cirrhosis.'),
('20. Avoid alcohol, liver-supportive foods for Alcoholic Hepatitis.'),
('21. Heart-healthy diet, omega-3, whole grains for Stroke.'),
('22. Iodine-rich foods, seafood, dairy for Hyperthyroidism.'),
('23. Iodine-controlled diet, selenium-rich foods for Hypothyroidism.'),
('24. Mood-boosting foods, omega-3, whole grains for Depression.'),
('25. Balanced diet, essential fatty acids, whole grains for Bipolar Disorder.');

-- Insert Lifestyle Changes
INSERT INTO LifestyleChanges (disease_id, lifestyle_details) VALUES
('1. Exercise, weight control, stress reduction for Diabetes.'),
('2. Physical activity, stress control, quitting smoking for Hypertension.'),
('3. Fresh air, avoiding crowded places for Tuberculosis.'),
('4. Vaccination, quitting smoking, respiratory therapy for Pneumonia.'),
('5. Hand washing, mask-wearing, social distancing for COVID-19.'),
('6. Avoid allergens, use air purifiers, breathing exercises for Asthma.'),
('7. Quit smoking, use humidifiers, lung rehab for COPD.'),
('8. Cardio exercises, weight management, stress relief for Heart Failure.'),
('9. Healthy sleep, avoiding caffeine, ECG checks for Arrhythmia.'),
('10. Iron intake, physical activity, good sleep for Anemia.'),
('11. Vaccinations, avoiding contaminated water for Hepatitis.'),
('12. Avoid alcohol, eat at regular intervals for Jaundice.'),
('13. Hygiene, avoiding synthetic underwear, urinating post-intercourse for UTI.'),
('14. Drinking water, avoiding high oxalate foods, staying active for Kidney Stones.'),
('15. Avoiding spicy foods, small frequent meals for Gastritis.'),
('16. Reducing stress, avoiding artificial sweeteners for IBS.'),
('17. Food hygiene, avoiding street food, staying hydrated for Food Poisoning.'),
('18. Quit smoking, reducing pollution exposure, screenings for Lung Cancer.'),
('19. Avoid alcohol, regular liver function tests for Liver Cirrhosis.'),
('20. Avoid alcohol, liver-friendly foods, stay active for Alcoholic Hepatitis.'),
('21. Regular checkups, reducing salt, staying active for Stroke.'),
('22. Thyroid tests, stress reduction, enough sleep for Hyperthyroidism.'),
('23. Thyroid checks, yoga, avoiding processed food for Hypothyroidism.'),
('24. Therapy, exercise, social interaction for Depression.'),
('25. Daily routine, therapy, avoiding stress triggers for Bipolar Disorder.');

-- Insert Preventative Measures
INSERT INTO PreventativeMeasures (disease_id, prevention_details) VALUES
('1. Blood sugar checks, healthy weight, avoiding sugar for Diabetes.'),
('2. BP monitoring, balanced diet, reducing salt for Hypertension.'),
('3. Vaccination, immune boosting, early treatment for Tuberculosis.'),
('4. Flu shots, avoiding smoking, immunity boost for Pneumonia.'),
('5. Handwashing, vaccination, social distancing for COVID-19.'),
('6. Avoid allergens, use inhalers, regular checkups for Asthma.'),
('7. Quit smoking, use air filters, avoid irritants for COPD.'),
('8. Cardio exercise, heart-friendly diet, BP control for Heart Failure.'),
('9. ECG, stress reduction, electrolyte balance for Arrhythmia.'),
('10. Iron-rich diet, CBC tests, avoid tea post-meal for Anemia.'),
('11. Hepatitis vaccines, avoid alcohol, hygiene for Hepatitis.'),
('12. Avoid alcohol, hygiene, liver function tests for Jaundice.'),
('13. Water intake, hygiene, avoiding sugary drinks for UTI.'),
('14. Avoid excessive calcium, drink water for Kidney Stones.'),
('15. Avoid NSAIDs, reduce alcohol, eat on time for Gastritis.'),
('16. Reduce stress, maintain gut health, avoid processed food for IBS.'),
('17. Avoid contaminated food, hygiene, hydration for Food Poisoning.'),
('18. Regular lung scans, quit smoking, stay fit for Lung Cancer.'),
('19. No alcohol, liver detox foods, screening for Liver Cirrhosis.'),
('20. No alcohol, healthy liver diet for Alcoholic Hepatitis.'),
('21. Checkups, manage cholesterol, stay active for Stroke.'),
('22. Thyroid checkups, iodine balance, avoid caffeine for Hyperthyroidism.'),
('23. Adequate iodine, exercise, stress control for Hypothyroidism.'),
('24. Mental wellness, socializing, therapy for Depression.'),
('25. Therapy, checkups, avoid stressors for Bipolar Disorder.');
