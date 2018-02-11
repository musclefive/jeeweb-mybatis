<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="sys.user.createuser" /></title>
     <meta name="decorator" content="form"/>
	 
</head>

<body class="white-bg"  formid="userLeaveForm" beforeSubmit="beforeSubmit">
     <form:form id="userLeaveForm" modelAttribute="data" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<table  class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		       <tr>
		         <td  class="width-15 active text-right">	<label><font color="red">*</font>用户名:</label></td>
		         <td  class="width-35" >
		             <form:input path="username" defaultValue="${fns:getUser().realname}" class="form-control"
								 htmlEscape="false"  datatype="*"
							 readonly="true"/>
					 <form:hidden path="userid" defaultValue="${fns:getUser().id}"/>
		             <label class="Validform_checktip"></label>
		         </td>
		          <td  class="width-15 active text-right">
		              <label><font color="red">*</font>类型:</label>
		         </td>
		         <td class="width-35" >
		             <%--<form:input path="leaveName" class="form-control " datatype="*" nullmsg="请输入姓名！" validErrorMsg="用户名重复" htmlEscape="false" />--%>
						 <form:select path="leavetype" dict="leavetype" class="form-control"  htmlEscape="false"  datatype="*"  nullmsg="请输入类型！"/>

						 <label class="Validform_checktip"></label>
		         </td>
		      </tr>
		      <tr>
		         <td  class="width-15 active text-right">	
		              <label><font color="red">*</font>开始日期:</label>
		         </td>
		         <td class="width-35" >
					 <form:input path="startdate" htmlEscape="false"
								 class="form-control layer-date"
								 placeholder="YYYY-MM-DD" datefmt="YYYY-MM-DD"
								 onclick="laydate({istime: true, format: 'YYYY-MM-DD'})"/>
					 <label class="Validform_checktip"></label>
		         </td>
		         <td  class="width-15 active text-right">	
		           	 <label><font color="red">*</font>结束日期:</label>
		         </td>
		         <td  class="width-35" >
					 <form:input path="enddate" htmlEscape="false" class="form-control layer-date" placeholder="YYYY-MM-DD" datefmt="YYYY-MM-DD"
								 onclick="laydate({istime: true, format: 'YYYY-MM-DD'})"/>
					 <label class="Validform_checktip"></label>
		         </td>
		      </tr>
		      <tr>
				<td class="width-15 active"><label class="pull-right">备注:</label></td>
				<td colspan="3">
					<form:input path="remark" class="form-control"  htmlEscape="false"   nullmsg="请输入用户名！"/>
				</td>
		      </tr>

		     
		   </tbody>
		   </table>   
	</form:form>

	 <script type="text/javascript">
		 /**
		  *提交回调方法，判断结束日期不能小于开始日期
		  */
		 function beforeSubmit(curform){

			 var startDate = $("#startdate").val();
			 var endDate = $("#enddate").val();
			 if(endDate < startDate) {
				 top.layer.alert('结束日期小于开始日期，重新填写！', {icon: 0, title:'警告'});
				 return false
			 }
			 return true;
		 }


	 </script>

</body>
</html>