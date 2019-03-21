package cn.suse.zack.pojo;

import org.apache.ibatis.type.Alias;

import java.io.Serializable;
import java.util.Date;

/**
 * FileName:FriendLink
 * Description: 友情链接po
 * Author:Zack
 * Date:2019/3/19
 * Time:20:42
 */
@Alias("FriendLink")
public class FriendLink implements Serializable {

    public int link_id;         //链接id
    public String link_words;   //链接文字
    public String link_url;     //链接url
    public String link_way;     //链接打开方式
    public Date create_time;     //创建时间
    public Boolean del_flag;    //删除标志
    public String extend_a;     //扩展字段
    public String extend_b;
    public String extend_c;

    public int getLink_id() {
        return link_id;
    }

    public void setLink_id(int link_id) {
        this.link_id = link_id;
    }

    public String getLink_words() {
        return link_words;
    }

    public void setLink_words(String link_words) {
        this.link_words = link_words;
    }

    public String getLink_url() {
        return link_url;
    }

    public void setLink_url(String link_url) {
        this.link_url = link_url;
    }

    public String getLink_way() {
        return link_way;
    }

    public void setLink_way(String link_way) {
        this.link_way = link_way;
    }

    public Boolean getDel_flag() {
        return del_flag;
    }

    public void setDel_flag(Boolean del_flag) {
        this.del_flag = del_flag;
    }

    public String getExtend_a() {
        return extend_a;
    }

    public void setExtend_a(String extend_a) {
        this.extend_a = extend_a;
    }

    public String getExtend_b() {
        return extend_b;
    }

    public void setExtend_b(String extend_b) {
        this.extend_b = extend_b;
    }

    public String getExtend_c() {
        return extend_c;
    }

    public void setExtend_c(String extend_c) {
        this.extend_c = extend_c;
    }
    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

}
