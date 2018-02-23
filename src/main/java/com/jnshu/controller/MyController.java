package com.jnshu.controller;


import com.jnshu.pojo.*;
import com.jnshu.service.*;

import com.jnshu.utils.AliYun;
import com.jnshu.utils.Email;
import com.jnshu.utils.Qiniu;
import com.jnshu.utils.SMS;
import net.sf.json.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.junit.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import utils.DesUtil;
import utils.Md5Util;

import javax.annotation.Resource;
import javax.jms.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@Controller
public class MyController {


    private Logger logger = Logger.getLogger(MyController.class);
    @Resource
    private HeadService headService;
    @Resource
    private StudentService studentService;
    @Resource
    private StudyService studyService;
    @Resource
    private ProfessionService professionService;
    @Resource
    private UserService userService;
    @Autowired
    private Qiniu qiniu;
    @Autowired
    private AliYun aliYun;
    @Autowired
    private Email sendEmail;
    @Autowired
    private SMS sms;
    @Value("${upimage.method}")
    private String method;

//    public StudentService getsS() {
//
//        StudentService studentService;
//        Integer num = (int)(Math.random()*10);
//        if(num <= 5){
//            logger.info("============>进入Service1===============");
//            try {
//                ApplicationContext context = new ClassPathXmlApplicationContext("application.xml");
//                studentService = (StudentService) context.getBean("studentService");
//                System.out.println(studentService);
//            }catch (Exception e){
//                logger.info("============>Service1挂了，用service2===============");
//                ApplicationContext context = new ClassPathXmlApplicationContext("application2.xml");
//                studentService = (StudentService) context.getBean("studentService");
//                e.printStackTrace();
//                System.out.println(studentService);
//            }
//        }else{
//            logger.info("============>进入Service2=============");
//            try {
//                ApplicationContext context = new ClassPathXmlApplicationContext("application.xml");
//                studentService = (StudentService) context.getBean("studentService");
//                System.out.println(studentService);
//            }catch (Exception e){
//                logger.info("============>Service2挂了，用service1============");
//                ApplicationContext context = new ClassPathXmlApplicationContext("application2.xml");
//                studentService = (StudentService) context.getBean("studentService");
//                e.printStackTrace();
//                System.out.println(studentService);
//            }
//
//        }
//        return studentService;
//
//    }



    @RequestMapping(value = "/t10", method = RequestMethod.GET)
//        @ResponseBody
    public String t10(Model model) {

        System.out.println("进入到controller的t10");
//        获取head信息
        List<Head> heads = headService.getAll();
        logger.info("获取到的head是：" + heads);
        model.addAttribute("heads", heads);
//        Map<String,Object> result = new HashMap<String, Object>();
//        result.put("heads",heads);


//        获取学习步骤信息
        List<Study> studies = studyService.getAll();
        logger.info("获取到的学习步骤是：" + studies);
        model.addAttribute("studies", studies);

//        获取学员信息
//        StudentService studentService = this.getsS();
        List<Student> students = studentService.getAll();
        logger.info("获取到的学员新信息：" + students);
        model.addAttribute("students", students);

//        获取在学学员数量
        int onStudy = studentService.onStudy();
        logger.info("在学数量是：" + onStudy);
        model.addAttribute("onStudy", onStudy);

//        获取就职学员数量
        int onWork = studentService.onWork();
        logger.info("在职学员数量是：" + onWork);
        model.addAttribute("onWork", onWork);

        return "t10";

    }

    @RequestMapping(value = "/u/t11", method = RequestMethod.GET)
    public String t11(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
//        获取所有的cookies
        Cookie[] cookie = request.getCookies();
//      如果存在cookis,遍历cookie,
        if (cookie != null) {
            for (int i = 0; i < cookie.length; i++) {
//                取出cookie中的token，解密，和数据库匹配，成功则
                if (cookie[i].getName().equals("Token")) {
                    String token = cookie[i].getValue();
//                    解密token
                    String tDecrypt = new DesUtil("Java").decrypt(token);
//                    用spilt()分割token，取出username和时间
                    String[] arrToken = tDecrypt.split(",");
                    String username = arrToken[0];
                    model.addAttribute("username", username);
                    long date = System.currentTimeMillis();
                    model.addAttribute("date", date);
                }
            }
        }

//        获取前端
        List<Profession> font = professionService.getFont();
        model.addAttribute("font", font);
        logger.info("获取前端" + font);

//        获取后端
        List<Profession> back = professionService.getBack();
        model.addAttribute("back", back);
        logger.info("获取后端" + back);

//        获取移动端
        List<Profession> mobile = professionService.getMobile();
        model.addAttribute("mobile", mobile);
        logger.info("获取移动" + mobile);

        return "t11";
    }

