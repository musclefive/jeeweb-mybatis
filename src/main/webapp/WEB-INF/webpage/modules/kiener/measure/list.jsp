<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
  <title><spring:message code="sys.dict.title" /></title>
  <meta name="decorator" content="list"/>
</head>
<body title="<spring:message code="sys.dict.title" />">
<grid:grid id="measureDataGridId" url="${adminPath}/kiener/measure/ajaxList">
	<grid:column label="sys.common.key" hidden="true"   name="id" width="100"/>
	<grid:column label="sys.common.opt"  name="opt" formatter="button" width="100"/>
	<grid:button groupname="opt" function="delete"/>
    <grid:column label="零件号"  name="partNumber" width="200"  />
    <grid:column label="工位"  name="station"  width="200" />
    <grid:column label="型号"  name="variety" width="100"    />
    <grid:column label="日期"  name="measureDate"   width="100" />

	<grid:toolbar  function="delete" />
	
	<grid:toolbar  function="search"  />
	<grid:toolbar  function="reset" />
</grid:grid>
</body>
</html>