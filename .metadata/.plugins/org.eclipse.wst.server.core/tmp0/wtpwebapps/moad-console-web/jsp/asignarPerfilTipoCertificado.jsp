<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="asignarPerfilTipoCertificado.titulo"/></title>
	</head>
	<body> 

		<html:form action="/asignarPerfilTipoCertificado.do">
			<input type="hidden" name="accion" value="asignar" />
			<input type="hidden" name="d-3351491-p" value="<c:out value="${param['d-3351491-p']}"/>" />
  			<html:hidden property="idProcedimiento"/>
			<html:hidden property="idTipoCertificado"/>
			<html:hidden property="idPerfil"/>

			<p class="azul"><fmt:message key="asignarPerfilTipoCertificado.tituloTipoCertificado"/> <html:errors property="idPerfil"/></p>
			<p class="info"><fmt:message key="asignarPerfilTipoCertificado.comentario"/></p>

			<div class="listado">		
				<display:table id="listadoUsuarioPerfiles"
							   name="perfilesTipoCertificado"
							   pagesize="15"
							   requestURI="asignarPerfilTipoCertificado.do"
							   excludedParams=""
							   decorator="es.ja.cice.pct.moad.webapp.decorators.ConvocatoriasPerfilesDecorator">
					<display:column property="convocatoriaLink"
									titleKey="convocatoria.campo.convocatoria"
									sortable="false"/>
					<display:column property="descripcionLink"
									titleKey="perfil.campo.perfil"
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
	