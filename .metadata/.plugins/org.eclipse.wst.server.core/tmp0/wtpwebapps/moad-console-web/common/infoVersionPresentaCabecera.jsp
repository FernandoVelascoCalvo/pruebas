<%@ include file="/common/taglibs.jsp"%>

			<!-- Información de la Version Presenta-->
			<div class="cabeceraMedio">
				<c:url var="nuevoURL" value="/listadoVersionPresentaConvocatorias.do">
					<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
					<c:param name="idVersionPresenta" value="${param.idVersionPresenta}"/>				
				</c:url>
				<h2>
					<html-el:link href="${nuevoURL}">
						<strong>Version Presenta: </strong> <bean:write name="versionPresenta" property="codigo"/>
					</html-el:link>
				</h2>
			</div>
