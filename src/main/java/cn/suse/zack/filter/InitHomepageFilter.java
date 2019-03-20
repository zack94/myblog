package cn.suse.zack.filter;


import javax.servlet.*;
import java.io.IOException;

public class InitHomepageFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
            System.out.println("开始执行过滤器。。。。。。。。。。。。。");
            System.out.println("过滤器执行完毕。。。。。。。。。。。。。");
            filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {

    }

    //@Override
    //public void init(){
    //
    //}
    //
    //@Override
    //public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
    //    System.out.println("开始执行过滤器。。。。。。。。。。。。。");
    //    filterChain.doFilter(servletRequest,servletResponse);
    //    System.out.println("过滤器执行完毕。。。。。。。。。。。。。");
    //}
    //
    //@Override
    //public void destroy(){
    //
    //}

}
