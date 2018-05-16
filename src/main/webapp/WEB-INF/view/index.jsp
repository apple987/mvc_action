<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>iSec管理综合平台</title>
<style>
html{ overflow:hidden}
body{ min-width:1260px;}
</style>
</head>
<body>
<div class="top">
	<dl class="logo fl">
    	<dd id="topNav"><span></span><span></span><span></span></dd>
        <dt><img src="${root}/static/resource/images/logo.png" /></dt>
    </dl>
     <input type="text" value="" placeholder="查询案件、报警、身份信息" class="search fl" /><a href="searchResult.html" style="color:#fff" onclick="Eject($(this), 1000, 800); return false;">搜素结果</a>
     <div class="Avatar fr">
    	<img src="${root}/static/resource/images/Avatar.png" />
    	<ul>
        	<li><a href="javascript:;"><img src="${root}/static/resource/images/Avatar1.png" /><span>${user.userName}</span><i>${user.realName}</i><b>${user.roleName}</b></a></li>
            <li><a href="${root}/account/toHome" class="AvatarZhgl" target="rightFrame"><img src="${root}/static/resource/images/Avatar2.png" /><span>账户管理</span></a></li>
            <li><a href="${pageContext.request.contextPath}/logout"><img src="${root}/static/resource/images/Avatar3.png" /><span>退出平台</span></a></li>
        </ul>
    </div>
  	<div class="notice fr">
    <a href="bgxt/bgxt/bgxt_tztg.html" target="rightFrame"><i>5</i></a>
	<dl>
    	<dd>
        	<h2><img src="${root}/static/resource/images/notice1.png" /><b>严重警告</b></h2>
        	<p>对行业、系统有监管职责的政府有关部门（以下简称有关部门）负责指导、检查本行业、本系统的单位内部治安。</p>
            <span>忽略</span>
            <a href="javascript:;"><img src="${root}/static/resource/images/notice4.png" /></a>
        </dd>
        <dd>
        	<h2><img src="${root}/static/resource/images/notice2.png" /><b>一般警告</b></h2>
        	<p>对行业、系统有监管职责的政府有关部门（以下简称有关部门）负责指导、检查本行业、本系统的单位内部治安。</p>
            <span>忽略</span>
            <a href="javascript:;"><img src="${root}/static/resource/images/notice4.png" /></a>
        </dd>
        <dd>
        	<h2><img src="${root}/static/resource/images/notice3.png" /><b>通知</b></h2>
        	<p>对行业、系统有监管职责的政府有关部门（以下简称有关部门）负责指导、检查本行业、本系统的单位内部治安。</p>
            <span>忽略</span>
            <a href="javascript:;"><img src="${root}/static/resource/images/notice4.png" /></a>
        </dd>
        <dt><a href="javascript:;"></a></dt>
   	 </dl>
  </div>
  <div class="platform fr">
    	<p><a href="/" target="rightFrame">市级平台</a><i></i></p>
        <ul>
        	<li>南京市</li>
            <li>苏州市</li>
            <li>无锡市</li>
            <li>常州市</li>
            <li>镇江市</li>
            <li>淮安市</li>
            <li>徐州市</li>
            <li>连云港市</li>
        </ul>
    </div>
  <div class="blank"></div>
    <ul class="topNav">
	  	<li class="on"><a href="${root}/fristPage" target="rightFrame"><i class="topNav_i2"></i><span>首 页</span></a></li>
	        <li><a href="${root}/cssb" target="rightFrame"><i class="nav_i2"></i><span>场所设备人员</span></a></li>
	        <li><a href="${root}/ajgl" target="rightFrame"><i class="nav_i3"></i><span>布控报警</span></a></li>
	        <li><a href="/" target="rightFrame"><i class="nav_i4"></i><span>查询统计</span></a></li>
	        <li><a href="/" target="rightFrame"><i class="nav_i5"></i><span>基础信息库</span></a></li>
	        <li><a href="/" target="rightFrame"><i class="nav_i6"></i><span>厂商反馈</span></a></li>
	        <li><a href="${root}/office" target="rightFrame"><i class="nav_i7"></i><span>办公协同</span></a></li> 
	        <li><a href="${root}/systemmanagement" target="rightFrame"><span>系统管理</span></a></li>
	    </ul>
</div>
<div class="main hack">
    <div class="left fl">
    	<ul id="menu"></ul>
    </div>
	<iframe id="rightFrame" name="rightFrame" src="${root}/fristPage" frameborder="0" scrolling="yes"></iframe>
</div>
</body>
</html>
<script type="text/javascript">
var menulist = '${menu}',
menu = $("#menu"),
menuJson = JSON.parse(menulist),
navLi = $(".topNav li");
/* console.log(menuJson);
console.log(menuJson[0]);  */
navLi.on("click", menu, function () {
    var index = $(this).index();
    window.parent.navControl(index,menuJson,$(this).val());
})  
</script>