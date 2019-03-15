<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="configuraciones.activar.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/editarConfiguracion.do">
			<input type="hidden" name="accion" value="activar" />
			<input type="hidden" name="d-4460053-p" value="<c:out value="${param['d-4460053-p']}"/>" />
  			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />
  			<input type="hidden" name="idConfiguracion" value="<c:out value="${param.idConfiguracion}"/>" />

			<html:hidden property="nombre"/>
			<html:hidden property="descripcion"/>
			<html:hidden property="habilitada"/>
			
			<div class="advertencia">
				<p>
					<fmt:message key="configuracion.confirmar.activacion"/>
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