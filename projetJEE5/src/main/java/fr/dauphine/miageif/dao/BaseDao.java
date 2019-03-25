package fr.dauphine.miageif.dao;

import fr.dauphine.miageif.bean.User;

public interface BaseDao {
	
	 public boolean login(String username, String password);
	 public String register(User user);

}
