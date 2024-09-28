package com.projects.quickcart.controller.retailer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/retailer")
public class RetailerController {

	@GetMapping
	public ModelAndView homeView() {
		return new ModelAndView("retailer/index");
	}

}
