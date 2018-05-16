<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="content-type" content="text/html" charset="UTF-8">
	<title>添加clientUser</title>
</head>
  <body>
  <div class="container">
     <div style="margin-bottom: 10px">
	    <input type="button" value="返回" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="clientUserBack()" /> 
		<input type="button" value="保存" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="clientUserSave()" /> 
		<input type="button" value="取消" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="clientUserCancle()" /> 
	 </div>
	 <div>
      <form id="clientUserInsertFm" name="clientUserInsertFm"  method="post" action="">
          <table border="0" cellpadding="0" id="clientUserInsertTable" cellspacing="0"
			 class="formlist" style="width: 100%; table-layout: fixed;">
                      <tr>
                            <th>用户名</th>
                            <td><input id='uname' name='uname' class="{required:true,maxlength:60}"/></td>
                            <th>登录密码(MD5加密）</th>
                            <td><input id='password' name='password' class="{required:true,maxlength:60}"/></td>
                      </tr>
                      <tr>
                            <th>用户状态0:冻结1 启用 2注销 3未激活</th>
                            <td><input id='status' name='status' /></td>
                            <th>备注信息</th>
                            <td><textarea id='memo'  name='memo'  rows="2" ></textarea></td>
                      </tr>
                      <tr>
                            <th>用户创建时间</th>
                            <td><input id='createDate'  name='createDate' readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"/></td>
                            <th>最近登录时间</th>
                            <td><input id='loginDate'  name='loginDate' readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"/></td>
                      </tr>
                      <tr>
                            <th>用户邮箱</th>
                            <td><textarea id='email'  name='email'  rows="2" ></textarea></td>
                            <th>账号激活时间</th>
                            <td><input id='activedate'  name='activedate' readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"/></td>
                      </tr>
                      <tr>
                            <th>邮箱激活的验证码</th>
                            <td><textarea id='remark'  name='remark'  rows="2" ></textarea></td>
                            <th>忘记密码时，存储用户唯一操作码</th>
                            <td><textarea id='remark1'  name='remark1'  rows="2" ></textarea></td>
                      </tr>
                      <tr>
                            <th>备用字段2</th>
                            <td><textarea id='remark2'  name='remark2'  rows="2" ></textarea></td>
                            <th>备用字段3</th>
                            <td><textarea id='remark3'  name='remark3'  rows="2" ></textarea></td>
                      </tr>

          </table>
       </form>
     </div> 
 </div> 
     <script type="text/javascript">
       function clientUserSave(){//保存
          if($('#clientUserInsertFm').valid()){//验证通过
				$.ajax({
					url: $.common.basePath+'/clientUser/insert',
					contentType:"application/json",
			    	dataType : "json",
			    	type : "put",
	                data : JSON.stringify($('#clientUserInsertFm').serializeObject()), 
					success: function(json, status) {
						if(json==true){
							layer.msg('添加成功', {
				    				icon:1, 
								    time: 500,
								    end: function(index, layero){ 
								         parent.layer.close(parent.layer.getFrameIndex(window.name));  // 关闭layer
								    	 window.parent.location.reload(); //刷新父页面
										 //window.location.href=$.common.basePath+'/clientUser/init';
									}
							}); 
						}else{
						    layer.msg('添加失败', {
			    				icon:5, 
							    time: 500,
							    end: function(index, layero){ 
							         parent.layer.close(parent.layer.getFrameIndex(window.name));  // 关闭layer
								     window.parent.location.reload(); //刷新父页面
									 //window.location.href=$.common.basePath+'/clientUser/init';
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
								 //window.location.href=$.common.basePath+'/clientUser/init';
							}
					    });
					}
				});
		  }
       }
       function clientUserCancle(){//取消
          $(':input','#clientUserInsertFm') 
			    .not(':button, :submit, :reset, :hidden') 
			    .val('') 
			    .removeAttr('checked') 
			    .removeAttr('selected');
       }
       function clientUserBack(){//返回
          parent.layer.close(parent.layer.getFrameIndex(window.name));  // 关闭layer
		  window.parent.location.reload(); //刷新父页面
          //window.location.href=$.common.basePath+'/clientUser/init';
       }
     </script>
  </body>
</html>
