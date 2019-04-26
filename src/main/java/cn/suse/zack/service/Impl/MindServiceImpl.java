package cn.suse.zack.service.Impl;

import cn.suse.zack.mapper.MindMapper;
import cn.suse.zack.pojo.Mind;
import cn.suse.zack.service.interfaces.MindService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * FileName:MindServiceImpl
 * Description:MindService的实现类
 * Author:Zack
 * Date:2018/6/12
 * Time:16:59
 */
public class MindServiceImpl implements MindService {

    //自动注入MindMapper
    @Autowired
    private MindMapper mindMapper;

    /**
     * 添加新的心情
     * @param mind 给定一个mind对象作为参数
     * @throws Exception 出错抛出异常
     */
    @Override
    public void addNewMind(Mind mind) throws Exception {
        mindMapper.addNewMind(mind);
    }

    /**
     * 查找最近的10条mind
     * @return 返回包含10个mind对象的List
     * @throws Exception 出错抛出异常
     */
    @Override
    public List<Mind> findTenMind() throws Exception {
        //调用mapper的#findTenMind

        return mindMapper.findTenMind();
    }

    //查询心情文章总数
    @Override
    public int getTotalCount() throws Exception {
        return mindMapper.totalCount();

    }

    @Override
    public List<Mind> subList(int pageStart, int perPageCount) throws Exception {
        return mindMapper.subList(pageStart, perPageCount);

    }

    @Override
    public void changeMindLook(String mind_look, String mind_id) throws Exception {
        mindMapper.changeMindLook(mind_look, mind_id);
    }
}
