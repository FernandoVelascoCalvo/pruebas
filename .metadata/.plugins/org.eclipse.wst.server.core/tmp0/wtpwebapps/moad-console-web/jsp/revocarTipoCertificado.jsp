<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="revocarTipoCertificado.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/revocarTipoCertificado.do">
			<input type="hidden" name="accion" value="revocar" />
			<input type="hidden" name="d-3954682-p" value="<c:out value="${param['d-3954682-p']}"/>" />
  			<input type="hidden" name="idTipoCertificado" value="<c:out value="${param.idTipoCertificado}"/>" />
  			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.revocar">
						<fmt:param value=" el tipo de certificado"/>
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