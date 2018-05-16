package com.rainsoft.util.redisson;

import org.redisson.Redisson;
import org.redisson.api.RAtomicLong;
import org.redisson.config.Config;

public class RedissonManager {

    private static final String RAtomicName = "genId_";

    private static Config config = new Config();
    private static Redisson redisson = null;

    public static void init(){
        try {
        	/*集群模式*/
            /*config.useClusterServers() //这是用的集群server
                    .setScanInterval(2000) //设置集群状态扫描时间
                    .setMasterConnectionPoolSize(10000) //设置连接数
                    .setSlaveConnectionPoolSize(10000)
                    .addNodeAddress("redis://10.21.17.107:6379","redis://10.21.17.107:6380","redis://10.21.17.107:6381","redis://10.21.17.107:6382","redis://10.21.17.107:6383","redis://10.21.17.107:6384");
            redisson = (Redisson) Redisson.create(config);*/
            /*单机模式*/
            config.useSingleServer().setAddress("redis://127.0.0.1:6385");
            redisson = (Redisson) Redisson.create(config);
            
            //清空自增的ID数字
            RAtomicLong atomicLong = redisson.getAtomicLong(RAtomicName);
            atomicLong.set(1);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    
    

    public static Redisson getRedisson(){
        return redisson;
    }

    /** 获取redis中的原子ID */
    public static Long nextID(){
        RAtomicLong atomicLong = getRedisson().getAtomicLong(RAtomicName);
        atomicLong.incrementAndGet();
        return atomicLong.get();
    }
    
    public static Long UUID(){
        RAtomicLong atomicLong = getRedisson().getAtomicLong("test");
        atomicLong.incrementAndGet();
        return atomicLong.get();
    }
    
    /*public static void main(String[] args) throws InterruptedException {
    	 RedissonManager.init(); //初始化
         for (int i = 0; i < 100; i++) {
             Thread t = new Thread(new Runnable() {
                 @Override
                 public void run() {
                     try {
                         String key = "test123";
                         DistributedRedisLock.acquire(key);
                         Thread.sleep(1000); //获得锁之后可以进行相应的处理
                         System.err.println("======获得锁后进行相应的操作======");
                         System.err.println("获取的分布式id是:"+UUID());
                         DistributedRedisLock.release(key);
                         System.err.println("=============================");
                     } catch (Exception e) {
                         e.printStackTrace();
                     }
                 }
             });
             t.start();
         }
	}*/
}