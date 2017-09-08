<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<c:set var="currentMenu" value="${fns:getCurrentMenu()}" />
<!DOCTYPE html>
<html>
<head>
  <title><spring:message code="kiener.measure.title" /></title>
  <meta name="decorator" content="list"/>
</head>
<body title="<spring:message code="kiener.measure.title" />">

<grid:grid id="measureDataGridId" url="${adminPath}/kiener/measure/ajaxList_measure">
    <grid:column label="kiener.measure.partnumber"  name="partNumber" width="150"  query="true"  condition="like"/>
    <grid:column label="kiener.measure.station"  name="station"  width="100" />
    <grid:column label="kiener.measure.variety"  name="variety" width="100"/>
    <grid:column label="kiener.measure.date"  name="measureDate"   width="100" query="true"/>
    <grid:column label="结束时间"  name="nextDate"   width="150" query="true"/>
    <grid:column label="换型时间"  name="takeTime" width="100"    />

	<grid:toolbar  function="search"  />
	<grid:toolbar  function="reset" />
</grid:grid>
</body>
</html>