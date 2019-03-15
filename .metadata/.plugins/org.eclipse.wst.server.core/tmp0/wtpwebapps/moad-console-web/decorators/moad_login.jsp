<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
        <%@ include file="/common/meta.jsp" %>
        <title><decorator:title/></title>
        <link rel="stylesheet" type="text/css" media="all" href="<c:url value='/css/moad-global.css'/>" />
        <script type="text/javascript" src="<c:url value='/scripts/horaActual.js'/>"></script>
        <decorator:head/>
    </head>

	<body<decorator:getProperty property="body.id" writeEntireProperty="true"/><decorator:getProperty property="body.class" writeEntireProperty="true"/>>

		<div id="cabecera">
			<jsp:include page="/common/cabecera.jsp"/>
		</div>

		<div id="cuerpo">

			
			<div id="login">
			
				<!-- se inserta el cuerpo de la vista que se debe mostrar -->
				<decorator:body/>
			</div>
			
		</div>

		<div id="pie">
			<jsp:include page="/common/pie.jsp"/>
		</div>
	</body>
</html>
        