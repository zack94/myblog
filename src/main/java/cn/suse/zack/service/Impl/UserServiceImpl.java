package cn.suse.zack.service.Impl;

import cn.suse.zack.mapper.UserMapper;
import cn.suse.zack.pojo.User;
import cn.suse.zack.service.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * FileName:UserServiceImpl
 * Description: 用户Service的实现
 * Author:Zack
 * Date:2018/6/23
 * Time:16:48
 */
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 实现添加用户
     * @param user 参数为用户对象
     * @throws Exception 添加出现错误抛出异常
     */
    @Override
    public void addUser(User user) throws Exception {
        userMapper.addUser(user);
    }

    /**
     * 通过邮箱查询用户
     * @param user_email 用户邮箱
     * @return 返回查询结果
     * @throws Exception 出错异常
     */
    @Override
    public User findUserByEmail(String user_email) throws Exception {
        //调用mapper层#findUserByEmail
        return userMapper.findUserByEmail(user_email);
    }
}
