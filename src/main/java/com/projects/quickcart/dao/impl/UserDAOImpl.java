package com.projects.quickcart.dao.impl;

import java.util.List;
import java.util.Optional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projects.quickcart.dao.UserDAO;
import com.projects.quickcart.entity.Customer;
import com.projects.quickcart.entity.MyUser;
import com.projects.quickcart.entity.Retailer;
import com.projects.quickcart.entity.UserStatus;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Optional<MyUser> getUser(String username, String password) {
		return sessionFactory.fromSession(session -> {
			var query = session.createQuery("from User u where u.username = :username and u.password = :password",
					MyUser.class);
			query.setParameter("username", username);
			query.setParameter("password", password);
			MyUser myUser = query.getSingleResultOrNull();
			if (myUser != null)
				return Optional.of(myUser);
			return Optional.empty();
		});
	}

	@Override
	public void addCustomer(Customer customer) {
		sessionFactory.inTransaction(session -> {
			session.persist(customer);
		});
	}

	@Override
	public void addRetailer(Retailer retailer) {
		sessionFactory.inTransaction(session -> {
			session.persist(retailer);
		});
	}

	@Override
	public List<MyUser> getAllUsers() {
		return sessionFactory.fromSession(session -> {
			return session.createQuery("from User", MyUser.class).getResultList();
		});
	}

	@Override
	public void updateUserStatus(long userId, UserStatus status) {
		sessionFactory.inTransaction(session -> {
			MyUser user = session.get(MyUser.class, userId);
			user.setStatus(status);
			session.merge(user);
		});
	}

}
