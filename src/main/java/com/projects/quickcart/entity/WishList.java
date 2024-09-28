package com.projects.quickcart.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "wishlists")
public class WishList {
	@Id
	@GeneratedValue
	private long id;
	@ManyToOne
	private Product product;
	@ManyToOne
	private Customer customer;
}
