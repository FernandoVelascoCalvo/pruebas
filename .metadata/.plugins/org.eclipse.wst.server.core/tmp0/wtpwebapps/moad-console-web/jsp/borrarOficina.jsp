<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="borrarOficina.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/borrarOficina.do">
			<input type="hidden" name="accion" value="borrar" />
			<input type="hidden" name="d-6544692-p" value="<c:out value="${param['d-6544692-p']}"/>" />  			
  			<input type="hidden" name="idOficina" value="<c:out value="${param.idOficina}"/>" />
  			<input type="hidden" name="idUO" value="<c:out value="${param.idUO}"/>" />  			

			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.borrar">
						<fmt:param value="la oficina de registro"/>
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