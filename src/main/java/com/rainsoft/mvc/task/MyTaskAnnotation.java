package com.rainsoft.mvc.task;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class MyTaskAnnotation {
	    private final Log log = LogFactory.getLog(MyTaskAnnotation.class);
	
	 /**  
     * 定时计算。每隔6秒钟执行一次  
	 * @throws InterruptedException 
     */    
    @Scheduled(cron = "0/6 * * * * *")   
    public void show() throws InterruptedException{  
    	log.debug("您好，这是付为地的一个简单quartz的基于Annotation方式定时器，现在开始执行MyTaskAnnotation.show   定时器任务!");
        //Thread.sleep(7000);
        //log.debug(" Thread.sleep 您好，这是付为地的一个简单quartz的基于Annotation方式定时器，现在开始执行MyTaskAnnotation.show   定时器任务!");
        
    }  
      
    /**  
     * 心跳更新。启动时执行一次，之后每隔5秒执行一次  
     */    
    @Scheduled(fixedRate = 1000*5)   
    public void print(){  
     	log.debug("您好，这是付为地的一个简单quartz的基于Annotation方式定时器，现在开始执行MyTaskAnnotation.print  定时器任务!");
    }  
   
}
