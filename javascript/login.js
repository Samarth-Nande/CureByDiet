function login() {
    const usernameInput = document.getElementById('username');
    const passwordInput = document.getElementById('password');
    const errorMessage = document.getElementById('error-message');

    const username = usernameInput.value.trim();
    const password = passwordInput.value.trim();

    // Clear error message for new attempts
    errorMessage.textContent = '';

    // Validate input fields
    if (username === '' || password === '') {
        errorMessage.textContent = 'Please enter both username (email) and password.';
        return;
    }

    // Retrieve stored user data from localStorage
    const storedUserData = localStorage.getItem('userData');
    if (!storedUserData) {
        errorMessage.textContent = 'No user data found. Please register first.';
        return;
    }

    const userData = JSON.parse(storedUserData);

    // Find user by email and password
    const foundUser = userData.find(user => user.email === username && user.password === password);

    if (foundUser) {
        // Successful login
        console.log(`Login successful. Welcome ${foundUser.fullname}!`);

        // Store login session
        sessionStorage.setItem('isLoggedIn', 'true');
        sessionStorage.setItem('username', foundUser.email);

        // Redirect to the home page (fixed redirection)
        window.location.href = './home.html';
    } else {
        // Failed login
        errorMessage.textContent = 'Invalid username (email) or password.';
    }
}
