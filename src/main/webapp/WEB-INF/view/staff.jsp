<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html" charset="UTF-8">
<title>staff</title>
</head>
<body>
	<table id="dg"></table>
	<div id="tb" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
			<input type="button" value="添加"
				style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;"
				class="btn-primary" onclick="add()" /> 
			<input type="button"
				value="修改"
				style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;"
				class="btn-primary" onclick="edit()" /> <input type="button"
				value="删除"
				style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;"
				class="btn-primary" onclick="delete()" /> <input type="button"
				value="查询"
				style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;"
				class="btn-primary" onclick="doSearch()" /> <input type="button"
				value="清空"
				style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;"
				class="btn-primary" onclick="cleanForm()" />
		</div>
		<div>
			<form id="queryForm" method="post" action="${root}/staff/selectPage">
				<table align="left">
					<tr>
						<td>pkid:<input id='pkid' name='pkid' class="easyui-textbox"
							autocomplete="off" style="width: 80px" /></td>
						<td>职员姓名:<input id='sname' name='sname' /></td>
						<td>职员性别:<input id='sex' name='sex' /></td>
						<td>职员年龄:<input id='age' name='age' /></td>
						<td>创建职员时间:<input id='createDate' name='createDate' /></td>
						<td>职员创建者:<input id='createby' name='createby' /></td>
						<td>更新职员时间:<input id='updateDate' name='updateDate' /></td>
						<td>police:<input id='police' name='police' /></td>
						<td>职员信息更新人:<input id='updateby' name='updateby' /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<!-- 模态框 开始 -->
	<div class="modal fade" id="dlg" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog " style="width: 1200px; height: 800px;"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="alertDataModalLabel">staff</h4>
				</div>
				<div class="modal-body">
					<form id="fm" method="post">
						<table align="center">
							<tr>
								<td>pkid</td>
								<td><input name='pkid' /></td>
							</tr>
							<tr>
								<td>职员姓名</td>
								<td><input name='sname' /></td>
							</tr>
							<tr>
								<td>职员性别</td>
								<td><input name='sex' /></td>
							</tr>
							<tr>
								<td>职员年龄</td>
								<td><input name='age' /></td>
							</tr>
							<tr>
								<td>创建职员时间</td>
								<td><input name='createDate' /></td>
							</tr>
							<tr>
								<td>职员创建者</td>
								<td><input name='createby' /></td>
							</tr>
							<tr>
								<td>更新职员时间</td>
								<td><input name='updateDate' /></td>
							</tr>
							<tr>
								<td>police</td>
								<td><input name='police' /></td>
							</tr>
							<tr>
								<td>职员信息更新人</td>
								<td><input name='updateby' /></td>
							</tr>

						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 模态框  结束 -->
	<script type="text/javascript">
		$(function(){
			$('#dg').bootstrapTable({                
			    url: '${root}/staff/selectPage',
			    method:'post', //加载方法
			    contentType:"application/x-www-form-urlencoded;charset=UTF-8",
			    striped : true, //斑马线效果
				cache: false,      //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
				dataType: 'json',  //请求类型
				sidePagination : 'server',//设置为服务器端分页
				pagination : true, //启用分页
				pageNumber : 1,
				pageSize : 10,
				height:500,
				search: false,
				sortName:"pkid",
				showMultiSort:true,  //显示多列排序
				showToggle:true,     //显示切换视图
				sortable: true,      //是否启用排序
				showExport:true,     //显示导出
				toolbar:"#tb",
				sortOrder: "asc",     //排序方式
				sortStable:true,
				queryParamsType: "limit",//这里只是选择适合我后台的逻辑，可以选择传入页数和显示数量
				queryParams:queryParams,
			    columns: [{field:'state',checkbox:true },{formatter:getRowIndex,title: '序号', align:'center'}, 
                      { field:'pkid',title:'pkid',sortable:true,align:'center'}, 
                      { field:'sname',title:'职员姓名',sortable:true,align:'center'}, 
                      { field:'sex',title:'职员性别',sortable:true,align:'center'}, 
                      { field:'age',title:'职员年龄',sortable:true,align:'center'}, 
                      /* { field:'createDate',title:'创建职员时间',sortable:true,align:'center'}, 
                      { field:'createby',title:'职员创建者',sortable:true,align:'center'}, 
                      { field:'updateDate',title:'更新职员时间',sortable:true,align:'center'}, 
                      { field:'police',title:'police',sortable:true,align:'center'}, 
                      { field:'updateby',title:'职员信息更新人',sortable:true,align:'center'}, */ 
                      { field:'action',title:'操作',align:'center',events:'actionEvents',formatter:actionFormatter}] 

			});
		    //获得行号
			function getRowIndex(value, row, index) {  
			    var page=$("#dg").bootstrapTable("getOptions");
			    return page.pageSize*(page.pageNumber-1)+index+1;
			} 
			//行按钮渲染
			function actionFormatter(value, row, index) {
				    return [
				        '<a class="like" href="javascript:void(0)" title="Like">',
				        '<i class="glyphicon glyphicon-heart"></i>',
				        '</a>',"&nbsp;&nbsp;&nbsp;&nbsp;",
				        '<a class="edit ml10" href="javascript:void(0)" data-tooltip="true" title="Edit">',
				        '<i class="glyphicon glyphicon-edit"></i>',
				        '</a>',"&nbsp;&nbsp;&nbsp;&nbsp;",
				        '<a class="remove ml10" href="javascript:void(0)" title="Remove">',
				        '<i class="glyphicon glyphicon-remove"></i>',
				        '</a>'
				    ].join('');
			}
		    //行操作点击事件
			window.actionEvents = {
				    'click .like': function (e, value, row, index) {
				        alert('You click like icon, row: ' + JSON.stringify(row));
				        console.log(value, row, index);
				    },
				    'click .edit': function (e, value, row, index) {
				        alert('You click edit icon, row: ' + JSON.stringify(row));
				        console.log(value, row, index);
				    },
				    'click .remove': function (e, value, row, index) {
				        alert('You click remove icon, row: ' + JSON.stringify(row));
				        console.log(value, row, index);
				    }
			};
		})
		//后台传递参数
		function queryParams(params){
			params.status=111;//自定义查询参数
			return params;
		}
		//延迟对齐
		setTimeout(function () {
			$('#dg').bootstrapTable('resetView');
		}, 200);
		//查询
		function doSearch(){
				var str=JSON.stringify($('#queryForm').serializeObject());
				$("#dg").bootstrapTable("refresh",{
						"silent":true,
						"url":"${root}/staff/selectPage",
						query:$('#queryForm').serializeObject()
				}); 
		 }  
	    //重置查询的表单form
	    function cleanForm() {
		    //$("#queryForm").form("clear");
		    $(':input','#queryForm') 
		    .not(':button, :submit, :reset, :hidden') 
		    .val('') 
		    .removeAttr('checked') 
		    .removeAttr('selected'); 
	    }
	</script>
</body>
</html>