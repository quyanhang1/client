package com.jnshu.pojo;

import java.io.Serializable;

public class User implements Serializable {
    private int id;
    private String username;
    private String password;
    private long loginTime;
    private int salt;
    private String mobile;

    public User() {
    }

    public User(int id, String username, String password, long loginTime, int salt, String mobile) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.loginTime = loginTime;
        this.salt = salt;
        this.mobile = mobile;
    }

    public int getSalt() {
        return salt;
    }

    public void setSalt(int salt) {
        this.salt = salt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public long getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(long loginTime) {
        this.loginTime = loginTime;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", loginTime=" + loginTime +
                ", salt=" + salt +
                ", mobile='" + mobile + '\'' +
                '}';
    }
}
