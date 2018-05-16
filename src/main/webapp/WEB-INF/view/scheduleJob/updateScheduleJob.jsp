<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="content-type" content="text/html" charset="UTF-8">
	<title>修改scheduleJob</title>
</head>
  <body>
     <div style="margin-bottom: 10px">
	    <input type="button" value="返回" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="scheduleJobBack()" /> 
		<input type="button" value="保存" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="scheduleJobSave()" /> 
		<input type="button" value="取消" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="scheduleJobCancle()" /> 
	 </div>
	 <div>
      <form id="scheduleJobUpdateFm" name="scheduleJobUpdateFm"  method="post" action="">
          <input type="hidden" name="jobId" value="${scheduleJob.jobId}"/>
          <table border="0" cellpadding="0"  cellspacing="0"
	         class="formlist" style="width: 100%; table-layout: fixed;">
                      <tr>
                            <th>spring bean名称</th>
                            <td><textarea id='beanName'  name='beanName' class="{required:true,maxlength:200}" value='${scheduleJob.beanName}'  rows="2" >${scheduleJob.beanName}</textarea></td>
                            <th>方法名</th>
                            <td><textarea id='methodName'  name='methodName' class="{required:true,maxlength:100}" value='${scheduleJob.methodName}'  rows="2" >${scheduleJob.methodName}</textarea></td>
                      </tr>
                      <tr>
                            <th>参数</th>
                            <td><textarea id='params'  name='params' class="{required:true,maxlength:2000}" value='${scheduleJob.params}'  rows="2" >${scheduleJob.params}</textarea></td>
                            <th>cron表达式</th>
                            <td><textarea id='cronExpression'  name='cronExpression' class="{required:true,maxlength:100}" value='${scheduleJob.cronExpression}'  rows="2" >${scheduleJob.cronExpression}</textarea></td>
                      </tr>
                      <tr>
                            <th>任务状态</th>
                            <td>
                            <select id='status' name='status' value='${scheduleJob.status}' class="{required:true}" style="width:163px;" class="publicSelect2" >
                               <option value="0" selected>正常</option>
                               <option value="1" selected>暂停</option>
                               <script type="text/javascript">
                                  $("#status").val(${scheduleJob.status});
                               </script>
						     </select>
                           </td>
                            <th>备注</th>
                            <td><textarea id='remark'  name='remark' class="{required:true,maxlength:255}"  value='${scheduleJob.remark}'  rows="2" >${scheduleJob.remark}</textarea></td>
                      </tr>
                      <%-- <tr>
                            <th>创建时间</th>
                            <td><input id='createTime'  name='createTime' readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${scheduleJob.createTime}" />'/></td>
                      </tr> --%>
          </table>
       </form>
     </div> 
     <script type="text/javascript">
       function scheduleJobSave(){//保存
          if($('#scheduleJobUpdateFm').valid()){//验证通过
        	  console.log($('#scheduleJobUpdateFm').serializeObject());
              debugger;
				$.ajax({
					url: $.common.basePath+'/scheduleJob/update',
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					datatype: 'json',
					type:"post",
					data:$('#scheduleJobUpdateFm').serializeObject(),
					success: function(json, status) {
						if(json==true){
							layer.msg('修改成功', {
				    				icon:1, 
								    time: 500,
								    end: function(index, layero){ 
								    	  parent.layer.close(parent.layer.getFrameIndex(window.name));  // 关闭layer
								          window.parent.location.reload(); //刷新父页面
										 //window.location.href=$.common.basePath+'/scheduleJob/init';
									}
							}); 
						}else{
						    layer.msg('修改失败', {
			    				icon:5, 
							    time: 500,
							    end: function(index, layero){ 
							         parent.layer.close(parent.layer.getFrameIndex(window.name));  // 关闭layer
								     window.parent.location.reload(); //刷新父页面
									 //window.location.href=$.common.basePath+'/scheduleJob/init';
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
								 //window.location.href=$.common.basePath+'/scheduleJob/init';
							}
					    });
					}
				});
		  }
       }
       function scheduleJobCancle(){//取消
          $(':input','#scheduleJobUpdateFm') 
			    .not(':button, :submit, :reset, :hidden') 
			    .val('') 
			    .removeAttr('checked') 
			    .removeAttr('selected');
       }
       function scheduleJobBack(){//返回
          parent.layer.close(parent.layer.getFrameIndex(window.name));  // 关闭layer
		  window.parent.location.reload(); //刷新父页面
          //window.location.href=$.common.basePath+'/scheduleJob/init';
       }
     </script>
  </body>
</html>
