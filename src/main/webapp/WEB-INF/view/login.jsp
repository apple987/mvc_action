<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/common.jsp"%>
<head>
    <title>iSec管理综合平台</title>
    <style>
     .error{
         color:red;font-family:微软雅黑;font-size:20px;margin-left: 116px;
     }
    </style>
</head>
<body>
<div class="loginBanner"></div>
<form  action="${pageContext.request.contextPath}/doLogin" method="post">
 <div class="login">
	<div class="loginC">
		<input type="text" id="loginText" name="username"  />
        <label for="loginText">请输入用户名</label>
    </div>
    <div class="loginC">
		<input type="password" id="loginPassword" name="password"/>
        <label for="loginPassword">请输入密码</label>
    </div>
    <div class="loginC">
		<input type="text" id="validataImg" name="code"/>
        <label for="loginPassword">验证码<a title="换一张" class="captchaImg"><img  src="${pageContext.request.contextPath}/validateCode" onclick="changeCode();"></a></label>
    </div>
    <input type="submit" class="loginSubmit" value="登 录"/>
    <input type="checkbox" id="savePassword" name="rememberMe"/>
    <label for="loginPassword">自动登录</label>
    <div class="error">${loginMessage}</div>
 </div>
</form> 
<div class="loginFoot">© 2012-2016 上海云辰信息科技有限公司. All Rights Reserved. </div>
</body>
<script>
$(function(){
	var windowHeight = $(window).height(), bodyHeight = $("body").height(), loginC = $(".loginC"), loginCInput = loginC.find("input");
	
	loginCInput.val("");
	
	windowHeight > bodyHeight ? $(".loginFoot").addClass("on") : ""
	
	loginC.click(function(){
		$(this).addClass("on");
	})	
	loginCInput.blur(function(){
		$(this).val().length == 0 ? $(this).parent().removeClass("on") : ""
	})
	loginCInput.focus(function(){
		$(this).parent().addClass("on");
	})
	//session过期时，直接父界面重新刷新执行，而不是在rightFrame里面打开登录页面
	var isParentLoad=window.parent.document.getElementById("rightFrame");
	if(isParentLoad!=null){
		window.parent.location.href="${root}/login";
	}
})
function changeCode(){
	//$("#captchaImg").attr("src","${pageContext.request.contextPath}/validateCode?date=" + new Date());
	window.location.reload();
}
</script>
