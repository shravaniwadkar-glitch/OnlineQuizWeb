package fquiz;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;
import dao.*;
import model.Question;

@WebServlet("/Quizservlet")
public class QuizServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("username");

        AttemptDAO attemptDAO = new AttemptDAO();

        if (attemptDAO.hasAttempted(name)) {
            response.sendRedirect("index.jsp?error=Already attempted!");
            return;
        }

        HttpSession session = request.getSession();
        session.setAttribute("name", name);

        QuizDAO dao = new QuizDAO();
        List<Question> list = dao.getAllQuestions();

        request.setAttribute("questions", list);

        RequestDispatcher rd = request.getRequestDispatcher("quiz.jsp");
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doPost(req, res);
    }
}