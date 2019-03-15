<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="revocarPerfilTipoCertificado.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/revocarPerfilTipoCertificado.do">
			<input type="hidden" name="accion" value="revocar" />
			<input type="hidden" name="d-3351491-p" value="<c:out value="${param['d-3351491-p']}"/>" />
  			<input type="hidden" name="idTipoCertificado" value="<c:out value="${param.idTipoCertificado}"/>" />
  			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />
  			<input type="hidden" name="idPerfil" value="<c:out value="${param.idPerfil}"/>" />

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.revocar">
						<fmt:param value=" el perfil"/>
						<fmt:param value="l tipo de certificado del procedimiento"/>
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