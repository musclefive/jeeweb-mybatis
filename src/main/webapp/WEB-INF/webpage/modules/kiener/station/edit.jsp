<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <title><spring:message code="sys.datasource.edittitle" /></title>
    <meta name="decorator" content="form"/> 
    
</head>

<body class="white-bg"  formid="stationForm">
    <form:form id="stationForm" modelAttribute="data" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<table  class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		       <tr>
		         <td  class="width-15 active text-right">	
		              <label><font color="red">*</font>identifier</label>
		         </td>
		         <td class="width-35" >
		             <form:input path="identifier" class="form-control "
								 datatype="/^[a-zA-Z 0-9]+$/"
								 errormsg="数据库关键字必须为英文" htmlEscape="false"
								 readonly="true"/>
		             <label class="Validform_checktip"></label>
		         </td>
		         <td  class="width-15 active text-right">	
		          	<label><font color="red">*</font>type</label>
		         </td>
		         <td  class="width-35" >
					 <form:input path="type" class="form-control " readonly="true"/>
					 <label class="Validform_checktip"></label>
		         </td>
		      </tr>
			   <tr>
				   <td  class="width-15 active text-right">
					   <label><font color="red">*</font>address</label>
				   </td>
				   <td class="width-35" >
					   <form:input path="address" class="form-control " readonly="true"/>
					   <label class="Validform_checktip"></label>
				   </td>
				   <td  class="width-15 active text-right">
					   <label><font color="red">*</font>isOffline</label>
				   </td>
				   <td  class="width-35" >
					   <form:radiobuttons path="isOffline"   dict="sf" defaultvalue="0"  htmlEscape="false" cssClass="i-checks required" />
					   <%--<form:input path="isOffline" class="form-control"  htmlEscape="false"  datatype="*"  nullmsg="请输入角色编码！"/>--%>
					   <label class="Validform_checktip"></label>
				   </td>
			   </tr>
			   <tr>
				   <td  class="width-15 active text-right">
					   <label><font color="red">*</font>首页显示</label>
				   </td>
				   <td class="width-35" >
					   <form:radiobuttons path="isShowDashboard"  dict="bFlag" defaultvalue="0"  htmlEscape="false" cssClass="i-checks required" />
					   <label class="Validform_checktip"></label>
				   </td>
				   <td  class="width-15 active text-right">
					   <label><font color="red">*</font>实时节拍</label>
				   </td>
				   <td  class="width-35" >
					   <form:radiobuttons path="isShowTaktTime" dict="bFlag" defaultvalue="0"  htmlEscape="false" cssClass="i-checks required" />
						   <%--<form:input path="isOffline" class="form-control"  htmlEscape="false"  datatype="*"  nullmsg="请输入角色编码！"/>--%>
					   <label class="Validform_checktip"></label>
				   </td>
			   </tr>
			   <tr>
				   <td  class="width-15 active text-right">
					   <label><font color="red">*</font>拧紧数量</label>
				   </td>
				   <td class="width-35" >
					   <form:input path="screw"  defaultvalue="0"  class="form-control " />
					   <label class="Validform_checktip"></label>
				   </td>
			   </tr>
			   <tr>
				   <td  class="width-15 active text-right">
					   <label><font color="red">*</font>试漏数量</label>
				   </td>
				   <td class="width-35" >
					   <form:input path="leak"  defaultvalue="0"  class="form-control " />
					   <label class="Validform_checktip"></label>
				   </td>
			   </tr>
			   <tr>
				   <td  class="width-15 active text-right">
					   <label><font color="red">*</font>压装数量</label>
				   </td>
				   <td class="width-35" >
					   <form:input path="force"  defaultvalue="0"  class="form-control " />
					   <label class="Validform_checktip"></label>
				   </td>
			   </tr>
		   </tbody>
		</table>   
	</form:form>
</body>
</html>