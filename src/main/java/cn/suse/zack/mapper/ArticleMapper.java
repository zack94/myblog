package cn.suse.zack.mapper;

import cn.suse.zack.pojo.Article;
import cn.suse.zack.pojo.Label;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * article的dao层
 */

@Repository("ArticleMapper")
public interface ArticleMapper {
    /**
     * 添加文章
     * @param article
     * @throws Exception
     */
    public void addArticle(Article article) throws Exception;

    /**
     * 查询并返回5篇文章
     * @return
     * @throws Exception
     */
    public List<Article> find5Articles() throws Exception;

    /**
     * 按照给定的article_id查询文章并返回该文章
     * @param article_id
     * @return
     * @throws Exception
     */
    public Article articleDetail(String article_id) throws Exception;

    /**
     * 统计文章所有数量
     * @return
     * @throws Exception
     */
    public int totalCount() throws Exception;

    /**
     * 分页返回一页数据
     * @param pageStart 分页每一页开始是第几条
     * @param perPageCount 分页需要返回的条数
     * @return
     * @throws Exception
     */
    public List<Article> subList(@Param("pageStart") int pageStart, @Param("perPageCount") int perPageCount) throws Exception;

    public Article queryArticleById(@Param("article_id") String id) throws Exception;

    public void updateArticle(Article article) throws Exception;

    public void deleteArticle(@Param("article_id")String article_id) throws Exception;

    //查询所有标签
    public List<Label> queryAllLabel() throws Exception;
}
