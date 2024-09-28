package com.projects.quickcart.dao;

import java.util.List;

import com.projects.quickcart.entity.CartItem;
import com.projects.quickcart.entity.Order;
import com.projects.quickcart.entity.OrderDetail;
import com.projects.quickcart.entity.PaymentDetail;

public interface OrderDAO {

	double getCartValue(long customerId);

	List<CartItem> getCartItems(long userId);

	void save(PaymentDetail paymentDetail);

	void save(Order order);

	void save(OrderDetail detail);

	List<Order> getCustomerOrders(long customerId);

	void cancelCustomerOrder(long customerId, long orderDetailId);
}
