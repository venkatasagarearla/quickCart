package com.projects.quickcart.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.projects.quickcart.dto.CurrentUser;
import com.projects.quickcart.entity.ProductReview;
import com.projects.quickcart.service.ProductReviewService;

@Controller
@RequestMapping("/reviews")
public class ProductReviewController {

	@Autowired
	private ProductReviewService productReviewService;

	@GetMapping
	public ModelAndView listReviewsByproduct(@SessionAttribute CurrentUser user) {
		List<ProductReview> reviews = productReviewService.getReviewsByCustomerId(user.getUserId());
		ModelAndView mView = new ModelAndView("customer/reviews");
		mView.addObject("reviews", reviews);
		return mView;
	}

	@PostMapping
	public ModelAndView showNewReviewForm(@SessionAttribute CurrentUser user, @RequestParam long productId,
			@RequestParam String reviewContent, @RequestParam int rating, @RequestHeader String referer) {
		ModelAndView mView = new ModelAndView("redirect:" + referer);
		productReviewService.saveProductReview(user.getUserId(), productId, reviewContent, rating);
		return mView;
	}

	@DeleteMapping
	public ModelAndView updateReview(@SessionAttribute CurrentUser user, @RequestParam long reviewId) {
		productReviewService.deleteReview(reviewId);
		return new ModelAndView("redirect:/reviews");
	}

}
