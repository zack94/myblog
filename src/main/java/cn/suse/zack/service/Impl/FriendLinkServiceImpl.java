package cn.suse.zack.service.Impl;

import cn.suse.zack.mapper.FriendLinkMapper;
import cn.suse.zack.pojo.FriendLink;
import cn.suse.zack.service.interfaces.FriendLinkService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

/**
 * FileName:FriendLinkServiceImpl
 * Description:
 * Author:Zack
 * Date:2019/3/19
 * Time:21:23
 */
public class FriendLinkServiceImpl implements FriendLinkService {
    @Autowired
    FriendLinkMapper friendLinkMapper;

    @Override
    public void addFriendLinkService(FriendLink friendLink) throws Exception {
        friendLink.setCreate_time(new Date());
        friendLink.setDel_flag(true);
        friendLinkMapper.addFriendLink(friendLink);
    }
}
