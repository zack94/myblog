package cn.suse.zack.mapper;

import cn.suse.zack.pojo.User;
import org.springframework.stereotype.Repository;

/**
 * FileName:UserMapper
 * Description: 用户的Mapper层
 * Author:Zack
 * Date:2018/6/23
 * Time:16:34
 */

@Repository("UserMapper")
public interface UserMapper {

    /**
     * 添加用户
     * @param user 添加的对象
     * @throws Exception 出错抛异常
     */
    public void addUser(User user) throws Exception;

    /**
     * 根据用户邮箱查找用户
     * @param user_email 用户邮箱
     * @return 返回查询到的用户信息
     * @throws Exception 出错抛出异常
     */
    public User findUserByEmail(String user_email) throws Exception;
}
