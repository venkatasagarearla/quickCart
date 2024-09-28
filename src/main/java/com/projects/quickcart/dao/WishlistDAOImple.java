package com.projects.quickcart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projects.quickcart.entity.Customer;
import com.projects.quickcart.entity.Product;
import com.projects.quickcart.entity.WishList;

@Repository
public class WishlistDAOImple implements WishlistDAO {

	@Autowired
	private SessionFactory sf;

	@Override
	public void addWishlistItem(long userid, long pid) {
		Session ss = sf.openSession();
		Customer customer = ss.get(Customer.class, userid);
		Product product = ss.get(Product.class, pid);
		WishList wList = new WishList();
		wList.setCustomer(customer);
		wList.setProduct(product);
		Transaction t = ss.beginTransaction();
		ss.save(wList);
		t.commit();

	}

	public void removeWishlistItem(long userid, long pid) {
		int result = 0;
		Session ss = sf.openSession();
		Transaction t = ss.beginTransaction();
		Customer customer = ss.get(Customer.class, userid);
		Product product = ss.get(Product.class, pid);
		if (customer != null && product != null) {
			Query q = ss.createQuery("delete from WishList w where w.customer=:customer and w.product=:product");
			q.setParameter("customer", customer);
			q.setParameter("product", product);
			result = q.executeUpdate();

			t.commit();
		}
	}

	public List<Product> getItems(long userId) {
		Session ss = sf.openSession();
		Transaction t = ss.beginTransaction();
		var q = ss.createQuery("from WishList w where w.customer.id = :userId", WishList.class);
		q.setParameter("userId", userId);
		return q.getResultStream().map(wish -> wish.getProduct()).toList();
	}

	public boolean isProductwishlisted(Long id1, long id) {
		// TODO Auto-generated method stub
		return sf.fromSession(ss -> {
			return ss.createQuery("from WishList w where w.customer.id=:cid and w.product.id=:pid")
					.setParameter("cid", id1).setParameter("pid", id).getResultCount() > 0;
		});
	}

}
