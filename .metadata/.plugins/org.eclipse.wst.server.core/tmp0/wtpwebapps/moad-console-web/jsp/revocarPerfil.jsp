<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="revocarPerfil.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/revocarPerfil.do">
			<input type="hidden" name="accion" value="borrar" />
			<input type="hidden" name="d-7953672-p" value="<c:out value="${param['d-7953672-p']}"/>" />
  			<input type="hidden" name="cdUsuario" value="<c:out value="${param.cdUsuario}"/>" />
  			<input type="hidden" name="idPerfil" value="<c:out value="${param.idPerfil}"/>" />
  			<input type="hidden" name="idUsuConfTrewa" value="<c:out value="${param.idUsuConfTrewa}"/>" />
  			<input type="hidden" name="idUsuarios" value="<c:out value="${param.idUsuarios}"/>" />

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.revocar">
						<fmt:param value="el perfil"/>
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