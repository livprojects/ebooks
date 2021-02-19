package fr.ebook.dao;

import fr.ebook.model.User;

public interface IUserDao extends IDao<User> {
	
	public User findByEmail(String email);


}
