package cn.suse.zack.mapper;

import cn.suse.zack.pojo.FriendLink;
import org.springframework.stereotype.Repository;

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
}
