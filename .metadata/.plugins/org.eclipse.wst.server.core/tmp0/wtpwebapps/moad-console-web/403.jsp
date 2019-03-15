<%@ include file="/common/taglibs.jsp"%>

<page:applyDecorator name="moad">

	<title><fmt:message key="403.titulo"/></title>
	<div class="mensaje">
		<fmt:message key="403.mensaje">
            <fmt:param><%= request.getContextPath() %></fmt:param>
		</fmt:message>
	</div>
</page:applyDecorator>
