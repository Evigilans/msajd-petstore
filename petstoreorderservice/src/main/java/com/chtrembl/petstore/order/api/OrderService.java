package com.chtrembl.petstore.order.api;

import com.chtrembl.petstore.order.model.Order;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@AllArgsConstructor
@Transactional
public class OrderService {

	private final OrderRepository orderRepository;

	public Order findOrder(String orderId) {
		Optional<Order> optionalOrder = orderRepository.findById(orderId);

		Order order = optionalOrder.orElseGet(Order::new);
		order.setId(orderId);

		return order;
	}

	public Order saveOrder(Order order) {
		return orderRepository.save(order);
	}
}
