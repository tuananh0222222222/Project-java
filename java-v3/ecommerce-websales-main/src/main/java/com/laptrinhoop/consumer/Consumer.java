package com.laptrinhoop.consumer;

import java.util.Date;

import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.laptrinhoop.dao.IOrderDAO;
import com.laptrinhoop.dao.IOrderDetailDAO;
import com.laptrinhoop.entity.Customer;
import com.laptrinhoop.entity.Order;
import com.laptrinhoop.entity.OrderDetail;
import com.laptrinhoop.entity.Product;
import com.laptrinhoop.model.OrderDetails;
import com.laptrinhoop.model.OrderModel;

@Component
public class Consumer {
}
