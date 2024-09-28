package com.projects.quickcart.service;

import java.util.List;

import com.projects.quickcart.dto.ProductForm;
import com.projects.quickcart.entity.Product;

public interface InventoryService {
	List<Product> getAllProducts(long id);

	void addProduct(ProductForm form, Long id);

	Product getProductInfo(Long userId, long id);

	int updateProduct(long userId, long id, ProductForm form);

	void deleteProduct(long userId, long id);

}
