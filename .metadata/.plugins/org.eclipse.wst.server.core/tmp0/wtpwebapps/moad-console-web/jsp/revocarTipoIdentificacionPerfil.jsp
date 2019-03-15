<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="revocarTipoIdentificacionPerfil.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/revocarTipoIdentificacionPerfil.do">
			<input type="hidden" name="accion" value="revocar_tipo_identificacion" />
			<input type="hidden" name="d-2206782-p" value="<c:out value="${param['d-2206782-p']}"/>" />
  			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />
  			<input type="hidden" name="idOrden" value="<c:out value="${param.idOrden}"/>" />
  			<input type="hidden" name="idConvocatoria" value="<c:out value="${param.idConvocatoria}"/>" />
  			<input type="hidden" name="idTipoIdentificacion" value="<c:out value="${param.idTipoIdentificacion}"/>" />
  			<input type="hidden" name="idPerfil" value="<c:out value="${param.idPerfil}"/>" />

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.revocar">
						<fmt:param value=" el tipo de identificación"/>
						<fmt:param value="l perfil"/>
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