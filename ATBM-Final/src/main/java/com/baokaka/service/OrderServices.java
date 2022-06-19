package com.baokaka.service;

import com.baokaka.model.*;
import com.baokaka.reponsitory.OrderRepository;
import com.baokaka.reponsitory.ProductRepository;
import com.baokaka.util.RandomCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class OrderServices {
    @Autowired
    OrderRepository oderRepository;
    @Autowired
    ProductRepository productRepository;
    @Autowired
    CartService cartService;
    public String orderCode = null;
    List<List<CartItem>> listItemOrderUsser = new ArrayList<>();
    public List<CartItem> listItemOderByCode = new ArrayList<>();
    public Address addressByOrderCode =new Address();
    public String createOderCode() {
        RandomCode randomCode = new RandomCode();
        orderCode = randomCode.randomAlphaNumeric(19);
        List<Order> orderList = oderRepository.findAll();
        for (int i = 0; i < orderList.size(); i++) {
            if (orderList.get(i).getCode().equals(orderCode)) {
                orderCode = randomCode.randomAlphaNumeric(19);
            } else return orderCode;
        }
        //Sẽ check code ở chỗ này
        return orderCode;
    }

    public static String[] fomatList(String str) {
        String[] result = str.trim().split("@");
        return result;
    }

    public void newOder(Order order) {
        oderRepository.save(order);

    }

    public String convertCodeToStringToken(List<CartItem> cartItems) {
        String result = "";
        for (int i = 0; i < cartItems.size(); i++) {
            result += cartItems.get(i).getProduct().getId() + "@";
        }
        return result;
    }

    public String convertQtyToStringToken(List<CartItem> cartItems) {
        String result = "";
        for (int i = 0; i < cartItems.size(); i++) {
            result += cartItems.get(i).getQuantity() + "@";
        }
        return result;
    }

    public List<Product> convertStringToProductId(String str) {
        List<Product> productList = new ArrayList<>();
        String[] arrId = fomatList(str);
        Outer:
        for (int i = 0; i < arrId.length; i++) {
            if (arrId[i] == "") break Outer;
            productList.add(productRepository.findProductById(Long.parseLong(arrId[i])));
        }
        System.out.println(productList.size());
        return productList;
    }

    public List<Integer> convertStringToQty(String str) {
        List<Integer> list = new ArrayList<>();
        String[] arrId = fomatList(str);
        Outer:
        for (int i = 0; i < arrId.length; i++) {
            if (arrId[i] == "") break Outer;
            list.add(Integer.valueOf(arrId[i]));
        }
        System.out.println(list.size());
        return list;
    }

    List<Order> orderList = new ArrayList<>();

    //    Lấy ra tất cả các đơn hàng
    public List<Order> getAllOrderByUser(User customer) {
        orderList = oderRepository.findOrderByCustomer(customer);
        return orderList;
    }


    //Lấy ra danh sách sacnr phẩm trong 1 đơn hàng
    public List<CartItem> getCartItemByIdOrder(String code) {
        Order order = oderRepository.getOrderByCode(code);
        String proId = order.getListProduct();
        String qty = order.getListQuantity();
        List<CartItem> cartItems = new ArrayList<>();
        List<Integer> integers = convertStringToQty(qty);
        List<Product> productList = convertStringToProductId(proId);

        for (int i = 0; i < integers.size(); i++) {
            CartItem item = new CartItem(productList.get(i), order.getCustomer(), integers.get(i));
            cartItems.add(item);
        }
        listItemOderByCode= cartItems;
        return listItemOderByCode;
    }


    public void createOder(String code, User customer) {
        Date date = new Date();
        Order order = new Order(code, customer, convertCodeToStringToken(cartService.getListChossePay()), convertQtyToStringToken(cartService.getListChossePay()), date, cartService.totalPay(), 1,cartService.getAddressChosse());
        oderRepository.save(order);
       List<CartItem> dele= cartService.getListChossePay();
        for (CartItem item:dele
             ) {
            cartService.deleteCart(item.getId());

        }

    }


    public Order showOrderDetails(String code){
        Order order = oderRepository.getOrderByCode(code);
        getCartItemByIdOrder(order.getCode());
        addressByOrderCode= order.getAddress();
        return order;
    }

}
