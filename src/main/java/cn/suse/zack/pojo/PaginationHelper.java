package cn.suse.zack.pojo;

import cn.suse.zack.mapper.ArticleMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * FileName:PaginationHelper
 * Description: 分页数据存储对象
 * Author:Zack
 * Date:2019/3/8
 * Time:20:31
 */
public class PaginationHelper {

    @Autowired
    private ArticleMapper articleMapper;

    // 数据总数
    public int totalCount;

    // 每页数据数
    public int PerPageCount = 6;

    //需要分页的页数
    public int totalPage;

    public int getPageCount() {
        return totalCount % PerPageCount == 0 ?
                totalCount / PerPageCount : totalCount / PerPageCount + 1;
    }

    //页数以1开始
    public int getCurrentPageStart(int currentPage) {
        if (currentPage < 1 || currentPage > getTotalCount()) {
            throw new RuntimeException("页数错误");
        }
        return (currentPage - 1) * PerPageCount;
    }

    public int getCurrentPageEnd(int currentPage) {
        if (currentPage < 1 || currentPage > getTotalCount()) {
            throw new RuntimeException("页数错误");
        }
        return getCurrentPageStart(currentPage) + PerPageCount > totalCount ?
                totalCount : getCurrentPageStart(currentPage) + PerPageCount;
    }
    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) throws Exception{
        this.totalCount = totalCount;
    }
    public int getPerPageCount() {
        return PerPageCount;
    }

    public void setPerPageCount(int perPageCount) {
        PerPageCount = perPageCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
}
