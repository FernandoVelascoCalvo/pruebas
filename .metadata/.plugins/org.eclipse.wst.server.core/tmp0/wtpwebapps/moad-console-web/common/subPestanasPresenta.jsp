<%@ include file="/common/taglibs.jsp"%>

			<div id="pestanas_listado">
				<ul>
					<li>
						<c:url var="enlace" value="/listadoVersionPresentaConvocatorias.do">
							<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>				
							<c:param name="idVersionPresenta" value="${param.idVersionPresenta}"/>				
						</c:url>
						<html-el:link href="${enlace}" styleClass="${tabConvocatorias}">
							<fmt:message key="convocatoria.subpestana"/>
						</html-el:link>
					</li>
					<li>
						<c:url var="enlace" value="/listadoVersionPresentaPlantillas.do">
							<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>				
							<c:param name="idVersionPresenta" value="${param.idVersionPresenta}"/>				
						</c:url>
						<html-el:link href="${enlace}" styleClass="${tabPlantillas}">
							<fmt:message key="plantillas.subpestana"/>
						</html-el:link>
					</li>
					<li>
						<c:url var="enlace" value="/listadoVersionPresentaAnexos.do">
							<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>				
							<c:param name="idVersionPresenta" value="${param.idVersionPresenta}"/>				
						</c:url>
						<html-el:link href="${enlace}" styleClass="${tabAnexos}">
							<fmt:message key="anexos.subpestana"/>
						</html-el:link>
					</li>
				</ul>
			</div>
