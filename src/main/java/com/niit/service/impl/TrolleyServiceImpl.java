package com.niit.service.impl;

import com.niit.dao.TrolleyMapper;
import com.niit.model.Trolley;
import com.niit.service.TrolleyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/6/20.
 */
@Service
public class TrolleyServiceImpl implements TrolleyService{

    @Autowired
    private TrolleyMapper trolleyMapper;

    public int insert(Trolley record) {
        return trolleyMapper.insert(record);
    }

    public List<Trolley> selectByUserAccount(String userAccount) {
        return trolleyMapper.selectByUserAccount(userAccount);
    }

    public int deleteByGoodsId(String goodsId) {
        return trolleyMapper.deleteByGoodsId(goodsId);
    }
}
