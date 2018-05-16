package com.rainsoft.mvc.task;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class MyTaskXml {
	private final Log log = LogFactory.getLog(MyTaskXml.class);

	public void show() {
		log.debug("你好，付为地的基于XML注解show   定时器  XMl:is show run!");
	}

	public void print() {
		log.debug("你好，付为地的基于XML注解print   定时器  XMl:is print run!");
	}

}
