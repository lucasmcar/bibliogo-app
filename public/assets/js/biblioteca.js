document.addEventListener('DOMContentLoaded', function () {
    const locationFilter = document.getElementById('location-filter');
    const booksFilter = document.getElementById('books-filter');
    const librariesContainer = document.getElementById('libraries-container');
    const libraryCards = document.querySelectorAll('.library-card');

    function filterLibraries() {
        const locationValue = locationFilter.value.trim().toLowerCase();
        const booksValue = booksFilter.value;

        libraryCards.forEach(card => {
            const location = card.getAttribute('data-location').toLowerCase();
            const bookCount = parseInt(card.getAttribute('data-books'));

            let locationMatch = location.includes(locationValue);
            let booksMatch = true;

            if (booksValue) {
                if (booksValue === '1-10') {
                    booksMatch = bookCount >= 1 && bookCount <= 10;
                } else if (booksValue === '11-50') {
                    booksMatch = bookCount >= 11 && bookCount <= 50;
                } else if (booksValue === '51+') {
                    booksMatch = bookCount > 50;
                }
            }

            if (locationMatch && booksMatch) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });
    }

    locationFilter.addEventListener('input', filterLibraries);
    booksFilter.addEventListener('change', filterLibraries);
});