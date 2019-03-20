<%--
  Created by IntelliJ IDEA.
  /**
 * FileName:article_comment
 * Description:
 * Author:Zack
 * Date:2018/7/5
 * Time:9:23
 */  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="zerogrid">
    <div class="comments-are">
        <div id="comment">
            <h3>Leave a Reply</h3>
            <span>Your email address will not be published. Required fields are marked </span>
            <form name="form1" id="comment_form" method="post" action="">
                <label>
                    <span>Comment:</span>
                    <textarea name="message" id="message"></textarea>
                </label>
                <label>
                    <span>Name:</span>
                    <input type="text"  name="name" id="name" required>
                </label>
                <label>
                    <span>Email:</span>
                    <input type="email"  name="email" id="email" required>
                </label>
                <center><input class="sendButton" type="submit" name="Submit" value="Submit"></center>
            </form>
        </div>
    </div>
</div>