<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
<c:import url="/WEB-INF/jsp/navbar.jsp"/>
<h2>Login</h2>
<form action="${pageContext.request.contextPath}/login" method="post">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>
    <button type="submit">Login</button>
</form>
</body>
</html>
