package com.baokaka.controller;

import com.baokaka.model.Product;
import com.baokaka.model.User;
import com.baokaka.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    private UserService userService;

    @RequestMapping({"danh-sach-san-pham","/productList"})
    public String showShoppingCart(Model model, Product product) {
        return "productList";
    }

    @RequestMapping({"","/home"})
    public String showHome(Model model) {
//        return "home";
        return "productList";
    }

    @GetMapping("/login")
    public String loginPage(){
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("userName") String userName, @RequestParam("passWord") String passWord, HttpServletRequest request, Model model){
        User user = userService.findByUserName(userName);
        if(user!=null){
            if(userService.checkLogin(userName,passWord)){
                request.getSession().setAttribute("user",user);
                return "redirect:/";
            }
        }
        model.addAttribute("errorMessage", "error");
        return "login";
    }

    @GetMapping("/register")
    public String registerPage(Model model){
        model.addAttribute("registerForm",new User());
        return "register";
    }

    @PostMapping("/register")
    public String addUser(@ModelAttribute("registerForm") User user){
        userService.addUser(user);
        return "redirect:/login";
    }

    @GetMapping("/account")
    public String myAccountPage(){
        return "my-account";
    }

    




}
