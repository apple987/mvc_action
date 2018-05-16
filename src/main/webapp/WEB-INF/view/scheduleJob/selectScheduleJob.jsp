<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/common.jsp"%>
<html>
<head>
	<meta http-equiv="content-type" content="text/html" charset="UTF-8">
	<title>scheduleJob管理</title>
</head>
<body>
		    <table  id="scheduleJobDg" 
				    data-toggle="table"  
				    data-method="post" 
				    data-content-type="application/json"
				    data-url="${root}/scheduleJob/selectPage"
				    data-toolbar="#scheduleJobTb"
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
					data-page-list="[1,10,20,50,100,500,1000]"
					data-query-params="scheduleJobQueryParams"
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
				         "fileName": "scheduleJob列表", 
				         "worksheetName": "sheet"
				    }'
			>
			<thead>
				<tr>
                      <th data-field="state"  data-align="center"  data-checkbox="true"></th>
                      <!-- <th data-field="index" data-title="序号" data-align="center"  data-formatter="getRowIndex"></th> -->
                      <th data-field='jobId' data-sortable='true' data-align='center'  data-title='任务编号'></th>
                      <th data-field='beanName' data-sortable='true' data-align='center'  data-title='spring bean名称'></th>
                      <th data-field='methodName' data-sortable='true' data-align='center'  data-title='方法名'></th>
                      <th data-field='params' data-sortable='true' data-align='center'  data-title='参数'></th>
                      <th data-field='cronExpression' data-sortable='true' data-align='center'  data-title='cron表达式'></th>
                      <th data-field='status' data-sortable='true' data-align='center'  data-title='任务状态 ' data-formatter="statusFormatter"></th>
                      <th data-field='remark' data-sortable='true' data-align='center'  data-title='备注'></th>
                      <th data-field='createTime' data-sortable='true' data-align='center'  data-title='创建时间'></th>
				</tr>
			</thead>
		</table>
		
        <div id="scheduleJobTb"  style="padding: 5px; height: auto">
			<div style="margin-bottom: 5px">
			    <input type="button" value="添加" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="addScheduleJob()" /> 
				<input type="button" value="修改" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="editScheduleJob()" /> 
				<input type="button" value="删除" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="deleteScheduleJob()" />
				<input type="button" value="暂停" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="pauseScheduleJob()" />
				<input type="button" value="恢复" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="recoveryScheduleJob()" /> 
				<input type="button" value="执行" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="runScheduleJob()" />
				<input type="button" value="查询" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="findScheduleJob()" /> 
			    <input type="button" value="清空" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="clearScheduleJob()" /> 
			</div>
			<div>
			   <form id="scheduleJobQueryForm" method="post" action="">
                           <table align="left">
                              <tr>
                                      <!-- <td>任务id:<input id='jobId' name='jobId'  style="width: 80px;height:25px;"/></td> -->
                                      <td>spring bean名称:<input id='beanName' name='beanName'  style="width: 80px;height:25px;"/></td>
                                      <!-- <td>方法名:<input id='methodName' name='methodName'  style="width: 80px;height:25px;"/></td>
                                      <td>参数:<input id='params' name='params'  style="width: 80px;height:25px;"/></td>
                                      <td>cron表达式:<input id='cronExpression' name='cronExpression'  style="width: 80px;height:25px;"/></td>
                                       <td>
                                                                                                                任务状态:<select id='status' name='status' style="width:60px;" class="publicSelect2" >
                                            <option value="">全部</option>
						             	    <option value="0">正常</option>
						              	    <option value="1">暂停</option>
						                 </select>
                                      </td>
                                      <td>备注:<input id='remark' name='remark'  style="width: 80px;height:25px;"/></td>
                                      <td>创建时间:<input id='createTime' name='createTime' readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" style="width: 80px;height:25px;"/></td> -->
                             </tr>
                           </table>         
			   </form>
			</div>
		</div>
		<script type="text/javascript">
		function statusFormatter(value,row,index) {
			 var result="正常";
			 if(value=="1"){
				 result="暂停";
			 }
		     return result;
		}
		
	   function scheduleJobQueryParams(params){
			params.beanName=$('#beanName').val();
			params.methodName=$('#methodName').val();
			params.params=$('#params').val();
			params.cronExpression=$('#cronExpression').val();
			params.status=$('#status').val();
			params.remark=$('#remark').val();
			params.createTime=$('#createTime').val();
			return params;
	    }
	    //显示行号
		function getRowIndex(value, row, index) {  
		   var page=$("#scheduleJobDg").bootstrapTable("getOptions");
		   return page.pageSize*(page.pageNumber-1)+index+1;
		}  
	
	    //添加
	    function addScheduleJob(){
	         var index=layer.open({
		    	      id:"insertScheduleJob",//唯一Id    
		    		  type: 2,//iframe模式
		    		  area: ['800px', '500px'],
		    		  title: '添加ScheduleJob',//标题
		    		  shade: 0.6 ,//遮罩透明度
		    		  maxmin: true, //允许全屏最小化
		    		  anim: 1, //0-6的动画形式，-1不开启
		    		  content: "${root}/scheduleJob/preInsert",//内容
	    	});
	        //window.location.href="${root}/scheduleJob/preInsert";
	    }
	    //修改 
	    function editScheduleJob(){
	        var row = $('#scheduleJobDg').bootstrapTable('getSelections');
		    if (row.length==1&&row[0].jobId!=null&&row[0].jobId!=""){//主键不为空
			    	var index=layer.open({
					    	      id:"updateScheduleJob",//唯一Id    
					    		  type: 2,//iframe模式
					    		  area: ['800px', '500px'],
					    		  title: '修改ScheduleJob',//标题
					    		  shade: 0.6 ,//遮罩透明度
					    		  maxmin: true, //允许全屏最小化
					    		  anim: 1, //0-6的动画形式，-1不开启
					    		  content: "${root}/scheduleJob/preUpdate?jobId="+row[0].jobId,//内容
			    	});
				//window.location.href="${root}/scheduleJob/preUpdate?id="+row[0].jobId;
    		}else{
    			layer.open({
				  title: '提示信息'
				  ,content: '请选择一行记录'
				});  
    		}
	    }
	    //暂停任务
	    function pauseScheduleJob(){
		      var row = $('#scheduleJobDg').bootstrapTable('getSelections');
			  if (row.length>0){
				    var ids=[];
				    for (var i = 0; i < row.length; i++) {
				    	ids[i]=row[i].jobId;
					}
				    layer.confirm('你确定要暂停选择的任务吗？', {icon: 3, title:'提示'}, function(index){
				                $.ajax({
						    		url:'${root}/scheduleJob/pause',
		                            contentType:"application/json",
				    	    		dataType : "json",
				    	    		type : "post",
		                            /* data : JSON.stringify(row),  */
		                            data : JSON.stringify(ids), 
						    		success:function(json,status){
						    		    layer.msg('暂停任务成功', {
						    				icon:1, 
										    time: 1000,
										    end: function(index, layero){ 
										    	 findScheduleJob();
											}
										});
						    		},
						    		error:function(json,status){
						    		    layer.msg('系统异常,请稍后重试或联系技术人员', {
						    				icon:5, 
										    time: 1000,
										    end: function(index, layero){ 
										    	findScheduleJob();
											}
										}); 
						    		}
						    	});
				     layer.close(index);
				  });
		        }else{
		        	   layer.open({
						  title: '提示信息'
						  ,content: '请选择需要暂停的任务!',
						  btnAlign: 'c'
						}); 
		        }
		    }
	   //恢复任务
	    function recoveryScheduleJob(){
		      var row = $('#scheduleJobDg').bootstrapTable('getSelections');
			  if (row.length>0){
				    var ids=[];
				    for (var i = 0; i < row.length; i++) {
				    	ids[i]=row[i].jobId;
					}
				    layer.confirm('你确定要恢复选择的任务吗？', {icon: 3, title:'提示'}, function(index){
				                $.ajax({
						    		url:'${root}/scheduleJob/resume',
		                            contentType:"application/json",
				    	    		dataType : "json",
				    	    		type : "post",
		                            /* data : JSON.stringify(row),  */
		                            data : JSON.stringify(ids), 
						    		success:function(json,status){
						    		    layer.msg('恢复任务成功', {
						    				icon:1, 
										    time: 1000,
										    end: function(index, layero){ 
										    	 findScheduleJob();
											}
										});
						    		},
						    		error:function(json,status){
						    		    layer.msg('系统异常,请稍后重试或联系技术人员', {
						    				icon:5, 
										    time: 1000,
										    end: function(index, layero){ 
										    	findScheduleJob();
											}
										}); 
						    		}
						    	});
				     layer.close(index);
				  });
		        }else{
		        	   layer.open({
						  title: '提示信息'
						  ,content: '请选择需要恢复的任务!',
						  btnAlign: 'c'
						}); 
		        }
		    }
		   //执行任务
	      function runScheduleJob(){
		      var row = $('#scheduleJobDg').bootstrapTable('getSelections');
			  if (row.length>0){
				    var ids=[];
				    for (var i = 0; i < row.length; i++) {
				    	ids[i]=row[i].jobId;
					}
				    layer.confirm('你确定要执行选择的任务吗？', {icon: 3, title:'提示'}, function(index){
				                $.ajax({
						    		url:'${root}/scheduleJob/run',
		                            contentType:"application/json",
				    	    		dataType : "json",
				    	    		type : "post",
		                            /* data : JSON.stringify(row),  */
		                            data : JSON.stringify(ids), 
						    		success:function(json,status){
						    		    layer.msg('执行任务成功', {
						    				icon:1, 
										    time: 1000,
										    end: function(index, layero){ 
										    	 findScheduleJob();
											}
										});
						    		},
						    		error:function(json,status){
						    		    layer.msg('系统异常,请稍后重试或联系技术人员', {
						    				icon:5, 
										    time: 1000,
										    end: function(index, layero){ 
										    	findScheduleJob();
											}
										}); 
						    		}
						    	});
				     layer.close(index);
				  });
		        }else{
		        	   layer.open({
						  title: '提示信息'
						  ,content: '请选择需要执行的任务!',
						  btnAlign: 'c'
						}); 
		        }
		    }
	    //删除
        function deleteScheduleJob(){
	      var row = $('#scheduleJobDg').bootstrapTable('getSelections');
		  if (row.length>0){
			    layer.confirm('你确定要删除选中的记录？', {icon: 3, title:'提示'}, function(index){
			                $.ajax({
					    		url:'${root}/scheduleJob/delete',
	                            contentType:"application/json",
			    	    		dataType : "json",
			    	    		type : "post",
	                            data : JSON.stringify(row), 
					    		success:function(json,status){
					    		    layer.msg('删除成功', {
					    				icon:1, 
									    time: 1000,
									    end: function(index, layero){ 
									    	 findScheduleJob();
										}
									});
					    		},
					    		error:function(json,status){
					    		    layer.msg('系统异常,请稍后重试或联系技术人员', {
					    				icon:5, 
									    time: 1000,
									    end: function(index, layero){ 
									    	findScheduleJob();
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
		function findScheduleJob(){
			$("#scheduleJobDg").bootstrapTable("refresh",{
					"silent":true,
					"resetOffset":false,
					"url":"${root}/scheduleJob/selectPage",
					query:$('#scheduleJobQueryForm').serializeObject()
			}); 
		} 
	    //清空查询条件
	   function clearScheduleJob(){
	       $(':input','#scheduleJobQueryForm') 
		    .not(':button, :submit, :reset, :hidden') 
		    .val('') 
		    .removeAttr('checked') 
		    .removeAttr('selected'); 
	   }
	</script>
 </body>
</html>