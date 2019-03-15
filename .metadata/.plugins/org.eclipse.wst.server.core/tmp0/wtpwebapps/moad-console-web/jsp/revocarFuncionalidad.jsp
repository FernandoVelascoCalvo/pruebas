<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="revocarFuncionalidad.titulo"/></title>
	</head>
	
	<body>
		<html:form action="/revocarFuncionalidad.do">
			<input type="hidden" name="show" value="true" />
			<input type="hidden" name="accion" value="borrar" />
			<input type="hidden" name="d-6456657-p" value="<c:out value="${param['d-6456657-p']}"/>" />
			<input type="hidden" name="d-2760595-p" value="<c:out value="${param['d-2760595-p']}"/>" />
			<input type="hidden" name="filtro" value="<c:out value="${param.filtro}"/>" />		
			<input type="hidden" name="idRol" value="<c:out value="${param.idRol}"/>" />		
			<input type="hidden" name="idFuncionalidad" value="<c:out value="${param.idFuncionalidad}"/>" />		

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.revocar">
						<fmt:param value=" la funcionalidad"/>
						<fmt:param value="l rol"/>
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
