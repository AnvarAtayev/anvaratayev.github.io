const themeToggle = document.getElementById('toggle-dark-mode');
const currentTheme = localStorage.getItem('theme') || 'light';

// Apply the saved theme on page load
document.documentElement.setAttribute('data-theme', currentTheme);

themeToggle.addEventListener('click', () => {
    const newTheme = document.documentElement.getAttribute('data-theme') === 'dark' ? 'light' : 'dark';
    document.documentElement.setAttribute('data-theme', newTheme);
    localStorage.setItem('theme', newTheme);
});