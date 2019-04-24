package cn.suse.zack.controller;

import cn.suse.zack.pojo.Article;
import cn.suse.zack.pojo.PaginationHelper;
import cn.suse.zack.service.interfaces.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * FileName:AdminArticleController
 * Description:
 * Author:Zack
 * Date:2019/3/12
 * Time:15:13
 */
@Controller
public class AdminArticleController {

    @Autowired
    ArticleService articleService;

    /**
     * 管理员页面获取文章信息
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("articleInfo.action")
    public ModelAndView articleInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        int perPageCount = 6;
        PaginationHelper pagination = new PaginationHelper();
        // 当前页数
        int page;
        try {
            page = Integer.valueOf(request.getParameter("page"));
        } catch (NumberFormatException e) {
            page = 1;
        }
        try {
            if (request.getParameter("countPerPage") != null)
                perPageCount = Integer.valueOf(request.getParameter("countPerPage"));
        } catch (NumberFormatException e) {
            perPageCount = 6;
        }
        int totalCount = articleService.getTotalCount();
        int totalPage = totalCount % perPageCount == 0 ? totalCount / perPageCount : totalCount / perPageCount + 1;
        // 设置用户总数
        pagination.setTotalCount(totalCount);
        // 设置每页用户数
        pagination.setPerPageCount(perPageCount);
        pagination.setTotalPage(totalPage);
        modelAndView.addObject("page",page);
        modelAndView.addObject("pagination", pagination);
        modelAndView.addObject("articleList", articleService.subList(pagination.getCurrentPageStart(page), perPageCount));
        modelAndView.setViewName("view/admin/jsps/article.jsp");
        return modelAndView;
    }

    //修改数据 1.根据当前的文章id查找到该文章，将文章回显
    //        2.更新修改的数据到库，update
    @RequestMapping("queryArticle.action")
    public ModelAndView queryArticle(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String article_id = request.getParameter("article_id");
        ModelAndView modelAndView = new ModelAndView("view/admin/jsps/edit_articles.jsp");
        Article article = articleService.queryArticleById(article_id);
        article.setArticle_content(article.getArticle_content().replaceAll("(\r|\n|\r\n|\n\r)", " "));
        article.setArticle_content(article.getArticle_content().replaceAll("\"","\\\\"+"\""));
        article.setArticle_content(article.getArticle_content().replaceAll("\'","\\\\"+"\'"));
        modelAndView.addObject("article", article);
        return modelAndView;
    }

    //保存修改的数据
    @RequestMapping("updateArticle.action")
    public ModelAndView updateArticle(HttpServletRequest request,HttpServletResponse response,Article article) throws Exception {

        ModelAndView modelAndView;
        System.out.println(article);
        try {
            //如果修改成功跳转到文章列表页
            articleService.updateArticle(article);
            modelAndView =  articleInfo(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView = new ModelAndView("view/admin/info/errors.jsp");
        }
        return modelAndView;
    }
}
