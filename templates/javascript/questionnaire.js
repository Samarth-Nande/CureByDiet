document.getElementById("symptomsForm").addEventListener("submit", function(event) {
    event.preventDefault(); // Prevent default form submission

    // Collect symptoms
    const symptoms = [];
    document.querySelectorAll('input[name="symptoms"]:checked').forEach((checkbox) => {
        symptoms.push(checkbox.value);
    });

    // Validate input
    if (symptoms.length === 0) {
        alert("Please select at least one symptom.");
        return;
    }

    console.log("Sending symptoms:", symptoms); // Debugging

    // Send data to backend
    fetch("submit_symptoms.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ symptoms: symptoms })
    })
    .then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        return response.json();
    })
    .then(data => {
        console.log("Server response:", data); // Debugging

        if (data.success) {
            localStorage.setItem("user_id", data.user_id); // Store user ID
            window.location.href = "result.html"; // Redirect to results
        } else {
            alert("Error: " + (data.message || "Submission failed."));
        }
    })
    .catch(error => {
        console.error("Error submitting form:", error);
        alert("A network error occurred. Please check your internet connection and try again.");
    });
});

// Redirect to questionnaire if user_id is missing in result.html
document.addEventListener("DOMContentLoaded", function() {
    if (window.location.pathname.includes("result.html") && !localStorage.getItem("user_id")) {
        alert("No data found. Please fill out the questionnaire first.");
        window.location.href = "question.html";
    }
});

document.getElementById("symptomsForm").addEventListener("submit", (event) => {
    event.preventDefault(); // Prevent page reload
    alert("Form submitted successfully! (You can handle this submission with AJAX)");
});


document.querySelectorAll('.follow-up-trigger').forEach(trigger => {
    trigger.addEventListener('change', (event) => {
        const followUpId = event.target.dataset.followUp;
        const followUpSection = document.getElementById(followUpId);
        
        // Show or hide the follow-up section based on checkbox state
        if (event.target.checked) {
            followUpSection.classList.remove('hidden');
        } else {
            followUpSection.classList.add('hidden');
            // Clear input values inside hidden sections
            followUpSection.querySelectorAll('input').forEach(input => input.value = '');
            followUpSection.querySelectorAll('input[type="radio"]').forEach(radio => radio.checked = false);
        }
    });
});
