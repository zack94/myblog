package cn.suse.zack.service.interfaces;

import cn.suse.zack.pojo.FriendLink;
import org.springframework.stereotype.Service;

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

}
