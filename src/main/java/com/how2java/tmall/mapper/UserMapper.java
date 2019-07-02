package com.how2java.tmall.mapper;

import com.how2java.tmall.pojo.AccountInfo;
import com.how2java.tmall.pojo.User;
import com.how2java.tmall.pojo.UserExample;
import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int deleteReceiver(AccountInfo c);

    int insert(User record);

    int addReceiver(AccountInfo c);

    int insertSelective(User record);

    int resetPassword(User record);

    int resetAccount(User record);

    int updateReceiver(AccountInfo record);

    List<AccountInfo> getReceiver(String name);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}