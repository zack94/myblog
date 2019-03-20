package cn.suse.zack.pojo;


import org.apache.ibatis.type.Alias;

import java.io.Serializable;

/**
 * FileName:Admin
 * Description: 管理员类
 * Author:Zack
 * Date:2018/7/11
 * Time:15:05
 */
@Alias("Admin")
public class Admin implements Serializable {

    private String admin_name;
    private String admin_password;

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public String getAdmin_password() {
        return admin_password;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
    }

    public Admin(String admin_name, String admin_password) {
        this.admin_name = admin_name;
        this.admin_password = admin_password;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "admin_name='" + admin_name + '\'' +
                ", admin_password='" + admin_password + '\'' +
                '}';
    }
}
