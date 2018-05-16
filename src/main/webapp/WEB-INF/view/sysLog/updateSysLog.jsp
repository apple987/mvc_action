<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="content-type" content="text/html" charset="UTF-8">
	<title>修改sysLog</title>
</head>
  <body>
     <div style="margin-bottom: 10px">
	    <input type="button" value="返回" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="sysLogBack()" /> 
		<!-- <input type="button" value="保存" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="sysLogSave()" /> 
		<input type="button" value="取消" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="sysLogCancle()" />  -->
	 </div>
	 <div>
      <form id="sysLogUpdateFm" name="sysLogUpdateFm"  method="post" action="">
          <input type="hidden" name="id" value="${sysLog.id}"/>
          <table border="0" cellpadding="0"  cellspacing="0"
	         class="formlist" style="width: 100%; table-layout: fixed;">
                      <tr>
                            <th>日志标题</th>
                            <td><textarea id='title'  name='title' value='${sysLog.title}'  rows="2" >${sysLog.title}</textarea></td>
                            <th>日志类型</th>
                            <td>
                                 <select id='type' name='type' style="width:163px;" value='${sysLog.type}' class="publicSelect2" >
						              <option value="1">正常</option>
						              <option value="2">异常</option>
						          </select>
                             </td>
                             <script type="text/javascript">
                                $("#type").val('${sysLog.type}');
                             </script>
                      </tr>
                      <tr>
                            <th>执行操作用户</th>
                            <td><input id='userId' name='userId' value='${sysLog.userId}' /></td>
                          <%--   <th>创建者</th>
                            <td><input id='createBy' name='createBy' value='${sysLog.createBy}' /></td> --%>
                      </tr>
                      <tr>
                            <th>创建日志时间</th>
                            <td><input id='createDate'  name='createDate' readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${sysLog.createDate}" />'/></td>
                            <th>用户代理</th>
                            <td><textarea id='userAgent'  name='userAgent' value='${sysLog.userAgent}'  rows="2" >${sysLog.userAgent}</textarea></td>
                      </tr>
                      <tr>
                            <th>操作IP地址</th>
                            <td><textarea id='remoteIp'  name='remoteIp' value='${sysLog.remoteIp}'  rows="2" >${sysLog.remoteIp}</textarea></td>
                            <th>请求URI</th>
                            <td><textarea id='requestUri'  name='requestUri' value='${sysLog.requestUri}'  rows="2" >${sysLog.requestUri}</textarea></td>
                      </tr>
                      <tr>
                            <th>操作方式</th>
                            <td><input id='requestMethod' name='requestMethod' value='${sysLog.requestMethod}' /></td>
                            <th>请求参数</th>
                            <td><textarea id='requestParams'  name='requestParams' value='${sysLog.requestParams}'  rows="2" >${sysLog.requestParams}</textarea></td>
                      </tr>
                      <tr>
                            <th>设备MAC</th>
                            <td><input id='requestMac' name='requestMac' value='${sysLog.requestMac}' /></td>
                            <th>异常信息</th>
                            <td><textarea id='exception'  name='exception' value='${sysLog.exception}'  rows="2" >${sysLog.exception}</textarea></td>
                      </tr>
                      <tr>
                            <th>执行类名</th>
                            <td><textarea id='className'  name='className' value='${sysLog.className}'  rows="2" >${sysLog.className}</textarea></td>
                            <th>功能模块名称</th>
                            <td><textarea id='functionName'  name='functionName' value='${sysLog.functionName}'  rows="2" >${sysLog.functionName}</textarea></td>
                      </tr>
                      <tr>
                            <th>执行方法名称</th>
                            <td><textarea id='methodName'  name='methodName' value='${sysLog.methodName}'  rows="2" >${sysLog.methodName}</textarea></td>
                            <th>执行线程</th>
                            <td><textarea id='actionThread'  name='actionThread' value='${sysLog.actionThread}'  rows="2" >${sysLog.actionThread}</textarea></td>
                      </tr>
                      <tr>
                            <th>开始执行时刻</th>
                            <td><input id='actionStartTime'  name='actionStartTime' readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${sysLog.actionStartTime}" />'/></td>
                            <th>结束执行时刻</th>
                            <td><input id='actionEndTime'  name='actionEndTime' readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${sysLog.actionEndTime}" />'/></td>
                      </tr>
                      <tr>
                            <th>执行耗时 单位(秒)</th>
                            <td><input id='actionTime'  name='actionTime' value='${sysLog.actionTime}'/></td>
                      </tr>

          </table>
       </form>
     </div> 
     <script type="text/javascript">
       function sysLogSave(){//保存
          if($('#sysLogUpdateFm').valid()){//验证通过
				$.ajax({
					url: $.common.basePath+'/sysLog/update',
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					datatype: 'json',
					type:"post",
					data:$('#sysLogUpdateFm').serializeObject(),
					success: function(json, status) {
						if(json==true){
							layer.msg('修改成功', {
				    				icon:1, 
								    time: 500,
								    end: function(index, layero){ 
								    	  parent.layer.close(parent.layer.getFrameIndex(window.name));  // 关闭layer
								          window.parent.location.reload(); //刷新父页面
										 //window.location.href=$.common.basePath+'/sysLog/init';
									}
							}); 
						}else{
						    layer.msg('修改失败', {
			    				icon:5, 
							    time: 500,
							    end: function(index, layero){ 
							         parent.layer.close(parent.layer.getFrameIndex(window.name));  // 关闭layer
								     window.parent.location.reload(); //刷新父页面
									 //window.location.href=$.common.basePath+'/sysLog/init';
								}
						    });
						}
					},
					error: function(json, status) {
						layer.msg('系统异常,请稍后重试或联系技术人员', {
		    				icon:5, 
						    time: 1500,
						    end: function(index, layero){ 
						         parent.layer.close(parent.layer.getFrameIndex(window.name));  // 关闭layer
								 window.parent.location.reload(); //刷新父页面
								 //window.location.href=$.common.basePath+'/sysLog/init';
							}
					    });
					}
				});
		  }
       }
       function sysLogCancle(){//取消
          $(':input','#sysLogUpdateFm') 
			    .not(':button, :submit, :reset, :hidden') 
			    .val('') 
			    .removeAttr('checked') 
			    .removeAttr('selected');
       }
       function sysLogBack(){//返回
          parent.layer.close(parent.layer.getFrameIndex(window.name));  // 关闭layer
		  window.parent.location.reload(); //刷新父页面
          //window.location.href=$.common.basePath+'/sysLog/init';
       }
     </script>
  </body>
</html>
