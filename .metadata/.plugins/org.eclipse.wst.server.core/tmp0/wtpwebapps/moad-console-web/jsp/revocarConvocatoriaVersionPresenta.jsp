<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="revocarConvocatoriaVersionPresenta.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/revocarConvocatoriaVersionPresenta.do">
			<input type="hidden" name="accion" value="revocar" />
			<input type="hidden" name="d-2002331-p" value="<c:out value="${param['d-2002331-p']}"/>" />
  			<input type="hidden" name="idConvocatoria" value="<c:out value="${param.idConvocatoria}"/>" />
  			<input type="hidden" name="idVersionPresenta" value="<c:out value="${param.idVersionPresenta}"/>" />
			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.revocar">
						<fmt:param value=" la convocatoria"/>
						<fmt:param value=" la version de presenta"/>
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