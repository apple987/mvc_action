<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/common.jsp"%>
<html>
<head>
	<meta http-equiv="content-type" content="text/html" charset="UTF-8">
	<title>sysLog管理</title>
</head>
<body>
		    <table  id="sysLogDg" 
				    data-toggle="table"  
				    data-method="post" 
				    data-content-type="application/json"
				    data-url="${root}/sysLog/selectPage"
				    data-toolbar="#sysLogTb"
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
					data-query-params="sysLogQueryParams"
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
				         "fileName": "sysLog列表", 
				         "worksheetName": "sheet"
				    }'
			>
			<thead>
				<tr>
                      <th data-field="state"  data-align="center"  data-checkbox="true"></th>
                      <!-- <th data-field="index" data-title="序号" data-align="center"  data-formatter="getRowIndex"></th> -->
                      <th data-field='id' data-sortable='true' data-align='center'  data-title='编号'></th>
                      <th data-field='title' data-sortable='true' data-align='center'  data-title='标题'></th>
                      <th data-field='type' data-sortable='true' data-align='center'  data-title='类型 '  data-formatter="typeFormatter"></th>
                      <th data-field='userId' data-sortable='true' data-align='center'  data-title='用户'></th>
                      <!-- <th data-field='createBy' data-sortable='true' data-align='center'  data-title='创建者'></th> -->
                      <th data-field='createDate' data-sortable='true' data-align='center'  data-title='创建时间'></th>
                      <!-- <th data-field='userAgent' data-sortable='true' data-align='center'  data-title='用户代理'></th> -->
                      <th data-field='remoteIp' data-sortable='true' data-align='center'  data-title='操作IP'></th>
                      <th data-field='requestUri' data-sortable='true' data-align='center'  data-title='请求URI'></th>
                      <th data-field='requestMethod' data-sortable='true' data-align='center'  data-title='操作方式'></th>
                      <th data-field='requestParams' data-sortable='true' data-align='center'  data-title='请求参数'></th>
                      <!-- <th data-field='requestMac' data-sortable='true' data-align='center'  data-title='设备MAC'></th>
                      <th data-field='exception' data-sortable='true' data-align='center'  data-title='异常信息'></th> -->
                      <th data-field='className' data-sortable='true' data-align='center'  data-title='执行类名'></th>
                      <th data-field='functionName' data-sortable='true' data-align='center'  data-title='模块名称'></th>
                      <th data-field='methodName' data-sortable='true' data-align='center'  data-title='方法名称'></th>
                      <!--<th data-field='actionThread' data-sortable='true' data-align='center'  data-title='执行线程'></th>
                       <th data-field='actionStartTime' data-sortable='true' data-align='center'  data-title='开始执行时刻'></th>
                      <th data-field='actionEndTime' data-sortable='true' data-align='center'  data-title='结束执行时刻'></th>
                      <th data-field='actionTime' data-sortable='true' data-align='center'  data-title='执行耗时 单位(秒)'></th> -->
				</tr>
			</thead>
		</table>
		
        <div id="sysLogTb"  style="padding: 5px; height: auto">
			<div style="margin-bottom: 5px">
			   <!--  <input type="button" value="添加" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="addSysLog()" /> --> 
				<input type="button" value="修改" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="editSysLog()" /> 
				<!-- <input type="button" value="删除" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="deleteSysLog()" /> --> 
				<input type="button" value="查询" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="findSysLog()" /> 
			    <input type="button" value="清空" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="clearSysLog()" /> 
			</div>
			<div>
			   <form id="sysLogQueryForm" method="post" action="">
                           <table align="left">
                              <tr>
                                      <td>编号:<input id='id' name='id'  style="width: 80px;height:25px;"/></td>
                                      <td>日志标题:<input id='title' name='title'  style="width: 80px;height:25px;"/></td>
                                      <!-- <td>日志类型 1:正常 2：异常:<input id='type' name='type'  style="width: 80px;height:25px;"/></td> -->
                                      <td>执行操作用户:<input id='userId' name='userId'  style="width: 80px;height:25px;"/></td>
                                      <!-- <td>创建者:<input id='createBy' name='createBy'  style="width: 80px;height:25px;"/></td> -->
                                      <td>创建日志时间:<input id='createDate' name='createDate'  readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" style="width: 80px;height:25px;"/></td>
                                     <!--  <td>用户代理:<input id='userAgent' name='userAgent'  style="width: 80px;height:25px;"/></td> -->
                                      <td>操作IP地址:<input id='remoteIp' name='remoteIp'  style="width: 80px;height:25px;"/></td>
                                      <td>请求URI:<input id='requestUri' name='requestUri'  style="width: 80px;height:25px;"/></td>
                                      <!-- <td>操作方式:<input id='requestMethod' name='requestMethod'  style="width: 80px;height:25px;"/></td> -->
                                      <td>请求参数:<input id='requestParams' name='requestParams'  style="width: 80px;height:25px;"/></td>
                                     <!--  <td>设备MAC:<input id='requestMac' name='requestMac'  style="width: 80px;height:25px;"/></td> -->
                                      <!-- <td>异常信息:<input id='exception' name='exception'  style="width: 80px;height:25px;"/></td> -->
                                      <td>执行类名:<input id='className' name='className'  style="width: 80px;height:25px;"/></td>
                                      <td>功能模块名称:<input id='functionName' name='functionName'  style="width: 80px;height:25px;"/></td>
                                      <td>执行方法名称:<input id='methodName' name='methodName'  style="width: 80px;height:25px;"/></td>
                                       <!--<td>执行线程:<input id='actionThread' name='actionThread'  style="width: 80px;height:25px;"/></td>
                                      <td>开始执行时刻:<input id='actionStartTime' name='actionStartTime'  readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" style="width: 80px;height:25px;"/></td>
                                      <td>结束执行时刻:<input id='actionEndTime' name='actionEndTime'  readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" style="width: 80px;height:25px;"/></td>
                                      <td>执行耗时 单位(秒):<input id='actionTime' name='actionTime'  style="width: 80px;height:25px;"/></td> -->
                             </tr>
                           </table>         
			   </form>
			</div>
		</div>
		<script type="text/javascript">
	   function sysLogQueryParams(params){
			params.title=$('#title').val();
			params.type=$('#type').val();
			params.userId=$('#userId').val();
			params.createBy=$('#createBy').val();
			params.createDate=$('#createDate').val();
			params.userAgent=$('#userAgent').val();
			params.remoteIp=$('#remoteIp').val();
			params.requestUri=$('#requestUri').val();
			params.requestMethod=$('#requestMethod').val();
			params.requestParams=$('#requestParams').val();
			params.requestMac=$('#requestMac').val();
			params.exception=$('#exception').val();
			params.className=$('#className').val();
			params.functionName=$('#functionName').val();
			params.methodName=$('#methodName').val();
			params.actionThread=$('#actionThread').val();
			params.actionStartTime=$('#actionStartTime').val();
			params.actionEndTime=$('#actionEndTime').val();
			params.actionTime=$('#actionTime').val();
			return params;
	    }
	    //显示行号
		function getRowIndex(value, row, index) {  
		   var page=$("#sysLogDg").bootstrapTable("getOptions");
		   return page.pageSize*(page.pageNumber-1)+index+1;
		}  
	    
		function typeFormatter(value,row,index) {
			 var result="正常";
			 if(value=="2"){
				 result="异常";
			 }
		     return result;
		}
	
	    //添加
	  /*   function addSysLog(){
	         var index=layer.open({
		    	      id:"insertSysLog",//唯一Id    
		    		  type: 2,//iframe模式
		    		  area: ['800px', '500px'],
		    		  title: '添加SysLog',//标题
		    		  shade: 0.6 ,//遮罩透明度
		    		  maxmin: true, //允许全屏最小化
		    		  anim: 1, //0-6的动画形式，-1不开启
		    		  content: "${root}/sysLog/preInsert",//内容
	    	});
	    } */
	    //修改 
	    function editSysLog(){
	        var row = $('#sysLogDg').bootstrapTable('getSelections');
		    if (row.length==1&&row[0].id!=null&&row[0].id!=""){//主键不为空
			    	var index=layer.open({
					    	      id:"updateSysLog",//唯一Id    
					    		  type: 2,//iframe模式
					    		  area: ['800px', '500px'],
					    		  title: '修改SysLog',//标题
					    		  shade: 0.6 ,//遮罩透明度
					    		  maxmin: true, //允许全屏最小化
					    		  anim: 1, //0-6的动画形式，-1不开启
					    		  content: "${root}/sysLog/preUpdate?id="+row[0].id,//内容
			    	});
				//window.location.href="${root}/sysLog/preUpdate?id="+row[0].id;
    		}else{
    			layer.open({
				  title: '提示信息'
				  ,content: '请选择一行记录'
				});  
    		}
	    }
	    //删除
      /*   function deleteSysLog(){
	      var row = $('#sysLogDg').bootstrapTable('getSelections');
		  if (row.length>0){
			    layer.confirm('你确定要删除选中的记录？', {icon: 3, title:'提示'}, function(index){
			                $.ajax({
					    		url:'${root}/sysLog/delete',
	                            contentType:"application/json",
			    	    		dataType : "json",
			    	    		type : "post",
	                            data : JSON.stringify(row), 
					    		success:function(json,status){
					    		    layer.msg('删除成功', {
					    				icon:1, 
									    time: 1000,
									    end: function(index, layero){ 
									    	 findSysLog();
										}
									});
					    		},
					    		error:function(json,status){
					    		    layer.msg('系统异常,请稍后重试或联系技术人员', {
					    				icon:5, 
									    time: 1000,
									    end: function(index, layero){ 
									    	findSysLog();
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
	    } */
	    //查询
		function findSysLog(){
			$("#sysLogDg").bootstrapTable("refresh",{
					"silent":true,
					"resetOffset":false,
					"url":"${root}/sysLog/selectPage",
					query:$('#sysLogQueryForm').serializeObject()
			}); 
		} 
	    //清空查询条件
	   function clearSysLog(){
	       $(':input','#sysLogQueryForm') 
		    .not(':button, :submit, :reset, :hidden') 
		    .val('') 
		    .removeAttr('checked') 
		    .removeAttr('selected'); 
	   }
	</script>
 </body>
</html>