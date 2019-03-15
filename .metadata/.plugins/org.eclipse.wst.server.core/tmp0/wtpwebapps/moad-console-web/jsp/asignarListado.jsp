<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="asignarListado.titulo"/></title>
	</head>
	<body> 

		<html:form action="/asignarListado.do">
			<input type="hidden" name="accion" value="asignar" />
			<input type="hidden" name="d-6543861-p" value="<c:out value="${param['d-6543861-p']}"/>" />
  			<html:hidden property="idProcedimiento"/>
			<html:hidden property="idListado"/>

			<p class="azul"><fmt:message key="asignarListado.tituloListados"/> <html:errors property="idListado"/></p>
			<p class="info"><fmt:message key="asignarListado.comentario"/></p>

			<div class="listado">		
				<display:table id="listadoProcedimientosAsignar"
							   name="listados"
							   pagesize="15"
							   requestURI="asignarListado.do"
							   excludedParams=""
							   decorator="es.ja.cice.pct.moad.webapp.decorators.ListadosAsignarDecorator">
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
	