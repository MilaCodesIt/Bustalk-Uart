package org.acme.controller;

import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.acme.data.Customer;
import org.acme.service.CustomerRepository;

@Path("/customer")
public class CustomerController {

    @Inject
    CustomerRepository customerRepository;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/{id}")
    public Customer Customer(@PathParam("id") Long id) {
        return customerRepository.getCustomer(id);
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public Response createCustomer(Customer customer) {
        customerRepository.createCustomer(customer);
        return Response.ok().build();
    }

    @DELETE
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/{id}")
    public Response deleteCustomer(@PathParam("id") Long id) {
        Customer customerToDelete = customerRepository.getCustomer(id);
        customerRepository.deleteCustomer(customerToDelete);
        return Response.ok().build();
    }

    @PUT
    @Produces(MediaType.APPLICATION_JSON)
    public Response updatecustomer(Customer customer) {
        customerRepository.updateCustomer(customer);
        return Response.ok().build();
    }
}
