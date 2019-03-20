package cn.suse.zack.filter;

import cn.suse.zack.pojo.Admin;

import javax.servlet.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * FileName: 博客后台管理的过滤器
 * Description:
 * Author:Zack
 * Date:2018/7/11
 * Time:10:58
 */
public class AdminFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        //System.out.println("你访问了管理员的页面被拦截下来了。。。。。");
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        //System.out.println(request);
        //这里从session域中获取管理员登陆信息，如果session中没有登陆信息则跳转到登陆界面，否则跳转到登陆界面

        /***************************************************开发环境注释掉拦截器*****************************************************************
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        //session域中没有对象，则没有登陆，跳转到登陆页面
        if (admin==null){
            response.sendRedirect("../admin_login.jsp");
        }
         *****************************************************************************************************************/
        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
