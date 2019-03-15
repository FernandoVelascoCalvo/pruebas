<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="borrarUsuario.titulo"/></title>
	</head>
	
	<body>
		<html:form action="/borrarUsuario.do">
			<input type="hidden" name="accion" value="borrar" />
			<input type="hidden" name="d-6570285-p" value="<c:out value="${param['d-6570285-p']}"/>" />			
			<input type="hidden" name="filtro" value="<c:out value="${param.filtro}"/>" />
			<input type="hidden" name="cdUsuario" value="<c:out value="${param.cdUsuario}"/>" />

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.borrar">
						<fmt:param value="el usuario"/>
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
		