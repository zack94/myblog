package cn.suse.zack.controller;

import cn.suse.zack.pojo.FriendLink;
import cn.suse.zack.pojo.PaginationHelper;
import cn.suse.zack.service.interfaces.FriendLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * FileName:FriendLinkController
 * Description: 友情链接controller
 * Author:Zack
 * Date:2019/3/19
 * Time:21:01
 */
@Controller
public class FriendLinkController {

    @Autowired
    FriendLinkService sv;

    @RequestMapping("addFriendLink.action")
    public ModelAndView addFriendLink(HttpServletRequest request, HttpServletResponse response, FriendLink friendLink)throws Exception{
        //添加友情链接
        ModelAndView modelAndView;
        try {
            sv.addFriendLinkService(friendLink);
            modelAndView = queryFriendLink(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView = new ModelAndView("view/admin/info/errors.jsp");
        }
        return modelAndView;
    }

    //跳转到友情链接展示页并回带数据
    @RequestMapping("friendLinkPage.action")
    public ModelAndView queryFriendLink(HttpServletRequest request, HttpServletResponse response) throws Exception{
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

        int totalCount = sv.getFriendLinkCount();
        int totalPage = totalCount % perPageCount == 0 ? totalCount / perPageCount : totalCount / perPageCount + 1;
        // 设置总数
        pagination.setTotalCount(totalCount);
        // 设置每页数
        pagination.setPerPageCount(perPageCount);
        pagination.setTotalPage(totalPage);
        request.setAttribute("pagination", pagination);
        request.setAttribute("friendLinks", sv.subList(pagination.getCurrentPageStart(page), perPageCount));
        request.setAttribute("page", page);

        return new ModelAndView("view/admin/jsps/flink.jsp");
    }
}
