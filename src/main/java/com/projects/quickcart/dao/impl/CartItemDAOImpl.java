package com.projects.quickcart.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projects.quickcart.dao.CartItemDAO;
import com.projects.quickcart.entity.CartItem;
import com.projects.quickcart.entity.Customer;
import com.projects.quickcart.entity.Product;

import jakarta.transaction.Transactional;

@Repository
public class CartItemDAOImpl implements CartItemDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addItem(long cutomerId, long productId) {
		sessionFactory.inTransaction(session -> {
			CartItem cartItem = new CartItem();
			cartItem.setCustomer(session.get(Customer.class, cutomerId));
			cartItem.setProduct(session.get(Product.class, productId));
			session.persist(cartItem);
		});

	}

	@Override
	public void removeItem(long cutomerId, long productId) {
		sessionFactory.inTransaction(session -> {
			var query = session
					.createMutationQuery("delete from CartItem c where c.customer.id = :cid and c.product.id = :pid");
			query.setParameter("cid", cutomerId);
			query.setParameter("pid", productId);
			query.executeUpdate();
		});
	}

	@Override
	@Transactional
	public List<CartItem> getCartItems(long userId) {
		return sessionFactory.fromTransaction(session -> {
			var query = session.createSelectionQuery("from CartItem c where c.customer.id = :id", CartItem.class);
			query.setParameter("id", userId);
			return query.getResultList();
		});
	}

	@Override
	public void updateItem(long userId, long productId, int quantity) {
		sessionFactory.inTransaction(session -> {
			session.createMutationQuery(
					"update CartItem c set c.quantity = :qty where c.product.id = :pid and c.customer.id = :cid")
					.setParameter("qty", quantity).setParameter("pid", productId).setParameter("cid", userId)
					.executeUpdate();
		});
	}

	@Override
	public boolean isProductInCart(Long userId, long productId) {
		return sessionFactory.fromSession(session -> {
			return session
					.createQuery("from CartItem c where c.customer.id = :cid and c.product.id = :pid", CartItem.class)
					.setParameter("cid", userId).setParameter("pid", productId).getResultCount() == 1;
		});
	}

}
