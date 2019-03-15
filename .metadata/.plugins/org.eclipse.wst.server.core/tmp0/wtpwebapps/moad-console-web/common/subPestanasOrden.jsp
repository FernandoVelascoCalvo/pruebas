<%@ include file="/common/taglibs.jsp"%>

			<div id="pestanas_listado">
				<ul>
					<li>
						<c:url var="enlace" value="/listadoOrdenConvocatorias.do">
							<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
							<c:param name="idOrden" value="${param.idOrden}"/>
						</c:url>
						<html-el:link href="${enlace}" styleClass="${tabConvocatorias}">
							<fmt:message key="convocatoria.subpestana"/>
						</html-el:link>
					</li>
				</ul>
			</div>
