<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="borrarProcedimiento.titulo"/></title>
	</head>
	
	<body>
		<html:form action="/borrarProcedimiento.do">
			<input type="hidden" name="accion" value="borrar" />
			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />			
			<input type="hidden" name="d-6903951-p" value="<c:out value="${param['d-6903951-p']}"/>" />

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.borrar">
						<fmt:param value="el procedimiento"/>
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
		