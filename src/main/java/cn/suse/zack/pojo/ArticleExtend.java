package cn.suse.zack.pojo;

import org.apache.ibatis.type.Alias;

import java.io.Serializable;

/**
 * Article类的扩展类
 * Article对应数据库的字段
 * ArticcleExtend将Article对应的article_label字段由原来的int改为string类型
 */

@Alias("ArticleExtend")
public class ArticleExtend extends Article implements Serializable {

    private String str_article_label;

    public String getStr_article_label() {
        return str_article_label;
    }

    public void setStr_article_label(String str_article_label) {
        this.str_article_label = str_article_label;
    }
}
