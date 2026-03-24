package fquiz;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;
import java.sql.*;

import model.Question;
import dao.*;

@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = (String) request.getSession().getAttribute("name");

        QuizDAO dao = new QuizDAO();
        List<Question> list = dao.getAllQuestions();

        int score = 0;
        int i = 1;

        for (Question q : list) {
            String userAns = request.getParameter("q" + i);

            if (userAns != null && userAns.equals(q.getCorrectAnswer())) {
                score++;
            }
            i++;
        }

        // ✅ Save attempt
        AttemptDAO attemptDAO = new AttemptDAO();
        attemptDAO.saveAttempt(name);

        // ✅ Save result in DB (THIS WAS MISSING)
        try {
            Connection con = DBconnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO results (name, score) VALUES (?, ?)");

            ps.setString(1, name);
            ps.setInt(2, score);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // ✅ Send score to JSP
        request.setAttribute("score", score);

        RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
        rd.forward(request, response);
    }
}