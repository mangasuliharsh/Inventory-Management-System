<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enhanced Sidebar</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Custom CSS -->
    <style>
        .sidebar {
            background-color: #343a40;
        }
        .sidebar .nav-link {
            color: #f8f9fa;
            padding: 10px 15px;
            transition: background-color 0.3s, color 0.3s;
        }
        .sidebar .nav-link:hover {
            background-color: #495057;
            color: #ffc107;
        }
        .sidebar .nav-link i {
            margin-right: 10px;
        }
        .sidebar .nav-item.active .nav-link {
            background-color: #495057;
            color: #ffc107;
        }
        .sidebar .collapse .nav-link {
            padding-left: 30px;
        }
        .sidebar hr {
            border-top: 1px solid #495057;
            width: 100%;
        }
        .sidebar .dropdown-toggle::after {
            display: none;
        }
    </style>
</head>
<body>
    <div id="sidebar" class="sidebar col-auto col-md-3 col-xl-2 px-sm-2 px-0">
        <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
            <a href="/" class="d-flex align-items-center pb-3 mb-md-0 text-white text-decoration-none">
                <span class="fs-5 d-none d-sm-inline">Menu</span>
            </a>
            <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                <li class="nav-item">
                    <a href="home.jsp" class="nav-link align-middle text-white">
                        <i class="fas fa-home fs-4"></i> <span class="ms-1 d-none d-sm-inline">Home</span>
                    </a>
                </li>
                <li>
                    <a href="listCategory.jsp" data-bs-toggle="collapse" class="nav-link text-white">
                        <i class="fas fa-tachometer-alt fs-4"></i> <span class="ms-1 d-none d-sm-inline">Category</span>
                    </a>
                    <ul class="collapse nav flex-column ms-1" id="submenu1" data-bs-parent="#menu">
                        <li class="w-100">
                            <a href="#" class="nav-link text-white">Item 1</a>
                        </li>
                        <li>
                            <a href="#" class="nav-link text-white">Item 2</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="listOrderDetails.jsp" class="nav-link text-white">
                        <i class="fas fa-table fs-4"></i> <span class="ms-1 d-none d-sm-inline">Orders</span>
                    </a>
                </li>
                <li>
                    <a href="listProduct.jsp" data-bs-toggle="collapse" class="nav-link text-white">
                        <i class="fas fa-box-open fs-4"></i> <span class="ms-1 d-none d-sm-inline">Products</span>
                    </a>
                    <ul class="collapse nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
                        <li class="w-100">
                            <a href="#" class="nav-link text-white">Product 1</a>
                        </li>
                        <li>
                            <a href="#" class="nav-link text-white">Product 2</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="listSupplier.jsp" class="nav-link text-white">
                        <i class="fas fa-users fs-4"></i> <span class="ms-1 d-none d-sm-inline">Suppliers</span>
                    </a>
                </li>
            </ul>
            <hr>
        </div>
    </div>

    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
