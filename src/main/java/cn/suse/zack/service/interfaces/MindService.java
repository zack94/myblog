package cn.suse.zack.service.interfaces;


import cn.suse.zack.pojo.Mind;
import org.apache.tools.ant.taskdefs.Echo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * FileName:MindService
 * Description:心情Service接口
 * Author:Zack
 * Date:2018/6/12
 * Time:16:56
 */
@Service("MindService")
public interface MindService {

    /**
     * 添加新的心情
     * @param mind
     * @throws Exception
     */
    public void addNewMind(Mind mind) throws Exception;

    /**
     * 按时间查询出最近的10条心情
     * @return 返回包含10的mind对象的List
     * @throws Exception 出错抛出异常
     */
    public List<Mind> findTenMind() throws Exception;
}
