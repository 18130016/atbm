package com.baokaka.service;

import com.baokaka.util.RandomCode;
import org.springframework.stereotype.Service;

@Service
public class OrderServices {

    public String orderCode=null;
    public String createOderCode(){
        RandomCode randomCode = new RandomCode();

        //Sẽ check code ở chỗ này
        orderCode= randomCode.randomAlphaNumeric(19);
        return orderCode;
    }

}
