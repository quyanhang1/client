package com.jnshu.pojo;

import java.io.Serializable;

public class Study implements Serializable {
    private int id;
    private String image;
    private String title;

    public Study() {
    }

    public Study(int id, String image, String title) {
        this.id = id;
        this.image = image;
        this.title = title;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        return "Study{" +
                "id=" + id +
                ", image='" + image + '\'' +
                ", title='" + title + '\'' +
                '}';
    }
}
