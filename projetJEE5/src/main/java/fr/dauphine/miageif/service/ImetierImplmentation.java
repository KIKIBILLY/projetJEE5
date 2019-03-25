package fr.dauphine.miageif.service;


import fr.dauphine.miageif.bean.User;
import fr.dauphine.miageif.dao.BaseDao;
import fr.dauphine.miageif.dao.BaseDaoImp;

public class ImetierImplmentation implements Imetier {

 private BaseDao loginDao = new BaseDaoImp();

 @Override
 public boolean login(String username, String password) {
  return loginDao.login(username, password);
 }

 
 
 @Override
 public String register(User utilisateur)
 {
  return loginDao.register(utilisateur);
 }

 
}