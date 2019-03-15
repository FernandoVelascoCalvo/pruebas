<%@ include file="/common/taglibs.jsp"%>

<page:applyDecorator name="moad">

	<title><fmt:message key="404.titulo"/></title>
	<div class="mensaje">
		<fmt:message key="404.mensaje">
			<fmt:param><%= request.getContextPath() %></fmt:param>
		</fmt:message>
	</div>
</page:applyDecorator>

