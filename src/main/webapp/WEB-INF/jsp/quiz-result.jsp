<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quiz Result</title>
    <style>
        .correct { background-color: #d3ffd3; }
        .incorrect { background-color: #ffd3d3; }
    </style>
</head>
<body>
<h2>Quiz Result</h2>
<p>Quiz Name: ${quizName}</p>
<p>User: ${userFullName}</p>
<p>Start Time: ${quizStartTime}</p>
<p>End Time: ${quizEndTime}</p>
<p>Result: ${result}</p>

<h3>Question Results</h3>
<c:forEach var="result" items="${results}">
    <div class="${result.correct ? 'correct' : 'incorrect'}">
        <h4>${result.questionContent}</h4>
        <p>Selected Option: ${result.userSelectedOption}</p>
        <p>Correct Option:
            <c:forEach var="option" items="${result.options}">
                <c:if test="${option.correct}">${option.description}</c:if>
            </c:forEach>
        </p>
    </div>
</c:forEach>

<a href="${pageContext.request.contextPath}/home">Take Another Quiz</a>
</body>
</html>
