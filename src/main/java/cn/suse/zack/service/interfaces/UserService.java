package cn.suse.zack.service.interfaces;

import cn.suse.zack.pojo.User;
import org.springframework.stereotype.Service;

/**
 * FileName:UserService
 * Description: 用户Service接口
 * Author:Zack
 * Date:2018/6/23
 * Time:16:45
 */
@Service("UserService")
public interface UserService {

    //添加用户
    public void addUser(User user) throws Exception;

    //查询用户
    public User findUserByEmail(String user_email) throws Exception;
}
