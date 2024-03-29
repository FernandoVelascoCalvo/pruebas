<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="borrarAnexo.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/borrarAnexo.do">
			<input type="hidden" name="accion" value="borrar" />
  			<input type="hidden" name="d-6931142-p" value="<c:out value="${param['d-6931142-p']}"/>" />
  			<input type="hidden" name="idAnexo" value="<c:out value="${param.idAnexo}"/>" />
  			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />
  			<input type="hidden" name="idVersionPresenta" value="<c:out value="${param.idVersionPresenta}"/>" />

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.borrar">
						<fmt:param value="el anexo"/>
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