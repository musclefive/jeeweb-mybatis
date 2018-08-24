<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <title><spring:message code="sys.datasource.edittitle" /></title>
    <meta name="decorator" content="form"/> 
    
</head>

<body class="white-bg"  formid="stationscrewForm">
    <form:form id="stationscrewForm" modelAttribute="data" method="post" class="form-horizontal">
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
								 errormsg="数据库关键字必须为英文" htmlEscape="false"/>
		             <label class="Validform_checktip"></label>
		         </td>
		         <td  class="width-15 active text-right">	
		          	<label><font color="red">*</font>type</label>
		         </td>
		         <td  class="width-35" >
					 <form:input path="type" class="form-control "/>
					 <label class="Validform_checktip"></label>
		         </td>
		      </tr>
			   <tr>
				   <td  class="width-15 active text-right">
					   <label><font color="red">*</font>pos</label>
				   </td>
				   <td class="width-35" >
					   <form:input path="pos" class="form-control "/>
					   <label class="Validform_checktip"></label>
				   </td>
				   <td  class="width-15 active text-right">
					   <label><font color="red">*</font>spin</label>
				   </td>
				   <td  class="width-35" >
					   <form:input path="spin" class="form-control " />
					   <label class="Validform_checktip"></label>
				   </td>
			   </tr>
			   <tr>
				   <td  class="width-15 active text-right">
					   <label><font color="red">*</font>Type</label>
				   </td>
				   <td class="width-35" >
					   <form:input path="measureType" class="form-control "/>
					   <label class="Validform_checktip"></label>
				   </td>
			   </tr>
		   </tbody>
		</table>   
	</form:form>
</body>
</html>