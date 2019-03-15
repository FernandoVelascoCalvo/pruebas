<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="borrarEmpleo.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/borrarEmpleo.do">
			<input type="hidden" name="accion" value="borrar" />
			<input type="hidden" name="d-7769137-p" value="<c:out value="${param['d-7769137-p']}"/>" />
  			<input type="hidden" name="cdUsuario" value="<c:out value="${param.cdUsuario}"/>" />
  			<input type="hidden" name="idEmpleado" value="<c:out value="${param.idEmpleado}"/>" />
  			<input type="hidden" name="idUO" value="<c:out value="${param.idUO}"/>" />
  			<input type="hidden" name="cdPuesto" value="<c:out value="${param.cdPuesto}"/>" />
  			<input type="hidden" name="idUsuConfTrewa" value="<c:out value="${param.idUsuConfTrewa}"/>" />
  			<input type="hidden" name="idUsuarios" value="<c:out value="${param.idUsuarios}"/>" />

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.borrar">
						<fmt:param value="el empleo"/>
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