<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/common.jsp"%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>qrcode二维码</title>
</head>
<body>
<br>
<div id="printArea" align="center">
	<div id="output"  align="center">
	  <img style="width:300px;height:300px;padding-left:50px;" src="${root}/staff/getQrcode" />  
	</div>
</div>
<br>
<div  align="center">
  <input id="btn" type="button" value="打印二维码"/>
</div>
<script>
 $(function(){
    var st="${qrdata}";
	st=st.replaceAll("\\|","\n"); 
	var str=utf16to8(st);
	//jQuery('#output').qrcode(str);
	 /* $("#output").qrcode({ 
	    render: "table", //table方式 
	    width: 400, //宽度 
	    height:400, //高度 
	    text: str//任意内容 
	}); */  
	
 }) 
 $("#btn").click(function(){
	 $("#printArea").printArea();
 })
 
/**
 * JS的String替换replaceAll方法
 */
String.prototype.replaceAll = function(s1,s2) { 
    return this.replace(new RegExp(s1,"gm"),s2); 
} 
/**
 * JS转码UTF-8
 */
 function utf16to8(str) {  
	    var out, i, len, c;  
	    out = "";  
	    len = str.length;  
	    for(i = 0; i < len; i++) {  
	    c = str.charCodeAt(i);  
	    if ((c >= 0x0001) && (c <= 0x007F)) {  
	        out += str.charAt(i);  
	    } else if (c > 0x07FF) {  
	        out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));  
	        out += String.fromCharCode(0x80 | ((c >>  6) & 0x3F));  
	        out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));  
	    } else {  
	        out += String.fromCharCode(0xC0 | ((c >>  6) & 0x1F));  
	        out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));  
	    }  
	    }  
	    return out;  
}
</script>
</body>
</html>