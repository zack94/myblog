package cn.suse.zack.service.interfaces;

import cn.suse.zack.pojo.ITNews;
import org.springframework.stereotype.Service;

/**
 * FileName:ITNewsService
 * Description:
 * Author:Zack
 * Date:2019/3/26
 * Time:11:40
 */
@Service("ITNewsService")
public interface ITNewsService {
    void addITNewsInfo(ITNews itNews) throws Exception;
}
