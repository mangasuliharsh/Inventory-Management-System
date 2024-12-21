<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: white;
        }
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: all 0.3s;
        }
        h2 {
            margin-bottom: 20px;
            color: #007bff;
        }
        .welcome-message {
            text-align: center;
            margin-bottom: 30px;
            color: #6c757d;
        }
        .login-container:hover {
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2 class="text-center">Admin Login</h2>
        <p class="welcome-message">Please enter your credentials to access the Inventory Management System.</p>
        <form method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" class="form-control" name="username" required />
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" name="password" required />
            </div>
            <button type="submit" class="btn btn-primary btn-block">Login</button>
        </form>

        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String message = "";

                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/InventoryDB", "root", "myadmin123");
                    stmt = conn.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
                    stmt.setString(1, username);
                    stmt.setString(2, password);
                    rs = stmt.executeQuery();

                    if (rs.next()) {
                        HttpSession session = request.getSession();
                        session.setAttribute("username", username);
                        response.sendRedirect("home.jsp");
                    } else {
                        message = "Invalid username or password.";
                        out.println("<script>alert('" + message + "');</script>");
                        out.println("<script>window.location.href='index.jsp';</script>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) {}
                    if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
                    if (conn != null) try { conn.close(); } catch (SQLException e) {}
                }
            }
        %>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
