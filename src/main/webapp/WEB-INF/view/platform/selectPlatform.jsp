<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/common.jsp"%>
<html>
<head>
	<meta http-equiv="content-type" content="text/html" charset="UTF-8">
	<title>platform管理</title>
</head>
<body>
		    <table  id="platformDg" 
				    data-toggle="table"  
				    data-method="post" 
				    data-content-type="application/json"
				    data-url="${root}/platform/selectPage"
				    data-toolbar="#platformTb"
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
					data-query-params="platformQueryParams"
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
				         "fileName": "platform列表", 
				         "worksheetName": "sheet"
				    }'
			>
			<thead>
				<tr>
                      <th data-field="state"  data-align="center"  data-checkbox="true"></th>
                      <th data-field="index" data-title="序号" data-align="center"  data-formatter="getRowIndex"></th>
                      <th data-field='id' data-sortable='true' data-align='center'  data-title='主键'></th>
                      <th data-field='platformName' data-sortable='true' data-align='center'  data-title='平台名称'></th>
                      <th data-field='platformAbout' data-sortable='true' data-align='center'  data-title='平台简介'></th>
                      <th data-field='platformSite' data-sortable='true' data-align='center'  data-title='平台官网'></th>
                      <th data-field='onlineTime' data-sortable='true' data-align='center'  data-title='平台上线时间'></th>
                      <th data-field='companyName' data-sortable='true' data-align='center'  data-title='公司名称'></th>
                      <th data-field='legal' data-sortable='true' data-align='center'  data-title='公司法人'></th>
                      <th data-field='registerCapita' data-sortable='true' data-align='center'  data-title='注册资金'></th>
                      <th data-field='scale' data-sortable='true' data-align='center'  data-title='公司规模'></th>
                      <th data-field='address' data-sortable='true' data-align='center'  data-title='公司地址'></th>
                      <th data-field='qqGroup' data-sortable='true' data-align='center'  data-title='QQ群'></th>
                      <th data-field='trusteeship' data-sortable='true' data-align='center'  data-title='资金托管'></th>
                      <th data-field='kefuPhone' data-sortable='true' data-align='center'  data-title='客服电话'></th>
                      <th data-field='logo' data-sortable='true' data-align='center'  data-title='公司logo'></th>
                      <th data-field='province' data-sortable='true' data-align='center'  data-title='省份'></th>
                      <th data-field='city' data-sortable='true' data-align='center'  data-title='城市'></th>
                      <th data-field='sta' data-sortable='true' data-align='center'  data-title='状态（0：终止合作 1：合作）'></th>
                      <th data-field='bankBg' data-sortable='true' data-align='center'  data-title='银行背景'></th>
                      <th data-field='vcBg' data-sortable='true' data-align='center'  data-title='风投背景'></th>
                      <th data-field='icpBg' data-sortable='true' data-align='center'  data-title='ICP背景'></th>
                      <th data-field='gzBg' data-sortable='true' data-align='center'  data-title='国资背景'></th>
                      <th data-field='marketBg' data-sortable='true' data-align='center'  data-title='上市公司背景'></th>
                      <th data-field='myBg' data-sortable='true' data-align='center'  data-title='民营背景'></th>
                      <th data-field='bdAttorn' data-sortable='true' data-align='center'  data-title='可否转让（标的流动性 ）'></th>
                      <th data-field='bdInterestDay' data-sortable='true' data-align='center'  data-title='起息时间（标的流动性 ）'></th>
                      <th data-field='bdAuto' data-sortable='true' data-align='center'  data-title='自动投标（标的流动性 ）'></th>
                      <th data-field='bdExit' data-sortable='true' data-align='center'  data-title='退出方式（标的流动性 ）'></th>
                      <th data-field='withCahDay' data-sortable='true' data-align='center'  data-title='提现到账时间（标的流动性 ）'></th>
                      <th data-field='createDate' data-sortable='true' data-align='center'  data-title='创建时间'></th>
                      <th data-field='createBy' data-sortable='true' data-align='center'  data-title='创建人'></th>
                      <th data-field='updateDate' data-sortable='true' data-align='center'  data-title='修改时间'></th>
                      <th data-field='updateBy' data-sortable='true' data-align='center'  data-title='修改人'></th>
				</tr>
			</thead>
		</table>
		
        <div id="platformTb"  style="padding: 5px; height: auto">
			<div style="margin-bottom: 5px">
			    <input type="button" value="添加" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="addPlatform()" /> 
				<input type="button" value="修改" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="editPlatform()" /> 
				<input type="button" value="删除" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="deletePlatform()" /> 
				<input type="button" value="查询" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="findPlatform()" /> 
			    <input type="button" value="清空" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="clearPlatform()" /> 
			</div>
			<div>
			   <form id="platformQueryForm" method="post" action="">
                           <table align="left">
                              <tr>
                                      <td>主键:<input id='id' name='id'  style="width: 80px;height:25px;"/></td>
                                      <td>平台名称:<input id='platformName' name='platformName'  style="width: 80px;height:25px;"/></td>
                                      <td>平台简介:<input id='platformAbout' name='platformAbout'  style="width: 80px;height:25px;"/></td>
                                      <td>平台官网:<input id='platformSite' name='platformSite'  style="width: 80px;height:25px;"/></td>
                                      <td>平台上线时间:<input id='onlineTime' name='onlineTime'  style="width: 80px;height:25px;"/></td>
                                      <td>公司名称:<input id='companyName' name='companyName'  style="width: 80px;height:25px;"/></td>
                                      <td>公司法人:<input id='legal' name='legal'  style="width: 80px;height:25px;"/></td>
                                      <td>注册资金:<input id='registerCapita' name='registerCapita'  style="width: 80px;height:25px;"/></td>
                                      <td>公司规模:<input id='scale' name='scale'  style="width: 80px;height:25px;"/></td>
                                      <td>公司地址:<input id='address' name='address'  style="width: 80px;height:25px;"/></td>
                                      <td>QQ群:<input id='qqGroup' name='qqGroup'  style="width: 80px;height:25px;"/></td>
                                      <td>资金托管:<input id='trusteeship' name='trusteeship'  style="width: 80px;height:25px;"/></td>
                                      <td>客服电话:<input id='kefuPhone' name='kefuPhone'  style="width: 80px;height:25px;"/></td>
                                      <td>公司logo:<input id='logo' name='logo'  style="width: 80px;height:25px;"/></td>
                                      <td>省份:<input id='province' name='province'  style="width: 80px;height:25px;"/></td>
                                      <td>城市:<input id='city' name='city'  style="width: 80px;height:25px;"/></td>
                                      <td>状态（0：终止合作 1：合作）:<input id='sta' name='sta'  style="width: 80px;height:25px;"/></td>
                                      <td>银行背景:<input id='bankBg' name='bankBg'  style="width: 80px;height:25px;"/></td>
                                      <td>风投背景:<input id='vcBg' name='vcBg'  style="width: 80px;height:25px;"/></td>
                                      <td>ICP背景:<input id='icpBg' name='icpBg'  style="width: 80px;height:25px;"/></td>
                                      <td>国资背景:<input id='gzBg' name='gzBg'  style="width: 80px;height:25px;"/></td>
                                      <td>上市公司背景:<input id='marketBg' name='marketBg'  style="width: 80px;height:25px;"/></td>
                                      <td>民营背景:<input id='myBg' name='myBg'  style="width: 80px;height:25px;"/></td>
                                      <td>可否转让（标的流动性 ）:<input id='bdAttorn' name='bdAttorn'  style="width: 80px;height:25px;"/></td>
                                      <td>起息时间（标的流动性 ）:<input id='bdInterestDay' name='bdInterestDay'  style="width: 80px;height:25px;"/></td>
                                      <td>自动投标（标的流动性 ）:<input id='bdAuto' name='bdAuto'  style="width: 80px;height:25px;"/></td>
                                      <td>退出方式（标的流动性 ）:<input id='bdExit' name='bdExit'  style="width: 80px;height:25px;"/></td>
                                      <td>提现到账时间（标的流动性 ）:<input id='withCahDay' name='withCahDay'  style="width: 80px;height:25px;"/></td>
                                      <td>创建时间:<input id='createDate' name='createDate'  readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" style="width: 80px;height:25px;"/></td>
                                      <td>创建人:<input id='createBy' name='createBy'  style="width: 80px;height:25px;"/></td>
                                      <td>修改时间:<input id='updateDate' name='updateDate'  readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" style="width: 80px;height:25px;"/></td>
                                      <td>修改人:<input id='updateBy' name='updateBy'  style="width: 80px;height:25px;"/></td>
                             </tr>
                           </table>         
			   </form>
			</div>
		</div>
		<script type="text/javascript">
	   function platformQueryParams(params){
			params.platformName=$('#platformName').val();
			params.platformAbout=$('#platformAbout').val();
			params.platformSite=$('#platformSite').val();
			params.onlineTime=$('#onlineTime').val();
			params.companyName=$('#companyName').val();
			params.legal=$('#legal').val();
			params.registerCapita=$('#registerCapita').val();
			params.scale=$('#scale').val();
			params.address=$('#address').val();
			params.qqGroup=$('#qqGroup').val();
			params.trusteeship=$('#trusteeship').val();
			params.kefuPhone=$('#kefuPhone').val();
			params.logo=$('#logo').val();
			params.province=$('#province').val();
			params.city=$('#city').val();
			params.sta=$('#sta').val();
			params.bankBg=$('#bankBg').val();
			params.vcBg=$('#vcBg').val();
			params.icpBg=$('#icpBg').val();
			params.gzBg=$('#gzBg').val();
			params.marketBg=$('#marketBg').val();
			params.myBg=$('#myBg').val();
			params.bdAttorn=$('#bdAttorn').val();
			params.bdInterestDay=$('#bdInterestDay').val();
			params.bdAuto=$('#bdAuto').val();
			params.bdExit=$('#bdExit').val();
			params.withCahDay=$('#withCahDay').val();
			params.createDate=$('#createDate').val();
			params.createBy=$('#createBy').val();
			params.updateDate=$('#updateDate').val();
			params.updateBy=$('#updateBy').val();
			return params;
	    }
	    //显示行号
		function getRowIndex(value, row, index) {  
		   var page=$("#platformDg").bootstrapTable("getOptions");
		   return page.pageSize*(page.pageNumber-1)+index+1;
		}  
	
	    //添加
	    function addPlatform(){
	        window.location.href="${root}/platform/preInsert";
	    }
	    //修改 
	    function editPlatform(){
	        var row = $('#platformDg').bootstrapTable('getSelections');
		    if (row.length==1&&row[0].id!=null&&row[0].id!=""){//主键不为空
				window.location.href="${root}/platform/preUpdate?id="+row[0].id;
    		}else{
    			layer.open({
				  title: '提示信息'
				  ,content: '请选择一行记录'
				});  
    		}
	    }
	    //删除
        function deletePlatform(){
	      var row = $('#platformDg').bootstrapTable('getSelections');
		  if (row.length>0){
			    if(confirm('删除确认框','你确定要删除选中的记录？')){
			                $.ajax({
					    		url:'${root}/platform/delete',
	                            contentType:"application/json",
			    	    		dataType : "json",
			    	    		type : "post",
	                            data : JSON.stringify(row), 
					    		success:function(json,status){
					    		    layer.msg('删除成功', {
					    				icon:1, 
									    time: 1000,
									    end: function(index, layero){ 
									    	 findPlatform();
										}
									});
					    		},
					    		error:function(json,status){
					    		    layer.msg('系统异常,请稍后重试或联系技术人员', {
					    				icon:5, 
									    time: 1000,
									    end: function(index, layero){ 
									    	findPlatform();
										}
									}); 
					    		}
					    	});
			    }
	        }else{
	        	   layer.open({
					  title: '提示信息'
					  ,content: '请选择需要删除的行!',
					  btnAlign: 'c'
					}); 
	        	
	        }
	    }
	    //查询
		function findPlatform(){
			$("#platformDg").bootstrapTable("refresh",{
					"silent":true,
					"resetOffset":false,
					"url":"${root}/platform/selectPage",
					query:$('#platformQueryForm').serializeObject()
			}); 
		} 
	    //清空查询条件
	   function clearPlatform(){
	       $(':input','#platformQueryForm') 
		    .not(':button, :submit, :reset, :hidden') 
		    .val('') 
		    .removeAttr('checked') 
		    .removeAttr('selected'); 
	   }
	</script>
 </body>
</html>