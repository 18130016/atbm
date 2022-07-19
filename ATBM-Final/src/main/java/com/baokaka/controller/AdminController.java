package com.baokaka.controller;


import com.baokaka.model.*;
import com.baokaka.reponsitory.AddressRepository;
import com.baokaka.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private UserService userService;
    @Autowired
    private ProductServices productServices;
    @Autowired
    private KeyService keyService;

    @Autowired
    private CartService cartService;

    @Autowired
    private OrderServices orderServices;

    @Autowired
    private AddressRepository addressRepository;


    @RequestMapping({"product-admin", "/productmanager"})
    public String getAllProduct(Model model) {
        List<Product> list = productServices.listProduct();
        if (list.size() > 0) {
            model.addAttribute("listP", list);
            model.addAttribute("countP", list.size());
            return "productmanager";
        }
        return "/";
    }
    @RequestMapping({"/product-admin/add"})
    public String addProduct(Model model) {
        return "addProduct";
    }
    @RequestMapping({"/product-admin/edit"})
    public String editProduct(Model model) {
        return "editProduct";
    }
    @RequestMapping({"/product-admin/delete"})
    public String deleteProduct(Model model) {
        return "deleteProduct";
    }
    @GetMapping("/usermanager")
    public String userManager(Model model, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            if (user.getIsAdmin() == 1) {
                model.addAttribute("user", user);
                List<User> list = userService.getAllUser();
                List<Key> listKey = keyService.getAllKey();
                if (list.size() > 0) {
                    model.addAttribute("listU", list);
                    model.addAttribute("listK", listKey);
                    model.addAttribute("countU", list.size());
                    return "usermanager";
                }
            } else return "redirect:/";
        }
        return "redirect:/";
    }




    @GetMapping("usermanager/delete")
    public  String deleteUser(Model model, @RequestParam("uid") Long id,HttpServletRequest request) {
            User user = userService.findById(id);
            User user1 = (User) request.getSession().getAttribute("user");
          if (user1 != null&& user1.getIsAdmin() == 1) {

            if (user != null) {
             List<CartItem> lisst=   cartService.listCartItems(user);
               for (CartItem cartItem : lisst) {
                   cartService.deleteCart(cartItem.getId());
               }

                List<Address> lissAddress=   addressRepository.findByCustomer(user);
                for (Address address : lissAddress) {
                    addressRepository.delete(address);
                }
                List<Order> lissOrder=   orderServices.getAllOrderByUser(user);
                for (Order order : lissOrder) {
                    orderServices.deleteOrder(order.getId());
                }
                userService.deleteUser(user.getId());
                return "redirect:/usermanager";
            }

            return "redirect:/usermanager";
    }
          return "redirect:/";
    }
}
