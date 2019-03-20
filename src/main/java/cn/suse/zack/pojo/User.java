package cn.suse.zack.pojo;

import java.io.Serializable;

/**
 * FileName:User
 * Description: 用户po类,继承Serializable
 * Author:Zack
 * Date:2018/6/23
 * Time:16:31
 */

public class User implements Serializable {
    private String user_id;
    private String user_name;
    private String user_password;
    private String user_email;
    private String user_state;

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_state() {
        return user_state;
    }

    public void setUser_state(String user_state) {
        this.user_state = user_state;
    }
}
