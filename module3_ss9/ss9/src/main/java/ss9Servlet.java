import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ss9Servlet",value = "/ss9")
public class ss9Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double numFirst = Double.parseDouble(request.getParameter("number-first1"));
        double numSecond = Double.parseDouble(request.getParameter("number-second1"));

        double sum = numFirst + numSecond;
        request.setAttribute("sum1", sum);
        request.getRequestDispatcher("/ketqua.jsp").forward(request,response);
    }
}
