package cn.suse.zack.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * FileName:ITNews
 * Description:
 * Author:Zack
 * Date:2019/3/26
 * Time:11:16
 */
public class ITNews implements Serializable {

    public String news_id;
    public String news_content;
    public String news_url;
    public String news_way;
    public Date create_time;
    public String del_flag;

    public String getNews_id() {
        return news_id;
    }

    public void setNews_id(String news_id) {
        this.news_id = news_id;
    }

    public String getNews_content() {
        return news_content;
    }

    public void setNews_content(String news_content) {
        this.news_content = news_content;
    }

    public String getNews_url() {
        return news_url;
    }

    public void setNews_url(String news_url) {
        this.news_url = news_url;
    }

    public String getNews_way() {
        return news_way;
    }

    public void setNews_way(String news_way) {
        this.news_way = news_way;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public String getDel_flag() {
        return del_flag;
    }

    public void setDel_flag(String del_flag) {
        this.del_flag = del_flag;
    }
}
