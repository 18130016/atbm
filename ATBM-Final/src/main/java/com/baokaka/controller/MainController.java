package com.baokaka.controller;

import com.baokaka.common.CreateKey;
import com.baokaka.model.Key;
import com.baokaka.model.Product;
import com.baokaka.model.User;
import com.baokaka.reponsitory.ProductRepository;
import com.baokaka.service.KeyService;
import com.baokaka.service.ProductServices;
import com.baokaka.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.security.NoSuchAlgorithmException;
import java.security.Principal;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    private UserService userService;
    @Autowired
    private ProductServices productServices;
    @Autowired
    private KeyService keyService;

    @RequestMapping({"danh-sach-san-pham", "/productList"})
    public String getAllProduct(Model model) {
        List<Product> list = productServices.listProduct();
        if (list.size()>0){
            model.addAttribute("listP", list);
            model.addAttribute("countP", list.size());
            return "productList";
        }
        return "/";
    }

    @RequestMapping({"","/home"})
    public String showHome(Model model) {
//        return "home";
        return "home";
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
    public String myAccountPage(Model model, HttpServletRequest request){
        if(request.getSession().getAttribute("user")==null){
            return "redirect:/login";
        }
        model.addAttribute("user",(User)request.getSession().getAttribute("user"));
        return "my-account";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/login";
    }

    @PostMapping("/createkey")
    public @ResponseBody
    String createKey(@RequestParam("idUser") Long idUser) throws NoSuchAlgorithmException {
        if(idUser!=null){
            CreateKey create = new CreateKey();
            create.createKey();
            //neu da co trong csdl thi update key moi
            if(keyService.checkExist(idUser)){
                Key k = keyService.findByUserId(idUser);
                k.setPublicKey(create.getPublickey());
                keyService.updateKey(k);
                return create.getPrivatekey();
            }
            //neu chua co trong csdl thi tao cai moi
            Key key =new Key();
            key.setUserId(idUser);
            key.setPublicKey(create.getPublickey());
            keyService.addKey(key);
            return create.getPrivatekey();
        }

        return null;
    }


    




}
