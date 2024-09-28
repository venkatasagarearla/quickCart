package com.projects.quickcart.service.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.projects.quickcart.dao.CartItemDAO;
import com.projects.quickcart.dao.OrderDAO;
import com.projects.quickcart.dao.ProductDAO;
import com.projects.quickcart.dao.WishlistDAO;
import com.projects.quickcart.dto.CheckoutForm;
import com.projects.quickcart.entity.CartItem;
import com.projects.quickcart.entity.Order;
import com.projects.quickcart.entity.OrderDetail;
import com.projects.quickcart.entity.OrderStatus;
import com.projects.quickcart.entity.PaymentDetail;
import com.projects.quickcart.entity.Product;
import com.projects.quickcart.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {

	private Logger logger = LogManager.getLogger();

	@Autowired
	private CartItemDAO cartItemDAO;

	@Autowired
	private WishlistDAO wishlistDAO;

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private OrderDAO orderDAO;

	@Override
	public List<Product> getItems(long userId) {
		return wishlistDAO.getItems(userId);
	}

	@Override
	public void addWishlistItem(long userId, long productId) {
		wishlistDAO.addWishlistItem(userId, productId);
	}

	@Override
	public void removeWishlistItem(long userId, long productId) {
		wishlistDAO.removeWishlistItem(userId, productId);
	}

	@Override
	public List<CartItem> getCartItemsByCustomer(long userId) {
		return cartItemDAO.getCartItems(userId);
	}

	@Override
	public void addProductToCart(long userId, long productId) {
		cartItemDAO.addItem(userId, productId);
	}

	@Override
	public void updateCartQuantity(long userId, long productId, int quantity) {
		cartItemDAO.updateItem(userId, productId, quantity);
	}

	@Override
	public void deleteCartitem(long userId, long productId) {
		cartItemDAO.removeItem(userId, productId);
	}

	@Override
	public List<Product> getProducts(String category, String search) {
		return productDAO.findProducts(category, search);
	}

	@Override
	public Product getProduct(long id) {
		return productDAO.getProductById(id);
	}

	@Override
	public boolean isProductWishlisted(Long id1, long id) {
		return wishlistDAO.isProductwishlisted(id1, id);
	}

	@Override
	public boolean isProductInCart(Long id1, long id) {
		return cartItemDAO.isProductInCart(id1, id);
	}

	@Override
	public List<String> getCategories() {
		return productDAO.getAllCategories();
  }
  
  @Override
	@Transactional
	public void placeOrder(long customerId, CheckoutForm form) {
		var cart = orderDAO.getCartItems(customerId);
		var amount = cart.stream().mapToDouble(item -> item.getQuantity() * item.getProduct().getPrice()).sum();
		logger.info("constructing payment details");
		PaymentDetail paymentDetail = new PaymentDetail();
		paymentDetail.setAmount(amount);
		paymentDetail.setProvider(form.getPaymentMode());
		paymentDetail.setStatus("PENDING");
		orderDAO.save(paymentDetail);
		Order order = new Order();
		order.setFullName(form.getFullName());
		order.setMobileNumber(form.getMobileNumber());
		order.setPaymentDetail(paymentDetail);
		order.setPincode(form.getPincode());
		order.setShippingAddress(form.getAddress());
		cart.forEach(item -> {
			if (order.getCustomer() == null) {
				order.setCustomer(item.getCustomer());
			}
			OrderDetail detail = new OrderDetail();
			detail.setOrder(order);
			detail.setOrderStatus(OrderStatus.PENDING);
			detail.setPrice(item.getProduct().getPrice());
			detail.setProduct(item.getProduct());
			detail.setQuantity(item.getQuantity());

			orderDAO.save(detail);
			cartItemDAO.removeItem(customerId, item.getId());

		});
		orderDAO.save(order);
	}

	@Override
	public List<Order> getOrders(long customerId) {
		return orderDAO.getCustomerOrders(customerId);
	}

	@Override
	public void cancelOrder(long customerId, long orderDetailId) {
		orderDAO.cancelCustomerOrder(customerId, orderDetailId);
	}

}