    //=========================用户登录===========================================
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String testlog() {
        return "login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, HttpServletResponse response, User user) throws Exception {
        logger.info("通过拦截器验证进入登录验证的方法");
        // =========MD5对密码加密，
        System.out.println("加密前：" + user.getPassword());
        String psw = Md5Util.getMd5(user.getPassword() + user.getUsername());
        System.out.println("加密后：" + psw);
        user.setPassword(psw);

        long loginTime = System.currentTimeMillis();
        System.out.println("当前时间loginTime：" + loginTime);
        user.setLoginTime(loginTime);
        userService.updateLogTime(user.getUsername(), user.getLoginTime());
        System.out.println("更新后数据库user的logintime：" + user);

//===========DES对用户名和登录时间加密，放入cookie中
        DesUtil des = new DesUtil("Java");
//        将用户名和时间组成字符串加密
        System.out.println(user.getUsername() + "," + user.getLoginTime());
        String token = des.encrypt(user.getUsername() + "," + user.getLoginTime());
//        创建cookie,将加密后的用户名和时间放入token
        Cookie cookie = new Cookie("Token", token);
        //对cookies过期时间进行设置,过期时间是60秒
        cookie.setMaxAge(60);
//        cookie获取路径，所有路径都可以获取cookie
        cookie.setPath("/");
//        添加到请求
        response.addCookie(cookie);

// ===========在数据库中用户名密码进行匹配,匹配成功则登录
        user.setPassword(psw);
        boolean b = userService.compareUser(user.getUsername(), user.getPassword());
        if (b == true) {
            logger.info("controller判断正确，进入t11页面");
//            进入页面
            return "redirect:/u/t11";
        } else {
//            进入失败页面
            logger.info("controller判断错误，进入错误页面");
            return "error";
        }
    }


    //用户名不存在或密码错误时返回登录页面
    @RequestMapping(value = "/back", method = RequestMethod.GET)
    public String back() {
        logger.info("返回登录页面");
        return "login";
    }

    @RequestMapping(value = "/u/loginok", method = RequestMethod.GET)
    public String loginok() {
        logger.info("返回登录页面");
        return "loginok";
    }
    //跳转到手机注册页面
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() {
        logger.info("进入注册页面");
        return "register";
    }

    //跳转到邮箱注册页面
    @RequestMapping(value = "/register2", method = RequestMethod.GET)
    public String register2() {
        logger.info("进入邮箱注册页面");
        return "register2";
    }

