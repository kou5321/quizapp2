<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quiz</title>
    <style>
        .answered { background-color: #d3ffd3; }
        .unanswered { background-color: #ffd3d3; }
    </style>
</head>
<body>
<h2>Quiz</h2>
<div id="timer">5:00</div>
<form action="${pageContext.request.contextPath}/quiz" method="post">
    <c:forEach var="question" items="${questions}">
        <div>
            <h3>${question.description}</h3>
            <c:forEach var="choice" items="${question.choices}">
                <input type="radio" id="choice${choice.choice_id}" name="selectedChoices" value="${choice.choice_id}">
                <label for="choice${choice.choice_id}">${choice.description}</label><br>
            </c:forEach>
        </div>
    </c:forEach>
    <button type="submit">Submit Quiz</button>
</form>
</body>

<script>
    let timeLeft = 300; // 5 minutes in seconds

    function updateTimer() {
        const minutes = Math.floor(timeLeft / 60);
        const seconds = timeLeft % 60;
        document.getElementById('timer').innerText = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
        if (timeLeft > 0) {
            timeLeft--;
        } else {
            alert('Time is up! The quiz will be submitted automatically.');
            document.forms[0].submit();
        }
    }

    setInterval(updateTimer, 1000);
</script>

</html>
