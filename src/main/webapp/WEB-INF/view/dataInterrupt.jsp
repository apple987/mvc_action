<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 不显示横向滚动条 -->
<style>
.no-flow-x{
    overflow:hidden !important;
}
.table{
   table-layout:fixed;
}
</style>    
<%@ include file="inc/common.jsp"%>   
<div class="Set_t hack">
      <h2 class="Set_title fl">数据中断</h2>
</div>
<!---表格 ---->
  <!-- data-content-type="application/x-www-form-urlencoded; charset=UTF-8" -->
	<table id="dg" 
	    data-toggle="table"  
	    data-method="post" 
	    data-content-type="application/x-www-form-urlencoded; charset=UTF-8"
	    data-url="${root}/dataInterrupt/getPage"
	    data-toolbar="#tb"
	    data-height="355"
		data-show-header="true" 
		data-cache="false"
		data-click-to-select="true"  
		data-single-select="false" 
		data-striped="true"
		data-search="false" 
		data-pagination="true"
		data-side-pagination="server"
		data-query-params-type="''"
		data-page-size="1"
		data-page-number="1"
		data-page-list="[1,2,5,10,20,50,100,500,1000]"
		data-query-params="queryParams"
		data-pagination-loop="false"
		data-classes="table table-hover table-condensed no-flow-x"
        data-sort-stable="true"
        data-show-footer="false"
        data-resizable="true"
        data-reorderable-columns="true"
		data-show-toggle="true"
        data-show-columns="true"
		data-show-multi-sort="true"
		data-show-pagination-switch="true"
		data-show-export="true"
		data-export-types="['excel']"
		data-export-options='{
		         "fileName": "场所列表", 
		         "worksheetName": "sheet"
		    }'
		>
	    <thead>
	    <tr>
	        <th data-field="state"  class="col-xs-1" data-align="center"  data-checkbox="true" ></th>
            <th data-field="index" data-title="序号" data-align="center" class="col-xs-1" data-formatter="getRowIndex"></th>  
	        <th data-field="breakSource" data-title="数据类型" data-align="center" data-sortable="true" data-formatter="sourceFormatter"></th>
	        <th data-field="startTime" data-title="中断开始时间" data-align="center"  data-sortable="true" ></th>
	        <th data-field="endTime" data-title="中断结束时间" data-align="center" data-sortable="true" data-formatter="endTimeFormatter"></th>
	        <th data-field="status" data-sort-name="sb.status" data-title="处理状态" data-align="center" data-sortable="true" data-formatter="statusFormatter"></th>
	        <th data-field="action" data-title="操作" data-align="center" data-events="actionEvents" data-formatter="actionFormatter"></th>
	    </tr>
	    </thead>
	</table>
	<div id="tb"  style="padding: 5px; height: auto">
	  <div style="margin-bottom: 5px">
	     <form id="queryForm" name="queryForm" method="post" action="">
	     <input type="text" name="sname"/>
           <table id="toolbarLeft" style="width:1050px;">
                     
                    <tr>
				        <td>数据类型:</td>
				        <td>
				            <select class="form-control" name="breakSource">
					        	<option value="" selected>全部</option>
								<option value="0">接受数据</option>
								<option value="1">上传数据</option>
					        </select>
			            </td>
			            <td>处理状态:</td>
				        <td>
				            <select class="form-control"  name="status">
					        	<option value="" selected>全部</option>
								<option value="1">已处理</option>
								<option value="2" >未处理</option>
					        </select>
			            </td>
			            <td>
			              &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="dataInterruptSearch" value="查询" style="width:80px;height:30px;vertical-align: bottom; line-height:10px;" class="btn-primary" onclick="doSearch()"/> 
			              &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="清空" style="width:80px;height:30px;vertical-align: bottom; line-height:10px;" class="btn-primary" onclick="doClear()"/>
			              &nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-default btn-md" id="btnVitalImport">
									<span class="glyphicon" aria-hidden="true"></span>
									导入
								</button>
						<%-- &nbsp;&nbsp;&nbsp;&nbsp;<a
						style="color: #FF0000; text-decoration: underline;"
						href="${pageContext.request.contextPath}/downLoad?fileId=data.txt">点击下载</a>。 --%>
						</td>
			            <!-- <td>&nbsp;&nbsp;&nbsp;&nbsp;导出:</td>
				        <td>
				         <select class="form-control"  name="exportType">
			                <option value="" selected>当前页面</option>
			                <option value="1">选中记录</option>
			                <option value="2">所有记录</option>
			            </select>
			            </td>
			            <td>
			              &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="导出" style="width:80px;height:30px;vertical-align: bottom; line-height:10px;" class="btn-primary" onclick="doExport()"/>
			            </td> -->
                    </tr>
                    <tr>
						   <%-- <td><a href="${root}/staff/toQrcode" target="_blank">
							        <button type="button" class="btn btn-default btn-sm" >
									  <span class="glyphicon" aria-hidden="true"></span>
										QrCode二维码
									</button>
								</a>
						   </td> --%>
                           <td>
						       <a href="${root}/staff/toZxingQrcode" target="_blank">
							        <button type="button" class="btn btn-default btn-sm" >
									  <span class="glyphicon" aria-hidden="true"></span>
										Zxing二维码
									</button>
								</a>
						  </td>
	                        <td>		
								        <button type="button" class="btn btn-default btn-sm"  onClick="sendEmail()">
										    <span class="glyphicon" aria-hidden="true"></span>
											Spring发邮件
										</button>
							</td>
							<td><a href="<%=rootPath %>/ckdemo/index.html" target="_blank">
								        <button type="button" class="btn btn-default btn-sm" >
										    <span class="glyphicon" aria-hidden="true"></span>
											CKEditor和CKFinder上传文件
										</button>
								</a>		
				            </td>
				            <td><a href="${root}/druid" target="_blank">
								        <button type="button" class="btn btn-default btn-sm" >
										    <span class="glyphicon" aria-hidden="true"></span>
											druid监控
										</button>
								</a>	
								&nbsp;&nbsp;&nbsp;&nbsp;	
				            <a href="${root}/monitoring" target="_blank">
								        <button type="button" class="btn btn-default btn-sm" >
										    <span class="glyphicon" aria-hidden="true"></span>
											JavaMelody监控
										</button>
								</a>
								&nbsp;&nbsp;&nbsp;&nbsp;	
				            <a href="${root}/dataInterrupt/exportCsv" target="_blank">
								        <button type="button" class="btn btn-default btn-sm" >
										    <span class="glyphicon" aria-hidden="true"></span>
											导出CSV
										</button>
								</a>
									&nbsp;&nbsp;&nbsp;&nbsp;	
				            <a href="${root}/dataInterrupt/freemarker" target="_blank">
								        <button type="button" class="btn btn-default btn-sm" >
										    <span class="glyphicon" aria-hidden="true"></span>
											简单freemarker
										</button>
								</a>		
										&nbsp;&nbsp;&nbsp;&nbsp;	
				            <a href="${root}/dataInterrupt/exportPoiExcel" target="_blank">
								        <button type="button" class="btn btn-default btn-sm" >
										    <span class="glyphicon" aria-hidden="true"></span>
											简单导出poi
										</button>
								</a>		
				            </td>
			     </tr>
           </table>         
	     </form>
	 </div>
   </div>
   <img style="width:auto;height:200px;" src="${base}/photoPath/timg.gif" />  
