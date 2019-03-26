package cn.suse.zack.controller;

import cn.suse.zack.pojo.Admin;
import cn.suse.zack.pojo.User;
import cn.suse.zack.pojo.UserExtend;
import cn.suse.zack.service.interfaces.UserService;
import cn.suse.zack.utils.VerifyCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

/**
 * FileName:UserController
 * Description: 用户类访问API
 * Author:Zack
 * Date:2018/6/23
 * Time:16:51
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;


    /**
     * 登陆界面初始话
     *
     * @param request  foo
     * @param response foo
     * @return 返回登陆界面
     */
    @RequestMapping("userLoginHomepage.action")
    public String userLoginHomepage(HttpServletRequest request, HttpServletResponse response) {


        return "view/login.jsp";

    }

    /**
     * 注册界面初始话
     *
     * @param request  foo
     * @param response foo
     * @return 返回注册界面
     */
    @RequestMapping("userRegistHomepage.action")
    public String userRegistHomepage(HttpServletRequest request, HttpServletResponse response) {


        return "view/regist.jsp";

    }


    /**
     * 获取页面端的验证码
     *
     * @param request  req
     * @param response res
     */
    @RequestMapping("getVerifyCode.action")
    public void getVerifyCode(HttpServletRequest request, HttpServletResponse response) {
        //创建一个验证码对象
        VerifyCode verifyCode = new VerifyCode();
        //获取到验证码图形
        //BufferedImage image = verifyCode.getImage();
        //将图片输出
        try {
            verifyCode.output(verifyCode.getImage(), response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
        //获取验证码的文本并保存到session中
        //否则当表单请求触发时request域中的数据将消失
        //String vcode = verifyCode.getText();
        //System.out.println(vcode);
        //request.setAttribute("vcode",vcode);
        request.getSession().setAttribute("vcode", verifyCode.getText());
    }


    /**
     * 用户添加controller
     *
     * @param userExtend 参数为json形式的User对象
     * @return 返回到指定的页面
     */
    @RequestMapping("addUser.action")
    public String addUser(HttpServletRequest request,UserExtend userExtend) {
        //System.out.println("..........");
        //从session域中获取服务端的正确的验证码
        String scode = (String) request.getSession().getAttribute("vcode");
        //比较用户填写的验证码，相同则完成注册，不同则保存用户表单，返回到注册界面
        //验证码错误
        if (!userExtend.getVcode().equalsIgnoreCase(scode)) {

            request.setAttribute("user", userExtend);
            request.setAttribute("error","验证码错误");
            return "view/regist.jsp";
        }

        //验证码正确
        //完善用户信息，完成注册,跳转登陆页
        //userExtend.setUser_id(UUID.randomUUID().toString());
        userExtend.setUser_state("0");
        try {
            userService.addUser(userExtend);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //完成注册,返回到登陆界面
        request.setAttribute("success","注册成功，请登陆");
        return "view/login.jsp";

    }

    /**
     * 用户登陆
     * @param request  保存错误信息
     * @param userExtend 获取页面对象
     * @return 成功->博客首页  失败->登陆页面
     */
    @RequestMapping("userLogin.action")
    public String userLogin(HttpServletRequest request,UserExtend userExtend){
        //判断验证码是否正
        //System.out.println("............");
        //System.out.println(userExtend);
        //String code = ((String) request.getSession().getAttribute("vcode"));
        //String scode = userExtend.getVcode();
        if ( !((String) request.getSession().getAttribute("vcode")).equalsIgnoreCase(userExtend.getVcode()) ){
            //验证码不正确，保存表单信息返回登陆界面
            request.setAttribute("user",userExtend);
            request.setAttribute("error","验证码错误");
            return "view/login.jsp";
        }
        //判断用户是否存在
        //从数据库查询出用户
        User user = null;
        try {
            user = userService.findUserByEmail(userExtend.getUser_email());
        } catch (Exception e) {
            e.printStackTrace();
        }
        //用户不存在
        if (user == null){
            //保存错误信息和用户信息输出到登陆页面
            request.setAttribute("user",userExtend);
            request.setAttribute("userIsNull","用户名或密码不存在");
            return "view/login.jsp";
        }
        //否则用户存在
        //保存用户到session域中返回页面
        request.setAttribute("success","恭喜您，登陆成功！");
        if (user.getIs_admin().equals("1")) {
            request.getSession().setAttribute("admin", user);
        } else {
            request.getSession().setAttribute("user",user);
        }
        return "view/login.jsp";
    }


    /**
     * 管理员登陆入口
     * @param request
     * @param userExtend
     * @return
     */
    @RequestMapping("adminLogin.action")
    public ModelAndView adminLogin(HttpServletResponse response,HttpServletRequest request, UserExtend userExtend){

        //if ( !((String) request.getSession().getAttribute("vcode")).equalsIgnoreCase(userExtend.getVcode()) ){
        //    //验证码不正确，保存表单信息返回登陆界面
        //    request.setAttribute("user",userExtend);
        //    request.setAttribute("error","验证码错误");
        //    //返回管理员登陆入口
        //    return "view/login.jsp";
        //}

        //判断用户是否存在
        //从数据库查询出用户
        //User user = null;
        //try {
        //    user = userService.findUserByEmail(userExtend.getUser_email());
        //} catch (Exception e) {
        //    e.printStackTrace();
        //}
        ////用户不存在
        //if (user == null){
        //    //保存错误信息和用户信息输出到登陆页面
        //    request.setAttribute("user",userExtend);
        //    request.setAttribute("userIsNull","用户名或密码不存在");
        //    return "view/login.jsp";
        //}
        ////否则用户存在
        ////保存用户到session域中，跳转到后台页面
        //request.setAttribute("success","恭喜您，登陆成功！");
        //request.getSession().setAttribute("user",userExtend);
        //return "redirect:view/admin/jsps/index.jsp";

        //返回到ArticleDetail.jsp页面
        ModelAndView modelAndView = new ModelAndView("/view/admin/jsps/index.jsp");

        try {
            User user = null;
            user = userService.findUserByEmail(userExtend.getUser_email());
            if (user != null) {
                //将登陆用户保存到session中,保持登陆状态
                Admin admin = new Admin(user.getUser_name(),user.getUser_password());
                request.getSession().setAttribute("admin",admin);
                modelAndView.addObject("user", user);
            } else {
                modelAndView.addObject("userIsNull", "用户名或密码错误！");
            }
        } catch (Exception e) {
            //articleService#articleDetail()调用出现异常
            e.printStackTrace();
            request.setAttribute("errors","用户登陆错误！请将错误反馈给我，感激不尽！E-mail：susezack@gmail.com");
            try {
                request.getRequestDispatcher("/view/errors.jsp").forward(request,response);
            } catch (ServletException e1) {
                e1.printStackTrace();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
        //System.out.println(article_id);
        return modelAndView;
    }



}
