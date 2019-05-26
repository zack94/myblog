package cn.suse.zack.controller;

import cn.suse.zack.pojo.Article;
import cn.suse.zack.pojo.PaginationHelper;
import cn.suse.zack.pojo.Picture;
import cn.suse.zack.service.interfaces.ArticleService;
import cn.suse.zack.service.interfaces.FriendLinkService;
import cn.suse.zack.service.interfaces.ITNewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 文章的Controller
 */
@Controller
public class ArticleController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private FriendLinkService friendLinkService;
    @Autowired
    private ITNewsService ITNewsService;
    @Autowired
    AdminArticleController adminArticleController;


    //创建新的文章,创建成功返回到首页查看
    @RequestMapping("addArticle.action")
    public ModelAndView addArticle(HttpServletRequest request,HttpServletResponse response,Article article, MultipartFile pictureFile,Picture picture) throws Exception{
        //文章的配图的存储
        //获取项目的运行真是路径,动态的可以随项目的运行路径发生变化的,如果不存在则会新建一个
        String pictureRealPath = request.getSession().getServletContext().getRealPath("/picture/");
        //相当于获取到了本项目下的picture文件夹的路径了

        ModelAndView modelAndView;
        //没有选择图片，则默认配图
        if (pictureFile.getName()==null) {
            picture.setPictureName("articleDefaultImage.jpg");
            article.setArticle_picture(picture.getPictureName());
            article.setArticle_createtime(new Date());
            article.setArticle_readtimes(0);
            article.setDel_flag(1);//设置删除标志位,1表示未删除数据
            try {
                articleService.addArticle(article);
            } catch (Exception e) {
                e.printStackTrace();
                modelAndView = new ModelAndView("view/admin/info/errors.jsp");
                return modelAndView;
            }
            modelAndView = new ModelAndView("view/admin/jsps/article.jsp");
            return modelAndView;
        }

        // 获取上传图片的源文件名
        String originalFileName = pictureFile.getOriginalFilename();
        // 获取源文件名的后缀名
        String fileName_extension = originalFileName.substring(originalFileName.indexOf("."));
        // 判断文件后缀名(支持的文件类型)
        Boolean flag = pictureIsSupportType(fileName_extension);
        if (flag) {
            //若支持该种文件，将图片命名为时间后缀的形式，避免重复
            String str = (new SimpleDateFormat("yyyyMMddHHmmssSSS")).format(new Date());
            //以日期.后缀名形式命名图片
            picture.setPictureName(str + fileName_extension);
            //将article填充完整
            article.setArticle_picture(picture.getPictureName());
            article.setArticle_createtime(new Date());
            article.setArticle_readtimes(0);
            article.setDel_flag(1);//设置删除标志位,1表示未删除数据

            try {
                articleService.addArticle(article);
                //上传图片
                pictureUpload(pictureRealPath, picture.getPictureName(), pictureFile);
            } catch (Exception e) {
                e.printStackTrace();
                modelAndView = new ModelAndView("view/admin/info/errors.jsp");
                return modelAndView;
            }
            return adminArticleController.articleInfo(request,response);

        } else {
            //不支持该种文件
            modelAndView = new ModelAndView("view/admin/info/errors.jsp");

            return modelAndView;
        }

    }

    //判断文件类型是否未支持类型
    public Boolean pictureIsSupportType(String fileType){
        boolean flag = (fileType.equalsIgnoreCase(".JPG") || fileType.equalsIgnoreCase(".JPEG")
                || fileType.equalsIgnoreCase(".PNG") || fileType.equalsIgnoreCase(".GIF")
                || fileType.equalsIgnoreCase(".BMP") || fileType.equalsIgnoreCase(".JPE"));
        return flag;
    }


    /**
     * 图片上传方法
     * @param pictureRealPath 文件将要保存的相对项目的真实路径
     * @param pictureName 图片文件名
     * @param pictureFile
     */
    public void pictureUpload(String pictureRealPath,String pictureName,MultipartFile pictureFile) throws Exception{
        //保存路径+文件名 拼装要上传的文件对象
        File uploadPicture = new File(pictureRealPath+"/"+pictureName);
        // 将缓存中的文件写到磁盘上
        // 如果文件路径不存在，则创建他
        if (!uploadPicture.exists()) {
            uploadPicture.mkdirs();
        }
        //从磁盘中将上传文件写入到新创建的文件中
        pictureFile.transferTo(uploadPicture);
    }

    /**
     * 初始化主页
     * @param request
     * @param response
     * @return
     */
    //初始化主页
    @RequestMapping("initHomepage.action")
    public String initHomepage(HttpServletRequest request, HttpServletResponse response) throws Exception{
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
        request.setAttribute("pagination", pagination);
        request.setAttribute("articleList", articleService.subList(pagination.getCurrentPageStart(page), perPageCount));
        request.setAttribute("friendLinks",friendLinkService.subList(0,6));
        request.setAttribute("ITNews",ITNewsService.subList(0,6));

        request.setAttribute("page", page);
       return "/view/homepage.jsp";
    }

    @RequestMapping("page.action")
    public String page(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return this.initHomepage(request, response);
    }

    /**
     * 主页初始化要调用的方法，查询5篇最新的文章返回给调用者
     * @param request
     * @param response
     * @return
     */
    //主页加载时查询最新的5篇文章
    public List<Article> find5Articles(HttpServletRequest request,HttpServletResponse response){

        List<Article> listArticles = new ArrayList<>();

        try {
            listArticles = articleService.find5Articles();
        } catch (Exception e) {
            e.printStackTrace();
        }
         return listArticles;
    }

    /**
     * 点击文章的阅读详情后，在此查询该
     * @return
     */
    @RequestMapping("articleDetail.action")
    public ModelAndView articleDetail(HttpServletResponse response, HttpServletRequest request,String article_id){
        //调用service#articleDetail()，返回Article对象保存到ModelAndView中
        //返回到ArticleDetail.jsp页面
        ModelAndView modelAndView = new ModelAndView("/view/article_detail.jsp");

        try {
            //articleService#articleDetail()调用
            modelAndView.addObject("article",articleService.articleDetail(article_id));
        } catch (Exception e) {
            //articleService#articleDetail()调用出现异常
            e.printStackTrace();
            request.setAttribute("errors","文章详情加载出现错误！请将错误反馈给我，感激不尽！E-mail：susezack@gmail.com");
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
