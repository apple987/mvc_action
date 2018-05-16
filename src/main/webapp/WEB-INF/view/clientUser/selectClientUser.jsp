<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/common.jsp"%>
<html>
<head>
	<meta http-equiv="content-type" content="text/html" charset="UTF-8">
	<title>clientUser管理</title>
</head>
<body>
		    <table  id="clientUserDg" 
				    data-toggle="table"  
				    data-method="post" 
				    data-content-type="application/json"
				    data-url="${root}/clientUser/selectPage"
				    data-toolbar="#clientUserTb"
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
					data-page-size="10"
					data-page-number="1"
					data-page-list="[10,20,50,100,500,1000]"
					data-query-params="clientUserQueryParams"
					data-pagination-loop="false"
					data-classes="table table-hover table-condensed"
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
				         "fileName": "clientUser列表", 
				         "worksheetName": "sheet"
				    }'
			>
			<thead>
				<tr>
                      <th data-field="state"  data-align="center"  data-checkbox="true"></th>
                      <th data-field="index" data-title="序号" data-align="center"  data-formatter="getRowIndex"></th>
                      <th data-field='pkid' data-sortable='true' data-align='center'  data-title='pkid'></th>
                      <th data-field='uname' data-sortable='true' data-align='center'  data-title='用户名'></th>
                      <th data-field='password' data-sortable='true' data-align='center'  data-title='登录密码(MD5加密）'></th>
                      <th data-field='status' data-sortable='true' data-align='center'  data-title='用户状态0:冻结1 启用 2注销 3未激活'></th>
                      <th data-field='memo' data-sortable='true' data-align='center'  data-title='备注信息'></th>
                      <th data-field='createDate' data-sortable='true' data-align='center'  data-title='用户创建时间'></th>
                      <th data-field='loginDate' data-sortable='true' data-align='center'  data-title='最近登录时间'></th>
                      <th data-field='email' data-sortable='true' data-align='center'  data-title='用户邮箱'></th>
                      <th data-field='activedate' data-sortable='true' data-align='center'  data-title='账号激活时间'></th>
                      <th data-field='remark' data-sortable='true' data-align='center'  data-title='邮箱激活的验证码'></th>
                      <th data-field='remark1' data-sortable='true' data-align='center'  data-title='忘记密码时，存储用户唯一操作码'></th>
                      <th data-field='remark2' data-sortable='true' data-align='center'  data-title='备用字段2'></th>
                      <th data-field='remark3' data-sortable='true' data-align='center'  data-title='备用字段3'></th>
				</tr>
			</thead>
		</table>
		
        <div id="clientUserTb"  style="padding: 5px; height: auto">
			<div style="margin-bottom: 5px">
			    <input type="button" value="添加" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="addClientUser()" /> 
				<input type="button" value="修改" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="editClientUser()" /> 
				<input type="button" value="删除" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="deleteClientUser()" /> 
				<input type="button" value="查询" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="findClientUser()" /> 
			    <input type="button" value="清空" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="clearClientUser()" /> 
			</div>
			<div>
			   <form id="clientUserQueryForm" method="post" action="">
                           <table align="left">
                              <tr>
                                      <td>pkid:<input id='pkid' name='pkid'  style="width: 80px;height:25px;"/></td>
                                      <td>用户名:<input id='uname' name='uname'  style="width: 80px;height:25px;"/></td>
                                      <td>登录密码(MD5加密）:<input id='password' name='password'  style="width: 80px;height:25px;"/></td>
                                      <td>用户状态0:冻结1 启用 2注销 3未激活:<input id='status' name='status'  style="width: 80px;height:25px;"/></td>
                                      <td>备注信息:<input id='memo' name='memo'  style="width: 80px;height:25px;"/></td>
                                      <td>用户创建时间:<input id='createDate' name='createDate'  readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" style="width: 80px;height:25px;"/></td>
                                      <td>最近登录时间:<input id='loginDate' name='loginDate'  readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" style="width: 80px;height:25px;"/></td>
                                      <td>用户邮箱:<input id='email' name='email'  style="width: 80px;height:25px;"/></td>
                                      <td>账号激活时间:<input id='activedate' name='activedate'  readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" style="width: 80px;height:25px;"/></td>
                                      <td>邮箱激活的验证码:<input id='remark' name='remark'  style="width: 80px;height:25px;"/></td>
                                      <td>忘记密码时，存储用户唯一操作码:<input id='remark1' name='remark1'  style="width: 80px;height:25px;"/></td>
                                      <td>备用字段2:<input id='remark2' name='remark2'  style="width: 80px;height:25px;"/></td>
                                      <td>备用字段3:<input id='remark3' name='remark3'  style="width: 80px;height:25px;"/></td>
                             </tr>
                           </table>         
			   </form>
			</div>
		</div>
		<script type="text/javascript">
	   function clientUserQueryParams(params){
			params.uname=$('#uname').val();
			params.password=$('#password').val();
			params.status=$('#status').val();
			params.memo=$('#memo').val();
			params.createDate=$('#createDate').val();
			params.loginDate=$('#loginDate').val();
			params.email=$('#email').val();
			params.activedate=$('#activedate').val();
			params.remark=$('#remark').val();
			params.remark1=$('#remark1').val();
			params.remark2=$('#remark2').val();
			params.remark3=$('#remark3').val();
			return params;
	    }
	    //显示行号
		function getRowIndex(value, row, index) {  
		   var page=$("#clientUserDg").bootstrapTable("getOptions");
		   return page.pageSize*(page.pageNumber-1)+index+1;
		}  
	
	    //添加
	    function addClientUser(){
	         var index=layer.open({
		    	      id:"insertClientUser",//唯一Id    
		    		  type: 2,//iframe模式
		    		  area: ['800px', '500px'],
		    		  title: '添加ClientUser',//标题
		    		  shade: 0.6 ,//遮罩透明度
		    		  maxmin: true, //允许全屏最小化
		    		  anim: 1, //0-6的动画形式，-1不开启
		    		  content: "${root}/clientUser/preInsert",//内容
	    	});
	        //window.location.href="${root}/clientUser/preInsert";
	    }
	    //修改 
	    function editClientUser(){
	        var row = $('#clientUserDg').bootstrapTable('getSelections');
		    if (row.length==1&&row[0].pkid!=null&&row[0].pkid!=""){//主键不为空
			    	var index=layer.open({
					    	      id:"updateClientUser",//唯一Id    
					    		  type: 2,//iframe模式
					    		  area: ['800px', '500px'],
					    		  title: '修改ClientUser',//标题
					    		  shade: 0.6 ,//遮罩透明度
					    		  maxmin: true, //允许全屏最小化
					    		  anim: 1, //0-6的动画形式，-1不开启
					    		  content: "${root}/clientUser/preUpdate?pkid="+row[0].pkid,//内容
			    	});
				//window.location.href="${root}/clientUser/preUpdate?id="+row[0].pkid;
    		}else{
    			layer.open({
				  title: '提示信息'
				  ,content: '请选择一行记录'
				});  
    		}
	    }
	    //删除
        function deleteClientUser(){
	      var row = $('#clientUserDg').bootstrapTable('getSelections');
		  if (row.length>0){
			    layer.confirm('你确定要删除选中的记录？', {icon: 3, title:'提示'}, function(index){
			                $.ajax({
					    		url:'${root}/clientUser/delete',
	                            contentType:"application/json",
			    	    		dataType : "json",
			    	    		type : "post",
	                            data : JSON.stringify(row), 
					    		success:function(json,status){
					    		    layer.msg('删除成功', {
					    				icon:1, 
									    time: 1000,
									    end: function(index, layero){ 
									    	 findClientUser();
										}
									});
					    		},
					    		error:function(json,status){
					    		    layer.msg('系统异常,请稍后重试或联系技术人员', {
					    				icon:5, 
									    time: 1000,
									    end: function(index, layero){ 
									    	findClientUser();
										}
									}); 
					    		}
					    	});
			     layer.close(index);
			  });
	        }else{
	        	   layer.open({
					  title: '提示信息'
					  ,content: '请选择需要删除的行!',
					  btnAlign: 'c'
					}); 
	        }
	    }
	    //查询
		function findClientUser(){
			$("#clientUserDg").bootstrapTable("refresh",{
					"silent":true,
					"resetOffset":false,
					"url":"${root}/clientUser/selectPage",
					query:$('#clientUserQueryForm').serializeObject()
			}); 
		} 
	    //清空查询条件
	   function clearClientUser(){
	       $(':input','#clientUserQueryForm') 
		    .not(':button, :submit, :reset, :hidden') 
		    .val('') 
		    .removeAttr('checked') 
		    .removeAttr('selected'); 
	   }
	</script>
 </body>
</html>