package com.jnshu.service;

import com.jnshu.pojo.User;
import org.springframework.stereotype.Service;

@Service
public interface UserService {

//    判断用户名和密码是否匹配
    boolean compareUser(String username,String password);
//    通过用户名获取用户信息
    User selectUserByName(String username);
//    添加用户
    void insertUser(User user);
//    更新用户登录时间
    void updateLogTime(String username,long loginTime);


}
