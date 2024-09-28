package com.projects.quickcart.controller.retailer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.projects.quickcart.dto.CurrentUser;
import com.projects.quickcart.entity.OrderStatus;
import com.projects.quickcart.service.RetailerService;

@Controller
@RequestMapping("/retailer/orders")
public class RetailerOrdersController {

	@Autowired
	private RetailerService service;

	@GetMapping
	public String getOrdersView(@SessionAttribute CurrentUser user, @RequestParam(required = false) OrderStatus status,
			Model model) {
		var orders = service.getOrders(user.getUserId(), status);
		model.addAttribute("orderDetails", orders);
		return "retailer/orders";
	}

	@PutMapping
	public String putOrderStatus(@SessionAttribute CurrentUser user, @RequestParam long orderDetailId,
			@RequestParam OrderStatus status) {
		service.changeOrderStatus(user.getUserId(), orderDetailId, status);
		return "redirect:/retailer/orders";
	}
}
