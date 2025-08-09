document.querySelector('#registration-form').addEventListener('submit', function (event) {
    event.preventDefault();

    // Validate all fields
    if (
        !validateFullname() ||
        !validateCity() ||
        !validateContactno() ||
        !validateAge() ||
        !validateGender() ||
        !validateEmail() ||
        !validatePassword() ||
        !validateReEnterPassword()
    ) {
        return; // Exit if any validation fails
    }

    // Initialize local storage if empty
    let storedUserData = localStorage.getItem('userData');
    let data = storedUserData ? JSON.parse(storedUserData) : [];

    // Push new user data
    data.push({
        fullname: document.querySelector('#fullname').value,
        city: document.querySelector('#city').value,
        contactno: document.querySelector('#contactno').value,
        age: document.querySelector('#age').value,
        gender: document.querySelector('#gender').value,
        email: document.querySelector('#email').value,
        password: document.querySelector('#password').value,
    });

    // Save back to local storage
    localStorage.setItem('userData', JSON.stringify(data));
    
    alert('Registration successful!');

    // Reset the form
    document.querySelector('#registration-form').reset();

    // Redirect to the login page
    window.location.href = './login.html';
});
