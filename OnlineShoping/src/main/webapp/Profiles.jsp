<%@page import="SqlConnection.dbcon"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
String con = "failed";
if (auth == null) {
    response.sendRedirect("login.jsp"); // Redirect to login if not authenticated
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <%@include file="bootstrap/head.jsp"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
    <style>
        /* Main Container */
       .profile-container {
    max-width: 900px;
    margin: 130px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 10px;
    background-color: #f9f9f9;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.7); /* Darker black shadow */
}

        /* Headline Styling */
        .profile-header {
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: bold;
            color: #333;
            text-transform: uppercase;
        }

        .profile-header i {
            margin-right: 10px;
            color: #007bff;
        }

        /* Flexbox for Details and Reset */
        .profile-content {
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }

        /* Individual Box Styling */
        .profile-box {
            flex: 1;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 15px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .profile-box h4 {
            margin-bottom: 0px;
            font-size: 20px;
            color: #444;
        }

        .profile-box h4 i {
            margin-right: 8px;
            color: #17a2b8;
        }

        /* Form Field Icons */
        .form-group {
            position: relative;
            margin-bottom: 15px;
        }

        .form-group i {
            position: absolute;
            left: 15px;  /* Adjusted position */
            top: 50%;
            transform: translateY(-50%);
            color: #888;
        }

        .form-control {
            padding-left: 40px;  /* Increased padding to prevent overlap */
        }

        /* Button Styling */
        .btn-custom {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <%@include file="bootstrap/Navbar.jsp"%>

    <div class="container profile-container">
        <!-- Headline -->
        <div class="profile-header">
            <i class="bi bi-person-circle"></i> User Profile Details
        </div>

        <!-- Content: Username and Password Reset -->
        <div class="profile-content">
            <!-- Left Side: Username Details -->
            <div class="profile-box">
                <h4><i class="bi bi-person"></i> Username Details</h4>
                <form action="ProfileDetail" method="post">
                    <div class="form-group">
                       
                        <label>Username:</label>
                        <input type="text" name="username" class="form-control" value="<%= auth.getName() %>" required>
                    </div>
                    <div class="form-group">
                        
                        <label>Email:</label>
                        <input type="email" name="email" class="form-control" value="<%= auth.getEmail() %>" required>
                    </div>
                    <div class="form-group">
                       
                        <label>Contact:</label>
                        <input type="text" name="Contact" class="form-control" value="<%= auth.getContact() %>" required>
                    </div>
                    <div class="form-group">
                        
                        <label>Address:</label>
                       <textarea name="address" class="form-control" rows="3" required><%= auth.getAddress() %></textarea>
                </div>
                    <button type="submit" class="btn btn-primary btn-custom">Update Profile</button>
                </form>
            </div>

            <!-- Right Side: Password Reset -->
            <div class="profile-box">
                <h4><i class="bi bi-lock"></i> Password Reset</h4>
                <form action="ResetPasswordServlet" method="post">
                    <div class="form-group">
                        
                        <label>Current Password:</label>
                        <input type="password" name="currentPassword" class="form-control" 
                        value="<%= auth.getPassword() %>"  required>
                    </div>
                    <div class="form-group">
                       
                        <label>New Password:</label>
                        <input type="password" name="newPassword" class="form-control" required>
                    </div>
                    <div class="form-group">
                        
                        <label>Confirm New Password: </label>
                        <input type="password" name="confirmPassword" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-danger btn-custom">Reset Password</button>
                </form>
            </div>
        </div>
    </div>

    <%@include file="bootstrap/footer.jsp"%>
</body>
</html>
