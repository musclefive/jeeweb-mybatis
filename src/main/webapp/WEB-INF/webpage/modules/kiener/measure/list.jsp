<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
  <title><spring:message code="kiener.measure.title" /></title>
  <meta name="decorator" content="list"/>
</head>
<body title="<spring:message code="kiener.measure.title" />">
<grid:grid id="measureDataGridId" url="${adminPath}/kiener/measure/ajaxList">
	<grid:column label="sys.common.key" hidden="true"   name="id" width="100"/>
    <grid:column label="kiener.measure.partnumber"  name="partNumber" width="200"  query="true"  condition="like"/>
    <grid:column label="kiener.measure.station"  name="station"  width="200" />
    <grid:column label="kiener.measure.variety"  name="variety" width="100"    />
    <grid:column label="kiener.measure.date"  name="measureDate"   width="100" query="true" queryMode="date"/>

	<grid:toolbar  function="search"  />
	<grid:toolbar  function="reset" />
</grid:grid>
</body>
</html>