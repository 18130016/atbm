package com.baokaka.controller;

import com.baokaka.model.Product;
import com.baokaka.reponsitory.ProductRepository;
import com.baokaka.service.ProductServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Controller
public class ProductController {
    @Autowired
    private ProductRepository repository;
    @Autowired
    private ProductServices productServices;





    @GetMapping("/productDetails/{id}")
    public String studentDetailPage(@PathVariable(value = "id") Long id, Optional<Product> products, Model model) {

        try {
            if (id != 0) {
                products = productServices.getProductById(id);

                if (products.isPresent()) {
                    model.addAttribute("id", products.get().getId());
                    model.addAttribute("description", products.get().getDescription());
                    model.addAttribute("name", products.get().getName());
                    model.addAttribute("price", products.get().getPrice());

                    return "productDetails";
                }
                return "redirect:/danh-sach-san-pham";
            }
            return "redirect:/danh-sach-san-pham";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/danh-sach-san-pham";
        }

    }
    @GetMapping("/image/display/{id}")
    @ResponseBody
    void showImage(@PathVariable("id") Long id, HttpServletResponse response, Optional<Product> product)
            throws ServletException, IOException {
        product = productServices.getProductById(id);
        response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        response.getOutputStream().write(product.get().getImage());
        response.getOutputStream().close();
    }
}
