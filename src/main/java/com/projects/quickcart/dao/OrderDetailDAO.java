package com.projects.quickcart.dao;

import java.util.List;

import com.projects.quickcart.entity.OrderDetail;
import com.projects.quickcart.entity.OrderStatus;

public interface OrderDetailDAO {

	List<OrderDetail> getRetailerOrderDetails(long userId, OrderStatus status);

	void changeOrderStatus(long retailerId, long orderDetailId, OrderStatus status);

}
