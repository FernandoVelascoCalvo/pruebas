<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="borrarCampo.titulo"/></title>
	</head>
	
	<body>
		<html:form action="/borrarCampo.do">
			<input type="hidden" name="show" value="true" />
			<input type="hidden" name="accion" value="borrar" />
			<input type="hidden" name="d-6543861-p" value="<c:out value="${param['d-6543861-p']}"/>" />
			<input type="hidden" name="d-2588205-p" value="<c:out value="${param['d-2588205-p']}"/>" />
			<input type="hidden" name="filtro" value="<c:out value="${param.filtro}"/>" />		
			<input type="hidden" name="idListado" value="<c:out value="${param.idListado}"/>" />		
			<input type="hidden" name="idCampoListado" value="<c:out value="${param.idCampoListado}"/>" />		

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.borrar">
						<fmt:param value="el campo del listado"/>
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
		
