package com.projects.quickcart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projects.quickcart.dao.ProductDAO;
import com.projects.quickcart.dto.ProductForm;
import com.projects.quickcart.entity.Product;
import com.projects.quickcart.service.InventoryService;

@Service
public class InventoryServiceImpl implements InventoryService {

	@Autowired
	private ProductDAO dao;

	@Override
	public List<Product> getAllProducts(long retailerId) {
		return dao.getRetailerProducts(retailerId);
	}

	@Override
	public void addProduct(ProductForm form, Long id) {
		dao.addProduct(form, id);
	}

	@Override
	public Product getProductInfo(Long userId, long id) {
		return dao.addRetailerProduct(userId, id);
	}

	public int updateProduct(long userId, long id, ProductForm form) {
		return dao.updateProduct(null, id, form);
	}

	@Override
	public void deleteProduct(long userId, long id) {
		dao.deleteProduct(userId, id);

	}

}