<div class="Prompt"><font color='blue'>CFEditor和CFFinder上传文件时,请务必将ftlMVC跟ckdemo项目部署到同一个tomcat</font></div>
<div class="Prompt"><font color='blue'>本处配置的数据源是druid,点击druid监控,就可以简单看到druid监控到的数据源,执行sql的情况</font></div>
<div class="Prompt"><font color='blue'>本处配置了JavaMelody监控程序,它可以方便找到系统的瓶颈,点击JavaMelody按钮可以跳转查看详情,针对JavaMelod,具体参考地址:&nbsp;&nbsp; <a href="http://www.oschina.net/p/javamelody" target="_blank"><font color="red">http://www.oschina.net/p/javamelody</font></a></font></div>
<div class="Prompt">下面列表是文件下载功能演示:</div>
<c:forEach items="${fileDirs}" var="item">
 <a style="color: #FF0000; text-decoration: underline;" href="${root}/downLoad?fileId=${item}">${item}</a>&nbsp;&nbsp;&nbsp;&nbsp;
</c:forEach>
<!-- 导入  开始 -->
<div class="modal fade" id="editVitaldddDvdModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog " style="width:460px;height:600px;" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" id="closeVitalDvdPeople" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myDvdVitalPeopleModalLabel">导入数据中断信息</h4>
			</div>
			<div class="modal-body" id="dddconDvd">
				<form id="upForm" name="upForm" method="post" action=""
					enctype="multipart/form-data">
					<table border="0" align="center" style="height:200px;">
						<tr>
							<td><font color="red">*</font>上传文件：</td>
							<td><input id="vitalPeople" name="vitalPeople" multiple="true" type="file" /> 
							</td>
						</tr>
						<tr>
							<td><font color="red">*</font>测试名称：</td>
							<td> 
								<input type="text" id="vitalRuleName" name="ruleName" vaule="" readonly/>
							</td>
						</tr>
						<tr>
							<td style="padding-left:75px;">
							 <input type="button" value="确定"  style="width:80px;height:30px;vertical-align: bottom; line-height:10px;" class="btn-primary"
								onclick="checkFilePrfeix()" />&nbsp;&nbsp;</td>
							<td> <input type="button" id="subButton" style="width:80px;height:30px;vertical-align: bottom; line-height:10px;" class="btn-primary" value="重置"></td>
						</tr>
					</table>
				</form>
				<div id="vitalPeopleRuleError" align="center"></div>
			</div>
		</div>
	</div>
