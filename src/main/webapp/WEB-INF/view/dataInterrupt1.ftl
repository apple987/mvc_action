<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    
  </head>
  
  <body>
  <a href="http://blog.csdn.net/u011118289/article/details/43306015" target="_blank"><span color='blue'>参考资料</span></a>
   <p>获取request存储的map类型:${map.sname}</p>
   <p>获取request存储的map类型:${map.sex}</p>
   <p>获取request存储的map类型:${map.age}</p>
   <#--<p>获取request存储的map类型:${map.birthday}</p>-->
         设置参数: <#assign price = 42 />  <br>
         获取参数:${price}  <br>
         字符串显示:${price?string}  <br>
         数字显示:${price?string.number}  <br>
         货币显示:${price?string.currency}  <br>
        百分比显示:${price?string.percent}   <br>
   date格式化string显示:  ${map.birthday?string("yyyy-MM-dd HH:mm:ss")}; <br>
   string设置成date:<#assign lastUpdated = "2009-01-07 15:05"?datetime("yyyy-MM-dd HH:mm") />  
	${lastUpdated?string("yyyy-MM-dd HH:mm:ss zzzz")};  <br>
	${lastUpdated?string("EEE,MMM d,yy")};   <br>
	${lastUpdated?string("EEEE,MMMM dd,yyyy,hh:mm:ss a '('zzz')'")}; <br>  
	${lastUpdated?string.short};   <br>
	${lastUpdated?string.long};   <br>
	${lastUpdated?string.full};   <br>
	boolean类型:<#assign foo=true />
    ${foo?string("是foo","非foo")}<br>
    数字格式化插值:<br>
    <#assign x = 2.582 />  
	<#assign y =4 />  
	#{x;M2};  
	#{y;M2};<br>  
	#{x;m1};  
	#{y;m1};<br>  
	#{x;m1M2};  
	#{y;m1M2};<br>
  if分支判断:<br>
             性别: <#if map.sex!='' && map.sex=='0'>女<#else>男</#if><br>
      判断对象null:<br>
      <#if tt??>不为空<#else>为空</#if>
  list遍历:<br>
   <#if list?? &&list?size gt 0>
     <#list list as item>  
        ${item.sname}--<#if item.sex!='' && item.sex=='0'>女<#else>男</#if>--${item.age}<br>
     </#list>
   </#if>
    	     
  </body>
</html>
