package com.chtrembl.petstore.product.api;

import com.chtrembl.petstore.product.model.Product;
import org.springframework.data.repository.CrudRepository;

public interface ProductRepository extends CrudRepository<Product, String> {
}