    //    短信注册新用户---验证短信
    @RequestMapping(value = "/registerin", method = RequestMethod.POST)
    public String register(User user,String code,HttpServletRequest request) throws Exception {
        System.out.println("新注册的用户信息：" + user);
        System.out.println("提交的验证码是："+code);
//       判断用户名是否存在，不存在则向数据库插入，存在则进入错误页面;
        User user1 = userService.selectUserByName(user.getUsername());
//        对比验证码
        String code1 = (String) request.getSession().getAttribute("code");
        logger.info("session中的验证码是："+code1);
        boolean flag = code.equals(code1);
        if (user1 == null&&flag) {
            String mdpsw = Md5Util.getMd5(user.getPassword() + user.getUsername());
            user.setPassword(mdpsw);
            userService.insertUser(user);
            return "registerok";
        } else {
            return "errorpage2";
        }
    }



//===================================任务7===========================================
//    邮件注册新用户---发送邮件
@RequestMapping(value = "/register_email", method = RequestMethod.POST)
public String register2(User user,String email,HttpServletRequest request) throws Exception {
    System.out.println("邮箱注册的用户信息：" + user);
//       判断用户名是否存在，不存在则向数据库插入，存在则进入错误页面;
    User user1 = userService.selectUserByName(user.getUsername());
//      将密码和用户名加密
   String mdpsw = Md5Util.getMd5(user.getPassword() + user.getUsername());
//        将加密后的信息放入session中
    HttpSession session = request.getSession();
    if(session.getAttribute("email")==null){
        session.setAttribute("mdpsw1",mdpsw);
        session.setAttribute("user",user);
        session.setAttribute("email",email);
//     设置session有效期
        session.setMaxInactiveInterval(60);
//    拼接get请求，link是连接
        String link="http://localhost:8080/task4-1/emailin?mdpsw="+mdpsw;
//    request.setAttribute("link",link);
//        emaillink是a标签的文字连接
        String emaillink = "<a href='http://localhost:8080/task4-1/emailin?mdpsw="+mdpsw+"'>进行验证</a>";
        logger.info("这是要发送到邮箱的连接参数："+emaillink);
        logger.info("这是要发送到邮箱的地址："+email);
//        request.setAttribute("link2",emaillink);
//    将加密后的信息发送到邮箱
        sendEmail.sendEmail(email,link);
//    sendEmail.sendEmail(email,emaillink);
        return "goEmail";
    }else{
        return "errorEmail";

    }

}

//验证邮件连接的参数
 @RequestMapping(value = "/emailin",method = RequestMethod.GET)
  public String emailin(HttpServletRequest request,String mdpsw){
     System.out.println("进入参数验证方法");
     System.out.println(mdpsw);
     User user = (User) request.getSession().getAttribute("user");
     System.out.println("这是user"+user);
    String confirm = (String) request.getSession().getAttribute("mdpsw1");
     System.out.println("这是加密的"+confirm);
     System.out.println("这是连接里的"+mdpsw);
     if(mdpsw.equals(confirm)){
         System.out.println("通过验证");
         user.setPassword(confirm);
         userService.insertUser(user);
         return "registerok";
     }else{
         return "errorpage2";
     }

  }


private int i;
//向手机发送验证码
    @RequestMapping(value = "/register/code", method = RequestMethod.POST)
    @ResponseBody
    public String code(HttpServletRequest request,String tel) {
        logger.info("进入发送验证码的方法");
//        获取手机号
        logger.info("获取的手机号是:" + tel);
//       产生一个六位的随机数
        Random random = new Random();
        int code = random.nextInt(900000) + 100000;
//        将验证码转为字符串格式
        String code1 = String.valueOf(code);
        logger.info("产生的六位验证码是：" + code1);

//防止短信攻击


        HttpSession session = request.getSession();
        //            设置session有效期
        session.setMaxInactiveInterval(120);
        if(session.getAttribute("tel")!=null){
               i++;
            System.out.println("i的值是："+i);
        }
        if(session.getAttribute("tel")==null){
                session.setAttribute("tel", tel);
                session.setAttribute("code",code1);
//          将随机数发送给手机
                Boolean b =sms.testMobile(tel, code1);

                System.out.println("第一次发送成功");
                return "suc";

        } else if(session.getAttribute("tel")!=null&&i<3){
            Boolean b =sms.testMobile(tel, code1);

            System.out.println("这是第"+i+"+1次发送成功");
            return "suc";

        }else if (session.getAttribute("tel")!=null&&i>=3){
            System.out.println("2分钟内已经发送了两次，请等一会");
              return "time";
        }else{
            System.out.println("发送失败");
             return "fail";
    }

    }

//    判断用户名是否存在，是否为空
    @RequestMapping(value = "/register/checkName", method = RequestMethod.POST)
    public String getVerify( HttpServletResponse response,String username) throws IOException {
        System.out.println("通过失去焦点进入方法");
        System.out.println("这是传来的username"+username+"空吗");
        String s = username.replaceAll(" ", "");
        System.out.println("这是传来的username"+s+"空吗");
        String ss="";
        if(s.equals(ss)){
            System.out.println("传入空字符串");
        }
//        User user = userService.selectUserByName(username);
        User user = userService.selectUserByName(username);
        boolean b = user!=null;
        System.out.println(b);
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        PrintWriter out= response.getWriter();

        if(s.equals(ss)){
            System.out.println("===空账号");
            out.println("<font color='red'>您还没有输入用户名，请输入!</font>");
        }
        else if(b){
            System.out.println("===账号存在");
            out.println("<font color='red'>该帐号已经存在，请重新输入!</font>");
        }else{
            System.out.println("==账号不存在");
            out.println("<font color='green'>恭喜您，该帐号可以使用!</font>");
        }
        return null;
    }

//    上传头像
//    @RequestMapping(value = "/upImage", method = RequestMethod.POST)
//    public String test2(HttpServletRequest request,HttpServletResponse response) throws ClassNotFoundException, UnsupportedLookAndFeelException, InstantiationException, IllegalAccessException {
//        System.out.println("进入表单提交测试方法");
//        String imageName = qiniu.upImage();
//        System.out.println("这是图片名称："+imageName);
//        request.setAttribute("pictureName",imageName);
//        return "register";
//    }

//    上传图片
    @RequestMapping(value = "/uploadtest",method =RequestMethod.POST)
    public String UpLoadtest(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws IOException, ClassNotFoundException, UnsupportedLookAndFeelException, InstantiationException, IllegalAccessException {
        System.out.println("进入图片上传方法");
        String filename= UUID.randomUUID().toString().replace("-", "")+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        System.out.println(filename);
        logger.info("选择上传的工具是："+method);
        String imageUrl = null;
        if (method.equals("qiniu")){
              qiniu.upImage(file.getBytes(), filename);
            imageUrl ="http://p3i421k51.bkt.clouddn.com/"+filename;
        }else {
            aliYun.alUp(file.getBytes(),filename);
            String url = aliYun.getUrl(filename);
            imageUrl = url;
        }

        request.setAttribute("image",imageUrl);
        return "loginok";
    }

    @RequestMapping(value = "aaa",method = RequestMethod.GET)
    public String a(){
        return "123";
    }





}
