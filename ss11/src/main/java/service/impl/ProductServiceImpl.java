package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepositoryImpl;
import service.IProductService;

import java.util.List;

public class ProductServiceImpl implements IProductService {
    IProductRepository productRepository = new ProductRepositoryImpl();

    @Override
    public List<Product> findALL() {
        return productRepository.findALL();
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public void create(Product product) {
        productRepository.create(product);
    }

    @Override
    public void update(Product product) {
        productRepository.update(product);
    }

    @Override
    public void delete(Product product) {
        productRepository.delete(product);
    }

    @Override
    public List<Product> search(String name) {
        return productRepository.search(name);
    }

}
