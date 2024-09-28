package com.projects.quickcart.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.projects.quickcart.dto.CurrentUser;
import com.projects.quickcart.entity.UserStatus;
import com.projects.quickcart.service.UserService;

@Controller
@RequestMapping("/admin/users")
public class UsersController {

	@Autowired
	private UserService userService;

	@GetMapping
	public ModelAndView getUserAndView(@SessionAttribute(required = false) CurrentUser user,
			@RequestParam(required = false) String role) {
		ModelAndView mView = new ModelAndView("admin/users");
		if (role == null || role.isBlank()) {
			mView.addObject("users", userService.getAllUsers());
		} else {
			mView.addObject("users", userService.getAllUsers().stream().filter(u -> u.getRole().equals(role)).toList());
		}

		return mView;
	}

	@PutMapping
	public ModelAndView putUserStatus(@SessionAttribute(required = false) CurrentUser user, @RequestParam long userId,
			@RequestParam UserStatus status) {
		ModelAndView mView = new ModelAndView("redirect:/admin/users");
		userService.updateUserStatus(userId, status);
		return mView;
	}

}
