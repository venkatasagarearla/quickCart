package com.projects.quickcart.service;

import java.util.List;
import java.util.Optional;

import com.projects.quickcart.dto.RegistrationForm;
import com.projects.quickcart.entity.MyUser;
import com.projects.quickcart.entity.UserStatus;

public interface UserService {
	Optional<MyUser> getUser(String username, String password);

	void registerCustomer(RegistrationForm registrationForm);

	void registerRetailer(RegistrationForm registrationForm);

	List<MyUser> getAllUsers();

	void updateUserStatus(long userId, UserStatus status);
}
