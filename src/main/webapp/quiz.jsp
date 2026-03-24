<%@ page import="java.util.*, model.Question" %>

<!DOCTYPE html>
<html>
<head>
<title>Quiz</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
body {
    font-family: Arial;
    background: linear-gradient(to right, #667eea, #764ba2);
    margin: 0;
    padding: 0;
}

/* Container */
.container {
    width: 60%;
    margin: 40px auto;
    background: white;
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0px 5px 20px rgba(0,0,0,0.2);
    animation: fadeIn 1s ease-in;
}

/* Title */
h2 {
    text-align: center;
    color: #333;
}

/* Timer */
#timer {
    text-align: center;
    font-size: 18px;
    margin-bottom: 20px;
    color: red;
}

/* Question Card */
.question {
    margin-bottom: 20px;
    padding: 15px;
    border-radius: 10px;
    background: #f4f6f9;
    transition: transform 0.3s, box-shadow 0.3s;
    animation: slideUp 0.5s ease forwards;
}

/* Hover Animation */
.question:hover {
    transform: scale(1.02);
    box-shadow: 0px 4px 15px rgba(0,0,0,0.15);
}

/* Options */
.option {
    margin: 8px 0;
    padding: 8px;
    border-radius: 5px;
    transition: background 0.3s;
}

/* Option Hover */
.option:hover {
    background: #e0e7ff;
    cursor: pointer;
}

/* Button */
button {
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 8px;
    background: #667eea;
    color: white;
    font-size: 16px;
    cursor: pointer;
    transition: background 0.3s, transform 0.2s;
}

/* Button Hover */
button:hover {
    background: #5a67d8;
    transform: scale(1.03);
}

/* Animations */
@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}

@keyframes slideUp {
    from { transform: translateY(20px); opacity: 0; }
    to { transform: translateY(0); opacity: 1; }
}

/* 📱 Mobile Responsive */
@media screen and (max-width: 768px) {
    .container {
        width: 90%;
        margin: 20px auto;
        padding: 15px;
    }

    h2 {
        font-size: 20px;
    }

    #timer {
        font-size: 16px;
    }

    button {
        font-size: 14px;
        padding: 10px;
    }
}

</style>

</head>

<body>

<div class="container">

<h2>🚀 Java Quiz</h2>

<h3 id="timer">Time Left: 60</h3>

<script>
let time = 60;

let timer = setInterval(function() {
    document.getElementById("timer").innerText = "Time Left: " + time;
    time--;

    if (time < 0) {
        clearInterval(timer);
        document.forms[0].submit();
    }
}, 1000);
</script>

<form action="ResultServlet" method="post">

<%
List<Question> list = (List<Question>) request.getAttribute("questions");
int i = 1;

for(Question q : list){
%>

<div class="question">
    <p><b>Q<%= i %>. <%= q.getQuestion() %></b></p>

    <div class="option">
        <input type="radio" name="q<%=i%>" value="A"> <%= q.getOptionA() %>
    </div>

    <div class="option">
        <input type="radio" name="q<%=i%>" value="B"> <%= q.getOptionB() %>
    </div>

    <div class="option">
        <input type="radio" name="q<%=i%>" value="C"> <%= q.getOptionC() %>
    </div>

    <div class="option">
        <input type="radio" name="q<%=i%>" value="D"> <%= q.getOptionD() %>
    </div>
</div>

<%
i++;
}
%>

<button type="submit">Submit Quiz</button>

</form>

</div>

</body>
</html>