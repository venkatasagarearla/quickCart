package com.projects.quickcart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projects.quickcart.dao.OrderDetailDAO;
import com.projects.quickcart.entity.OrderDetail;
import com.projects.quickcart.entity.OrderStatus;
import com.projects.quickcart.service.RetailerService;

@Service
public class RetailerServiceImpl implements RetailerService {

	@Autowired
	private OrderDetailDAO orderDetailDAO;

	@Override
	public List<OrderDetail> getOrders(long userId, OrderStatus status) {
		return orderDetailDAO.getRetailerOrderDetails(userId, status);
	}

	@Override
	public void changeOrderStatus(long userId, long orderDetailId, OrderStatus status) {
		orderDetailDAO.changeOrderStatus(userId, orderDetailId, status);
	}

}
