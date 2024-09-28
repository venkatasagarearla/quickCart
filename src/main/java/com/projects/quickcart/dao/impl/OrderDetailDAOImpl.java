package com.projects.quickcart.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.projects.quickcart.dao.OrderDetailDAO;
import com.projects.quickcart.entity.OrderDetail;
import com.projects.quickcart.entity.OrderStatus;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Repository
public class OrderDetailDAOImpl implements OrderDetailDAO {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<OrderDetail> getRetailerOrderDetails(long userId, OrderStatus status) {
		StringBuilder queryBuilder = new StringBuilder(
				"SELECT od FROM OrderDetail od JOIN od.product p WHERE p.retailer.id = :userId");

		if (status != null) {
			queryBuilder.append(" AND od.orderStatus = :status");
		}

		var query = entityManager.createQuery(queryBuilder.toString(), OrderDetail.class);
		query.setParameter("userId", userId);

		if (status != null) {
			query.setParameter("status", status);
		}

		return query.getResultList();
	}

	@Override
	@Transactional
	public void changeOrderStatus(long retailerId, long orderDetailId, OrderStatus status) {
		// Step 1: Check if the OrderDetail exists and belongs to the retailer
		int updatedCount = entityManager
				.createQuery("UPDATE OrderDetail od " + "SET od.orderStatus = :status "
						+ "WHERE od.id = :orderDetailId " + "AND od.product.retailer.id = :retailerId")
				.setParameter("status", status).setParameter("orderDetailId", orderDetailId)
				.setParameter("retailerId", retailerId).executeUpdate();

		// Step 2: Check if any row was updated
		if (updatedCount == 0) {
			// If no rows were updated, this means either the OrderDetail does not exist,
			// or the retailer does not own the product.
			throw new IllegalArgumentException(
					"Either the OrderDetail does not exist or the retailer does not own the product.");
		}
	}

}
