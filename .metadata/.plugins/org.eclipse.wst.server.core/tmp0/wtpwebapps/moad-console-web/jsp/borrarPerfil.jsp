<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="borrarPerfil.titulo"/></title>
	</head>
	
	<body>
		<html:form action="/borrarPerfil.do">
			<input type="hidden" name="accion" value="borrar" />
			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />
			<input type="hidden" name="idOrden" value="<c:out value="${param.idOrden}"/>" />
			<input type="hidden" name="idConvocatoria" value="<c:out value="${param.idConvocatoria}"/>" />
			<input type="hidden" name="idPerfil" value="<c:out value="${param.idPerfil}"/>" />
			<input type="hidden" name="d-6548574-p" value="<c:out value="${param['d-6548574-p']}"/>" />

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.borrar">
						<fmt:param value="el perfil"/>
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
		