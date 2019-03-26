package cn.suse.zack.controller;

import cn.suse.zack.pojo.ITNews;
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
    ITNewsService service;

    @RequestMapping("addITNewsInfo.action")
    public ModelAndView addITNewsInfo(HttpServletRequest request, HttpServletResponse response, ITNews itNews) {
        String content = request.getParameter("content");
        String url = request.getParameter("url");
        String way = request.getParameter("way");
        System.out.println("content" + content + "url" + url + "way" + way);
        return new ModelAndView();
    }
}
