<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="revocarRol.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/revocarRol.do">
			<input type="hidden" name="accion" value="revocar" />
			<input type="hidden" name="d-7926692-p" value="<c:out value="${param['d-7926692-p']}"/>" />
  			<input type="hidden" name="cdUsuario" value="<c:out value="${param.cdUsuario}"/>" />
  			<input type="hidden" name="idRolUsuaProc" value="<c:out value="${param.idRolUsuaProc}"/>" />
  			<input type="hidden" name="idUsuarios" value="<c:out value="${param.idUsuarios}"/>" />

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.revocar">
						<fmt:param value="el rol"/>
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