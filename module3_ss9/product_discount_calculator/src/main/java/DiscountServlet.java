import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Servlet", value = "/product-discount")
public class DiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productDescription = request.getParameter("product-description");
        double listPrice = Double.parseDouble(request.getParameter("list-price"));
        double discountPercent = Double.parseDouble(request.getParameter("discount-percent"));
        double discountAmount = listPrice * discountPercent * 0.01;
        double discountPrice = listPrice - discountAmount;

        request.setAttribute("DiscountAmount", discountAmount);
        request.setAttribute("DiscountPrice", discountPrice);
        request.setAttribute("ProductDescription", productDescription);

        request.getRequestDispatcher("/display-discount.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
