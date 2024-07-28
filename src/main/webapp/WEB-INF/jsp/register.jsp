<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
</head>
<body>
<h2>Register</h2>
<form action="${pageContext.request.contextPath}/register" method="post">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br>
    <label for="firstname">First Name:</label>
    <input type="text" id="firstname" name="firstname" required><br>
    <label for="lastname">Last Name:</label>
    <input type="text" id="lastname" name="lastname" required><br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>
    <button type="submit">Register</button>
</form>
</body>
</html>
