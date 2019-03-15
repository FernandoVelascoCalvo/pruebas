<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="borrarPlantilla.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/borrarPlantilla.do">
			<input type="hidden" name="accion" value="borrar" />
  			<input type="hidden" name="d-8045158-p" value="<c:out value="${param['d-8045158-p']}"/>" />
  			<input type="hidden" name="idPlantilla" value="<c:out value="${param.idPlantilla}"/>" />
  			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />
  			<input type="hidden" name="idVersionPresenta" value="<c:out value="${param.idVersionPresenta}"/>" />

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.borrar">
						<fmt:param value="la plantilla"/>
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