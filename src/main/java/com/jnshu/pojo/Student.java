package com.jnshu.pojo;

import java.io.Serializable;

public class Student implements Serializable {
    private int id;
    private  String name;
    private  String state;
    private  String introduce;
    private String profession;
    private String creat_at;
    private String update_at;
    private String image;

    public Student() {
    }

    public Student(int id, String name, String state, String introduce, String profession, String creat_at, String update_at, String image) {
        this.id = id;
        this.name = name;
        this.state = state;
        this.introduce = introduce;
        this.profession = profession;
        this.creat_at = creat_at;
        this.update_at = update_at;
        this.image = image;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getCreat_at() {
        return creat_at;
    }

    public void setCreat_at(String creat_at) {
        this.creat_at = creat_at;
    }

    public String getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(String update_at) {
        this.update_at = update_at;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", state='" + state + '\'' +
                ", introduce='" + introduce + '\'' +
                ", profession='" + profession + '\'' +
                ", creat_at='" + creat_at + '\'' +
                ", update_at='" + update_at + '\'' +
                '}';
    }
}
