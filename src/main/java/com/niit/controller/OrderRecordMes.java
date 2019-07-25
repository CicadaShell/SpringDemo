package com.niit.controller;

import java.util.Date;

/**
 * Created by Administrator on 2017/6/21.
 */
public class OrderRecordMes {

    private String orderId;

    private Date orderTime;

    private int goodsCounts;

    private String goodsName;

    private Double price;

    private String picture;

    private String address;

    private String buyName;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public int getGoodsCounts() {
        return goodsCounts;
    }

    public void setGoodsCounts(int goodsCounts) {
        this.goodsCounts = goodsCounts;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBuyName() {
        return buyName;
    }

    public void setBuyName(String buyName) {
        this.buyName = buyName;
    }
}
