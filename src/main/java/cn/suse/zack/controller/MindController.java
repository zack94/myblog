package cn.suse.zack.controller;

import cn.suse.zack.pojo.Mind;
import cn.suse.zack.pojo.PaginationHelper;
import cn.suse.zack.pojo.Picture;
import cn.suse.zack.service.interfaces.MindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;


/**
 * FileName:MindController
 * Description:心情处理相关的Controller
 * Author:Zack
 * Date:2018/6/12
 * Time:17:03
 */
@Controller
public class MindController {

    //自动注入MindService
    @Autowired
    private MindService mindService;

    /**
     * 添加新的心情文章
     *
     * @param mind 请求中需要包含mind对象
     * @return 心情添加成功后返回管理员首页
     */
    @RequestMapping("addNewMind.action")
    public String addNewMind(HttpServletRequest request, HttpServletResponse response,Mind mind, MultipartFile pictureFile,Picture picture) {
        //首先判断请求中是否包含图片
        //如果图片不为空则上传图片到指定的问价夹
        String pictureName = null;
        if (pictureFile!=null){
            try {
                pictureName = pictureHandler(response,request,pictureFile,picture,"mindPicture");
            } catch (Exception e) {
                e.printStackTrace();
                //文件上传出错，获取错误信息保存到request域返回到错误页面
                request.setAttribute("errorInfo",e.getMessage());
                return "view/admin/errorInfo.jsp";
            }
        }

        //到这里如果没有出错，那么表示图片已经上传到指定的文件夹内了，返回了图片的名字
        //完善mind对象的信息
        mind.setMind_picture(pictureName);
        mind.setMind_date(new Date());
        //mind.setMind_id(UUID.randomUUID().toString());

        //mind对象封装完毕，调用service方法持久化到数据库
        try {
            mindService.addNewMind(mind);
        } catch (Exception e) {
            e.printStackTrace();
            //心情添加出错抛出异常到info页面，显示
            request.setAttribute("errorInfo","添加心情出现未知错误错");
            return "view/admin/info/errorInfo.jsp";
        }


        //添加完成，返回到后台管理首页面
        return "view/admin/index.jsp";
    }


    /**
     *
     * 图片上传处理
     * @param pictureFile 给定一个上传的图片
     * @param folderName 给出图片存放的文件夹名称，默认以项目根路径为初始路径
     * @throws Exception 如果图片没有成功上传到指定的路径则抛出异常，由调用者处理
     * @return 返回String表示图片成功上传到制定路径后的文件名称
     */
    private String pictureHandler(HttpServletResponse response, HttpServletRequest request, MultipartFile pictureFile, Picture picture, String folderName) throws Exception{

        //获取项目的运行真是路径,动态的可以随项目的运行路径发生变化的,如果不存在项目根路径下新建一个folderName的文件夹
        String pictureRealPath = request.getSession().getServletContext().getRealPath("/"+folderName+"/");

        // 获取源文件名
        String originalFileName = pictureFile.getOriginalFilename();
        // 获取源文件名的后缀名
        String fileName_extension = originalFileName.substring(originalFileName
                .indexOf("."));
        // 判断文件后缀名(支持的文件类型)
        boolean tf = (fileName_extension.equalsIgnoreCase(".JPG")
                || fileName_extension.equalsIgnoreCase(".JPEG")
                || fileName_extension.equalsIgnoreCase(".PNG")
                || fileName_extension.equalsIgnoreCase(".GIF")
                || fileName_extension.equalsIgnoreCase(".BMP")
                || fileName_extension.equalsIgnoreCase(".JPE")
        );

        //如果支持该种文件形式则上传文件
        if (tf) {
             //将图片的文件名改为uuid+原后缀名的形式
            String str = (new SimpleDateFormat("yyyyMMddHHmmssSSS")).format(new Date());
            //以日期.后缀名形式命名图片
            picture.setPictureName(str+fileName_extension);

            //上传
            try {
                // 保存图片(创建新的文件的时候给出文件保存的地址：真是保存路径+文件名)
                File uploadPicture = new File(pictureRealPath+"/"+picture.getPictureName());
                //相当于将文件写到了本项目下的folderName文件夹中

                // 将缓存中的文件写到磁盘上如果文件不存在，则创建该文件
                if (!uploadPicture.exists()) {
                    uploadPicture.mkdirs();
                }

                try {
                    //将内存中的图片写入
                    pictureFile.transferTo(uploadPicture);
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                    throw new Exception("图片写入错误");
                }
            } catch (Exception e) {
                e.printStackTrace();
                throw new Exception("文件创建错误");
            }

            //选择的文件类型不支持，直接抛出不支持文件的异常
        } else {
            throw new Exception("不支持该种文件，请选择图片类型的文件jpg，gif，png，jpe等");
        }
        //上传已完成返回图片的名字
        return picture.getPictureName();
    }

