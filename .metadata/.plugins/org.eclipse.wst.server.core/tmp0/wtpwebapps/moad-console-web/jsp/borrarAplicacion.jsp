<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="borrarAplicacion.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/borrarAplicacion.do">
			<input type="hidden" name="accion" value="borrar" />
			<input type="hidden" name="show" value="false" />
			<input type="hidden" name="d-8216685-p" value="<c:out value="${param['d-8216685-p']}"/>" />
			<input type="hidden" name="idAplicacion" value="<c:out value="${param.idAplicacion}"/>" />

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.borrar">
						<fmt:param value="la aplicación"/>
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