package cn.suse.zack.pojo;

import org.apache.ibatis.type.Alias;

import java.util.Date;

/**
 * FileName:Mind
 * Description:心情数据表原型
 * Author:Zack
 * Date:2018/6/12
 * Time:16:38
 */
@Alias("Mind")
public class Mind {
    private String mind_id;
    private String mind_content;
    private Date mind_date;
    private String mind_look;
    private String mind_picture;
    private int del_flag;

    public int getDel_flag() {
        return del_flag;
    }

    public void setDel_flag(int del_flag) {
        this.del_flag = del_flag;
    }

    public String getMind_id() {
        return mind_id;
    }

    public void setMind_id(String mind_id) {
        this.mind_id = mind_id;
    }

    public String getMind_content() {
        return mind_content;
    }

    public void setMind_content(String mind_content) {
        this.mind_content = mind_content;
    }

    public Date getMind_date() {
        return mind_date;
    }

    public void setMind_date(Date mind_date) {
        this.mind_date = mind_date;
    }

    public String getMind_look() {
        return mind_look;
    }

    public void setMind_look(String mind_look) {
        this.mind_look = mind_look;
    }

    public String getMind_picture() {
        return mind_picture;
    }

    public void setMind_picture(String mind_picture) {
        this.mind_picture = mind_picture;
    }
}
