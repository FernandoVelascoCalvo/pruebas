<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="asignarRol.titulo"/></title>
	</head>
	<body> 

		<html:form action="/asignarRol.do">
			<input type="hidden" name="accion" value="asignar" />
			<input type="hidden" name="d-7926692-p" value="<c:out value="${param['d-7926692-p']}"/>" />
  			<html:hidden property="idRol"/>
  			<html:hidden property="idProcedimiento"/>
  			<html:hidden property="cdUsuario"/>
			<html:hidden property="idUsuarios" />


			<p class="azul"><fmt:message key="asignarRol.tituloRoles"/> <html:errors property="idRol"/></p>
			<p class="info"><fmt:message key="asignarRol.comentario"/></p>
			
			<div class="listado">		
				<display:table id="listadoRolesAsignar"
							   name="roles"
							   pagesize="10"
							   requestURI="asignarRol.do"
							   excludedParams=""
							   decorator="es.ja.cice.pct.moad.webapp.decorators.RolesAsignarDecorator">
					<display:column property="nombreLink"
									titleKey="comun.campo.nombre"
									sortable="false"/>
					<display:column property="descripcionLink"
									titleKey="comun.campo.descripcion"
									sortable="false"/>
	       		</display:table>
			</div>
			
			<p class="azul"><fmt:message key="asignarRol.tituloProcedimientos"/> <html:errors property="idProcedimiento"/></p>
			<p class="info"><fmt:message key="asignarRolProcedimiento.comentario"/></p>
			
			<div class="listado">		
				<display:table id="listadoProcedimientosAsignar"
							   name="procedimientos"
							   pagesize="10"
							   requestURI="asignarRol.do"
							   excludedParams=""
							   decorator="es.ja.cice.pct.moad.webapp.decorators.ProcedimientosAsignarDecorator">
					<display:column property="nombreLink"
									titleKey="comun.campo.nombre"
									sortable="false"/>
					<display:column property="descripcionLink"
									titleKey="comun.campo.descripcion"
									sortable="false"/>
	       		</display:table>
			</div>

			<div class="confirmar">
				<html:submit styleClass="boton_submit">
					<fmt:message key="comun.boton.asignar"/>
				</html:submit>
				<html:cancel styleClass="boton_submit">
					<fmt:message key="comun.boton.cancelar"/>
				</html:cancel>
			</div>
			
    	</html:form>
	</body>
</html>
	