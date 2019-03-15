<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="confTrewa.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/borrarConfiguracionTrewa.do">
			<input type="hidden" name="accion" value="revocar" />
			<input type="hidden" name="d-6544692-p" value="<c:out value="${param['d-6544692-p']}"/>" />  			
  			<input type="hidden" name="idConfTrewa" value="<c:out value="${param.idConfTrewa}"/>" />
  			
			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.borrar">
						<fmt:param value="la configuracion Trewa"/>
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