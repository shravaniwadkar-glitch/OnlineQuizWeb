package dao;
import java.sql.*;
import java.util.*;
import model.Question;

public class QuizDAO 
{
	

	    public List<Question> getAllQuestions() {
	        List<Question> list = new ArrayList<>();

	        try {
	            Connection con = DBconnection.getConnection();
	            Statement st = con.createStatement();
	            ResultSet rs = st.executeQuery("SELECT * FROM questions");

	            while (rs.next()) {
	                Question q = new Question();
	                q.setQuestion(rs.getString("question"));
	                q.setOptionA(rs.getString("optionA"));
	                q.setOptionB(rs.getString("optionB"));
	                q.setOptionC(rs.getString("optionC"));
	                q.setOptionD(rs.getString("optionD"));
	                q.setCorrectAnswer(rs.getString("answer"));

	                list.add(q);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        System.out.println("Questions fetched: " + list.size());
	        return list;
	    }
}
