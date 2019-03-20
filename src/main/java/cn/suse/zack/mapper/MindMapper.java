package cn.suse.zack.mapper;

import cn.suse.zack.pojo.Mind;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * FileName:MindMapper
 * Description: 心情mapper层
 * Author:Zack
 * Date:2018/6/12
 * Time:16:41
 */
@Repository("MindMapper")
public interface MindMapper {

    /**
     * 向数据库添加新的心情
     * @param mind 封装好的mind对象
     * @throws Exception 出错跑异常
     */
    public void addNewMind(Mind mind) throws Exception;

    /**
     * 查询出最近的10条心情言论
     * @return 包含10条心情的List
     * @throws Exception 抛出异常
     */
    public List<Mind> findTenMind() throws Exception;
}
