<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/common.jsp"%>
<html>
<head>
	<meta http-equiv="content-type" content="text/html" charset="UTF-8">
	<title>staff管理</title>
</head>
<body>
		    <table  id="staffDg" 
				    data-toggle="table"  
				    data-method="post" 
				    data-content-type="application/json"
				    data-url="${root}/staff/selectPage"
				    data-toolbar="#staffTb"
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
					data-query-params="staffQueryParams"
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
				         "fileName": "staff列表", 
				         "worksheetName": "sheet"
				    }'
			>
			<thead>
				<tr>
                      <th data-field="state"  data-align="center"  data-checkbox="true"></th>
                      <th data-field="index" data-title="序号" data-align="center"  data-formatter="getRowIndex"></th>
                      <th data-field='pkid' data-sortable='true' data-align='center'  data-title='pkid'></th>
                      <th data-field='sname' data-sortable='true' data-align='center'  data-title='职员姓名'></th>
                      <th data-field='sex' data-sortable='true' data-align='center'  data-title='职员性别'></th>
                      <th data-field='age' data-sortable='true' data-align='center'  data-title='职员年龄'></th>
                      <th data-field='createDate' data-sortable='true' data-align='center'  data-title='创建职员时间'></th>
                      <th data-field='createby' data-sortable='true' data-align='center'  data-title='职员创建者'></th>
                      <th data-field='updateDate' data-sortable='true' data-align='center'  data-title='更新职员时间'></th>
                      <th data-field='updateby' data-sortable='true' data-align='center'  data-title='职员信息更新人'></th>
                      <th data-field='police' data-sortable='true' data-align='center'  data-title='police'></th>
				</tr>
			</thead>
		</table>
		
        <div id="staffTb"  style="padding: 5px; height: auto">
			<div style="margin-bottom: 5px">
			    <input type="button" value="添加" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="addStaff()" /> 
				<input type="button" value="修改" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="editStaff()" /> 
				<input type="button" value="删除" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="deleteStaff()" /> 
				<input type="button" value="查询" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="findStaff()" /> 
			    <input type="button" value="清空" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="clearStaff()" /> 
			</div>
			<div>
			   <form id="staffQueryForm" method="post" action="">
                           <table align="left">
                              <tr>
                                      <td>pkid:<input id='pkid' name='pkid'  style="width: 80px;height:25px;"/></td>
                                      <td>职员姓名:<input id='sname' name='sname'  style="width: 80px;height:25px;"/></td>
                                      <td>职员性别:<input id='sex' name='sex'  style="width: 80px;height:25px;"/></td>
                                      <td>职员年龄:<input id='age' name='age'  style="width: 80px;height:25px;"/></td>
                                      <td>创建职员时间:<input id='createDate' name='createDate'  readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" style="width: 80px;height:25px;"/></td>
                                      <td>职员创建者:<input id='createby' name='createby'  style="width: 80px;height:25px;"/></td>
                                      <td>更新职员时间:<input id='updateDate' name='updateDate'  readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" style="width: 80px;height:25px;"/></td>
                                      <td>职员信息更新人:<input id='updateby' name='updateby'  style="width: 80px;height:25px;"/></td>
                                      <td>police:<input id='police' name='police'  style="width: 80px;height:25px;"/></td>
                             </tr>
                           </table>         
			   </form>
			</div>
		</div>
		<script type="text/javascript">
	   function staffQueryParams(params){
			params.sname=$('#sname').val();
			params.sex=$('#sex').val();
			params.age=$('#age').val();
			params.createDate=$('#createDate').val();
			params.createby=$('#createby').val();
			params.updateDate=$('#updateDate').val();
			params.updateby=$('#updateby').val();
			params.police=$('#police').val();
			return params;
	    }
	    //显示行号
		function getRowIndex(value, row, index) {  
		   var page=$("#staffDg").bootstrapTable("getOptions");
		   return page.pageSize*(page.pageNumber-1)+index+1;
		}  
	
	    //添加
	    function addStaff(){
	         var index=layer.open({
		    	      id:"insertStaff",//唯一Id    
		    		  type: 2,//iframe模式
		    		  area: ['800px', '500px'],
		    		  title: '添加Staff',//标题
		    		  shade: 0.6 ,//遮罩透明度
		    		  maxmin: true, //允许全屏最小化
		    		  anim: 1, //0-6的动画形式，-1不开启
		    		  content: "${root}/staff/preInsert",//内容
	    	});
	        //window.location.href="${root}/staff/preInsert";
	    }
	    //修改 
	    function editStaff(){
	        var row = $('#staffDg').bootstrapTable('getSelections');
		    if (row.length==1&&row[0].pkid!=null&&row[0].pkid!=""){//主键不为空
			    	var index=layer.open({
					    	      id:"updateStaff",//唯一Id    
					    		  type: 2,//iframe模式
					    		  area: ['800px', '500px'],
					    		  title: '修改Staff',//标题
					    		  shade: 0.6 ,//遮罩透明度
					    		  maxmin: true, //允许全屏最小化
					    		  anim: 1, //0-6的动画形式，-1不开启
					    		  content: "${root}/staff/preUpdate?pkid="+row[0].pkid,//内容
			    	});
				//window.location.href="${root}/staff/preUpdate?id="+row[0].pkid;
    		}else{
    			layer.open({
				  title: '提示信息'
				  ,content: '请选择一行记录'
				});  
    		}
	    }
	    //删除
        function deleteStaff(){
	      var row = $('#staffDg').bootstrapTable('getSelections');
		  if (row.length>0){
			    layer.confirm('你确定要删除选中的记录？', {icon: 3, title:'提示'}, function(index){
			                $.ajax({
					    		url:'${root}/staff/delete',
	                            contentType:"application/json",
			    	    		dataType : "json",
			    	    		type : "post",
	                            data : JSON.stringify(row), 
					    		success:function(json,status){
					    		    layer.msg('删除成功', {
					    				icon:1, 
									    time: 1000,
									    end: function(index, layero){ 
									    	 findStaff();
										}
									});
					    		},
					    		error:function(json,status){
					    		    layer.msg('系统异常,请稍后重试或联系技术人员', {
					    				icon:5, 
									    time: 1000,
									    end: function(index, layero){ 
									    	findStaff();
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
		function findStaff(){
			$("#staffDg").bootstrapTable("refresh",{
					"silent":true,
					"resetOffset":false,
					"url":"${root}/staff/selectPage",
					query:$('#staffQueryForm').serializeObject()
			}); 
		} 
	    //清空查询条件
	   function clearStaff(){
	       $(':input','#staffQueryForm') 
		    .not(':button, :submit, :reset, :hidden') 
		    .val('') 
		    .removeAttr('checked') 
		    .removeAttr('selected'); 
	   }
	</script>
 </body>
</html>