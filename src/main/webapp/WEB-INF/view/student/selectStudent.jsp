<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/common.jsp"%>
<html>
<head>
	<meta http-equiv="content-type" content="text/html" charset="UTF-8">
	<title>student管理18080</title>
</head>
<body>
<div class="row  page-component-element">
	<div class="col-md-12  col-md-offset-0">
		<table  id="studentDg" 
				    data-toggle="table"  
				    data-method="post" 
				    data-content-type="application/json"
				    data-url="${root}/student/selectPage"
				    data-toolbar="#studentTb"
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
					data-page-size="2"
					data-page-number="1"
					data-page-list="[2,5,10,20,50,100,500,1000]"
					data-query-params="studentQueryParams"
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
				         "fileName": "student列表", 
				         "worksheetName": "sheet"
				    }'
			>
			<thead>
				<tr>
                      <th data-field="state"  data-align="center"  data-checkbox="true"></th>
                      <th data-field="index" data-title="序号" data-align="center"  data-formatter="getRowIndex"></th>
                      <th data-field='id' data-sortable='true' data-align='center'  data-title='id'></th>
                      <th data-field='sname' data-sortable='true' data-align='center'  data-title='姓名' ></th>
                      <th data-field='sex' data-sortable='true' data-align='center'  data-title='性别' data-formatter="sexFormatter"></th>
                      <th data-field='age' data-sortable='true' data-align='center'  data-title='年龄'></th>
                      <th data-field='birthday' data-sortable='true' data-align='center'  data-title='生日' data-formatter="birthdayFormatter"></th>
				</tr>
			</thead>
		</table>
	</div>
</div>

		    
		
        <div id="studentTb"  >
			<div style="margin-bottom: 5px">
			    <input type="button" value="添加" style="width: 80px; height: 30px; vertical-align: top; line-height: 10px;" class="btn-primary" onclick="addStudent()" /> 
				<input type="button" value="修改" style="width: 80px; height: 30px; vertical-align: top; line-height: 10px;" class="btn-primary" onclick="editStudent()" /> 
				<input type="button" value="删除" style="width: 80px; height: 30px; vertical-align: top; line-height: 10px;" class="btn-primary" onclick="deleteStudent()" /> 
				<input type="button" value="查询" style="width: 80px; height: 30px; vertical-align: top; line-height: 10px;" class="btn-primary" onclick="findStudent()" /> 
			    <input type="button" value="清空" style="width: 80px; height: 30px; vertical-align: top; line-height: 10px;" class="btn-primary" onclick="clearStudent()" /> 
			</div>
			<div>
			   <form id="studentQueryForm" method="post" action="">
                           <table align="left">
                              <tr>
                                      <td>姓名:<input id='sname' name='sname'  style="width: 80px;height:25px;"/></td>
                                      <td>
                                                                                                                 性别:<select id='sex' name='sex' style="width:60px;" class="publicSelect2" >
                                            <option value="">全部</option>
						              	    <option value="1">男</option>
						             	    <option value="0">女</option>
						                 </select>
                                      </td>
                                      <td>年龄:<input id='age' name='age'  style="width: 80px;height:25px;"/></td>
                                      <td>开始时间:<input id='startDate' name='startDate' readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD'})" style="width: 80px;height:25px;"/></td>
                                      <td>结束时间:<input id='endDate' name='endDate' readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD'})" style="width: 80px;height:25px;"/></td>
                             </tr>
                           </table>         
			   </form>
			</div>
		</div>
		<script type="text/javascript">
		$(function(){
			$(".publicSelect2").select2();
		    Waves.init();
		    Waves.attach('.waves');
		})
		//附带查询参数
	    function studentQueryParams(params){
			params.sname=$('#sname').val();
			params.sex=$('#sex').val();
			params.age=$('#age').val();
			params.startDate=$('#startDate').val();
			params.endDate=$('#endDate').val();
			return params;
	    }
	    //显示行号
		function getRowIndex(value, row, index) {  
		   var page=$("#studentDg").bootstrapTable("getOptions");
		   return page.pageSize*(page.pageNumber-1)+index+1;
		}  
	    //格式化生日
	    function birthdayFormatter(value,row,index) {
	    	if(value==null||value.length==0||value==undefined){
	    		return "";
	    	}else{
	    	  return new Date(value).format("yyyy-MM-dd");
	    	}
	    }
	    //格式化性别
	    function sexFormatter(value,row,index) {
	    	if(value==null||value.length==0||value==undefined){
	    		return "";
	    	}else if(value=="1"){
	    	  return "男";
	    	}else{
	    		return "女";
	    	}
	    } 
	    //添加
	    function addStudent(){
	         var index=layer.open({
		    	      id:"insertStudent",//唯一Id    
		    		  type: 2,//iframe模式
		    		  area: ['850px', '500px'],
		    		  title: '添加Student',//标题
		    		  shade: 0.6 ,//遮罩透明度
		    		  maxmin: true, //允许全屏最小化
		    		  anim: 1, //0-6的动画形式，-1不开启
		    		  content: "${root}/student/preInsert",//内容
	    	});
	        //window.location.href="${root}/student/preInsert";
	    }
	    //修改 
	    function editStudent(){
	        var row = $('#studentDg').bootstrapTable('getSelections');
		    if (row.length==1&&row[0].id!=null&&row[0].id!=""){//主键不为空
			    	var index=layer.open({
					    	      id:"updateStudent",//唯一Id    
					    		  type: 2,//iframe模式
					    		  area: ['850px', '500px'],
					    		  title: '修改Student',//标题
					    		  shade: 0.6 ,//遮罩透明度
					    		  maxmin: true, //允许全屏最小化
					    		  anim: 1, //0-6的动画形式，-1不开启
					    		  content: "${root}/student/preUpdate?id="+row[0].id,//内容
			    	});
				//window.location.href="${root}/student/preUpdate?id="+row[0].id;
    		}else{
    			layer.open({
				  title: '提示信息'
				  ,content: '请选择一行记录'
				});  
    		}
	    }
	    //删除
        function deleteStudent(){
	      var row = $('#studentDg').bootstrapTable('getSelections');
		  if (row.length>0){
			    layer.confirm('你确定要删除选中的记录？', {icon: 3, title:'提示'}, function(index){
			                $.ajax({
					    		url:'${root}/student/delete',
	                            contentType:"application/json",
			    	    		dataType : "json",
			    	    		type : "post",
	                            data : JSON.stringify(row), 
					    		success:function(json,status){
					    		    layer.msg('删除成功', {
					    				icon:1, 
									    time: 1000,
									    end: function(index, layero){ 
									    	 findStudent();
										}
									});
					    		},
					    		error:function(json,status){
					    		    layer.msg('系统异常,请稍后重试或联系技术人员', {
					    				icon:5, 
									    time: 1000,
									    end: function(index, layero){ 
									    	findStudent();
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
		function findStudent(){
			$("#studentDg").bootstrapTable("refresh",{
					"silent":true,
					"resetOffset":false,
					"url":"${root}/student/selectPage",
					query:$('#studentQueryForm').serializeObject()
			}); 
		} 
	    //清空查询条件
	   function clearStudent(){
	       $(':input','#studentQueryForm') 
		    .not(':button, :submit, :reset, :hidden') 
		    .val('') 
		    .removeAttr('checked') 
		    .removeAttr('selected'); 
	   }
	</script>
 </body>
</html>