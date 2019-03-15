<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title><fmt:message key="borrarRol.titulo"/></title>
	</head>
	
	<body>
		<html:form action="/borrarRol.do">
			<input type="hidden" name="show" value="false" />
			<input type="hidden" name="accion" value="borrar" />
			<input type="hidden" name="d-6456657-p" value="<c:out value="${param['d-6456657-p']}"/>" />
			<input type="hidden" name="d-2760595-p" value="<c:out value="${param['d-2760595-p']}"/>" />
			<input type="hidden" name="filtro" value="<c:out value="${param.filtro}"/>" />		
			<input type="hidden" name="idRol" value="<c:out value="${param.idRol}"/>" />		

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.borrar">
						<fmt:param value="el rol"/>
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