</div>
<!-- 导入  结束 -->	

<script type="text/javascript">
//显示行号
function getRowIndex(value, row, index) {  
   var page=$("#dg").bootstrapTable("getOptions");
   return page.pageSize*(page.pageNumber-1)+index+1;
}  
//查询
function doSearch(){
	 var str=JSON.stringify($('#queryForm').serializeObject());
		 $("#dg").bootstrapTable("refresh",{
			"silent":true,
			"resetOffset":false,
			"url":"${root}/dataInterrupt/getPage",
			query:$('#queryForm').serializeObject()
	}); 
} 
function sourceFormatter(value,row,index) {
	 var result="接受数据";
	 if(value=="1"){
		 result="上传数据";
	 }
     return result;
}
function startTimeFormatter (value,row,index) {
	if(value==null||value.length==0||value==undefined){
		return "";
	}else{
	  return dateFormatYYYYMMDDHHMMSS(new Date(value));
	}
}
function endTimeFormatter(value,row,index) {
	if(value==null||value.length==0||value==undefined){
		return "";
	}else{
	  return dateFormatYYYYMMDDHHMMSS(new Date(value));
	}
}
function statusFormatter(value,row,index) {
	var result="未处理";
	if(value==1){
		result="已处理";
	}
	return result;
}
function doClear(){
    $(':input','#queryForm') 
    .not(':button, :submit, :reset, :hidden') 
    .val('') 
    .removeAttr('checked') 
    .removeAttr('selected'); 
}
//行处理
function actionFormatter(value, row, index) {
	  if(row.status=='2'){//未处理才显示按钮
		  return [
			        '<a class="like" href="javascript:void(0)" title="处理">',
			        '<i class="glyphicon glyphicon-edit"></i>',
			        '</a>'
			    ].join('');
	  }
}
window.actionEvents = {
	'click .like': function (e, value, row, index) {
		   BootstrapDialog.confirm({
	            title: '确认框',
	            message: '您确定要处理吗？',
	            type: BootstrapDialog.TYPE_PRIMARY, 
	            size:BootstrapDialog.SIZE_SMALL,
	            closable: true, 
	            draggable: true, 
	            btnCancelLabel: '取消', 
	            btnCancelClass: 'btn-info',
	            btnOKLabel: '确定', 
	            btnOKClass: 'btn-primary', 
	            callback: function(result) {
	                if(result) {
	                    $.ajax({
	        	    		url : '${root}/dataInterrupt/update',
	        	    		type : "post",
	        	    		contentType:"application/json",
	        	    		dataType : "json",
	        	    		/* data : {"RowData":JSON.stringify(row)}, */
	        	    	    data : JSON.stringify(row),
	        	    		success : function(json,status) {
	        	    			BootstrapDialog.alert({
	        	    	            title: '提示框',
	        	    	            message: '处理成功!',
	        	    	            buttonLabel:'确定',
	        	    	            draggable: true,
	        	    	            closable: true
	        	    	        });
	        	    			doSearch();
	        	    		}
	        	    	});
	                }
	            }
	        });
	}
};
function queryParams(params){
	params.status=$("select[name='status']").val();
	return params;
}
/* setTimeout(function () {
	$('#dg').bootstrapTable('resetView');
}, 200); */
/*function responseHandler(res){
	return res;
}
$('#dg').on("load-success.bs.table",function(data) {
	console.log(data);
})
$('#dg').on("pre-body.bs.table",function(data) {
	console.log(data);
})
function queryParams(params){
	console.error(params);
	return params;
}
/* function doExport(){
	var page=$("#dg").bootstrapTable("getOptions");
	console.log(page);
	console.log(page.pageSize);
	console.log(page.pageNumber);
	console.log(page.totalPages);
	var str=JSON.stringify($('#queryForm').serializeObject());
	console.log(JSON.parse(str))
	console.log("导出类型:"+JSON.parse(str).exportType);
	
	var data=$("#dg").bootstrapTable("getData","useCurrentPage");
	console.error(data);
} */
//导入必须选择规则
$("#btnVitalImport").click(function(){
	/* var rule=$("#contents").find("li.leftselect").length;
	if(rule.length==0){
		alert("请选择需要导入的人口库规则!");
		return;
	}else{
	     var ruleName=$("#contents").find("li.leftselect").children().last().text();
	     var status=$("#contents").find("li.leftselect").children("div").attr("name");
	     if(status==0){
	    	 alert("需要导入的规则已经停用，请选择启用中的规则!");
	    	 return;
	     }else{
	    	 $("#vitalRuleName").val(ruleName);
			 var $editModal = $("#editVitaldddDvdModal");
			 $editModal.modal("show");
	     }
	} */
	 $("#vitalRuleName").val("测试");
	 var $editModal = $("#editVitaldddDvdModal");
	 $editModal.modal("show");
})
function checkFilePrfeix() {
	var vitalTxt=$("#vitalPeople").val();
	if(vitalTxt==""){
		alert("请选择需要导入的人口库文本文件!");
	}else{
		var afPfx=vitalTxt.substring(vitalTxt.lastIndexOf(".")+1);
		if(afPfx=='txt'){
			$.ajaxFileUpload({
	            url: '${root}/fileupload',
	            type: 'post',
	            secureuri: false, //一般设置为false
	            fileElementId: 'vitalPeople', // 上传文件的id、name属性名
	            dataType: 'text', //返回值类型，一般设置为json、application/json
	            data:{"ruleName":$("#vitalRuleName").val()},
	            success: function(data, status){ 
	            	if(data.indexOf("{")!=-1&&data.indexOf("}")!=-1){
	            		data=data.substring(data.indexOf("{"),data.indexOf("}")+1);
	            	}
	            	var jsonData=JSON.parse(data);
	            	$("#vitalPeopleRuleError").html("执行状态:<font color='red'>"+jsonData.status+"</font>&nbsp;&nbsp;&nbsp;&nbsp;执行结果:<font color='red'>"+jsonData.msg+"</font>&nbsp;&nbsp;&nbsp;&nbsp;总计:<font color='red'>"+jsonData.total+"</font>条记录");
	            	setTimeout("$('#closeVitalDvdPeople').click();window.location.reload();", 2000);
	            	
	            } ,
	            error: function(data, status, e){ 
	                console.log(e);
	            } 
	        });
		}else{
			alert("导入的文件必须为txt，文本文件!");
		}
	}
}
function sendEmail(){
	$.ajax({
		url : '${root}/staff/sendEMail',
		type : "post",
		contentType:"application/json",
		dataType : "json",
	    //data : JSON.stringify(row),
		success : function(json,status) {
			console.log(json.status);
			if(json.status==200){
				alert("邮件发送成功!");
			}else{
				alert("邮件发送出错!");
			}
		}
	});
}

</script>
