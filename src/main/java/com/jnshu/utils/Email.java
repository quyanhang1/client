package com.jnshu.utils;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/2/6.
 */
@Service
public class Email {

    @Value("${email.url}")
    private String url ;
    @Value("${email.apiUser}")
    private String apiUser  ;
    @Value("${email.apiKey}")
    private String apiKey ;


    public void sendEmail(String email,String emaillink) throws IOException {

        Logger logger=Logger.getLogger(Email.class);
//        logger.info("进入发送右键的方法，用户的邮箱是"+emailAddress+"分配的验证码是"+emailVerify);


//        HttpClient httpclient = new DefaultHttpClient();
        CloseableHttpClient httpclient = HttpClientBuilder.create().build();
        HttpPost httPost = new HttpPost(url);


        List params = new ArrayList();
        // 您需要登录SendCloud创建API_USER，使用API_USER和API_KEY才可以进行邮件的发送。
        params.add(new BasicNameValuePair("apiUser", apiUser));
        params.add(new BasicNameValuePair("apiKey", apiKey));
        params.add(new BasicNameValuePair("from", "service@sendcloud.im"));
        params.add(new BasicNameValuePair("fromName", "quyanhang"));
        params.add(new BasicNameValuePair("to", email));
        params.add(new BasicNameValuePair("subject", "来自SendCloud的第一封邮件！"));
        params.add(new BasicNameValuePair("html", "你太棒了！你已成功的从SendCloud发送了一封测试邮件，接下来快登录前台去完善账户信息吧！验证码是"+emaillink));
        logger.info("邮件的链接参数是："+emaillink);
        logger.info("邮箱地址是："+email);

        httPost.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));

        // 请求
        HttpResponse response = httpclient.execute(httPost);
        // 处理响应
        if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) { // 正常返回
            // 读取xml文档
            String result = EntityUtils.toString(response.getEntity());
            System.out.println(result);
            logger.info("send email success");
        } else {
            logger.info("send email fail");
            System.err.println("error");
        }
        httPost.releaseConnection();


    }
}
