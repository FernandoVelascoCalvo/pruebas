<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="borrarConvocatoria.titulo"/></title>
	</head>
	
	<body>
		<html:form action="/borrarConvocatoria.do">
			<input type="hidden" name="accion" value="borrar" />
			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />
			<input type="hidden" name="idOrden" value="<c:out value="${param.idOrden}"/>" />
			<input type="hidden" name="idConvocatoria" value="<c:out value="${param.idConvocatoria}"/>" />
			<input type="hidden" name="d-828469-p" value="<c:out value="${param['d-828469-p']}"/>" />

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.borrar">
						<fmt:param value="la convocatoria"/>
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
		