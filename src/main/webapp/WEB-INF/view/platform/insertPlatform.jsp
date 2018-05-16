<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="content-type" content="text/html" charset="UTF-8">
	<title>添加platform</title>
</head>
  <body>
  <div class="container">
     <div style="margin-bottom: 10px">
	    <input type="button" value="返回" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="platformBack()" /> 
		<input type="button" value="保存" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="platformSave()" /> 
		<input type="button" value="取消" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="platformCancle()" /> 
	 </div>
	 <div>
      <form id="platformInsertFm" name="platformInsertFm"  method="post" action="">
          <table border="0" cellpadding="0" id="platformInsertTable" cellspacing="0"
			 class="formlist" style="width: 100%; table-layout: fixed;">
                      <tr>
                            <th>平台名称</th>
                            <td><input id='platformName' name='platformName' class="{required:true,maxlength:50}"/></td>
                            <th>平台简介</th>
                            <td><textarea id='platformAbout' name='platformAbout' class="{required:true,maxlength:500}"  rows="2" ></textarea></td>
                      </tr>
                      <tr>
                            <th>平台官网</th>
                            <td><input id='platformSite' name='platformSite' /></td>
                            <th>平台上线时间</th>
                            <td><input id='onlineTime' name='onlineTime' class="{required:true,maxlength:20}"/></td>
                      </tr>
                      <tr>
                            <th>公司名称</th>
                            <td><textarea id='companyName' name='companyName' class="{required:true,maxlength:100}"  rows="2" ></textarea></td>
                            <th>公司法人</th>
                            <td><input id='legal' name='legal' class="{required:true,maxlength:50}"/></td>
                      </tr>
                      <tr>
                            <th>注册资金</th>
                            <td><input id='registerCapita' name='registerCapita' class="{required:true,maxlength:50}"/></td>
                            <th>公司规模</th>
                            <td><input id='scale' name='scale' /></td>
                      </tr>
                      <tr>
                            <th>公司地址</th>
                            <td><textarea id='address' name='address' class="{required:true,maxlength:200}"  rows="2" ></textarea></td>
                            <th>QQ群</th>
                            <td><input id='qqGroup' name='qqGroup' /></td>
                      </tr>
                      <tr>
                            <th>资金托管</th>
                            <td><textarea id='trusteeship'  name='trusteeship'  rows="2" ></textarea></td>
                            <th>客服电话</th>
                            <td><textarea id='kefuPhone' name='kefuPhone' class="{required:true,maxlength:100}"  rows="2" ></textarea></td>
                      </tr>
                      <tr>
                            <th>公司logo</th>
                            <td><textarea id='logo' name='logo' class="{required:true,maxlength:100}"  rows="2" ></textarea></td>
                            <th>省份</th>
                            <td><textarea id='province'  name='province'  rows="2" ></textarea></td>
                      </tr>
                      <tr>
                            <th>城市</th>
                            <td><textarea id='city'  name='city'  rows="2" ></textarea></td>
                            <th>状态（0：终止合作 1：合作）</th>
                            <td><input id='sta' name='sta' /></td>
                      </tr>
                      <tr>
                            <th>银行背景</th>
                            <td><textarea id='bankBg'  name='bankBg'  rows="2" ></textarea></td>
                            <th>风投背景</th>
                            <td><textarea id='vcBg'  name='vcBg'  rows="2" ></textarea></td>
                      </tr>
                      <tr>
                            <th>ICP背景</th>
                            <td><textarea id='icpBg'  name='icpBg'  rows="2" ></textarea></td>
                            <th>国资背景</th>
                            <td><textarea id='gzBg'  name='gzBg'  rows="2" ></textarea></td>
                      </tr>
                      <tr>
                            <th>上市公司背景</th>
                            <td><textarea id='marketBg'  name='marketBg'  rows="2" ></textarea></td>
                            <th>民营背景</th>
                            <td><textarea id='myBg'  name='myBg'  rows="2" ></textarea></td>
                      </tr>
                      <tr>
                            <th>可否转让（标的流动性 ）</th>
                            <td><textarea id='bdAttorn'  name='bdAttorn'  rows="2" ></textarea></td>
                            <th>起息时间（标的流动性 ）</th>
                            <td><textarea id='bdInterestDay'  name='bdInterestDay'  rows="2" ></textarea></td>
                      </tr>
                      <tr>
                            <th>自动投标（标的流动性 ）</th>
                            <td><textarea id='bdAuto'  name='bdAuto'  rows="2" ></textarea></td>
                            <th>退出方式（标的流动性 ）</th>
                            <td><textarea id='bdExit'  name='bdExit'  rows="2" ></textarea></td>
                      </tr>
                      <tr>
                            <th>提现到账时间（标的流动性 ）</th>
                            <td><textarea id='withCahDay'  name='withCahDay'  rows="2" ></textarea></td>
                            <th>创建时间</th>
                            <td><input id='createDate'  name='createDate' readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"/></td>
                      </tr>
                      <tr>
                            <th>创建人</th>
                            <td><input id='createBy' name='createBy' /></td>
                            <th>修改时间</th>
                            <td><input id='updateDate'  name='updateDate' readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"/></td>
                      </tr>
                      <tr>
                            <th>修改人</th>
                            <td><input id='updateBy' name='updateBy' /></td>
                      </tr>

          </table>
       </form>
     </div> 
 </div> 
     <script type="text/javascript">
       function platformSave(){//保存
          if($('#platformInsertFm').valid()){//验证通过
				$.ajax({
					url: $.common.basePath+'/platform/insert',
					contentType:"application/json",
			    	dataType : "json",
			    	type : "put",
	                data : JSON.stringify($('#platformInsertFm').serializeObject()), 
					success: function(json, status) {
						if(json==true){
							layer.msg('添加成功', {
				    				icon:1, 
								    time: 1000,
								    end: function(index, layero){ 
										 window.location.href=$.common.basePath+'/platform/init';
									}
							}); 
						}else{
						    layer.msg('添加失败', {
			    				icon:5, 
							    time: 1000,
							    end: function(index, layero){ 
									 window.location.href=$.common.basePath+'/platform/init';
								}
						    });
						}
					},
					error: function(json, status) {
					    layer.msg('系统异常,请稍后重试或联系技术人员', {
		    				icon:5, 
						    time: 1500,
						    end: function(index, layero){ 
								 window.location.href=$.common.basePath+'/platform/init';
							}
					    });
					}
				});
		  }
       }
       function platformCancle(){//取消
          $(':input','#platformInsertFm') 
			    .not(':button, :submit, :reset, :hidden') 
			    .val('') 
			    .removeAttr('checked') 
			    .removeAttr('selected');
       }
       function platformBack(){//返回
          window.location.href=$.common.basePath+'/platform/init';
       }
     </script>
  </body>
</html>
