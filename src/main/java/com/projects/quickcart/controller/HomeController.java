package com.projects.quickcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.projects.quickcart.dto.CurrentUser;
import com.projects.quickcart.dto.RegistrationForm;
import com.projects.quickcart.service.UserService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

	@Autowired
	private UserService userService;

	@GetMapping("/")
	public String home() {
		return "index";
	}

	@GetMapping("/login")
	public String loginView() {
		return "login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@PostMapping("/login")
	public String loginView(@RequestParam String username, @RequestParam String password, Model model,
			HttpSession session) {
		var user = userService.getUser(username, password);
		if (user.isEmpty()) {
			model.addAttribute("errorMessage", "Incorrect credentials");
			return "login";
		}
		var u = user.get();
		session.setAttribute("userId", u.getId());
		session.setAttribute("username", u.getUsername());
		session.setAttribute("status", u.getStatus());
		session.setAttribute("role", u.getRole());

		var cu = new CurrentUser();
		cu.setUserId(u.getId());
		cu.setUsername(u.getUsername());
		cu.setRole(u.getRole());
		cu.setStatus(u.getStatus());

		session.setAttribute("user", cu);

		return switch (u.getRole()) {
		case "CUSTOMER" -> "redirect:/products";
		case "RETAILER" -> "redirect:/retailer";
		case "ADMIN" -> "redirect:/admin/users";
		default -> {
			session.invalidate();
			System.out.println("Unknown user role " + u.getRole());
			yield "redirect:/";
		}
		};
	}

	@GetMapping("/register")
	public String registrationView() {
		return "register";
	}

	@PostMapping(value = "/register", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public ModelAndView registrationView(RegistrationForm registrationForm) {
		var mv = new ModelAndView();
		try {
			userService.registerCustomer(registrationForm);
			mv.setViewName("redirect:/login");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMessage", e.getMessage());
			mv.setViewName("register");
		}

		return mv;
	}

	@GetMapping("/retailer-register")
	public String retailerRegistrationView() {
		return "register-retailer";
	}

	@PostMapping(value = "/retailer-register", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public ModelAndView retailerRegistrationView(RegistrationForm registrationForm) {
		var mv = new ModelAndView();
		try {
			userService.registerRetailer(registrationForm);
			mv.setViewName("redirect:/login");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMessage", e.getMessage());
			mv.setViewName("register-retailer");
		}

		return mv;
	}

	@GetMapping("/error")
	public String handleError(HttpServletRequest request) {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

		if (status != null) {
			Integer statusCode = Integer.valueOf(status.toString());

			if (statusCode == HttpStatus.NOT_FOUND.value()) {
				return "404";
			} else if (statusCode == HttpStatus.UNAUTHORIZED.value()) {
				return "403";
			}
		}
		return "error";
	}

}
