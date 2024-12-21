<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
    <style>
        .navbar-custom {
            background-color: #343a40; /* Dark background */
        }
        .navbar-custom .navbar-brand,
        .navbar-custom .nav-link {
            color: #f8f9fa; /* Light text */
        }
        .navbar-custom .nav-link:hover {
            color: #adb5bd; /* Light grey on hover */
            transition: color 0.3s;
        }
        .navbar-custom .nav-item.active .nav-link {
            color: #ffc107; /* Highlight active link */
        }
        .navbar-custom .nav-link i {
            margin-right: 5px;
        }
        .navbar-toggler {
            border: none;
        }
        .navbar-toggler:focus,
        .navbar-toggler:active {
            outline: none;
            box-shadow: none;
        }
        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3E%3Cpath stroke='rgba%288, 8, 8, 0.5%29' stroke-width='2' linecap='round' linejoin='round' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <a class="navbar-brand" href="#">
            <i class="fas fa-warehouse"></i> Inventory Management System
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="home.jsp">
                        <i class="fas fa-home"></i> Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">
                        <i class="fas fa-cogs"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
