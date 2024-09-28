package com.projects.quickcart.controller.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.projects.quickcart.dto.CheckoutForm;
import com.projects.quickcart.dto.CurrentUser;
import com.projects.quickcart.service.CustomerService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CustomerService customerService;

	@GetMapping
	public ModelAndView getCart(@SessionAttribute CurrentUser user) {
		ModelAndView mView = new ModelAndView("customer/cart");
		mView.addObject("cartItems", customerService.getCartItemsByCustomer(user.getUserId()));
		return mView;
	}

	@PostMapping
	public ModelAndView postCart(@SessionAttribute CurrentUser user, @RequestParam long productId) {
		ModelAndView mView = new ModelAndView("redirect:/cart");
		customerService.addProductToCart(user.getUserId(), productId);
		return mView;
	}

	@PutMapping
	public ModelAndView updateCartQuanitity(@SessionAttribute CurrentUser user, @RequestParam long productId,
			@RequestParam int quantity) {
		ModelAndView mView = new ModelAndView("redirect:/cart");
		customerService.updateCartQuantity(user.getUserId(), productId, quantity);
		return mView;
	}

	@DeleteMapping
	public ModelAndView deleteCartItem(@SessionAttribute CurrentUser user, @RequestParam long productId) {
		ModelAndView mView = new ModelAndView("redirect:/cart");
		customerService.deleteCartitem(user.getUserId(), productId);
		return mView;
	}

	@GetMapping("/checkout")
	public ModelAndView getCheckoutView(@SessionAttribute CurrentUser user) {
		ModelAndView mView = new ModelAndView("customer/checkout");
		mView.addObject("checkoutForm", new CheckoutForm());
		mView.addObject("cartItems", customerService.getCartItemsByCustomer(user.getUserId()));
		return mView;
	}

	@PostMapping("/checkout")
	public ModelAndView postCheckoutForm(@SessionAttribute CurrentUser user, @ModelAttribute CheckoutForm form) {
		ModelAndView mView = new ModelAndView();
		try {
			customerService.placeOrder(user.getUserId(), form);
			mView.setViewName("redirect:/orders");
		} catch (Exception e) {
			e.printStackTrace();
			mView.setViewName("customer/checkout");
		}
		return mView;
	}

}
