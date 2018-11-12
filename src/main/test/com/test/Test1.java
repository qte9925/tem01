package com.test;

import com.jds.entity.Mail;
import com.jds.entity.MailUtil;

public class Test1 {
    public static void main(String[] args) {
        Mail mail = new Mail();
        mail.setHost("smtp.qq.com"); // 设置邮件服务器,如果不用163的,自己找找看相关的
        mail.setSender("1047540375@qq.com");
        mail.setReceiver("928338852@qq.com"); // 接收人
        mail.setUsername("1047540375@qq.com"); // 登录账号,一般都是和邮箱名一样吧
        mail.setPassword("ljongupqynxwbeee"); // 发件人邮箱的登录密码  此密码必须是你在邮箱设置打开pop3和SMTP之后设置的密码，否则收不到邮件的
        mail.setSubject("你是傻逼吗？");
        mail.setMessage("对，你是！！！");
        new MailUtil().send(mail);
    }
}
