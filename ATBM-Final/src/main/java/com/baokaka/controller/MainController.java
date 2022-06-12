package com.baokaka.controller;

import com.baokaka.model.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;
import java.util.List;

@Controller
public class MainController {
@RequestMapping({"danh-sach-san-pham","/productList"})
public String showShoppingCart(Model model, Product product) {
    return "productList";
}
    @RequestMapping({"","/home"})
    public String showHome(Model model) {
//        return "home";
        return "productList";
    }

}
