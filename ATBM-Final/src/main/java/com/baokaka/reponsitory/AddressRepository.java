package com.baokaka.reponsitory;

import com.baokaka.model.Address;
import com.baokaka.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AddressRepository extends JpaRepository<Address,Long> {
    public List<Address> findByCustomer(User customer);
    public Address findByIdAndCustomer(Long id, User customer);
}
