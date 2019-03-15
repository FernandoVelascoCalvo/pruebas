<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="subMenus.titulo"/></title>
	</head>
	
	<body>

		<html:form action="/borrarSubMenus.do">
			<input type="hidden" name="accion" value="revocarSubMenu" />
			<input type="hidden" name="d-6544692-p" value="<c:out value="${param['d-6544692-p']}"/>" />  			
  			<input type="hidden" name="idSubMenu" value="<c:out value="${param.idSubMenu}"/>" />
  			<input type="hidden" name="idMenu" value="<c:out value="${param.idMenu}"/>" />
  			
			<div class="advertencia">
				<p>
					<fmt:message key="comun.confirmar.borrar">
						<fmt:param value="el submenú"/>
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