package cn.suse.zack.pojo;

import org.apache.ibatis.type.Alias;

import java.io.Serializable;

/**
 * 文章的配图，用Picture来接收这个对象
 * 需要改变图片的名称
 */
@Alias("Picture")
public class Picture implements Serializable {
    private String pictureName;

    public String getPictureName() {
        return pictureName;
    }

    public void setPictureName(String pictureName) {
        this.pictureName = pictureName;
    }
}
