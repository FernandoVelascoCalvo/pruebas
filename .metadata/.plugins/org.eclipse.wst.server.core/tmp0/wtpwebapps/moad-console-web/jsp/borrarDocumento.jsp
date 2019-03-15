<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="borrarDocumento.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/borrarDocumento.do">
			<input type="hidden" name="accion" value="borrar" />
  			<input type="hidden" name="d-3550647-p" value="<c:out value="${param['d-3550647-p']}"/>" />
  			<input type="hidden" name="idDocumento" value="<c:out value="${param.idDocumento}"/>" />
  			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.borrar">
						<fmt:param value="el documento"/>
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