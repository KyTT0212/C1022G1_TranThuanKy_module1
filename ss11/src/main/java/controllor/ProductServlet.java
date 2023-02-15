package controllor;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet",value = "/product")
public class ProductServlet extends HttpServlet {
    IProductService productService = new ProductService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameAction = request.getParameter("nameAction");
        if (nameAction == null){
            nameAction = "";
        }
        switch (nameAction){
            case "create":
                create (request,response);
                break;
            case "update":
                update (request,response);
                break;
            case "delete":
                delete (request,response);
                break;
            case "search":
                search (request,response);
                break;
            default:
                break;
        }

    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id =Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);

        if(product == null){
            try {
                request.getRequestDispatcher("view/error404.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            productService.delete(product);
            try {
                response.sendRedirect("/product");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String status = request.getParameter("status");
//        String producer = request.getProducer("producer");

        Product product = productService.findById(id);

        if(product==null){
            try{
                request.getRequestDispatcher("/view/error404.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            product.setName(name);
            product.setPrice(price);
            product.setQuantity(quantity);
            product.setStatus(status);
//            producer.setProducer(producer);

            productService.update(product);
            try {
                response.sendRedirect("/product");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String status = request.getParameter("status");
//        String producer = request.getProducer("producer");

        productService.create(new Product(name,price,quantity,status));
        try {
            response.sendRedirect("/product");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String productName = request.getParameter("search");
        List<Product> productList = productService.search(productName);

        if (productList==null){
            try{
                request.getRequestDispatcher("/view/error404.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            try {
                request.setAttribute("productList", productList);
                request.getRequestDispatcher("/view/search.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameAction = request.getParameter("nameAction");
        if (nameAction == null){
            nameAction = "";
        }
        switch (nameAction){
            case "create":
                createForm (request,response);
                break;
            case "update":
                updateForm (request,response);
                break;
            case "delete":
                deleteForm (request,response);
                break;
            case "search":
                break;
            default:
                displayListProduct (request,response);
                break;
//        }
    }



}

    private void displayListProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.findALL();
        request.setAttribute("productList",productList);
        try{
            request.getRequestDispatcher("/view/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);

        request.setAttribute("product",product);
        try{
            request.getRequestDispatcher("/view/delete.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);

        request.setAttribute("product", product);
        try{
            request.getRequestDispatcher("/view/update.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/view/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    }
