// Detect when the blocks are in the viewport to apply animation
document.addEventListener('DOMContentLoaded', function() {
    const blocks = document.querySelectorAll('.block');
    
    function isInViewport(element) {
        const rect = element.getBoundingClientRect();
        return (
            rect.top >= 0 &&
            rect.left >= 0 &&
            rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
            rect.right <= (window.innerWidth || document.documentElement.clientWidth)
        );
    }

    function handleScroll() {
        blocks.forEach(block => {
            if (isInViewport(block)) {
                block.classList.add('show');
            }
        });
    }

    window.addEventListener('scroll', handleScroll);
    handleScroll(); // Trigger scroll handler on page load
});

window.onload = function() {
    // Get user details from local storage
    const userDetails = JSON.parse(localStorage.getItem('userDetails')); // Assuming you stored user details in an object like { username: 'John', city: 'New York' }
    
    if (userDetails) {
        // Display user details in the header
        const userDetailSpan = document.getElementById('user-details');
        userDetailSpan.innerText = `Welcome, ${userDetails.username} from ${userDetails.city}`;
    }
};
