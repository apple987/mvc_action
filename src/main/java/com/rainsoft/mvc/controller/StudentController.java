package com.rainsoft.mvc.controller;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rainsoft.core.BaseController;
import com.rainsoft.mvc.model.Student;
import com.rainsoft.mvc.service.StudentService;
import com.rainsoft.util.Function;
import com.rainsoft.util.SerialNo;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

/**
 *student管理
 * @付为地
 * @date 2017-07-09 06:53:38
 */
@Api(description = "学生信息管理", tags = "学生管理")
@Controller
@RequestMapping("/student")
public class StudentController extends BaseController{
  

    @Autowired
	private StudentService studentService;
    
   /* @Autowired
	private SerialNo serialNo;*/

    /**
	 * 页面初始化
	 */
    @ApiOperation(value = "学生列表",notes = "进入学生列表页", httpMethod = "GET")
	@RequestMapping(value = "init",method = RequestMethod.GET)
	public String init(HttpServletRequest request){
		String token=UUID.randomUUID().toString();
		request.setAttribute("clientToken",token);
		request.getSession().setAttribute("serverToken",token);
		/*System.err.println(serialNo.createContractNo("abcd"));*/
		return "student/selectStudent";
	}
	
    /**
	 * 分页查询数据
	 */
	/*@RequestMapping(value="/selectPage",headers="Accept=application/json")*/
	@RequestMapping(value="/selectPage",method=RequestMethod.POST)
	@ResponseBody
	@Function("查询分页")
	@ApiOperation(value = "分页列表", notes = "分页列表", httpMethod = "POST",response = Map.class)
	public Map<String, Object> selectPage(@RequestHeader("Accept") String encoding,@RequestBody Student entity){
		System.err.println(encoding);
		/*System.err.println(1/0);*/
		return responseSelectPage(studentService.selectPage(entity));
	}
	
	/**
	 * 跳转添加
	*/
	@ApiOperation(value = "跳转添加", notes = "进入添加页面", httpMethod = "GET")
    @RequestMapping(value="/preInsert",method=RequestMethod.GET)
	public String preInsert(HttpServletRequest req){
		return "student/insertStudent";
	} 
	
    /**
     * 添加数据
     */
	@RequestMapping(value="/insert",method=RequestMethod.PUT)
	@ResponseBody
	@Function("添加数据")
	@ApiOperation(value = "添加学生", notes = "创建学生", httpMethod = "POST",response = Boolean.class)
	public Boolean insert(@ApiParam(name = "学生对象", value = "传入json格式", required = true) @RequestBody  Student entity,HttpServletRequest request) {
		entity.setId(SerialNo.getRomdomID());
		Boolean bool= studentService.insert(entity).getOperateResult()>0?Boolean.TRUE:Boolean.FALSE;
		return bool;
	}
	
	/**
	 * 跳转更新
	*/
	@ApiOperation(value = "跳转更新", notes = "进入更新页面", httpMethod = "GET")
    @RequestMapping(value="/preUpdate",method=RequestMethod.GET)
	public String preUpdate(HttpServletRequest request){
	    request.setAttribute("student", studentService.view(Integer.parseInt(request.getParameter("id"))));
		return "student/updateStudent";
	} 
	
    /**
     * 更新数据
     */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	@Function("更新数据")
	@ApiOperation(value = "更新学生", notes = "更新学生", httpMethod = "POST",response = Boolean.class)
	public Boolean update(@ApiParam(name = "学生对象", value = "传入json格式", required = true) Student entity) {
		return studentService.update(entity).getOperateResult()>0?Boolean.TRUE:Boolean.FALSE;
	}
	
    /**
     * 删除数据
     */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	@ApiOperation(value = "删除学生",position=6, notes = "删除学生", httpMethod = "POST",response = Boolean.class)
	public Boolean delete(@ApiParam(name = "学生对象", value = "传入json格式", required = true) @RequestBody List<Student> ids) {
		int total=0;
		for (Student s : ids) {
			total+=studentService.delete(String.valueOf(s.getId()));
		}
		return total>0?Boolean.TRUE:Boolean.FALSE;
		//return studentService.batchDelete(ids)>0?Boolean.TRUE:Boolean.FALSE;
	}
    
}
