package com.rainsoft.util.redisson;

import java.util.concurrent.TimeUnit;

import org.redisson.Redisson;
import org.redisson.api.RLock;

public class DistributedRedisLock {
    private static Redisson redisson = RedissonManager.getRedisson();
    private static final String LOCK_TITLE = "redisLock_";
    /*获得锁*/
    public static void acquire(String lockName){
        String key = LOCK_TITLE + lockName;
        RLock mylock = redisson.getFairLock(key);
        mylock.lock(2, TimeUnit.MINUTES); //lock提供带timeout参数，timeout结束强制解锁，防止死锁
        System.err.println("======lock======"+Thread.currentThread().getName());
    }
    /*释放锁*/
    public static void release(String lockName){
        String key = LOCK_TITLE + lockName;
        RLock mylock = redisson.getLock(key);
        mylock.unlock();
        System.err.println("======unlock======"+Thread.currentThread().getName());
    }
    
    private static void redisLock(){
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
                        DistributedRedisLock.release(key);
                        System.err.println("=============================");
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            });
            t.start();
        }
    }
   
}