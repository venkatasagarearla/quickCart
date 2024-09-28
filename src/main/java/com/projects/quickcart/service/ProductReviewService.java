package com.projects.quickcart.service;

import java.util.List;

import com.projects.quickcart.entity.ProductReview;

public interface ProductReviewService {

	List<ProductReview> getReviewsByProductId(long productId);

	List<ProductReview> getReviewsByCustomerId(long userId);

	void saveProductReview(long userId, long productId, String reviewContent, int rating);

	void deleteReview(long id);
}
