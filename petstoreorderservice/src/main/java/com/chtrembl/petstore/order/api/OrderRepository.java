package com.chtrembl.petstore.order.api;

import com.azure.spring.data.cosmos.repository.CosmosRepository;
import com.chtrembl.petstore.order.model.Order;

public interface OrderRepository extends CosmosRepository<Order, String> {
}
