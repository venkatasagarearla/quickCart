package com.projects.quickcart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.projects.quickcart.entity.ProductReview;
import com.projects.quickcart.service.CustomerService;
import com.projects.quickcart.service.ProductReviewService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {
	@Autowired
	private CustomerService customerService;

	@Autowired
	private ProductReviewService productReviewService;

	@GetMapping("/products")
	public ModelAndView productsView(@RequestParam(required = false) String category,
			@RequestParam(required = false) String search) {
		ModelAndView mView = new ModelAndView("products");
		mView.addObject("producs", customerService.getProducts(category, search));
		mView.addObject("categories", customerService.getCategories());
		return mView;
	}

	@GetMapping("/products/{id}")
	public ModelAndView productInfoView(@PathVariable long id, HttpSession session) {
		ModelAndView mView = new ModelAndView("product-info");
		var id1 = (Long) session.getAttribute("userId");
		if (id1 != null) {
			boolean isWishlisted = customerService.isProductWishlisted(id1, id);
			mView.addObject("wishlisted", isWishlisted);
			mView.addObject("inCart", customerService.isProductInCart(id1, id));
		}
		List<ProductReview> reviews = productReviewService.getReviewsByProductId(id);

		mView.addObject("product", customerService.getProduct(id));
		mView.addObject("reviews", reviews);
		return mView;
	}
}
