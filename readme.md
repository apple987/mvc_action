业余时间，整合以前项目技术，创建springMVC示例，目前升级到4.3.13版本,您的宝贵意见，是我们进步的动力。<br> 
 <br> 
**项目说明**<br>  
- 项目基于maven的多profile环境配置，打包时需要选择(test/pro/dev)打包运行的环境。<br>
<br>
**项目特点**<br>  
- 友好的代码结构及注释，便于阅读及二次开发 。<br>
- 前端页面采用jsp+freemaker，多视图解析处理，优先jsp,采用bootstrap-table强大灵活的表格插件渲染数据。 <br> 
- 后端配置swagger在线文档，方便编写API接口文档。<br> 
- 引入druib,fastjson,cors,xss,redis-cluster,redis配置。<br>
- 引入API模板，根据token作为登录令牌，极大的方便了APP接口开发。<br>
- 配置全局异常处理,mybatis,pagehelper分页。<br>
- 配置通用日志打印，采用异步线程池日志写入数据库，方便开发寻找异常。<br>
- 配置redisson集群模式,使用分布式锁，保证并发的数据一致性。<br>
- 配置jta分布式事务，使用atomikos分布式事务处理方案。<br>
- 引入druib,javaMelody监控系统各项指标，分析系统瓶颈。<br>
- 配置quartz定时器，开启集群版，cron表达式配置数据库，支持手动重启，停止任务。<br>
- 配置fileupload(默认配置最大100MB)，下载文件，生成二维码，二维码打印，mail发邮件等功能。<br>
- 配置poi和csv简单导出excel功能点,poi目前是多sheet智能导出。<br>
 <br> 
**项目结构**
<br>
mvc-action<br>
├─doc  (isec,qdone两个数据库)项目SQL语句<br>
│<br>
├─core 框架配置<br>
│<br>
├─mvc 功能模块<br>
│  ├─controller 控制层<br>
│  ├─mapper sql文件<br>
│  ├─model 数据库实体类<br>
│  ├─mybatis sql文件<br>
│  ├─service 业务层<br>
│  ├─task 注解定时任务<br>
│  └─test 模块测试<br>
│ <br>
├─util 系统工具<br>
│ <br>
├─module 功能模块<br>
│  ├─app API接口模块(APP调用)<br>
│  ├─interceptor APP权限拦截器<br>
│  ├─job 定时任务<br>
│  ├─solr solr操作<br>
│  └─util 模块工具<br>
│  
├──resources <br>
│     ├─spring spring配置xml<br>
│     ├─conf   系统配置properties<br>
│     ├─jta.properties   jta配置<br>
│     ├─freemarker.properties   freemarker配置<br>
│     ├─log4j.properties   log4j日志配置<br>
│     ├─mybatis-config.xml   mybatis配置<br>
│     └─spring-mvc.xml springMvc配置<br>
<br>
 **环境配置:**<br>
- 1.项目依赖,redis-cluster集群,activeMq,solr,redis工具。<br>
- 2.doc目录里面有初始化sql，运行项目前，请先创建mysql。<br>
- 3.工具地址:https://pan.baidu.com/s/1Bm7udGJc40xEENFgnJjsIw <br>
<br>
 **启动说明:**<br>
- 1.运行doc目录里面的sql文件，创建对应数据库isec,qdone<br>
- 2.启动redis集群,(127.0.0.1:6379~6384，密码:qdone)<br>
- 3.启动activeMq(默认单机版)<br>
- 4.启动solr(默认单机版)<br>
- 5.eclipse工具下，项目运行maven build:<br>
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goals:&nbsp;&nbsp;clean install<br>
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;profile:&nbsp;&nbsp;test/pro/dev(三选一，必填)<br>
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;勾选&nbsp;&nbsp; update snapshots和skip tests<br>
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;执行run之后,拷贝target目录下mvc.war<br>
- 6.配置tomcat,加入mvc.war，启动tomcat<br>
- 7.访问http://ip:port/mvc/swagger-ui.html<br>
<br> 	
**用户反馈：**<br>
- Git仓库： https://github.com/apple987/mvc_action<br>
- 码云仓库：https://gitee.com/bootstrap2table/mvc-master<br>
- 邮箱地址: m15171479289@163.com <br>
		
		

        
