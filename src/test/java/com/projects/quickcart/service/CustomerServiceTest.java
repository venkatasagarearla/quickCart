package com.projects.quickcart.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.projects.quickcart.dto.CheckoutForm;

@SpringBootTest
class CustomerServiceTest {

	@Autowired
	private CustomerService customerService;

	@Test
	void test() {
		CheckoutForm form = new CheckoutForm();
		form.setAddress("Chennai");
		form.setFullName("MAnikanta");
		form.setMobileNumber("94545343432");
		form.setPaymentMode("COD");
		form.setPincode(234522);
		customerService.placeOrder(3, form);
	}

}
