<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="borrarOrden.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/borrarOrden.do">
			<input type="hidden" name="accion" value="revocar" />
			<input type="hidden" name="d-7776532-p" value="<c:out value="${param['d-7776532-p']}"/>" />
  			<input type="hidden" name="idOrden" value="<c:out value="${param.idOrden}"/>" />
  			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.revocar">
						<fmt:param value=" la orden"/>
						<fmt:param value="l procedimiento"/>
					</fmt:message>
				</p>
				<div class="confirmar">
					<html:submit styleClass="boton_submit">
						<fmt:message key="comun.boton.si"/>
					</html:submit>
					<html:cancel styleClass="boton_submit">
						<fmt:message key="comun.boton.no"/>
					</html:cancel>
				</div>
			</div>
    	</html:form>
	</body>
</html>