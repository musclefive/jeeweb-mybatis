<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<c:set var="currentMenu" value="${fns:getCurrentMenu()}" />
<!DOCTYPE html>
<html>
<head>
  <title><spring:message code="kiener.screw.title" /></title>
  <meta name="decorator" content="list"/>
</head>
<body title="<spring:message code="kiener.screw.title" />">
<grid:grid id="takeTimeGridId" url="${adminPath}/kiener/screw/ajaxList">
    <grid:column label="identifier"  name="identifier" width="50"  query="true"  condition="like"/>
    <grid:column label="type"  name="type"  width="50" />
    <grid:column label="pos"  name="pos"  width="50"/>
    <grid:column label="spin"  name="spin"  width="50"/>
    <grid:column label="type"  name="measuretype"  width="50"/>
    <grid:column label="JobID"  name="jobid"  width="50"/>

    <grid:toolbar function="create"/>
    <grid:toolbar function="update"/>
    <grid:toolbar function="delete"/>
	<grid:toolbar function="search"  />
	<grid:toolbar function="reset" />
</grid:grid>
</body>
</html>