import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomersListServlet", value = "/Customers")
public class CustomersListServlet extends HttpServlet {
    private List<Customers> customerslist = new ArrayList<>();

    public void init(){
        customerslist.add(new Customers(1,"Mai Văn Hoàn","1983-08-20","Hà Nội","https://cdn.baogiaothong.vn/upload/2-2022/images/2022-05-25/2-1653445668-926-width740height481.jpg "));
        customerslist.add(new Customers(2,"Mai Văn Nam","1983-08-21","Bắc Giang","https://cdn.baogiaothong.vn/upload/2-2022/images/2022-05-25/2-1653445668-926-width740height481.jpg"));
        customerslist.add(new Customers(3,"Mai Thái Hòa","1983-08-22","Nam Định","https://cdn.baogiaothong.vn/upload/2-2022/images/2022-05-25/2-1653445668-926-width740height481.jpg"));
        customerslist.add(new Customers(4,"Trần ĐĂng Khoa","1983-08-17","Hà Tây","https://cdn.baogiaothong.vn/upload/2-2022/images/2022-05-25/2-1653445668-926-width740height481.jpg"));
        customerslist.add(new Customers(5,"Nguyến Đình Thi","1983-08-19","Hà Nội","https://cdn.baogiaothong.vn/upload/2-2022/images/2022-05-25/2-1653445668-926-width740height481.jpg"));


    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",this.customerslist);
        request.getRequestDispatcher("/index,jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",this.customerslist);
        request.getRequestDispatcher("/index.jsp").forward(request,response);

    }
}
