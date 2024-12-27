<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.*"%>

<% User auth = (User) request.getSession().getAttribute("auth");
	if(auth!=null){
		
	response.sendRedirect("index.jsp");
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>

<title>Index</title>
<!-- bootstrap css -->
<%@include file="bootstrap/head.jsp" %>

<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body> 


<div class="card shadow-lg p-4" style="width: 24rem;">
    <div class="card-body" id="dd">
        <!-- Login Form -->
        <form action="user-login" method="post" id="login-form">
            <h1 class="card-title text-center mb-4">Login</h1>
            <div class="mb-3">
                <label for="login-email" class="form-label">Email address</label>
                <input type="email" class="form-control" id="login-email" name="em" placeholder="Enter your email" required>
            </div>
            <div class="mb-3">
                <label for="login-password" class="form-label">Password</label>
                <input type="password" class="form-control" id="login-password" name="ep" placeholder="Enter your password" required>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>
        </form>

        <!-- Registration Form -->
        <form action="RegesterServlet" method="post" id="registration-form" class="d-none">
            <h1 class="card-title text-center mb-2">Register</h1>
            <div class="mb-3">
                <label for="reg-name" class="form-label">Name </label>
                <input type="text" class="form-control" id="reg-name" name="reg-name" placeholder="Enter your name" required>
            </div>
            <div class="mb-3">
                <label for="reg-email" class="form-label">Email address</label>
                <input type="email" class="form-control" id="reg-email" name="reg-email" placeholder="Enter your email" required>
            </div>
            <div class="mb-3">
                <label for="reg-password" class="form-label">Password</label>
                <input type="password" class="form-control" id="reg-password" name="reg-password" placeholder="Enter your password" required>
            </div>
            <div class="mb-3">
                <label for="confirm-password" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" id="confirm-password" name="confirm-password" placeholder="Confirm your password" required>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Register</button>
            </div>
        </form>

        <!-- Toggle Links -->
        <div class="text-center mt-3">
            <span id="switch-text">Don’t have an account?</span>
            <span class="switch-link" id="switch-link">Register here</span>
        </div>
    </div>
</div>




  <script>
 
  const loginForm = document.getElementById('login-form');
  const registrationForm = document.getElementById('registration-form');
  const switchText = document.getElementById('switch-text');
  const switchLink = document.getElementById('switch-link');

  // Function to clear input fields
  const clearFields = (form) => {
      const inputs = form.querySelectorAll('input');
      inputs.forEach(input => input.value = '');
  };

  switchLink.addEventListener('click', () => {
      if (loginForm.classList.contains('d-none')) {
          // Switch to Login
          clearFields(registrationForm);
          registrationForm.classList.add('d-none');
          loginForm.classList.remove('d-none');
          switchText.textContent = 'Don’t have an account?';
          switchLink.textContent = 'Register here';
      } else {
          // Switch to Registration
          clearFields(loginForm);
          loginForm.classList.add('d-none');
          registrationForm.classList.remove('d-none');
          switchText.textContent = 'Already have an account?';
          switchLink.textContent = 'Login here';
      }
  });

  // Clear registration fields if passwords don't match on form submit
  registrationForm.addEventListener('submit', (e) => {
      const password = document.getElementById('reg-password').value;
      const confirmPassword = document.getElementById('confirm-password').value;

      if (password !== confirmPassword) {
          e.preventDefault(); // Prevent form submission
          alert('Passwords do not match!');
          clearFields(registrationForm);
      }
  });
  </script>
  

<!-- bootstrap Script -->
<%@include file="bootstrap/footer.jsp" %>

</body>
</html>