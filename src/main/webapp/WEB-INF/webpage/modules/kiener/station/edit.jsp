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
		             <form:input path="identifier" class="form-control " datatype="/^[a-zA-Z 0-9]+$/" errormsg="数据库关键字必须为英文" htmlEscape="false" />
		             <label class="Validform_checktip"></label>
		         </td>
		         <td  class="width-15 active text-right">	
		          	<label><font color="red">*</font>type</label>
		         </td>
		         <td  class="width-35" >
		             <%--<form:select path="dbType" dict="dbtype" class="form-control"  htmlEscape="false"  datatype="*"  nullmsg="请输入数据库类型！"/>--%>
					 <form:input path="type" class="form-control " />
					 <label class="Validform_checktip"></label>
		         </td>
		      </tr>
			   <tr>
				   <td  class="width-15 active text-right">
					   <label><font color="red">*</font>address</label>
				   </td>
				   <td class="width-35" >
					   <form:input path="address" class="form-control " />
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

		   </tbody>
		</table>   
	</form:form>
	<script type="text/javascript">
		$(function(){
			$('#dbType').change(function(){
				var dbType = $("#dbType").val();
				$.ajax({
					type: "POST",
					url: "${adminPath}/sys/datasource/dataSourceParameter",
					data: "dbType=" + dbType,
					success: function(data){
						var driverData=data.data;
						$('#driverClass').val(driverData.driverClass);
						$('#url').val(driverData.url);
					}
				});
			});
		});
	</script>
</body>
</html>