<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="borrarParametro.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/borrarParametro.do">
			<input type="hidden" name="accion" value="borrar" />
			<input type="hidden" name="show" value="true" />
			<input type="hidden" name="d-601237-p" value="<c:out value="${param['d-601237-p']}"/>" />
			<input type="hidden" name="d-188270-p" value="<c:out value="${param['d-188270-p']}"/>" />
			<input type="hidden" name="idHerramienta" value="<c:out value="${param.idHerramienta}"/>" />		
			<input type="hidden" name="idParametro" value="<c:out value="${param.idParametro}"/>" />		

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.borrar">
						<fmt:param value="el parámetro"/>
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