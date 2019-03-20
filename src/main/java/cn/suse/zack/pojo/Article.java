package cn.suse.zack.pojo;

import org.apache.ibatis.type.Alias;
import java.io.Serializable;
import java.util.Date;

/**
 * 文章原型类
 */
@Alias("Article")
public class Article implements Serializable {

    private String article_id;
    private String article_label;
    private String article_title;
    private String article_content;
    private String article_picture;
    private Date article_createtime;
    private int article_readtimes;
    private int del_flag;

    public String getArticle_id() {
        return article_id;
    }

    public void setArticle_id(String article_id) {
        this.article_id = article_id;
    }

    public String getArticle_label() {
        return article_label;
    }

    public void setArticle_label(String article_label) {
        this.article_label = article_label;
    }

    public String getArticle_title() {
        return article_title;
    }

    public void setArticle_title(String article_title) {
        this.article_title = article_title;
    }

    public String getArticle_content() {
        return article_content;
    }

    public void setArticle_content(String article_content) {
        this.article_content = article_content;
    }

    public String getArticle_picture() {
        return article_picture;
    }

    public void setArticle_picture(String article_picture) {
        this.article_picture = article_picture;
    }

    public Date getArticle_createtime() {
        return article_createtime;
    }

    public void setArticle_createtime(Date article_createtime) {
        this.article_createtime = article_createtime;
    }

    public int getArticle_readtimes() {
        return article_readtimes;
    }

    public void setArticle_readtimes(int article_readtimes) {
        this.article_readtimes = article_readtimes;
    }

    public int getDel_flag() {
        return del_flag;
    }

    public void setDel_flag(int del_flag) {
        this.del_flag = del_flag;
    }
}
