document.getElementById('searchInput').addEventListener('input', function () {
    let filter = this.value.toLowerCase();
    let users = document.querySelectorAll('.user-card');

    users.forEach(user => {
        let name = user.querySelector('p').innerText.toLowerCase();
        if (name.includes(filter)) {
            user.style.display = '';
        } else {
            user.style.display = 'none';
        }
    });
});