    /**
     * 初始化mind页面
     * @param request 页面请求，返回页面是域中包含Mind对象
     * @param response 相应
     * @return 返回视图
     */
    @RequestMapping("InitMindPage.action")
    public String InitMindPage(HttpServletRequest request,HttpServletResponse response){
        try {
            //查询到10条数据保存到request
            request.setAttribute("mindList",mindService.findTenMind());
        } catch (Exception e) {
            e.printStackTrace();
            return "view/errors.jsp";
        }
        //执行到此还没出错则数据已保存到request域中，返回到mind.jsp页面显示
        return "view/mind.jsp";
    }

    @RequestMapping("queryMindInfo.action")
    public ModelAndView queryMindInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
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
        int totalCount = mindService.getTotalCount();
        int totalPage = totalCount % perPageCount == 0 ? totalCount / perPageCount : totalCount / perPageCount + 1;
        // 设置用户总数
        pagination.setTotalCount(totalCount);
        // 设置每页用户数
        pagination.setPerPageCount(perPageCount);
        pagination.setTotalPage(totalPage);
        modelAndView.addObject("page",page);
        modelAndView.addObject("pagination", pagination);
        modelAndView.addObject("mindList", mindService.subList(pagination.getCurrentPageStart(page), perPageCount));
        modelAndView.setViewName("view/admin/jsps/mindList.jsp");
        return modelAndView;
    }

    @RequestMapping("changeMindLook.action")
    public ModelAndView changeMindLook(HttpServletRequest request, HttpServletResponse response)throws Exception {
        String mind_look = request.getParameter("mind_look");
        String mind_id = request.getParameter("mind_id");
        ModelAndView modelAndView;
        try {
            mindService.changeMindLook(mind_look, mind_id);
            modelAndView = queryMindInfo(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView = new ModelAndView("view/errors.jsp");
        }


        return modelAndView;
    }


    //修改之前按照mind_id查询mind信息
    @RequestMapping("queryMind.action")
    public ModelAndView queryMind(HttpServletRequest request, HttpServletResponse response) {
        String mind_id = request.getParameter("mind_id");
        ModelAndView modelAndView;
        try {
            modelAndView = new ModelAndView("view/admin/jsps/edit_mind.jsp");
            Mind mind = mindService.queryMindById(mind_id);
            mind.setMind_content(mind.getMind_content().replaceAll("(\r|\n|\r\n|\n\r)", " "));
            mind.setMind_content(mind.getMind_content().replaceAll("\"","\\\\"+"\""));
            mind.setMind_content(mind.getMind_content().replaceAll("\'","\\\\"+"\'"));
            modelAndView.addObject("mind", mind);
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView = new ModelAndView("view/errors.jsp");
        }
        return modelAndView;
    }

    //修改保存mind
    @RequestMapping("updateMind.action")
    public ModelAndView updateMind(HttpServletRequest request, HttpServletResponse response,Mind mind) {
        ModelAndView modelAndView;
        try {
            mindService.updateMind(mind);
            modelAndView = queryMindInfo(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView = new ModelAndView("view/errors.jsp");
        }
        return modelAndView;
    }

    //逻辑删除心情
    @RequestMapping("deleteMind.action")
    public ModelAndView deleteMind(HttpServletRequest request, HttpServletResponse response, String mind_id) {
        //String mind_id2= request.getParameter("mind_id");
        ModelAndView modelAndView;
        //System.out.println(mind_id);
        //System.out.println(mind_id2);
        try {
            mindService.deleteMind(mind_id);
            modelAndView = queryMindInfo(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView = new ModelAndView("view/errors.jsp");
        }
        return modelAndView;
    }
}
