# Curamba Travel — Registro de sesiones

## Sesión 18/11/2026 (10:25 p. m. – 11:26 p. m., hora de Lima) — cerrada con "nos vemos al rato"

**Hecho**
- Revisión de la carpeta del proyecto y resumen del estado (plugin v2.8.3, auditoría de lanzamiento).
- Ayuda para encender el sitio local con `Iniciar Curamba (local).bat` (servidor arrancó; la portada tardaba en cargar).
- v2.8.4 — vuelo 3D entregado a la GPU, fotos con tope de 2560 px, luces de la escena sin recálculo de estilos.
  Probado en una réplica de la portada en un navegador de pruebas: mismas escenas, sin errores, sin pérdida de cuadros con la página ocupada.
- Fotos de las escenas regeneradas en alta calidad (17 archivos en `curamba-cinematic\assets\photos\prueba\`).
- v2.8.5 — pirámide subida en la portada (PC y celular).

**Archivos modificados** (dentro de `curamba-cinematic\`)
- `curamba-cinematic.php` (versión 2.8.3 → 2.8.5)
- `assets\js\curamba-cinematic.js` (vuelo en GPU)
- `assets\css\curamba-cinematic.css` (luces, posición de la foto de portada en PC y celular)
- `includes\helpers.php` (tope 2560 px; foto de portada grande en celular)
- `assets\photos\prueba\*-2560.webp`, `*-1600.webp`, `*-900.webp` (alta calidad)

**Respaldos creados**
- `respaldo-plugin-v2.8.3\` (antes del vuelo en GPU)
- `respaldo-plugin-v2.8.4\` (antes de subir la pirámide)
- `respaldo-fotos-originales\antes-calidad-max\` (fotos previas)

- Creados `CURAMBA_TRAVEL_MEMORY.md` y este registro; confirmada "base de datos CURAMBA" como única carpeta autorizada.

**Problemas abiertos**
- La portada se quedó "cargando" en Brave la primera vez (sin diagnosticar; probable lentitud del servidor local).
- Cambios aún no confirmados en la PC ni en un teléfono real.

**Pendiente / próximo paso**
- Que piero pruebe en su PC y en el celular (Ctrl+F5) y confirme fluidez y posición de la pirámide.
- Decidir si se rediseñan las páginas de producto, carrito y checkout.

## Sesión 19/11/2026 (10:25 p. m. – 10:35 p. m., hora de Lima)

**Hecho**
- piero dio permiso de trabajo de código. Cambio de marca "Curamba Travel" → **QHAPAQ ÑAN TRAVEL** (plugin v2.9.0).
- Búsqueda: en el código solo aparecía en un ejemplo de razón social; el nombre visible venía del título del sitio en la base de datos
  (`blogname` y el kit de Elementor). Se resolvió con `includes\brand.php` (cambio único al cargar el sitio), sin tocar el archivo de la base de datos
  (el servidor local estaba encendido).
- Portada 3D: nueva línea "QHAPAQ ÑAN TRAVEL · Tradición Andina Viva" (editable en Elementor, campo "Marca"), subtítulo, etiquetas y botones
  de CINADE; escena 2 con texto de presentación y datos (1 día, desde S/ 145); escena 3 con texto nuevo.
- Chat: nombre y saludo con la marca; respuestas nuevas de precios, ruta y horarios (CINADE). Pie y WhatsApp con mensaje con la marca.
- SEO: título "QHAPAQ ÑAN TRAVEL | Curamba: Tradición Andina Viva", meta descripción y Open Graph en la portada.

**Archivos modificados** (dentro de `curamba-cinematic\`)
- `curamba-cinematic.php`, `includes\helpers.php`, `render.php`, `class-elementor-widget.php`, `chatbot.php`, `legal.php`, `settings.php`,
  `assets\css\curamba-cinematic.css`; nuevo `includes\brand.php`.

**Respaldo:** `respaldo-plugin-v2.8.5\`

**Pendiente / próximo paso**
- Que piero recargue (Ctrl+F5) y revise portada, chat y pie en PC y celular.
- Actualizar productos de WooCommerce a las 4 modalidades y precios CINADE; logotipo, favicon y colores.
- Datos que debe dar piero: WhatsApp Business, correo comercial, forma de pago del adelanto, política de cancelación, RUC y razón social.
- Si el chat ya se guardó antes en Ajustes → Asistente, sus textos guardados mandan sobre los nuevos (hoy no había nada guardado).

### Misma sesión, 10:40 p. m. — v2.9.1 (look natural)
- Fotos de escenas regeneradas con tono natural (17 archivos en `assets\photos\prueba\`). Respaldo: `respaldo-fotos-originales\antes-natural\`.
- CSS: velos de color y luz del sol más suaves; foto de la escena 2 al 100 % (antes 55–60 % sobre degradado de color).
- Foto nueva de la plataforma corregida y puesta en el 4.º mosaico (escena 3). Respaldo del código: `respaldo-plugin-v2.9.0\`.
- Pendiente: que piero confirme si "cuarto mosaico" era el 4.º recuadro de la escena 3 o el fondo de la escena 4 (carrusel).

## Sesión 20/11/2026 (10:25 a. m., hora de Lima) — v2.9.2
- piero aprobó ("ejecútalo") pasar los productos a las 4 modalidades de CINADE. Hecho en `includes\brand.php` (cambio único al abrir la web).
- Respaldo: `respaldo-plugin-v2.9.1\` (código anterior y copia de la base de datos).
- Pendiente: que piero abra la web una vez y revise Productos; fotos y fechas reales de cada modalidad; foto para Salida privada.

## Sesión 21/11/2026 (9:09 a. m., hora de Lima) — v2.9.3
- "hola, continuamos": se leyó la memoria y se resumió el estado (v2.9.2).
- piero mandó captura del buscador: precio y botón "Reservar" se salían de las tarjetas. Arreglado en v2.9.3
  (`assets\css\curamba-cinematic.css`, `assets\js\curamba-cinematic.js`, `curamba-cinematic.php`). Respaldo: `respaldo-plugin-v2.9.2\`.
- Probado en una réplica con el mismo error forzado (PC, tablet y celular): tarjetas simétricas, nada fuera del cuadro.
- Pendiente: que piero recargue con Ctrl+F5 y confirme; foto para "Salida privada" (hoy muestra el ícono vacío de WooCommerce).
- v2.9.4: "Salida privada" (y cualquier producto sin foto) usa la foto del mirador en carrusel y buscador (`includes\helpers.php`).
  Respaldo: `respaldo-plugin-v2.9.3\`. Búsqueda de fotos libres en internet bloqueada desde la sesión.
- v2.9.5 (preparada 21/11, ~10:30 a. m.): fotos de internet (Wikimedia Commons, licencias libres) para los mosaicos de la escena 3.
  Caminatas = valle de Huacarama (Phao25, CC BY 4.0); Gastronomía = pachamanca sobre manta andina (Stanglavine, CC BY-SA 4.0);
  Experiencias comunitarias = tejedora andina en telar (Yanela Ccalluco Vargas, CC BY-SA 4.0); Fotografía y naturaleza = alpacas
  pastando (Pedro Gandulias Osorio, CC BY-SA 4.0); Tours privados = vista de Andahuaylas (AgainErick, CC BY-SA 3.0).
  Turismo cultural se queda con la foto propia de la plataforma. Bajo los mosaicos sale una línea de créditos (obligatoria por licencia).
  Archivos: `curamba-cinematic.php`, `includes\helpers.php`, `includes\render.php`, `assets\css\curamba-cinematic.css`,
  nuevas `assets\photos\web\*.webp` (1200×900). Respaldo previsto: `respaldo-plugin-v2.9.4\`.
  Estado: lista y probada en réplica (PC y celular); falta copiarla a la PC de piero cuando su computadora vuelva a estar conectada.

## Sesión 21/11/2026 (10:42 a. m., hora de Lima) — pasarela de pagos
- piero eligió Yape/Plin/transferencia manual como primera forma de pago (tarjeta después, cuando haya RUC).
- Se le pidieron: números de Yape/Plin, cuenta bancaria y CCI de la empresa, cómo cobrar el adelanto del 50 %, a dónde se envía la constancia.
- Próximo paso: con esos datos, configurar "Transferencia bancaria" en WooCommerce del sitio de prueba (piero inicia sesión en /wp-admin/).
- v2.9.6 (instalada 21/11, ~11:20 a. m.): fotos de internet para las tarjetas de Experiencias. Curamba + Sotccmayo = chacras de zapallo en el
  valle del río Sotccomayo (okerlen, CC BY 3.0); Curamba Educativo = estudiantes en taller de arqueología (Escuela de Nivín, CC BY-SA 4.0);
  Salida privada = pueblo en el valle, prov. de Andahuaylas (okerlen, CC BY 3.0). Curamba Esencial sigue con su foto propia (en internet
  solo hay un grabado antiguo de Curamba). Créditos bajo el carrusel. Archivos: `curamba-cinematic.php`, `includes\helpers.php`,
  `includes\render.php`, nuevas `assets\photos\web\{sotccmayo,educativo-aula,salida-privada}-900.webp`. Respaldo: `respaldo-plugin-v2.9.5\`.
  Pendiente: Ctrl+F5 y revisar; fotos propias de Sotccmayo y de grupos escolares cuando existan.
- v2.9.7 (instalada 21/11, ~12:25 p. m.): portada rediseñada con estilo sobrio (referencia Pacucha Glamping). Solo CSS
  (`assets\css\curamba-cinematic.css`) y versión en `curamba-cinematic.php`. Respaldo: `respaldo-plugin-v2.9.6\`.
  Pendiente: Ctrl+F5 y revisar; pedir a piero la foto original de la portada para quitar el aspecto suavizado de las nubes.
- v2.9.8 (instalada 21/11, ~12:40 p. m.): piero vio el pasto de la portada borroso/pixelado alrededor de textos y botones.
  Se agregó un velo parejo con grano fino sobre la foto y se quitó la mancha oscura detrás del texto. Archivos: `curamba-cinematic.php`,
  `includes\render.php`, `assets\css\curamba-cinematic.css`. Respaldo: `respaldo-plugin-v2.9.7\`. Vuelo 3D probado, sin cambios.
- v2.9.9 (instalada 21/11, ~12:25 p. m.): "mejóralo un poco más". Pasto del primer plano con desenfoque gradual (efecto de
  profundidad de campo) y velo inferior más oscuro. Archivos: `curamba-cinematic.php`, `assets\css\curamba-cinematic.css`,
  `assets\photos\prueba\curamba-campo-primer-plano-{1600,2560}.webp`. Respaldo: `respaldo-plugin-v2.9.8\`.
- v2.9.10 (instalada 21/11, ~12:35 p. m.): piero mandó un video; la foto de portada se movía descoordinada con el cursor (cielo y pasto
  en direcciones opuestas). Ahora se mueve toda junta. Archivo: `assets\js\curamba-cinematic.js` y versión. Respaldo: `respaldo-plugin-v2.9.9\`.
- 21/11 ~12:30 p. m.: se guió a piero para abrir la web en el celular (link http://IP-de-la-PC:8080/, perfil de red "Privada").
- v2.9.11 (instalada 21/11, ~12:50 p. m.): mensajes de WhatsApp más amigables y con emojis. Archivos: `curamba-cinematic.php`,
  `includes\helpers.php`, `includes\booking.php`, `includes\settings.php`, `assets\js\curamba-chat.js`. Respaldo: `respaldo-plugin-v2.9.10\`.
- 21/11 ~12:43 p. m.: piero decidió que, por ahora, el cobro será solo con Yape (número y QR). Se le pidieron número, titular, imagen del QR,
  adelanto o total, y canal de la constancia. Próximo paso: configurar el método "Yape" en WooCommerce del sitio de prueba.

## Sesión 21/11/2026 (2:20 p. m., hora de Lima) — plan de seguridad
- piero pidió asegurar la web "con todo el repositorio ECC". Se revisó ECC: es un kit para Claude Code (agentes, revisión de código),
  no protege un WordPress. No se instaló ni se usó, por las instrucciones de cuenta (sin código, sin subagentes).
- Se creó `PLAN-SEGURIDAD.md` con 4 prioridades: contraseña + 2FA, actualizaciones, copias, firewall; checkout/Yape; hosting; plugin propio.
- No se modificó ningún archivo del sitio ni del plugin.
- Próximo paso: que piero elija si lo guío paso a paso por la Prioridad 1 en /wp-admin/.

## Sesión 21/11/2026 (3:21–3:45 p. m., hora de Lima) — pasarela Yape configurada
- Datos de Kev: titular Kevin Renelmo Altamirano Villena, adelanto 50 %, constancia por WhatsApp 933 920 638.
- Configurado en el panel (navegador de la app de Claude, sesión iniciada por Kev): método «Yape» activo, transferencia bancaria desactivada.
- QR copiado a `wp-prueba\site\wp-content\uploads\yape\yape-qr.png`; en las Instrucciones (gracias + correo).
- Comprobado: el checkout muestra solo Yape con su texto. No se pudo enviar el pedido de prueba desde el navegador de Claude (el formulario no tomó los datos).
- Pendiente: que Kev haga una reserva de prueba y confirme que el QR se ve en la página de gracias; escanear el QR con Yape antes de lanzar;
  en el carrito del navegador de Claude quedó «Curamba Esencial» (10/01/2027).

## Sesión 21/11/2026 (~3:55–4:10 p. m., hora de Lima) — velocidad
- Kev pidió navegación rápida ("haz lo necesario"). Medido en el sitio local desde el navegador de la app de Claude.
- Respaldo: `respaldo-velocidad-2026-11-21\base-de-datos-antes-velocidad.sqlite`.
- Desactivados (no borrados): Jetpack, MailPoet, WooCommerce PayPal Payments, Google for WooCommerce, Reddit for WooCommerce,
  Snapchat for WooCommerce. Coordinado con el hilo de seguridad (de acuerdo). Comprobado: sin errores de PayPal en el carrito, Yape activo.
- Nuevo `GUIA-VELOCIDAD.md`: servidor local vs. web, prueba en ventana privada, hosting recomendado, caché y Cloudflare al lanzar.
- Sin cambios en el código del plugin (instrucciones de cuenta: sin código).
- Pendiente: que Kev pruebe una reserva completa (experiencia → carrito → checkout → Yape) en ventana privada; borrar los plugins
  desactivados junto con el plan de seguridad; elegir hosting.
- 21/11 ~4:05 p. m.: Kev pidió ("haz lo") la reserva de prueba completa. Hecha en el navegador de la app de Claude (con sesión de admin,
  porque el sitio está en «Próximamente»): Curamba Esencial, 24/01/2027, 1 persona, pago Yape → pedido n.º 37 creado, página de gracias
  con instrucciones y QR de Yape visibles. Tiempos aproximados: tienda ~3 s, producto ~2 s, añadir al carrito ~3 s, checkout ~4 s,
  realizar pedido hasta la página de gracias ~5–8 s. Luego pedido 37 cancelado (cupo devuelto: 24/01 vuelve a 10) y enviado a la papelera.
- 21/11 ~4:10 p. m.: Kev pidió ("haz lo") pasar el sitio a visible. WooCommerce → Visibilidad del sitio: «Próximamente» → «Visible». Falta que Kev compruebe la tienda en una ventana privada (el navegador de Claude tiene su sesión de admin).
- v2.9.12 (instalada 21/11, ~4:30 p. m.): vuelo entre escenas más pausado (2,1 s en vez de 1,3 s). Archivos: `curamba-cinematic.php`,
  `includes\helpers.php`, `includes\render.php`, `assets\js\curamba-cinematic.js`. Respaldo: `respaldo-plugin-v2.9.11\`.
