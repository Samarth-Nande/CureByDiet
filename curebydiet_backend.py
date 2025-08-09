from flask import Flask, request, jsonify, render_template
import sqlite3

app = Flask(__name__)

# Initialize the database
def init_db():
    conn = sqlite3.connect('health.db')
    cursor = conn.cursor()
    cursor.execute('''CREATE TABLE IF NOT EXISTS diseases (
                        id INTEGER PRIMARY KEY AUTOINCREMENT,
                        name TEXT UNIQUE,
                        symptoms TEXT,
                        diet TEXT,
                        lifestyle TEXT
                     )''')
    conn.commit()
    conn.close()

# Insert disease data
def insert_disease(name, symptoms, diet, lifestyle):
    conn = sqlite3.connect('health.db')
    cursor = conn.cursor()
    try:
        cursor.execute('INSERT INTO diseases (name, symptoms, diet, lifestyle) VALUES (?, ?, ?, ?)',
                       (name, symptoms, diet, lifestyle))
        conn.commit()
    except sqlite3.IntegrityError:
        pass  # Skip if already exists
    conn.close()

# Load predefined diseases
def load_disease_data():
    diseases = [
        ("Diabetes", "frequent urination, unexplained weight loss, fatigue", "Whole grains, Vegetables, Nuts, Lean proteins", "Exercise regularly, Reduce sugar intake"),
        ("Hypertension", "chest pain, shortness of breath, headache", "Low-sodium diet, Leafy greens, Berries", "Reduce stress, Avoid excessive salt"),
        ("Asthma", "wheezing, shortness of breath, persistent cough", "Vitamin D foods, Fatty fish, Fresh fruits", "Avoid smoking, Practice breathing exercises"),
        ("Heart Disease", "chest pain, shortness of breath, swelling in legs", "Oats, Salmon, Nuts, Leafy greens", "Exercise regularly, Manage stress"),
        ("Migraine", "headache, nausea, sensitivity to light", "Magnesium-rich foods, Almonds, Dark chocolate", "Reduce caffeine, Maintain sleep schedule"),
        ("Anemia", "fatigue, pale skin, shortness of breath", "Iron-rich foods, Leafy greens, Red meat", "Increase iron intake, Avoid tea/coffee after meals"),
        ("Arthritis", "joint pain, swelling, stiffness", "Turmeric, Ginger, Omega-3 foods", "Regular stretching, Stay active"),
        ("Liver Disease", "jaundice, abdominal pain, nausea", "Fruits, Vegetables, Lean protein", "Avoid alcohol, Stay hydrated"),
        ("Kidney Disease", "frequent urination, swelling in legs, fatigue", "Low-sodium diet, Berries, Cauliflower", "Monitor protein intake, Control blood pressure"),
        ("Obesity", "weight gain, fatigue, breathlessness", "High-fiber foods, Lean proteins, Vegetables", "Exercise daily, Control calorie intake"),
        ("Osteoporosis", "bone pain, fractures, stooped posture", "Calcium-rich foods, Dairy, Almonds", "Increase vitamin D, Weight-bearing exercise"),
        ("Thyroid Disorder", "weight fluctuations, fatigue, mood swings", "Iodine-rich foods, Seaweed, Dairy", "Regular thyroid checkups, Reduce stress"),
        ("Gastritis", "stomach pain, bloating, nausea", "Probiotics, Yogurt, Ginger, Bananas", "Avoid spicy foods, Eat small meals"),
        ("Peptic Ulcer", "burning stomach pain, bloating, nausea", "Cabbage, Honey, Licorice", "Avoid NSAIDs, Reduce stress"),
        ("Depression", "persistent sadness, loss of interest, fatigue", "Omega-3s, Dark chocolate, Nuts", "Regular exercise, Practice mindfulness"),
        ("Anxiety", "excessive worry, rapid heartbeat, restlessness", "Green tea, Dark chocolate, Nuts", "Meditation, Deep breathing exercises"),
        ("Allergies", "sneezing, itching, runny nose", "Honey, Vitamin C-rich foods, Turmeric", "Avoid allergens, Use air purifiers"),
        ("Flu", "fever, cough, body ache", "Citrus fruits, Ginger tea, Honey", "Stay hydrated, Get enough rest"),
        ("Tuberculosis", "persistent cough, fever, night sweats", "Protein-rich diet, Leafy greens, Garlic", "Complete medication course, Improve ventilation"),
        ("Pneumonia", "chest pain, cough, fever", "Vitamin C-rich foods, Garlic, Broccoli", "Quit smoking, Stay warm"),
        ("Skin Infection", "redness, itching, swelling", "Turmeric, Aloe vera, Omega-3 foods", "Maintain hygiene, Avoid harsh chemicals"),
        ("Constipation", "hard stools, infrequent bowel movements", "High-fiber foods, Prunes, Yogurt", "Increase water intake, Exercise regularly"),
        ("Food Poisoning", "nausea, vomiting, diarrhea", "Bananas, Rice, Applesauce, Toast (BRAT diet)", "Stay hydrated, Avoid dairy temporarily"),
        ("UTI", "painful urination, frequent urination, blood in urine", "Cranberry juice, Probiotics, Garlic", "Stay hydrated, Maintain hygiene")
    ]
    for disease in diseases:
        insert_disease(*disease)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/question')
def question():
    return render_template('question.html')

@app.route('/dietplan')
def dietplan():
    return render_template('dietplan.html')  

@app.route('/appointment')
def appointment():
    return render_template('appointment.html')

@app.route('/article')
def article():
    return render_template('article.html') 

@app.route('/help')
def help():
    return render_template('help.html')                

@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json()  # Ensure request is properly received
    print("Received symptoms:", data)  # Debugging

    user_symptoms = data.get('symptoms', '').lower()
    
    conn = sqlite3.connect('health.db')
    cursor = conn.cursor()
    cursor.execute("SELECT name, symptoms, diet, lifestyle FROM diseases")
    diseases = cursor.fetchall()
    conn.close()
    
    best_match = None
    max_symptom_matches = 0
    
    for disease in diseases:
        disease_name, symptoms, diet, lifestyle = disease
        symptom_list = symptoms.lower().split(', ')
        match_count = sum(1 for symptom in symptom_list if symptom in user_symptoms)
        
        if match_count > max_symptom_matches:
            max_symptom_matches = match_count
            best_match = (disease_name, diet, lifestyle)
    
    if best_match:
        response = {
            "predictedDisease": best_match[0],
            "dietPlan": best_match[1].split(', '),
            "lifestyleChanges": best_match[2].split(', ')
        }
    else:
        response = {"predictedDisease": "No match found", "dietPlan": [], "lifestyleChanges": []}
    
    return jsonify(response)


@app.route('/result')
def result():
    return render_template('result.html')

if __name__ == '__main__':
    init_db()
    load_disease_data()
    app.run(debug=True)
