<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<c:set var="currentMenu" value="${fns:getCurrentMenu()}" />
<!DOCTYPE html>
<html>
<head>
  <title><spring:message code="leave.user.title" /></title>
  <meta name="decorator" content="list"/>
</head>
<body title="<spring:message code="leave.user.title" />">

<%--adminPath:  <c:out value="${adminPath}" /> <br>--%>
<%--appPath: <c:out value="${appPath}" />  <br>--%>
<%--staticPath:<c:out value="${staticPath}" />  <br> <br>--%>
<%--ctx: <c:out value="${ctx}" /> <br>--%>

<grid:grid id="userLeaveGridId" url="${adminPath}/leave/user/ajaxList">
    <grid:column label="userName"  name="username" width="50"  query="true"  condition="like"/>
    <grid:column label="leavetype"  name="leavetype" dict="leavetype" width="50" query="true" queryMode="select"/>
    <grid:column label="startDate"  name="startdate" formatter="date" width="100"/>
    <grid:column label="endDate"  name="enddate" formatter="date" width="50"/>
    <grid:column label="remark"  name="remark"   width="50"/>

    <grid:toolbar function="create"/>
    <grid:toolbar function="update"/>
    <grid:toolbar function="delete"/>
    <grid:toolbar title="sys.user.modifypwd" icon="fa-database"  function="updateDialog" url="${adminPath}/sys/user/${fns:getUser().id}/changePassword"  />

    <grid:toolbar function="search"  />
	<grid:toolbar function="reset" />
</grid:grid>
</body>
</html>