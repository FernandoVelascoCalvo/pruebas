function firmar(datosAfirmar, formatoFirma, algoritmoHash)
{
	try
	{
		mostrarMensajeFirma();
		var algoritmo = getHashType(algoritmoHash);
		var params = null;
		if (null != algoritmo)
		{
			params = 'precalculatedHashAlgorithm=' + algoritmo;
		}
		MiniApplet.sign(datosAfirmar, algoritmoHash, formatoFirma, params, firmaCorrectaCallback, tratamientoDeErroresCallback);
	}
	catch (e)
	{
		alert("Se ha producido un error al iniciar el paso de firma del proceso de autenticación. Compruebe la compatibilidad de su equipo con el componente de firma. Mensaje de error: " + e);
		ocultarMensajeFirma();
	}
}

function getHashType(algoritmoHash)
{
	var alg = null;
	var aux = algoritmoHash.toUpperCase();
	var posicion = aux.indexOf('WITH');
	if (posicion > 0)
	{
		alg = aux.substring(0, posicion);
		if ("SHA1" == alg)
		{
			alg = "SHA";
		}
		else if ("SHA256" == alg)
		{
			alg = "SHA-256";
		}
		else if ("SHA512" == alg)
		{
			alg = "SHA-512";
		}
	}
	return alg;
}

function firmaCorrectaCallback(signatureB64)
{
	try
	{
		ocultarMensajeFirma();
		mostrarMensajeEnvio();
		var f = document.forms['autenticacionFormWeb'];
		f.datosFirmados.value = signatureB64;
		f.submit();
	}
	catch (e)
	{
		alert("Se ha producido un error al proceder a enviar la información al servidor para finalizar el proceso de autenticación. Mensaje de error: " + e);
		ocultarMensajeFirma();
		ocultarMensajeEnvio();
	}
}

function tratamientoDeErroresCallback(errorType, errorMessage)
{
	alert("Se ha producido un error en el paso de firma del proceso de autenticación. Compruebe la compatibilidad de su equipo con el componente de firma: [" + errorType +"] - [" + errorMessage + "]");
	ocultarMensajeFirma();
}

function mostrarMensajeFirma()
{
	try
	{
		document.getElementById('mensaje_firmando').style.display='block';
	}
	catch (e)
	{
		console.log("Error al mostrar la capa [mensaje_firmando]: " + e);
	}
}

function ocultarMensajeFirma()
{
	try
	{
		document.getElementById('mensaje_firmando').style.display='none';
	}
	catch (e)
	{
		console.log("Error al ocultar la capa [mensaje_firmando]: " + e);
	}
}

function mostrarMensajeEnvio()
{
	try
	{
		document.getElementById('mensaje_enviando').style.display='block';
	}
	catch (e)
	{
		console.log("Error al mostrar la capa [mensaje_enviando]: " + e);
	}
}

function ocultarMensajeEnvio()
{
	try
	{
		document.getElementById('mensaje_enviando').style.display='none';
	}
	catch (e)
	{
		console.log("Error al ocultar la capa [mensaje_enviando]: " + e);
	}
}