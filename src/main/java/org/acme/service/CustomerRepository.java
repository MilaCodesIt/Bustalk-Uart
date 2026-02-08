package org.acme.service;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;
import org.acme.data.Customer;

@ApplicationScoped
public class CustomerRepository {
    @Inject
    EntityManager entityManager;

    //Method to POST/CREATE customer
    @Transactional
    public void createCustomer(Customer customer) {
        entityManager.persist(customer);
    }

    //Method to GET/Retrieve customer
    @Transactional
    public Customer getCustomer(Long id) {
        return entityManager.find(Customer.class, id);
    }

    //Method to DELETE customer
    @Transactional
    public void deleteCustomer(Customer customer) {
        entityManager.remove(entityManager.contains(customer) ? customer : entityManager.merge(customer));
    }

    //Method to PUT/UPDATE customer
    @Transactional
    public void updateCustomer(Customer customer) {
        entityManager.merge(customer);
    }


}
