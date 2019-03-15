<%@ include file="/common/taglibs.jsp"%>

			<div id="pestanas_listado">
				<ul>
					<li>
						<c:url var="enlace" value="/listadoConvocatoriaPerfiles.do">
							<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
							<c:param name="idOrden" value="${param.idOrden}"/>
							<c:param name="idConvocatoria" value="${param.idConvocatoria}"/>
						</c:url>
						<html-el:link href="${enlace}" styleClass="${tabPerfiles}">
							<fmt:message key="perfil.subpestana"/>
						</html-el:link>
					</li>
				</ul>
			</div>
