package cn.suse.zack.controller;

import cn.suse.zack.pojo.ITNews;
import cn.suse.zack.pojo.PaginationHelper;
import cn.suse.zack.service.interfaces.ITNewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * FileName:ITNewsController
 * Description:
 * Author:Zack
 * Date:2019/3/26
 * Time:11:44
 */
@Controller
public class ITNewsController {
    @Autowired
    ITNewsService sv;

    @RequestMapping("addITNewsInfo.action")
    public ModelAndView addITNewsInfo(HttpServletRequest request, HttpServletResponse response, ITNews itNews) {

        //添加成功返回到ITNews页面刷新显示信息
        ModelAndView modelAndView;
        try {
            sv.addITNewsInfo(itNews);
            //查询一下返回数据
            modelAndView = queryITNewsInfo(request,response);
            modelAndView.setViewName("view/admin/jsps/ITNews.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView = new ModelAndView("view/admin/info/errors.jsp");
        }
        return modelAndView;
    }

    @RequestMapping("queryITNewsPage.action")
    public ModelAndView queryITNewsInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
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

        int totalCount = sv.getITNewsCount();
        int totalPage = totalCount % perPageCount == 0 ? totalCount / perPageCount : totalCount / perPageCount + 1;
        // 设置总数
        pagination.setTotalCount(totalCount);
        // 设置每页数
        pagination.setPerPageCount(perPageCount);
        pagination.setTotalPage(totalPage);
        request.setAttribute("pagination", pagination);
        request.setAttribute("itNewsList", sv.subList(pagination.getCurrentPageStart(page), perPageCount));
        request.setAttribute("page", page);

        return new ModelAndView("view/admin/jsps/ITNews.jsp");
    }


    @RequestMapping("queryITNewsById.action")
    public ModelAndView queryITNewsById(HttpServletResponse response, HttpServletRequest request) {
        String news_id = request.getParameter("news_id");
        ModelAndView modelAndView;
        try {
            modelAndView = new ModelAndView("view/admin/jsps/update_ITNews.jsp");
            modelAndView.addObject("ITNews", sv.queryITNewsById(news_id));
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView = new ModelAndView("view/admin/info/errors.jsp");
        }
        return modelAndView;
    }

    @RequestMapping("updateITNews.action")
    public ModelAndView updateITNews(HttpServletRequest request, HttpServletResponse response, ITNews itNews) {
        ModelAndView modelAndView;
        try {
            sv.updateITNews(itNews);
            modelAndView = queryITNewsInfo(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView = new ModelAndView("view/admin/info/errors.jsp");
        }
        return modelAndView;
    }

    @RequestMapping("deleteITNewsById.action")
    public ModelAndView deleteITNewsById(HttpServletResponse response, HttpServletRequest request) {
        ModelAndView modelAndView;
        String news_id = request.getParameter("news_id");
        try {
            sv.deleteITNewsById(news_id);
            modelAndView = queryITNewsInfo(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            modelAndView = new ModelAndView("view/admin/info/errors.jsp");
        }
        return modelAndView;
    }

}
