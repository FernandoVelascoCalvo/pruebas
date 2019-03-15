<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="asignarTipoIdentificacionPerfil.titulo"/></title>
	</head>
	<body> 

		<html:form action="/asignarTipoIdentificacionPerfil.do">
			<input type="hidden" name="accion" value="asignar_tipo_identificacion" />
			<input type="hidden" name="d-2206782-p" value="<c:out value="${param['d-2206782-p']}"/>" />
  			<input type="hidden" name="d-1288982-p" value="<c:out value="${param['d-1288982-p']}"/>" />
  			<html:hidden property="idProcedimiento"/>
			<html:hidden property="idOrden"/>
			<html:hidden property="idConvocatoria"/>
			<html:hidden property="idPerfil"/>
			<html:hidden property="idTipoIdentificacion"/>
			<html:hidden property="pordefecto"/>
			
			<p class="azul"><fmt:message key="asignarTipoIdentificacionPerfil.tituloTipoCertificado"/> <html:errors property="idTipoIdentificacion"/></p>
			<p class="info"><fmt:message key="asignarTipoIdentificacionPerfil.comentario"/></p>
			
			<div class="listado">		
				<display:table id="listadoPerfilTiposIdentificacion"
							   name="tiposIdentificacion"
							   pagesize="15"
							   requestURI="asignarTipoIdentificacionPerfil.do"
							   excludedParams=""
							   decorator="es.ja.cice.pct.moad.webapp.decorators.AsignarPerfilesDecorator">
						<display:column property="nombreLink"
										titleKey="comun.campo.nombre"
										sortable="false"/>
						<display:column property="descripcionLink"
										titleKey="comun.campo.descripcion"
										sortable="false" maxLength="75"/>
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
	