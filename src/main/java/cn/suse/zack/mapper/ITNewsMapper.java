package cn.suse.zack.mapper;

import cn.suse.zack.pojo.ITNews;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * FileName:ITNewsMapper
 * Description:
 * Author:Zack
 * Date:2019/3/26
 * Time:11:31
 */
@Repository("ITNewsMapper")
public interface ITNewsMapper {

    void addITNewsInfo(ITNews itNews) throws Exception;

    int getITNewsCount() throws Exception;

    List<ITNews> subList(@Param("pageStart") int pageStart, @Param("perPageCount") int perPageCount)throws Exception;

}
