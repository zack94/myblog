package cn.suse.zack.service.Impl;

import cn.suse.zack.mapper.ITNewsMapper;
import cn.suse.zack.pojo.ITNews;
import cn.suse.zack.service.interfaces.ITNewsService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

/**
 * FileName:ITNewsServiceImpl
 * Description:
 * Author:Zack
 * Date:2019/3/26
 * Time:11:41
 */
public class ITNewsServiceImpl implements ITNewsService {
    @Autowired
    ITNewsMapper mapper;
    @Override
    public void addITNewsInfo(ITNews itNews) throws Exception {
        itNews.setCreate_time(new Date());
        itNews.setDel_flag("1");
        mapper.addITNewsInfo(itNews);
    }

    @Override
    public int getITNewsCount() throws Exception {
        return mapper.getITNewsCount();
    }

    @Override
    public List<ITNews> subList(int pageStart, int perPageCount) throws Exception {
        return mapper.subList(pageStart, perPageCount);
    }

    @Override
    public ITNews queryITNewsById(String news_id) throws Exception {
        return mapper.queryITNewsById(news_id);
    }

    @Override
    public void updateITNews(ITNews itNews) throws Exception {
        mapper.updateITNews(itNews);
    }

    @Override
    public void deleteITNewsById(String news_id) throws Exception {
        mapper.deleteITNewsById(news_id);
    }

}
