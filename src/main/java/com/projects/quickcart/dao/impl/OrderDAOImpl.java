package com.projects.quickcart.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.projects.quickcart.dao.OrderDAO;
import com.projects.quickcart.entity.CartItem;
import com.projects.quickcart.entity.Order;
import com.projects.quickcart.entity.OrderDetail;
import com.projects.quickcart.entity.OrderStatus;
import com.projects.quickcart.entity.PaymentDetail;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityNotFoundException;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public double getCartValue(long customerId) {
		return entityManager
				.createQuery("select sum(qunatity) from CartItem c where c.customer.id = :cid", Double.class)
				.setParameter("cid", customerId).getSingleResult();
	}

	@Override
	@Transactional
	public List<CartItem> getCartItems(long userId) {
		return entityManager.createQuery("from CartItem c where c.customer.id = :id", CartItem.class)
				.setParameter("id", userId).getResultList();
	}

	@Override
	public void save(Order order) {
		entityManager.persist(order);
	}

	@Override
	public void save(PaymentDetail paymentDetail) {
		entityManager.persist(paymentDetail);
	}

	@Override
	public void save(OrderDetail detail) {
		entityManager.persist(detail);

	}

	@Override
	public List<Order> getCustomerOrders(long customerId) {
		return entityManager.createQuery("from Order c where c.customer.id = :cid", Order.class)
				.setParameter("cid", customerId).getResultList();
	}

	@Override
	@Transactional
	public void cancelCustomerOrder(long customerId, long orderDetailId) {
		// Fetch the OrderDetail along with the associated Order and Customer
		OrderDetail orderDetail = entityManager.createQuery(
				"SELECT od FROM OrderDetail od JOIN od.order o WHERE od.id = :orderDetailId AND o.customer.id = :customerId",
				OrderDetail.class).setParameter("orderDetailId", orderDetailId).setParameter("customerId", customerId)
				.getSingleResult();

		// Ensure the orderDetail exists and belongs to the given customer
		if (orderDetail == null) {
			throw new EntityNotFoundException("Order detail not found for this customer.");
		}

		// Check if the order is in 'PENDING' state
		if (orderDetail.getOrderStatus() != OrderStatus.PENDING) {
			throw new IllegalStateException("Cannot cancel an order that is not in PENDING status.");
		}

		// Set the order status to 'CANCELED'
		orderDetail.setOrderStatus(OrderStatus.CANCELED);

		// Persist the updated order detail status
		entityManager.merge(orderDetail);
	}

}
