package cn.suse.zack.mapper;

import cn.suse.zack.pojo.FriendLink;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * FileName:FriendLinkMapper
 * Description:
 * Author:Zack
 * Date:2019/3/19
 * Time:21:03
 */
@Repository("FriendLinkMapper")
public interface FriendLinkMapper {

    //添加友情链接
    public void addFriendLink(FriendLink friendLink) throws Exception;

    //获取友链总数
    int getFriendLinkCount() throws Exception;

    List<FriendLink> subList(@Param("pageStart") int pageStart, @Param("perPageCount") int perPageCount)throws Exception;
}
