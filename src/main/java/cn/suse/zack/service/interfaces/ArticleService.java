package cn.suse.zack.service.interfaces;

import cn.suse.zack.pojo.Article;
import cn.suse.zack.pojo.ArticleExtend;
import cn.suse.zack.pojo.Label;
import net.sf.ehcache.store.disk.ods.AATreeSet;
import org.apache.tools.ant.taskdefs.optional.extension.LibFileSet;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 文章service层
 */
@Service("ArticleService")
public interface ArticleService {

    /**
     * 添加文章
     * @param article
     * @throws Exception
     */
    void addArticle(Article article) throws Exception;

    /**
     * 查询并返回5篇文章
     * @return
     * @throws Exception
     */
    List<Article> find5Articles() throws Exception;

    /**
     * 按照文章id查询并返回该文章
     * @param article_id
     * @return
     * @throws Exception
     */
    Article articleDetail(String article_id) throws Exception;

    /**
     * 统计文章所有数量
     * @return
     * @throws Exception
     */
    public int getTotalCount() throws Exception;

    /**
     * 分页返回一页数据
     * @param pageStart 分页每一页开始是第几条
     * @param perPageCount 分页需要返回的条数
     * @return
     * @throws Exception
     */
    public List<Article> subList(int pageStart, int perPageCount) throws Exception;

    public Article queryArticleById(String id) throws Exception;

    public void updateArticle(Article article) throws Exception;

    public void deleteArticle(String article_id) throws Exception;

    //查询所有标签
    public List<Label> queryAllLabel() throws Exception;
}
