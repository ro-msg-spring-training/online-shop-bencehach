package ro.msg.learning.shop.Services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ro.msg.learning.shop.DTO.OrderDTO;
import ro.msg.learning.shop.DTO.OrderDetailDTO;
import ro.msg.learning.shop.Entities.Adresa;
import ro.msg.learning.shop.Entities.Orders;
import ro.msg.learning.shop.Exceptions.OrderNotFoundException;
import ro.msg.learning.shop.Mapper.OrderMapper;
import ro.msg.learning.shop.Repositories.OrderRepository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class OrderService {

    private final OrderRepository orderRepository;
    private final OrderMapper orderMapper;


    public OrderDTO getOrderById(Integer id) throws OrderNotFoundException {
        Optional<Orders> orderOptional = orderRepository.findById(id);

        if (orderOptional.isPresent()) {
            return orderMapper.mapOrderToOrderDTO(orderOptional.get());
        } else throw new OrderNotFoundException("This order doesn't exist");
    }

    public OrderDTO createOrder(LocalDateTime orderTimestamp, Adresa deliveryAddress, List<OrderDetailDTO> productsList) {

        OrderDTO orderDTO = OrderDTO.builder().orderTimestamp(orderTimestamp)
                .deliveryAddress(deliveryAddress)
                .productsList(productsList)
                .build();
        Orders order = orderMapper.mapOrderDtoToOrder(orderDTO);

        order.getOrderDetail().forEach(a -> a.setOrder(order));

        orderRepository.save(order);

        return orderMapper.mapOrderToOrderDTO(order);
    }
}
