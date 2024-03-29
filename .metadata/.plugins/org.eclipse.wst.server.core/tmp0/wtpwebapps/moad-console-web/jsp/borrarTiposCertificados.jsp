<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="tipoCertificados.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/borrarTiposCertificados.do">
			<input type="hidden" name="accion" value="revocar" />
			<input type="hidden" name="d-6544692-p" value="<c:out value="${param['d-6544692-p']}"/>" />  			
  			<input type="hidden" name="idTipoCertificado" value="<c:out value="${param.idTipoCertificado}"/>" />
  			
			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.borrar">
						<fmt:param value="el tipo de certificado"/>
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