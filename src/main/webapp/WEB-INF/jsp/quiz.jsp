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
                <input type="radio" id="choice${choice.choice_id}" name="selectedChoices_${question.question_id}" value="${choice.choice_id}">
                <label for="choice${choice.choice_id}">${choice.description}</label><br>
            </c:forEach>
        </div>
    </c:forEach>
    <button type="submit">Submit Quiz</button>
</form>

<script>
    let timeLeft = 300; // 5 minutes in seconds

    function updateTimer() {
        if (timeLeft >= 0) {
            const minutes = Math.floor(timeLeft / 60);
            const seconds = timeLeft % 60;
            document.getElementById('timer').innerText = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
            console.log(`Time left: ${minutes}:${seconds < 10 ? '0' : ''}${seconds}`); // Debugging statement
            timeLeft--;

            if (timeLeft < 0) {
                alert('Time is up! The quiz will be submitted automatically.');
                document.forms[0].submit();
            }
        }
    }

    setInterval(updateTimer, 1000);
    updateTimer(); // Initial call to set the timer display immediately
</script>
</body>
</html>
