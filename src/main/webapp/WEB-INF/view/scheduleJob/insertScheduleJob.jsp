<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="content-type" content="text/html" charset="UTF-8">
	<title>添加scheduleJob</title>
</head>
  <body>
  <div class="container">
     <div style="margin-bottom: 10px">
	    <input type="button" value="返回" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="scheduleJobBack()" /> 
		<input type="button" value="保存" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="scheduleJobSave()" /> 
		<input type="button" value="取消" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="scheduleJobCancle()" /> 
	 </div>
	 <div>
      <form id="scheduleJobInsertFm" name="scheduleJobInsertFm"  method="post" action="">
          <table border="0" cellpadding="0" id="scheduleJobInsertTable" cellspacing="0"
			 class="formlist" style="width: 100%; table-layout: fixed;">
                      <tr>
                            <th>spring bean名称</th>
                            <td><textarea id='beanName'  name='beanName' class="{required:true,maxlength:200}" rows="2" ></textarea></td>
                            <th>方法名</th>
                            <td><textarea id='methodName'  name='methodName' class="{required:true,maxlength:100}" rows="2" ></textarea></td>
                      </tr>
                      <tr>
                            <th>参数</th>
                            <td><textarea id='params'  name='params' class="{required:true,maxlength:2000}" rows="2" ></textarea></td>
                            <th>cron表达式</th>
                            <td><textarea id='cronExpression' class="{required:true,maxlength:100}" name='cronExpression'  rows="2" ></textarea></td>
                      </tr>
                      <tr>
                            <th>任务状态</th>
                            <td>
                                 <select id='status' name='status' style="width:163px;" class="{required:true}" class="publicSelect2" >
						             	    <option value="0" selected>正常</option>
						              	    <option value="1">暂停</option>
						         </select>
                            </td>
                            <th>备注</th>
                            <td><textarea id='remark' class="{required:true,maxlength:255}" name='remark'  rows="2" ></textarea></td>
                      </tr>
                     <!--  <tr>
                            <th>创建时间</th>
                            <td><input id='createTime'  name='createTime' readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"/></td>
                      </tr> -->
          </table>
       </form>
     </div> 
 </div> 
     <script type="text/javascript">
       function scheduleJobSave(){//保存
          if($('#scheduleJobInsertFm').valid()){//验证通过
				$.ajax({
					url: $.common.basePath+'/scheduleJob/insert',
					contentType:"application/json",
			    	dataType : "json",
			    	type : "put",
	                data : JSON.stringify($('#scheduleJobInsertFm').serializeObject()), 
					success: function(json, status) {
						if(json==true){
							layer.msg('添加成功', {
				    				icon:1, 
								    time: 500,
								    end: function(index, layero){ 
								         parent.layer.close(parent.layer.getFrameIndex(window.name));  // 关闭layer
								    	 window.parent.location.reload(); //刷新父页面
										 //window.location.href=$.common.basePath+'/scheduleJob/init';
									}
							}); 
						}else{
						    layer.msg('添加失败', {
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
          $(':input','#scheduleJobInsertFm') 
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
