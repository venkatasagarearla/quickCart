package com.projects.quickcart.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projects.quickcart.dao.ProductReviewDAO;
import com.projects.quickcart.entity.Customer;
import com.projects.quickcart.entity.Product;
import com.projects.quickcart.entity.ProductReview;

import jakarta.transaction.Transactional;

@Repository
@Transactional
public class ProductReviewImpl implements ProductReviewDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<ProductReview> findByProductId(long productId) {
		return sessionFactory.fromSession(session -> {
			return session.createQuery("FROM ProductReview where product.id= :productId", ProductReview.class)
					.setParameter("productId", productId).getResultList();
		});
	}

	@Override
	public List<ProductReview> getCustomerReviews(long userId) {
		return sessionFactory.fromSession(session -> {
			return session.createQuery("from ProductReview pr where pr.customer.id = :cid", ProductReview.class)
					.setParameter("cid", userId).getResultList();
		});
	}

	@Override
	public void addCustomerReview(long userId, long productId, String reviewContent, int rating) {
		sessionFactory.inTransaction(session -> {
			var customer = session.get(Customer.class, userId);
			var product = session.get(Product.class, productId);
			ProductReview review = new ProductReview();
			review.setCustomer(customer);
			review.setProduct(product);
			review.setRating(rating);
			review.setReviewContent(reviewContent);
			session.persist(review);
		});
	}

	@Override
	public void deleteReview(long id) {
		sessionFactory.inTransaction(session -> {
			session.createQuery("delete from ProductReview pr where pr.id = :id").setParameter("id", id)
					.executeUpdate();
		});
	}

}
