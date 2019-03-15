<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="revocarConfTrewa.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/revocarConfiguracionTrewa.do">
			<input type="hidden" name="accion" value="borrar" />
			<input type="hidden" name="d-7953672-p" value="<c:out value="${param['d-7953672-p']}"/>" />
  			<input type="hidden" name="cdUsuario" value="<c:out value="${param.cdUsuario}"/>" />
  			<input type="hidden" name="idUsuarios" value="<c:out value="${param.idUsuarios}"/>" />
  			<input type="hidden" name="idConfTrewa" value="<c:out value="${param.idConfTrewa}"/>" />
  			<input type="hidden" name="idUsuConfTrewa" value="<c:out value="${param.idUsuConfTrewa}"/>" />

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.revocar">
						<fmt:param value="la Configuracion Trewa"/>
						<fmt:param value="l usuario"/>
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