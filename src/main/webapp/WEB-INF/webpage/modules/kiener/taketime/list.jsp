<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<c:set var="currentMenu" value="${fns:getCurrentMenu()}" />
<!DOCTYPE html>
<html>
<head>
  <title><spring:message code="kiener.taketime.title" /></title>
  <meta name="decorator" content="list"/>
</head>
<body title="<spring:message code="kiener.taketime.title" />">

<grid:grid id="takeTimeGridId" url="${adminPath}/kiener/taketime/ajaxList">
    <grid:column label="kiener.taketime.partnumber"  name="partNumber" width="150"  query="true"  condition="like"/>
    <grid:column label="kiener.taketime.station"  name="station"  width="100" />
    <grid:column label="kiener.taketime.variety"  name="currentType" width="100"/>
    <grid:column label="kiener.taketime.date"  name="measureDate"   width="100" query="true"/>
    <grid:column label="kiener.taketime.enddate"  name="endDate"   width="150" query="true"/>
    <grid:column label="kiener.taketime.taketime"  name="takeTime" width="100"    />
    <grid:column label="kiener.taketime.changetype"  name="changeType" width="100"    />

	<grid:toolbar  function="search"  />
	<grid:toolbar  function="reset" />
</grid:grid>
</body>
</html>