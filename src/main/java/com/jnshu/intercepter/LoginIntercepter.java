package com.jnshu.intercepter;

import com.jnshu.pojo.User;
import com.jnshu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import utils.DesUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginIntercepter implements HandlerInterceptor {

    @Autowired
    private UserService userService;
//    请求进入controller方法前的拦截，判断用户是否需要登录
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
//        获取所有的cookies
        System.out.println("=======进入拦截器第一个方法");
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
                    System.out.println("====解密后的token的username："+username);
                    String loginTime = arrToken[1];
                    System.out.println("====解密后的token的logintime："+loginTime);
//                   根据username获取数据库中的时间
                    User user = userService.selectUserByName(username);
                    System.out.println("====根据username找到数据库中的logintime是："+user.getLoginTime());
//                  将时间和数据库中的时间进行匹配，相同则token有效，登录，不同则返回到登录页面
                    long time =  user.getLoginTime();
                    String time2 = String.valueOf(time);
                    if(loginTime.equals(time2)){
//                        设置cookie的有效时间
//                        cookie[i].setMaxAge(60);
                        System.out.println("通过token验证");
//                        response.addCookie(cookie[i]);
                        return true;
                    }else {
                        System.out.println("没有通过token验证");
                    }
                }
            }
        }
//        请求转发
        System.out.println("跳转到登陆页面");
//        request.getRequestDispatcher("/WEB-INF/test/login.jsp").forward(request, response);
        request.getRequestDispatcher("/login").forward(request, response);
        return false;

    }


//    执行controller之后，生成视图之前执行的动作
//    可在modelAndView中加入数据，比如当前时间
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        System.out.println("进入拦截器第二个方法");
    }

//    在DispatcherServlet完全处理完请求后被调用,可用于清理资源等
//     当有拦截器抛出异常时,会从当前拦截器往回执行所有的拦截器的afterCompletion()
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        System.out.println("进入拦截器第三个方法");
    }
}
