<%@ page import="java.sql.*, dao.DBconnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Result</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
body {
    font-family: Arial;
    background: linear-gradient(to right, #43cea2, #185a9d);
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* FULL SCREEN */
    overflow: hidden; /* remove scroll */
    color: white;
}

/* Main Card */
.box {
    background: white;
    color: black;
    padding: 20px;
    width: 320px;
    max-height: 90vh; /* prevent overflow */
    border-radius: 15px;
    box-shadow: 0px 10px 25px rgba(0,0,0,0.2);
    animation: pop 0.6s ease;
    overflow-y: auto; /* scroll INSIDE if needed */
}

/* Animation */
@keyframes pop {
    0% { transform: scale(0.6); opacity: 0; }
    100% { transform: scale(1); opacity: 1; }
}

/* Score */
.score {
    font-size: 24px;
    font-weight: bold;
    color: #667eea;
    text-align: center;
}

/* Leaderboard */
.leaderboard {
    margin-top: 15px;
}

.leaderboard h3 {
    text-align: center;
    margin-bottom: 10px;
}

.leaderboard p {
    background: #f4f6f9;
    padding: 6px;
    border-radius: 6px;
    margin: 4px 0;
    font-size: 14px;
}

/* Mobile */
@media screen and (max-width: 768px) {
    .box {
        width: 90%;
    }
}
</style>

</head>

<body>

<div class="box">

    <h2 style="text-align:center;">🎉 Quiz Completed!</h2>

    <p style="text-align:center;"><b>Name:</b> <%= session.getAttribute("name") %></p>

    <p class="score">
        Score: <span id="score">0</span>
    </p>

    <!-- 🏆 Leaderboard -->
    <div class="leaderboard">
        <h3>🏆 Top 5 Players</h3>

        <%
        try {
            Connection con = DBconnection.getConnection();
            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(
                "SELECT * FROM results ORDER BY score DESC LIMIT 5");

            while(rs.next()){
        %>

        <p><b><%= rs.getString("name") %></b> - <%= rs.getInt("score") %></p>

        <%
            }
        } catch(Exception e){
            out.println("<p>Error loading leaderboard</p>");
        }
        %>
    </div>

</div>

<script>
// 🎯 Score Animation
let finalScore = <%= request.getAttribute("score") %>;
let count = 0;

let interval = setInterval(() => {
    document.getElementById("score").innerText = count;
    count++;

    if(count > finalScore){
        clearInterval(interval);
    }
}, 80);
</script>

</body>
</html>