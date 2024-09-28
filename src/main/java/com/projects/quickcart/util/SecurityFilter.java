package com.projects.quickcart.util;

import java.io.IOException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SecurityFilter implements Filter {

	private final Logger logger = LogManager.getLogger();

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession(false);

		String requestURI = httpRequest.getRequestURI();

		String method = httpRequest.getMethod();

		logger.info(session + " " + method + " " + requestURI);

		if (session == null || session.getAttribute("role") == null) {
			httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied. Insufficient permissions.");
			return;
		}

		String userRole = (String) session.getAttribute("role");

		logger.info("Role " + userRole);

		String[] buyerPaths = { "/orders", "/cart", "/reviews" };
		for (String uri : buyerPaths) {
			if (requestURI.startsWith(uri)) {
				if (!userRole.equals("CUSTOMER")) {
					logger.info("Access designed for customer endpoints");
					httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN,
							"Access denied. Insufficient permissions.");
					return;
				}
			}
		}

		// Check for access to /retailer/* URLs
		if (requestURI.startsWith(httpRequest.getContextPath() + "/retailer") && !userRole.equals("RETAILER")) {
			httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied. Insufficient permissions.");
			return;
		}

		// Check for access to /admin/* URLs
		if (requestURI.startsWith(httpRequest.getContextPath() + "/admin") && !userRole.equals("ADMIN")) {
			httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied. Insufficient permissions.");
			return;
		}

		chain.doFilter(httpRequest, httpResponse);

	}

}
