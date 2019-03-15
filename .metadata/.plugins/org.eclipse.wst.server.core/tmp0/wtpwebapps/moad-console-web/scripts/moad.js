
function setAction(base, formName, action) {
	var form = document.getElementById(formName);
	var paginacion = document.getElementsByName('paginacion')[0].value;
	var accion = document.getElementsByName('accion')[0];
	accion.value = action;
	form.action = base + paginacion;
	form.submit();
	}

function nuevoRol() {
	var form = document.getElementById('rolesForm');
	var paginacion = document.getElementsByName('paginacion')[0].value;
	document.getElementsByName('idRol')[0].value = '';
	form.action = '/pctmoad/editarRolSubmit.do' + paginacion;
	form.submit();
	}

function editarRol(idRol) {
	var form = document.getElementById('rolesForm');
	var paginacion = document.getElementsByName('paginacion')[0].value;
	document.getElementsByName('idRol')[0].value = idRol;
	document.getElementsByName('accion')[0].value = 'edit';
	form.action = '/pctmoad/editarRolSubmit.do' + paginacion;
	form.submit();
	}

function eliminarRol(idRol) {
	var form = document.getElementById('rolesForm');
	var paginacion = document.getElementsByName('paginacion')[0].value;
	document.getElementsByName('idRol')[0].value = idRol;
	document.getElementsByName('accion')[0].value = 'deleteRol';
	form.action = '/pctmoad/editarRolSubmit.do' + paginacion;
	}

function filtrarRoles(idRol) {
	var form = document.getElementById('rolesForm');
	document.getElementsByName('idRol')[0].value = '';
	document.getElementsByName('accion')[0].value = '';
	document.getElementsByName('paginacion')[0].value = '';
	form.submit();
	}

function submitRol() {
    var form = document.getElementById('editarRolForm');
    var paginacion = document.getElementsByName('paginacion')[0].value;
    form.action = '/pctmoad/editarRolSubmit.do' + paginacion;
    form.submit();
	}
	
function volver() {
	history.back(1);
	}
