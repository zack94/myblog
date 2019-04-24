package cn.suse.zack.service.Impl;

import cn.suse.zack.mapper.ArticleMapper;
import cn.suse.zack.pojo.Article;
import cn.suse.zack.service.interfaces.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


/**
 * Article的实现类
 */
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    ArticleMapper articleMapper;

    /**
     * 添加文章
     * @param article
     * @throws Exception
     */
    @Override
    public void addArticle(Article article) throws Exception {
        articleMapper.addArticle(article);

    }

    /**
     * 查询5篇文章并返回给调用者
     * @return
     * @throws Exception
     */
    @Override
    public List<Article> find5Articles() throws Exception {

        return articleMapper.find5Articles();
    }

    /**
     * 按照给定的article_id查询并返回该文章给调用者
     * @param article_id
     * @return
     * @throws Exception
     */
    @Override
    public Article articleDetail(String article_id) throws Exception {
        //调用mapper#articleDetil()
        return articleMapper.articleDetail(article_id);
    }

    @Override
    public int getTotalCount() throws Exception {
        return articleMapper.totalCount();
    }

    @Override
    public List<Article> subList(int pageStart, int perPageCount) throws Exception {
        return articleMapper.subList(pageStart, perPageCount);
    }

    @Override
    public Article queryArticleById(String id) throws Exception {
        return articleMapper.queryArticleById(id);
    }

    @Override
    public void updateArticle(Article article) throws Exception {
        articleMapper.updateArticle(article);
    }

    //删除文章
    @Override
    public void deleteArticle(String article_id) throws Exception {
        articleMapper.deleteArticle(article_id);
    }


}
