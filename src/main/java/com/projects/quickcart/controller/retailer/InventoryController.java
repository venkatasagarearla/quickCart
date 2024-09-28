package com.projects.quickcart.controller.retailer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.servlet.ModelAndView;

import com.projects.quickcart.dto.ProductForm;
import com.projects.quickcart.service.InventoryService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/retailer/inventory")
public class InventoryController {

	@Autowired
	private InventoryService service;

	@GetMapping
	public String inventoryPage(Model model, HttpSession session) {
		var id = (Long) session.getAttribute("userId");
		if (id == null) {
			throw new HttpClientErrorException(HttpStatus.UNAUTHORIZED,
					"Sorry bro, You should be logon to your account");
		}
		model.addAttribute("inventory", service.getAllProducts(id));
		return "retailer/inventory";
	}

	@DeleteMapping
	public String deleteProduct(@RequestParam long id, HttpSession session) {
		var userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			throw new HttpClientErrorException(HttpStatus.UNAUTHORIZED,
					"Sorry bro, You should be logon to your account");
		}
		service.deleteProduct(userId, id);
		return "redirect:/retailer/inventory";
	}

	@GetMapping("/add-product")
	public String addProductView() {
		return "retailer/product-add";
	}

	@PostMapping("/add-product")
	public String addProductView(ProductForm form, HttpSession session) {
		var id = (Long) session.getAttribute("userId");
		if (id == null) {
			throw new HttpClientErrorException(HttpStatus.UNAUTHORIZED,
					"Sorry bro, You should be logon to your account");
		}
		service.addProduct(form, id);
		return "redirect:/retailer/inventory";
	}

	@GetMapping("/{id}")
	public ModelAndView productInfroView(@PathVariable long id, HttpSession session) {
		var userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			throw new HttpClientErrorException(HttpStatus.UNAUTHORIZED,
					"Sorry bro, You should be logon to your account");
		}
		var product = service.getProductInfo(userId, id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("product", product);
		mv.setViewName("retailer/product-info");
		return mv;
	}

	@GetMapping("/{id}/edit-product")
	public ModelAndView updateProductView(@PathVariable long id, HttpSession session) {
		var userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			throw new HttpClientErrorException(HttpStatus.UNAUTHORIZED,
					"Sorry bro, You should be logon to your account");
		}
		var product = service.getProductInfo(userId, id);
		ModelAndView mv = new ModelAndView("retailer/product-update");
		mv.addObject("product", product);
		return mv;
	}

	@PostMapping("/{id}/edit-product")
	public ModelAndView updateProductView(@PathVariable long id, ProductForm form, HttpSession session) {
		var userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			throw new HttpClientErrorException(HttpStatus.UNAUTHORIZED,
					"Sorry bro, You should be logon to your account");
		}
		ModelAndView mv = new ModelAndView();
		try {
			service.updateProduct(userId, id, form);
			mv.setViewName("redirect:/retailer/inventory");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("product", form); // let's check what you did
			mv.setViewName("retailer/product-update");
		}

		return mv;
	}

}
