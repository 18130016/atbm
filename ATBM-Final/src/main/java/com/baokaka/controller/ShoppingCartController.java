package com.baokaka.controller;


import com.baokaka.model.CartItem;
import com.baokaka.model.Product;
import com.baokaka.model.User;
import com.baokaka.service.CartService;
import com.baokaka.service.ProductServices;
import com.baokaka.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ShoppingCartController {

    @Autowired
    private CartService
            cartService;
    @Autowired
    private UserService userService;
//	@Autowired
//	private OrderRepository orderRepo;


    @GetMapping({"gio-hang-cua-toi", "/cart"})
    public String showShoppingCart(Model model, HttpServletRequest request) {
        cartService.restartListItemCheckout();
        if (request.getSession().getAttribute("user") == null) {
            return "redirect:/login";
        }
        model.addAttribute("user", (User) request.getSession().getAttribute("user"));
        User customer = (User) request.getSession().getAttribute("user");
        model.addAttribute("user", customer);
        List<CartItem> cartItems = cartService.listCartItems(customer);
        model.addAttribute("cartSize", cartItems.size());
        model.addAttribute("cartItems", cartItems);
        return "cart";


    }


    @GetMapping("/cart/delete/{id}")
    public String deteleCart(Model model, HttpServletRequest request, @PathVariable("id") Long id) {
        User customer = (User) request.getSession().getAttribute("user");
        if (customer != null) {
            cartService.deleteCart(id);
            return "redirect:/cart";
        } else {
            return "redirect:/login";
        }
    }

    @PostMapping("/cart-update")
    public String updateQuantity(@RequestParam("pid") Long id, @RequestParam("qty") Integer quantity,
                                 HttpServletRequest request, Model model) {
        User customer = (User) request.getSession().getAttribute("user");
        cartService.updateQuantity(id, quantity, customer);

        return "redirect:/cart";

    }

    @PostMapping("/cart-check-out")
    public @ResponseBody void addItemCheckOut(@RequestParam("cartId") Long cartItemId, HttpServletRequest request, Model model) {
        User customer = (User) request.getSession().getAttribute("user");
        if (customer != null) {
            List<CartItem> cartItemList = cartService.findCartItemById(cartItemId, customer);
            if (cartItemList.size() != 0) {
                model.addAttribute("cartItemList", cartItemList);
                for (CartItem c : cartItemList
                ) {
                    System.out.println("Sản phẩm :" + c.getProduct().getName());
                }
                System.out.println("--------------------");

            }
        }
    }

    @PostMapping("/cart-uncheck-out")
    public @ResponseBody void removeItemCheckOut(@RequestParam("cartId") Long cartItemId, HttpServletRequest request, Model model) {
        User customer = (User) request.getSession().getAttribute("user");
        if (customer != null) {
            List<CartItem> cartItemList = cartService.removeCartCheckout(cartItemId, customer);
            if (cartItemList.size() != 0) {
                model.addAttribute("cartItemList", cartItemList);
                for (CartItem c : cartItemList
                ) {
                    System.out.println("Sản phẩm :" + c.getProduct().getName());
                }
                System.out.println("--------------------");

            }
        }
        

    }

}
