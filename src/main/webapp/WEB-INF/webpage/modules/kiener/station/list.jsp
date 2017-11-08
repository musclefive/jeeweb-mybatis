<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<c:set var="currentMenu" value="${fns:getCurrentMenu()}" />
<!DOCTYPE html>
<html>
<head>
  <title><spring:message code="kiener.station.title" /></title>
  <meta name="decorator" content="list"/>
</head>
<body title="<spring:message code="kiener.station.title" />">
<grid:grid id="takeTimeGridId" url="${adminPath}/kiener/station/ajaxList">
    <grid:column label="identifier"  name="identifier" width="50"  query="true"  condition="like"/>
    <grid:column label="type"  name="type"  width="50" />
    <grid:column label="address"  name="address" width="100"/>
    <grid:column label="isOffline"  name="isOffline" dict="sf"  width="50"/>
    <grid:column label="IsALM"  name="isALM"  dict="sf"  width="50"/>
    <grid:column label="IsUpload"  name="isUpload" dict="sf" width="50"    />
    <grid:column label="isRework"  name="isRework" dict="sf" width="50"    />
    <grid:column label="enabled"  name="enabled" dict="sf" width="50"    />

    <%--<grid:toolbar function="create"/>--%>
    <grid:toolbar   function="update"/>
    <%--<grid:toolbar   function="delete"/>--%>
	<grid:toolbar  function="search"  />
	<grid:toolbar  function="reset" />
</grid:grid>
</body>
</html>