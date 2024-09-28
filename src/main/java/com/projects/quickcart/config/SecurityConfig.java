package com.projects.quickcart.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.projects.quickcart.util.SecurityFilter;

@Configuration
public class SecurityConfig {
	@Bean
	FilterRegistrationBean<SecurityFilter> loggingFilter() {
		FilterRegistrationBean<SecurityFilter> registrationBean = new FilterRegistrationBean<>();

		registrationBean.setFilter(new SecurityFilter());
		registrationBean.addUrlPatterns("/retailer/*", "/admin/*", "/cart", "/wishlist", "/orders", "/reviews");
		registrationBean.setOrder(2);

		return registrationBean;
	}
}
