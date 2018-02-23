package com.jnshu.utils;

import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.util.UUID;

/**
 * Created by Administrator on 2018/2/2.
 */
@Service
public class Qiniu  {

    @Value("${qiniu.ACCESS_KEY}")
    private  String ACCESS_KEY ;
    @Value("${qiniu.SECRET_KEY}")
    private String SECRET_KEY ;
//    //要上传的空间
    @Value("${qiniu.bucketname}")
    private String bucketname;

    static Logger logger = Logger.getLogger(Qiniu.class);
    public  String upImage(byte[] uploadBytes, String filename) throws ClassNotFoundException, UnsupportedLookAndFeelException, InstantiationException, IllegalAccessException {
        logger.info("qiniuyun start");
//        跳出弹框，选择图片路径
//        UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
//        JFileChooser fileChooser = new JFileChooser();
//        fileChooser.showOpenDialog(null);
////        选择的文件路径
//        String filePath = "" + fileChooser.getSelectedFile();
////        选择的文件名
//        String fileName = "" + fileChooser.getSelectedFile().getName();


//        String ACCESS_KEY = "q0hz8WWhZj6afAyexbUpnZn9foTxk_IB0PhSsL__";
//        String SECRET_KEY = "PK_xOk_4fDzHDJtRrLQOar_zJsJ_ALxO2rHLYUyw";
        //要上传的空间
//        String bucketname = "bucket";
        String key = filename;
        //上传文件的路径
//        String FilePath = filePath;

        //密钥配置
        Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
        Zone z = Zone.autoZone();
        Configuration c = new Configuration(z);

        //创建上传对象
        UploadManager uploadManager = new UploadManager(c);
        String upToken = auth.uploadToken(bucketname);

        try {
            //调用put方法上传
            Response res = uploadManager.put(uploadBytes, key, auth.uploadToken(bucketname));
            //打印返回的信息
            System.out.println("上传成功"+res.bodyString());
            logger.info("qiniu upload success");
        } catch (QiniuException e) {
            logger.info("qiniu upload fail");
            Response r = e.response;
            // 请求失败时打印的异常的信息
            System.out.println(r.toString());
            try {
                //响应的文本信息
                System.out.println(r.bodyString());
            } catch (QiniuException e1) {
                //ignore
            }
        }
        return key;

    }

}
