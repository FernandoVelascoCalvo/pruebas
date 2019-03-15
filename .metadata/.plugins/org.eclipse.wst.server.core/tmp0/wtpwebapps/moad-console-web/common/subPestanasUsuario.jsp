<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<% boolean perfilGestorUsuario = SecurityContextHelper.tienePerfil(ConstantesSecurity.MOAD_PF_ADMIN_USU); %>
			<div id="pestanas_listado">
				<ul>
					<li>
						<c:url var="enlace" value="/listadoUsuarioRoles.do">
							<c:param name="cdUsuario" value="${param.cdUsuario}"/>	
							<c:param name="idUsuarios" value="${param.idUsuarios}"/>			
						</c:url>
						<html-el:link href="${enlace}" styleClass="${tabRoles}">
							<fmt:message key="rol.subpestana"/>
						</html-el:link>
					</li>
					<li>
						<c:url var="enlace" value="/listadoUsuarioPerfiles.do">
							<c:param name="cdUsuario" value="${param.cdUsuario}"/>								
							<c:param name="idUsuarios" value="${param.idUsuarios}"/>			
						</c:url>
						<html-el:link href="${enlace}" styleClass="${tabPerfiles}">
							<fmt:message key="perfil.subpestana"/>
						</html-el:link>
					</li>
					<li>
						<c:url var="enlace" value="/listadoUsuarioEmpleos.do">
							<c:param name="cdUsuario" value="${param.cdUsuario}"/>	
							<c:param name="idUsuarios" value="${param.idUsuarios}"/>			
						</c:url>
						<html-el:link href="${enlace}" styleClass="${tabEmpleos}">
							<fmt:message key="empleo.subpestana"/>
						</html-el:link>
					</li>
					<li>
						<c:url var="enlace" value="/listadoUsuarioConfTrewa.do">
							<c:param name="cdUsuario" value="${param.cdUsuario}"/>	
							<c:param name="idUsuarios" value="${param.idUsuarios}"/>
						</c:url>
						<html-el:link href="${enlace}" styleClass="${tabConfTrewa}">
							<fmt:message key="confTrewa.subpestana"/>
						</html-el:link>
					</li>
					<% if(!perfilGestorUsuario){ %>
					<li>
						<c:url var="enlace" value="/listadoUsuarioPerfilesMoad.do">
							<c:param name="cdUsuario" value="${param.cdUsuario}"/>	
							<c:param name="idUsuarios" value="${param.idUsuarios}"/>
						</c:url>
						<html-el:link href="${enlace}" styleClass="${tabPerfilesMoad}">
							<fmt:message key="perfilMoad.subpestana"/>
						</html-el:link>
					</li>
					<%} %>
				</ul>
			</div>
