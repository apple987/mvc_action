<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="content-type" content="text/html" charset="UTF-8">
	<title>修改staff</title>
</head>
  <body>
     <div style="margin-bottom: 10px">
	    <input type="button" value="返回" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="staffBack()" /> 
		<input type="button" value="保存" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="staffSave()" /> 
		<input type="button" value="取消" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="staffCancle()" /> 
	 </div>
	 <div>
      <form id="staffUpdateFm" name="staffUpdateFm"  method="post" action="">
          <input type="hidden" name="pkid" value="${staff.pkid}"/>
          <table border="0" cellpadding="0"  cellspacing="0"
	         class="formlist" style="width: 100%; table-layout: fixed;">
                      <tr>
                            <th>职员姓名</th>
                            <td><input id='sname' name='sname' value='${staff.sname}' class="{required:true,maxlength:30}"/></td>
                            <th>职员性别</th>
                            <td><input id='sex' name='sex' value='${staff.sex}' /></td>
                      </tr>
                      <tr>
                            <th>职员年龄</th>
                            <td><input id='age'  name='age' value='${staff.age}'/></td>
                            <th>创建职员时间</th>
                            <td><input id='createDate'  name='createDate' readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${staff.createDate}" />'/></td>
                      </tr>
                      <tr>
                            <th>职员创建者</th>
                            <td><input id='createby' name='createby' value='${staff.createby}' /></td>
                            <th>更新职员时间</th>
                            <td><input id='updateDate'  name='updateDate' readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${staff.updateDate}" />'/></td>
                      </tr>
                      <tr>
                            <th>职员信息更新人</th>
                            <td><input id='updateby' name='updateby' value='${staff.updateby}' /></td>
                            <th>police</th>
                            <td><textarea id='police'  name='police' value='${staff.police}'  rows="2" >${staff.police}</textarea></td>
                      </tr>

          </table>
       </form>
     </div> 
     <script type="text/javascript">
       function staffSave(){//保存
          if($('#staffUpdateFm').valid()){//验证通过
				$.ajax({
					url: $.common.basePath+'/staff/update',
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					datatype: 'json',
					type:"post",
					data:$('#staffUpdateFm').serializeObject(),
					success: function(json, status) {
						if(json==true){
							layer.msg('修改成功', {
				    				icon:1, 
								    time: 500,
								    end: function(index, layero){ 
								    	  parent.layer.close(parent.layer.getFrameIndex(window.name));  // 关闭layer
								          window.parent.location.reload(); //刷新父页面
										 //window.location.href=$.common.basePath+'/staff/init';
									}
							}); 
						}else{
						    layer.msg('修改失败', {
			    				icon:5, 
							    time: 500,
							    end: function(index, layero){ 
							         parent.layer.close(parent.layer.getFrameIndex(window.name));  // 关闭layer
								     window.parent.location.reload(); //刷新父页面
									 //window.location.href=$.common.basePath+'/staff/init';
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
								 //window.location.href=$.common.basePath+'/staff/init';
							}
					    });
					}
				});
		  }
       }
       function staffCancle(){//取消
          $(':input','#staffUpdateFm') 
			    .not(':button, :submit, :reset, :hidden') 
			    .val('') 
			    .removeAttr('checked') 
			    .removeAttr('selected');
       }
       function staffBack(){//返回
          parent.layer.close(parent.layer.getFrameIndex(window.name));  // 关闭layer
		  window.parent.location.reload(); //刷新父页面
          //window.location.href=$.common.basePath+'/staff/init';
       }
     </script>
  </body>
</html>
