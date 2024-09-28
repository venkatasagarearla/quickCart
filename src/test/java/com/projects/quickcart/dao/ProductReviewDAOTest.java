package com.projects.quickcart.dao;

import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ProductReviewDAOTest {

	@Autowired
	private ProductReviewDAO pDao;

	@Test
	void testSave() {

	}

	@Test
	void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	void testDelete() {
		fail("Not yet implemented");
	}

	@Test
	void testFindByProductId() {
		fail("Not yet implemented");
	}

}
