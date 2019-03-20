package cn.suse.zack.controller;

import cn.suse.zack.pojo.FriendLink;
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
    FriendLinkService service;

    @RequestMapping("addFriendLink.action")
    public ModelAndView addFriendLink(HttpServletRequest request, HttpServletResponse response, FriendLink friendLink)throws Exception{
        //添加友情链接
        /**
         * 阿姨你好，有个事情我和静想寻求你们的意见，这件事估计静也给你提到过，静在成都的工作算是大致稳定下来了，也租了房子开始了工作和生活，
         * 我和静的感情也有一段时间了，但是这期间我们一直都是分处异地，没有真正的一起生活过，感情到底有多深，能否经得起生活的考验也是个未知数，毕竟我们都没有尝试过，所以静在成都工作了我想我们能否真实的相处生活一段时间
         * 当然这个请求有些唐突，有些不合适，如果二老有些犹豫顾虑的话，我也能理解你们的心情，也就不会
         */
        ModelAndView modelAndView;
        //try {
            service.addFriendLinkService(friendLink);
            modelAndView = new ModelAndView("view/admin/jsps/flink.jsp");
        //} catch (Exception e) {
        //    e.printStackTrace();
        //    modelAndView = new ModelAndView("view/admin/info/errors.jsp");
        //}
        return modelAndView;
    }
}
