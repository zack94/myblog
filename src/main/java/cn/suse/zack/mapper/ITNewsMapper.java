package cn.suse.zack.mapper;

import cn.suse.zack.pojo.ITNews;
import org.springframework.stereotype.Repository;

/**
 * FileName:ITNewsMapper
 * Description:
 * Author:Zack
 * Date:2019/3/26
 * Time:11:31
 */
@Repository("ITNewsMappler")
public interface ITNewsMapper {

    void addITNewsInfo(ITNews itNews) throws Exception;
}
