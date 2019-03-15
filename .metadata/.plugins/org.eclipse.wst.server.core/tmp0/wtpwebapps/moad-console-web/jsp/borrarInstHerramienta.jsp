<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="borrarInstHerramienta.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/borrarInstHerramienta.do">
			<input type="hidden" name="accion" value="borrar" />
			<input type="hidden" name=d-4460053-p value="<c:out value="${param['d-4460053-p']}"/>" />
			<input type="hidden" name="d-3449996-p" value="<c:out value="${param['d-3449996-p']}"/>" />
			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />
			<input type="hidden" name="idConfiguracion" value="<c:out value="${param.idConfiguracion}"/>" />
			<input type="hidden" name="idInstHerramienta" value="<c:out value="${param.idInstHerramienta}"/>" />

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.borrar">
						<fmt:param value="la configuración de herramienta"/>
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