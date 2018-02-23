package com.jnshu.pojo;

import java.io.Serializable;

public class Profession implements Serializable {
    private int id;
    private int type;
    private String door;
    private String easy;
    private String message;
    private String promessage;
    private String portype;
    private String protitle;

    public Profession() {
    }

    public Profession(int id, int type, String door, String easy, String message, String promessage, String portype, String protitle) {
        this.id = id;
        this.type = type;
        this.door = door;
        this.easy = easy;
        this.message = message;
        this.promessage = promessage;
        this.portype = portype;
        this.protitle = protitle;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getPromessage() {
        return promessage;
    }

    public void setPromessage(String promessage) {
        this.promessage = promessage;
    }

    public String getPortype() {
        return portype;
    }

    public void setPortype(String portype) {
        this.portype = portype;
    }

    public String getProtitle() {
        return protitle;
    }

    public void setProtitle(String protitle) {
        this.protitle = protitle;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getDoor() {
        return door;
    }

    public void setDoor(String door) {
        this.door = door;
    }

    public String getEasy() {
        return easy;
    }

    public void setEasy(String easy) {
        this.easy = easy;
    }


    @Override
    public String toString() {
        return "Profession{" +
                "id=" + id +
                ", type=" + type +
                ", door='" + door + '\'' +
                ", easy='" + easy + '\'' +
                ", message='" + message + '\'' +
                ", promessage='" + promessage + '\'' +
                ", portype='" + portype + '\'' +
                ", protitle='" + protitle + '\'' +
                '}';
    }
}
