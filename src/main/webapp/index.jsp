<!DOCTYPE html>
<html>
<head>
<title>Start Quiz</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
body {
    margin: 0;
    font-family: Arial;
    background: linear-gradient(135deg, #667eea, #764ba2);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* Card */
.box {
    background: white;
    padding: 30px;
    border-radius: 20px;
    width: 350px;
    text-align: center;
    box-shadow: 0px 10px 30px rgba(0,0,0,0.2);
    animation: fadeIn 1s ease;
}

/* Title */
h2 {
    margin-bottom: 10px;
}

/* Subtitle */
p {
    color: gray;
    font-size: 14px;
}

/* Input */
input[type="text"] {
    width: 90%;
    padding: 12px;
    margin-top: 15px;
    border-radius: 8px;
    border: 1px solid #ccc;
    transition: 0.3s;
}

/* Input focus animation */
input[type="text"]:focus {
    border-color: #667eea;
    outline: none;
    box-shadow: 0px 0px 8px rgba(102,126,234,0.5);
}

/* Button */
button {
    margin-top: 20px;
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 10px;
    background: #667eea;
    color: white;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s;
}

/* Button hover */
button:hover {
    background: #5a67d8;
    transform: scale(1.05);
}

/* Error */
.error {
    color: red;
    margin-top: 10px;
}

/* Animations */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}

/* Mobile */
@media screen and (max-width: 768px) {
    .box {
        width: 90%;
        padding: 20px;
    }
}
</style>

</head>

<body>

<div class="box">

<h2>🚀 Welcome to Quiz App</h2>
<p>Test your Java knowledge in 60 seconds!</p>

<form action="Quizservlet" method="post">
    <input type="text" name="username" placeholder="Enter your name" required>
    <button type="submit">Start Quiz</button>
</form>

<%
String error = request.getParameter("error");
if(error != null){
%>
<p class="error"><%= error %></p>
<% } %>

</div>

</body>
</html>