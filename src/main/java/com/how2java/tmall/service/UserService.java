package com.how2java.tmall.service;
  
import java.util.List;

import com.how2java.tmall.pojo.AccountInfo;
import com.how2java.tmall.pojo.User;
 
public interface UserService {
    void add(User c);
    void delete(int id);
    void update(User c);
    void reset(User c);
    void resetAccount(User c);
    void addReceiver(AccountInfo c);
    void updateReceiver(AccountInfo c);
    void deleteReceiver(AccountInfo c);
    List<AccountInfo> get(String name);
    User get(int id);
    List<User> list();
    boolean isExist(String name);
    User get(String name,String password);
}