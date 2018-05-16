<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="content-type" content="text/html" charset="UTF-8">
	<title>修改platform</title>
</head>
  <body>
     <div style="margin-bottom: 10px">
	    <input type="button" value="返回" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="platformBack()" /> 
		<input type="button" value="保存" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="platformSave()" /> 
		<input type="button" value="取消" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="platformCancle()" /> 
	 </div>
	 <div>
      <form id="platformUpdateFm" name="platformUpdateFm"  method="post" action="">
          <input type="hidden" name="id" value="${platform.id}"/>
          <table border="0" cellpadding="0"  cellspacing="0"
	         class="formlist" style="width: 100%; table-layout: fixed;">
                      <tr>
                            <th>平台名称</th>
                            <td><input id='platformName' name='platformName' value='${platform.platformName}' class="{required:true,maxlength:50}"/></td>
                            <th>平台简介</th>
                            <td><textarea id='platformAbout' name='platformAbout' value='${platform.platformAbout}' class="{required:true,maxlength:500}"  rows="2" >${platform.platformAbout}</textarea></td>
                      </tr>
                      <tr>
                            <th>平台官网</th>
                            <td><input id='platformSite' name='platformSite' value='${platform.platformSite}' /></td>
                            <th>平台上线时间</th>
                            <td><input id='onlineTime' name='onlineTime' value='${platform.onlineTime}' class="{required:true,maxlength:20}"/></td>
                      </tr>
                      <tr>
                            <th>公司名称</th>
                            <td><textarea id='companyName' name='companyName' value='${platform.companyName}' class="{required:true,maxlength:100}"  rows="2" >${platform.companyName}</textarea></td>
                            <th>公司法人</th>
                            <td><input id='legal' name='legal' value='${platform.legal}' class="{required:true,maxlength:50}"/></td>
                      </tr>
                      <tr>
                            <th>注册资金</th>
                            <td><input id='registerCapita' name='registerCapita' value='${platform.registerCapita}' class="{required:true,maxlength:50}"/></td>
                            <th>公司规模</th>
                            <td><input id='scale' name='scale' value='${platform.scale}' /></td>
                      </tr>
                      <tr>
                            <th>公司地址</th>
                            <td><textarea id='address' name='address' value='${platform.address}' class="{required:true,maxlength:200}"  rows="2" >${platform.address}</textarea></td>
                            <th>QQ群</th>
                            <td><input id='qqGroup' name='qqGroup' value='${platform.qqGroup}' /></td>
                      </tr>
                      <tr>
                            <th>资金托管</th>
                            <td><textarea id='trusteeship'  name='trusteeship' value='${platform.trusteeship}'  rows="2" >${platform.trusteeship}</textarea></td>
                            <th>客服电话</th>
                            <td><textarea id='kefuPhone' name='kefuPhone' value='${platform.kefuPhone}' class="{required:true,maxlength:100}"  rows="2" >${platform.kefuPhone}</textarea></td>
                      </tr>
                      <tr>
                            <th>公司logo</th>
                            <td><textarea id='logo' name='logo' value='${platform.logo}' class="{required:true,maxlength:100}"  rows="2" >${platform.logo}</textarea></td>
                            <th>省份</th>
                            <td><textarea id='province'  name='province' value='${platform.province}'  rows="2" >${platform.province}</textarea></td>
                      </tr>
                      <tr>
                            <th>城市</th>
                            <td><textarea id='city'  name='city' value='${platform.city}'  rows="2" >${platform.city}</textarea></td>
                            <th>状态（0：终止合作 1：合作）</th>
                            <td><input id='sta' name='sta' value='${platform.sta}' /></td>
                      </tr>
                      <tr>
                            <th>银行背景</th>
                            <td><textarea id='bankBg'  name='bankBg' value='${platform.bankBg}'  rows="2" >${platform.bankBg}</textarea></td>
                            <th>风投背景</th>
                            <td><textarea id='vcBg'  name='vcBg' value='${platform.vcBg}'  rows="2" >${platform.vcBg}</textarea></td>
                      </tr>
                      <tr>
                            <th>ICP背景</th>
                            <td><textarea id='icpBg'  name='icpBg' value='${platform.icpBg}'  rows="2" >${platform.icpBg}</textarea></td>
                            <th>国资背景</th>
                            <td><textarea id='gzBg'  name='gzBg' value='${platform.gzBg}'  rows="2" >${platform.gzBg}</textarea></td>
                      </tr>
                      <tr>
                            <th>上市公司背景</th>
                            <td><textarea id='marketBg'  name='marketBg' value='${platform.marketBg}'  rows="2" >${platform.marketBg}</textarea></td>
                            <th>民营背景</th>
                            <td><textarea id='myBg'  name='myBg' value='${platform.myBg}'  rows="2" >${platform.myBg}</textarea></td>
                      </tr>
                      <tr>
                            <th>可否转让（标的流动性 ）</th>
                            <td><textarea id='bdAttorn'  name='bdAttorn' value='${platform.bdAttorn}'  rows="2" >${platform.bdAttorn}</textarea></td>
                            <th>起息时间（标的流动性 ）</th>
                            <td><textarea id='bdInterestDay'  name='bdInterestDay' value='${platform.bdInterestDay}'  rows="2" >${platform.bdInterestDay}</textarea></td>
                      </tr>
                      <tr>
                            <th>自动投标（标的流动性 ）</th>
                            <td><textarea id='bdAuto'  name='bdAuto' value='${platform.bdAuto}'  rows="2" >${platform.bdAuto}</textarea></td>
                            <th>退出方式（标的流动性 ）</th>
                            <td><textarea id='bdExit'  name='bdExit' value='${platform.bdExit}'  rows="2" >${platform.bdExit}</textarea></td>
                      </tr>
                      <tr>
                            <th>提现到账时间（标的流动性 ）</th>
                            <td><textarea id='withCahDay'  name='withCahDay' value='${platform.withCahDay}'  rows="2" >${platform.withCahDay}</textarea></td>
                            <th>创建时间</th>
                            <td><input id='createDate'  name='createDate' readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${platform.createDate}" />'/></td>
                      </tr>
                      <tr>
                            <th>创建人</th>
                            <td><input id='createBy' name='createBy' value='${platform.createBy}' /></td>
                            <th>修改时间</th>
                            <td><input id='updateDate'  name='updateDate' readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${platform.updateDate}" />'/></td>
                      </tr>
                      <tr>
                            <th>修改人</th>
                            <td><input id='updateBy' name='updateBy' value='${platform.updateBy}' /></td>
                      </tr>

          </table>
       </form>
     </div> 
     <script type="text/javascript">
       function platformSave(){//保存
          if($('#platformUpdateFm').valid()){//验证通过
				$.ajax({
					url: $.common.basePath+'/platform/update',
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					datatype: 'json',
					type:"post",
					data:$('#platformUpdateFm').serializeObject(),
					success: function(json, status) {
						if(json==true){
							layer.msg('修改成功', {
				    				icon:1, 
								    time: 1000,
								    end: function(index, layero){ 
										 window.location.href=$.common.basePath+'/platform/init';
									}
							}); 
						}else{
						    layer.msg('修改失败', {
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
          $(':input','#platformUpdateFm') 
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
