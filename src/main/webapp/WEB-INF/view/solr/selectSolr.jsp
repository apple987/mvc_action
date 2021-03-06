<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/common.jsp"%>
<html>
<head>
	<meta http-equiv="content-type" content="text/html" charset="UTF-8">
	<title>solr管理</title>
	<style>
	.no-flow-x{
	    overflow:hidden !important;
	}
	.table{
	   table-layout:fixed;
	}
</style>    
</head>
<body>
		    <table  id="solrDg" 
				    data-toggle="table"  
				    data-method="post" 
				    data-content-type="application/json"
				    data-url="${root}/solr/selectPage"
				    data-toolbar="#solrTb"
				    data-height="400"
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
					data-page-list="[10,20,50,100,500,1000,2000,2500,3000,4000,5000]"
					data-query-params="solrQueryParams"
					data-pagination-loop="false"
					data-classes="table table-hover table-condensed no-flow-x"
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
				         "fileName": "solr列表", 
				         "worksheetName": "sheet"
				    }'
			>
			<thead>
				<tr>
                      <th data-field="state"  data-align="center"  data-checkbox="true"></th>
                      <th data-field="index" data-title="序号" data-align="center" data-formatter="getRowIndex"></th>
                      <th data-field='id' data-sortable='true' data-align='center'    data-title='主键'></th>
                      <th data-field='price' data-sortable='true' data-align='center'  data-title='价格'></th>
                      <th data-field='title' data-sortable='true' data-align='center'  data-title='标题'></th>
                      <th data-field='name' data-sortable='true' data-align='center' data-title='称呼'></th>
                      <th data-field='createtime' data-sortable='true' data-align='center' data-title='创建时间'></th>
				</tr>
			</thead>
		</table>
		
        <div id="solrTb"  style="padding: 5px; height: auto">
			<div style="margin-bottom: 5px">
			    <input type="button" value="添加" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="addSolr()" /> 
				<input type="button" value="修改" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="editSolr()" /> 
				<input type="button" value="删除" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="deleteSolr()" /> 
				<input type="button" value="查询" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="findSolr()" /> 
			    <input type="button" value="清空" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="clearSolr()" /> 
			</div>
			<div>
			   <form id="solrQueryForm" method="post" action="">
                           <table align="left">
                              <tr>
                                      <td>主键:<input id='id' name='id'  style="width: 80px;height:25px;"/></td>
                                      <td>价格:<input id='price' name='price'  style="width: 80px;height:25px;"/></td>
                                      <td>标题:<input id='title' name='title'  style="width: 80px;height:25px;"/></td>
                                      <td>称呼:<input id='name' name='name'  style="width: 80px;height:25px;"/></td>
                                      <td>创建时间:<input id='createtime' name='createtime' readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" style="width: 140px;height:25px;"/></td>
                             </tr>
                           </table>         
			   </form>
			</div>
		</div>
		<p>注意事项:<ul>
			  <li>1.本接口文档,如果没有特殊限定,默认仅支持POST方式。</li>
			  <li>2.参数描述模型示例,分别针对请求参数结构和示例进行描述。</li>
			  <li>3.响应描述模型示例,分别针对响应结果结构和示例进行描述。</li>
		</ul>
		</p>
		<script type="text/javascript">
	   function solrQueryParams(params){
			params.price=$('#price').val();
			params.title=$('#title').val();
			params.name=$('#name').val();
			params.createtime=$('#createtime').val();
			return params;
	    }
	    //显示行号
		function getRowIndex(value, row, index) {  
		   var page=$("#solrDg").bootstrapTable("getOptions");
		   return page.pageSize*(page.pageNumber-1)+index+1;
		}  
	
	    //添加
	    function addSolr(){
	         var index=layer.open({
		    	      id:"insertSolr",//唯一Id    
		    		  type: 2,//iframe模式
		    		  area: ['1200px', '500px'],
		    		  title: '添加Solr',//标题
		    		  shade: 0.6 ,//遮罩透明度
		    		  maxmin: true, //允许全屏最小化
		    		  anim: 1, //0-6的动画形式，-1不开启
		    		  content: "${root}/solr/preInsert",//内容
	    	});
	        //window.location.href="${root}/solr/preInsert";
	    }
	    //修改 
	    function editSolr(){
	        var row = $('#solrDg').bootstrapTable('getSelections');
		    if (row.length==1&&row[0].id!=null&&row[0].id!=""){//主键不为空
			    	var index=layer.open({
					    	      id:"updateSolr",//唯一Id    
					    		  type: 2,//iframe模式
					    		  area: ['1200px', '500px'],
					    		  title: '修改Solr',//标题
					    		  shade: 0.6 ,//遮罩透明度
					    		  maxmin: true, //允许全屏最小化
					    		  anim: 1, //0-6的动画形式，-1不开启
					    		  content: "${root}/solr/preUpdate?id="+row[0].id,//内容
			    	});
				//window.location.href="${root}/solr/preUpdate?id="+row[0].id;
    		}else{
    			layer.open({
				  title: '提示信息'
				  ,content: '请选择一行记录'
				});  
    		}
	    }
	    //删除
        function deleteSolr(){
	      var row = $('#solrDg').bootstrapTable('getSelections');
		  if (row.length>0){
			    layer.confirm('你确定要删除选中的记录？', {icon: 3, title:'提示'}, function(index){
			                $.ajax({
					    		url:'${root}/solr/delete',
	                            contentType:"application/json",
			    	    		dataType : "json",
			    	    		type : "post",
	                            data : JSON.stringify(row), 
					    		success:function(json,status){
					    		    layer.msg('删除成功', {
					    				icon:1, 
									    time: 1000,
									    end: function(index, layero){ 
									    	 findSolr();
										}
									});
					    		},
					    		error:function(json,status){
					    		    layer.msg('系统异常,请稍后重试或联系技术人员', {
					    				icon:5, 
									    time: 1000,
									    end: function(index, layero){ 
									    	findSolr();
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
		function findSolr(){
			$("#solrDg").bootstrapTable("refresh",{
					"silent":true,
					"resetOffset":false,
					"url":"${root}/solr/selectPage",
					query:$('#solrQueryForm').serializeObject()
			}); 
		} 
	    //清空查询条件
	   function clearSolr(){
	       $(':input','#solrQueryForm') 
		    .not(':button, :submit, :reset, :hidden') 
		    .val('') 
		    .removeAttr('checked') 
		    .removeAttr('selected'); 
	   }
	</script>
 </body>
</html>