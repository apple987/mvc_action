package com.rainsoft.mvc.service;

import javax.annotation.Resource;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

import org.apache.activemq.command.ActiveMQQueue;
import org.springframework.jms.JmsException;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;

@Service("producerService")
public class ProducerService {

	@Resource(name = "jmsQueueTemplate")
	private JmsTemplate jmsTemplate;

	public void sendMessage(Destination destination, final String msg) {
		System.out.println(Thread.currentThread().getName() + " 向队列" + destination.toString()
				+ "发送消息---------------------->" + msg);
		jmsTemplate.send(destination, new MessageCreator() {
			public Message createMessage(Session session) throws JMSException {
				return session.createTextMessage(msg);
			}
		});
	}

	public void sendMessage(final String msg) {
		    /*String destination = jmsTemplate.getDefaultDestinationName();//队列名称获取一直都是null*/
			ActiveMQQueue destination = (ActiveMQQueue) jmsTemplate.getDefaultDestination();
			System.out.println(Thread.currentThread().getName() + " 向队列" + destination.toString()+ "发送消息---------------------->" + msg);
			jmsTemplate.send(new MessageCreator() {
				public Message createMessage(Session session) throws JMSException {
					return session.createTextMessage(msg);
				}
			});
	}
}