<%@ include file="/common/taglibs.jsp"%>

			<!-- Información de la configuracion -->
			<div class="cabeceraMedio">
				<c:url var="nuevoURL" value="/listadoConfiguracionHerramientas.do">
					<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
					<c:param name="idConfiguracion" value="${param.idConfiguracion}"/>
				</c:url>
				<h2>
					<html-el:link href="${nuevoURL}">
						<strong>Configuracion: </strong><bean:write name="configuracion" property="nombre"/>
					</html-el:link>
				</h2>
			</div>
