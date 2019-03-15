<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>

			<div id="pestanas_listado">
				<ul>
					<li>
						<c:url var="enlace" value="/listadoProcedimientoConfiguraciones.do">
							<pctmoad:param nombre="idProcedimiento"/>				
						</c:url>
						<html-el:link href="${enlace}" styleClass="${tabConfiguraciones}">
							<fmt:message key="configuracion.subpestana"/>
						</html-el:link>
					</li>
					<li>
						<c:url var="enlace" value="/listadoProcedimientoOrdenes.do">
							<pctmoad:param nombre="idProcedimiento"/>				
						</c:url>
						<html-el:link href="${enlace}" styleClass="${tabOrdenes}">
							<fmt:message key="orden.subpestana"/>
						</html-el:link>
					</li>
					<li>
						<c:url var="enlace" value="/listadoProcedimientoListados.do">
							<pctmoad:param nombre="idProcedimiento"/>				
						</c:url>
						<html-el:link href="${enlace}" styleClass="${tabListados}">
							<fmt:message key="listado.subpestana"/>
						</html-el:link>
					</li>
					<li>
						<c:url var="enlace" value="/listadoProcedimientoTiposCertificado.do">
							<pctmoad:param nombre="idProcedimiento"/>				
						</c:url>
						<html-el:link href="${enlace}" styleClass="${tabTiposCertificado}">
							<fmt:message key="tipoCertificado.subpestana"/>
						</html-el:link>
					</li>
					<li>
						<c:url var="enlace" value="/listadoProcedimientoVersionesPresenta.do">
							<pctmoad:param nombre="idProcedimiento"/>				
						</c:url>
						<html-el:link href="${enlace}" styleClass="${tabVersionesPresenta}">
							<fmt:message key="versionesPresenta.subpestana"/>
						</html-el:link>
					</li>
					<li>
						<c:url var="enlace" value="/listadoProcedimientoDocumentos.do">
							<pctmoad:param nombre="idProcedimiento"/>				
						</c:url>
						<html-el:link href="${enlace}" styleClass="${tabDocumentos}">
							<fmt:message key="documentos.subpestana"/>
						</html-el:link>
					</li>
					<% if(modoEdicion){%>
					<li>
						<c:url var="enlace" value="/chequearIntegridad.do">
							<pctmoad:param nombre="idProcedimiento"/>				
						</c:url>
						<html-el:link href="${enlace}" styleClass="${tabChequearIntegridad}">
							<fmt:message key="chequearIntegridad.subpestana"/>
						</html-el:link>
					</li>
					<%} %>
					<li>
						<c:url var="enlace" value="/listadoProcedimientoTramites.do">
							<pctmoad:param nombre="idProcedimiento"/>				
						</c:url>
						<html-el:link href="${enlace}" styleClass="${tabTramites}">
							<fmt:message key="tramites.subpestana"/>
						</html-el:link>
					</li>
				</ul>
			</div>
