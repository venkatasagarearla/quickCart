package com.projects.quickcart.controller.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.servlet.ModelAndView;

import com.projects.quickcart.service.CustomerService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/wishlist")
public class WishlistController {

	@Autowired
	private CustomerService service;

	@GetMapping
	public ModelAndView wishlistView(Model model, HttpSession session) {
		var mv = new ModelAndView("customer/wishlist");
		var id = (Long) session.getAttribute("userId");
		if (id == null) {
			throw new HttpClientErrorException(HttpStatus.UNAUTHORIZED, "Sorry , You should login");
		}
		mv.addObject("products", service.getItems(id));
		return mv;

	}

	@PostMapping
	public ModelAndView addProduct(@RequestParam long productId, @RequestHeader String referer, HttpSession session) {
		var mv = new ModelAndView("redirect:" + referer);
		var id = (Long) session.getAttribute("userId");
		if (id == null) {
			throw new HttpClientErrorException(HttpStatus.UNAUTHORIZED, "Sorry , You should login");
		}
		service.addWishlistItem(id, productId);
		return mv;
	}

	@DeleteMapping
	public ModelAndView deleteProduct(@RequestParam long productId, @RequestHeader String referer,
			HttpSession session) {
		var mv = new ModelAndView("redirect:" + referer);
		var id = (Long) session.getAttribute("userId");
		if (id == null) {
			throw new HttpClientErrorException(HttpStatus.UNAUTHORIZED, "Sorry , You should login");
		}
		service.removeWishlistItem(id, productId);
		return mv;
	}
}
