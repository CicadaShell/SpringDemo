package com.niit.model;

import java.util.Date;

public class OrderRecord {
    private String orderId;

    private Date orderTime;

    private String userSell;

    private String userBuy;

    private String goodsId;

    private int goodsCounts;

    private Boolean sellHandler;

    private Boolean buyHandler;

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

    public String getUserSell() {
        return userSell;
    }

    public void setUserSell(String userSell) {
        this.userSell = userSell;
    }

    public String getUserBuy() {
        return userBuy;
    }

    public void setUserBuy(String userBuy) {
        this.userBuy = userBuy;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public int getGoodsCounts() {
        return goodsCounts;
    }

    public void setGoodsCounts(int goodsCounts) {
        this.goodsCounts = goodsCounts;
    }

    public Boolean getSellHandler() {
        return sellHandler;
    }

    public void setSellHandler(Boolean sellHandler) {
        this.sellHandler = sellHandler;
    }

    public Boolean getBuyHandler() {
        return buyHandler;
    }

    public void setBuyHandler(Boolean buyHandler) {
        this.buyHandler = buyHandler;
    }
}