package cn.suse.zack.service.Impl;

import cn.suse.zack.mapper.FriendLinkMapper;
import cn.suse.zack.pojo.FriendLink;
import cn.suse.zack.service.interfaces.FriendLinkService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

/**
 * FileName:FriendLinkServiceImpl
 * Description:
 * Author:Zack
 * Date:2019/3/19
 * Time:21:23
 */
public class FriendLinkServiceImpl implements FriendLinkService {
    @Autowired
    FriendLinkMapper mapper;

    @Override
    public void addFriendLinkService(FriendLink friendLink) throws Exception {
        friendLink.setCreate_time(new Date());
        friendLink.setDel_flag(true);
        mapper.addFriendLink(friendLink);
    }

    @Override
    public int getFriendLinkCount() throws Exception {
        return mapper.getFriendLinkCount();
    }

    @Override
    public List<FriendLink> subList(int pageStart, int perPageCount) throws Exception {
        return mapper.subList(pageStart, perPageCount);
    }

    @Override
    public FriendLink queryFriendLinkById(String link_id) throws Exception {
        return mapper.queryFriendLinkById(link_id);
    }

    @Override
    public void updateFriendLink(FriendLink friendLink) throws Exception {
        mapper.updateFriendLink(friendLink);
    }

    @Override
    public void deleteFriendLink(String link_id) throws Exception {
        mapper.deleteFriendLink(link_id);
    }
}
