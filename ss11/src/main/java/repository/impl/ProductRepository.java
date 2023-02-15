package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1,"Heineken","18","50","vip"));
        productList.add(new Product(2,"Tiger","15","70","vip"));
        productList.add(new Product(3,"Huda","12","100","vip"));
        productList.add(new Product(4,"Larue","11","100","vip"));
        productList.add(new Product(5,"Strongbow","22","20","vip"));
        productList.add(new Product(6,"Budweiser","20","30","vip"));
    }

    @Override
    public List<Product> findALL() {
        return productList;
    }

    @Override
    public Product findById(int id) {
        for (Product product:productList) {
            if (id == product.getId()) {
                return product;
            }
        }
        return null;
    }

    @Override
    public void create(Product product) {
        product.setId(productList.size() + 1);
        productList.add(product);
    }

    @Override
    public void update(Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == product.getId()) {
                productList.set(i, productList.get(i));
            }
        }
    }

    @Override
    public void delete(Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if (product.getId() == productList.get(i).getId()) {
                productList.remove(i);
            }
        }
    }

    @Override
    public List<Product> search(String name) {
        List<Product> products = new ArrayList<>();
        for (Product product: productList) {
            if (product.getName().contains(name)) {
                products.add(product);
            }
        }
        return products;
    }
}
