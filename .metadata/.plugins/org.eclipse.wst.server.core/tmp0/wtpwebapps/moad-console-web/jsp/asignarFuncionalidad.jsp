<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="asignarFuncionalidad.titulo"/></title>
	</head>
	
	<body>

		<p class="azul"><fmt:message key="asignarFuncionalidad.subtitulo"/> <html:errors property="idFuncionalidad"/></p>
		<p class="info"><fmt:message key="asignarFuncionalidad.comentario"/></p>


		<html:form action="/asignarFuncionalidad.do">
			<input type="hidden" name="show" value="true" />
			<input type="hidden" name="accion" value="asignar" />
			<input type="hidden" name="d-6456657-p" value="<c:out value="${param['d-6456657-p']}"/>" />
			<input type="hidden" name="d-2760595-p" value="<c:out value="${param['d-2760595-p']}"/>" />
			<input type="hidden" name="d-6100124-p" value="<c:out value="${param['d-6100124-p']}"/>" />
			<input type="hidden" name="filtro" value="<c:out value="${param.filtro}"/>" />		
			<html:hidden property="idRol"/>
			<html:hidden property="idFuncionalidad"/>
			

			<div class="listado">		
				<display:table id="listadoFuncionalidadesAsignar"
							   name="funcionalidades"
							   pagesize="15"
							   requestURI="asignarFuncionalidad.do"
							   excludedParams=""
							   decorator="es.ja.cice.pct.moad.webapp.decorators.FuncionalidadesAsignarDecorator">
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
