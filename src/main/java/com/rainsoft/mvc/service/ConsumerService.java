package com.rainsoft.mvc.service;

import javax.annotation.Resource;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.TextMessage;

import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Service;

@Service("consumerService")
public class ConsumerService {
	
	@Resource(name = "jmsQueueTemplate")
	private JmsTemplate jmsTemplate;

	public TextMessage receive(Destination destination) {
		TextMessage textMessage = (TextMessage) jmsTemplate.receive(destination);
		try {
			System.out.println("从队列" + destination.toString() + "收到了消息：\t" + textMessage.getText());
		} catch (JMSException e) {
			e.printStackTrace();
		}
		return textMessage;
	}
}