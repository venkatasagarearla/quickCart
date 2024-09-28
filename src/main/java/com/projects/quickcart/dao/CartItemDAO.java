package com.projects.quickcart.dao;

import java.util.List;

import com.projects.quickcart.entity.CartItem;

public interface CartItemDAO {
	void addItem(long cutomerId, long productId);

	void removeItem(long cutomerId, long productId);

	List<CartItem> getCartItems(long userId);

	void updateItem(long userId, long productId, int quantity);

	boolean isProductInCart(Long userId, long productId);
}
