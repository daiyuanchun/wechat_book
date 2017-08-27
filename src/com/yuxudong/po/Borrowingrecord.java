package com.yuxudong.po;

import java.util.Date;

public class Borrowingrecord {
    private String wechatid;

    private String tel;

    private String isbn;

    private String name;

    private String type;

    private String borrowtime;

    private Date returntime;

    private String realtime;

    private Integer num;

    private Integer flag;

    private String cover;

    private String author;

    private String position;

    private String uuid;

    private Double pay;

    public String getWechatid() {
        return wechatid;
    }

    public void setWechatid(String wechatid) {
        this.wechatid = wechatid == null ? null : wechatid.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn == null ? null : isbn.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getBorrowtime() {
        return borrowtime;
    }

    public void setBorrowtime(String borrowtime) {
        this.borrowtime = borrowtime == null ? null : borrowtime.trim();
    }

    public Date getReturntime() {
        return returntime;
    }

    public void setReturntime(Date returntime) {
        this.returntime = returntime;
    }

    public String getRealtime() {
        return realtime;
    }

    public void setRealtime(String realtime) {
        this.realtime = realtime == null ? null : realtime.trim();
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover == null ? null : cover.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position == null ? null : position.trim();
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid == null ? null : uuid.trim();
    }

    public Double getPay() {
        return pay;
    }

    public void setPay(Double pay) {
        this.pay = pay;
    }
}