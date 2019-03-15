<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="error.generico.titulo"/></title>
	</head>
	<body>
		<div class="mensaje">
			<fmt:message key="errors.generico">
				<fmt:param><%= request.getContextPath() %></fmt:param>
			</fmt:message>
		</div>
	</body>
</html>
