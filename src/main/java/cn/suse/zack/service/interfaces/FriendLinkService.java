package cn.suse.zack.service.interfaces;

import cn.suse.zack.pojo.FriendLink;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * FileName:FriendLinkService
 * Description:
 * Author:Zack
 * Date:2019/3/19
 * Time:21:15
 */
@Service("FriendLinkService")
public interface FriendLinkService {
    public void addFriendLinkService(FriendLink friendLink) throws Exception;

    //查询友链总数
    int getFriendLinkCount() throws Exception;

    List<FriendLink> subList(int pageStart, int perPageCount)throws Exception;

    public FriendLink queryFriendLinkById(String link_id) throws Exception;

    public void updateFriendLink(FriendLink friendLink) throws Exception;

    public void deleteFriendLink(String link_id) throws Exception;
}
