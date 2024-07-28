<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
</head>
<body>
<h2>Quiz Categories</h2>
<ul>
    <c:forEach var="category" items="${categories}">
        <li>
            <a href="${pageContext.request.contextPath}/quiz?categoryId=${category.category_id}">${category.name}</a>
        </li>
    </c:forEach>
</ul>

<h2>Recent Quiz Results</h2>
<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Date Taken</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="quiz" items="${quizzes}">
        <tr>
            <td>${quiz.name}</td>
            <td>${quiz.time_start}</td>
            <td><a href="${pageContext.request.contextPath}/quiz-result?quizId=${quiz.quiz_id}">View Result</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
