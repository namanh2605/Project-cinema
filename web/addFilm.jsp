<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Film</title>
        <style>
             body {
                background-color: #1c1c1c; /* Dark background for the whole page */
                color: #ccc; /* Light grey text color for general text */
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
            }
            .form-container {
                width: 50%; /* Adjust the width as needed */
                margin: auto; /* Center the form horizontally */
                background-color: #333; /* Dark background color */
                padding: 20px;
                border-radius: 10px;
            }

            /* Style the labels */
            label {
                font-weight: bold;
                color: #fff; /* White label text color */
            }

            /* Style the input fields */
            input[type="text"],
            input[type="number"],
            textarea,
            input[type="date"] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                background-color: #444; /* Darker input background color */
                color: #fff; /* White text color */
            }

            /* Style the submit button */
            button[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
            }

            /* Change the submit button color on hover */
            button[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <h2>Add New Film</h2>
        <div class="form-container">
            <form action="addFilm" method="post">
                <label for="filmName">Film Name:</label>
                <input type="text" id="filmName" name="filmName">
                <br>

                <label for="duration">Duration (minutes):</label>
                <input type="number" id="duration" name="duration">
                <br>

                <label for="description">Description:</label>
                <textarea id="description" name="description"></textarea>
                <br>

                <label for="image">Image URL:</label>
                <input type="text" id="image" name="image">
                <br>

                <label for="trailer">Trailer URL:</label>
                <input type="text" id="trailer" name="trailer">
                <br>

                <label for="genreId">Genre ID:</label>
                <input type="number" id="genreId" name="genreId">
                <br>

                <label for="director">Director:</label>
                <input type="text" id="director" name="director">
                <br>

                <label for="cast">Cast:</label>
                <input type="text" id="cast" name="cast">
                <br>

                <label for="releaseDate">Release Date:</label>
                <input type="date" id="releaseDate" name="releaseDate">
                <br>

                <label for="ageRating">Age Rating:</label>
                <input type="text" id="ageRating" name="ageRating">
                <br>

                <button type="submit">Add Film</button>
            </form>
        </div>
    </body>
</html>
<script>
    document.addEventListener('DOMContentLoaded', function() {
    document.querySelector('form').addEventListener('submit', function(event) {
        var inputs = document.querySelectorAll('input[type="text"], input[type="number"], textarea, input[type="date"]');
        var isValid = true;

        inputs.forEach(function(input) {
            if (input.value.trim() === '') {
                isValid = false;
            }
        });

        if (!isValid) {
            event.preventDefault(); // Prevent form submission
            alert('Please fill in all fields.'); // Display an alert message
        }
    });
});
</script>
