package com.baokaka.service;

import com.baokaka.model.User;
import com.baokaka.payload.RequestRegister;
import com.baokaka.reponsitory.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;


    public User findByUserName(String username){
        for(User u:userRepository.findAll()){
            if(u.getUserName()!=null && u.getUserName().equalsIgnoreCase(username)){
                return u;
            }
        }
        return null;
    }

    public User findById(Long id){
        return userRepository.findById(id).get();
    }

    public boolean checkLogin(String userName, String passWord){
        User user = findByUserName(userName);
        if(user!=null){
            if(user.getPassWord().equalsIgnoreCase(passWord)){
                return true;
            }
        }
        return false;
    }

    public void addUser(User user){
        userRepository.save(user);
    }

    public void updateUser(User user){

    }

}
