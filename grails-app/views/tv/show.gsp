<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'tile.label', default: 'Tv Show')}" />
<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>
<body>
    <h1>
        ${series.seriesName}
    </h1>
</body>
</html>
