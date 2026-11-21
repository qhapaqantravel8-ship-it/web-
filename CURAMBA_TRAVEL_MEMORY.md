# Curamba Travel — Memoria del proyecto

_Última actualización: 21/11/2026, 9:30 a. m. (hora de Lima)_

> **Nueva marca (19/11/2026): QHAPAQ ÑAN TRAVEL** (con Ñ). Producto principal: *Curamba: Tradición Andina Viva*.
> Fuente oficial de textos y precios: documento CINADE 2026 (resumen en `QHAPAQ-NAN-TRAVEL-textos-web.md` de la carpeta compartida del proyecto).
> piero autorizó trabajo de código para este proyecto (19/11/2026).

## Rutas autorizadas
- **Única carpeta autorizada:** `Escritorio\base de datos CURAMBA` (confirmado por piero el 18/11/2026).
  Ahí están el plugin, el sitio local y la base de datos. Para cualquier otra ubicación hay que pedir autorización.
- No se trabaja fuera de esa carpeta. No se sigue el enlace simbólico `wp-prueba\site\wp-content\plugins\curamba-cinematic`
  (apunta a `curamba-cinematic\` de esta misma carpeta: los cambios se hacen directamente allí).
- `CONTRASENA-ADMIN.txt` (en el Escritorio, fuera del proyecto): no se abre ni se toca.

## Qué es
Web de la agencia **Curamba Travel** (experiencias turísticas en Curamba, Andahuaylas, Apurímac).
WordPress + Elementor + WooCommerce, con el plugin propio **curamba-cinematic** (portada 3D con "vuelo" entre escenas,
carrusel y buscador de experiencias, reservas por fecha y cupos, WhatsApp +51 933 920 638, chat de ayuda,
Libro de Reclamaciones, privacidad y términos, GA4, opiniones de testers).

## Estructura de la carpeta
- `curamba-cinematic\` — el plugin (código fuente principal). Versión actual: **2.9.4** (la 2.9.5 está lista y probada, pendiente de copiar a la PC).
- `wp-prueba\` — sitio WordPress local (PHP portátil + SQLite). Se abre con `Iniciar Curamba (local).bat`
  → http://127.0.0.1:8080/ (panel: /wp-admin/; celular en el mismo Wi-Fi: http://192.168.10.20:8080/).
  Es lento (8–20 s por página); la ventana negra debe quedar abierta.
- `AUDITORIA-LANZAMIENTO.md` — lista de pendientes antes de lanzar (fuente principal de tareas).
- `respaldo-fotos-originales\`, `respaldo-plugin-v2.8.3\`, `respaldo-plugin-v2.8.4\`, `respaldo-plugin-v2.8.5\`, `respaldo-plugin-v2.9.0\`, `respaldo-plugin-v2.9.1\` (incluye copia de la base de datos antes de cambiar productos), `respaldo-plugin-v2.9.2\`, `respaldo-plugin-v2.9.3\`, `respaldo-fotos-originales\antes-natural\` — respaldos.
- `vista-previa\` — vista previa HTML antigua (no refleja la versión actual).

## Decisiones tomadas
- **Vuelo 3D en la GPU (v2.8.4):** al despegar se calcula todo el recorrido y se entrega al navegador como animaciones
  Web Animations (solo transform/opacity). Así no se traba aunque la página esté ocupada.
- **Fotos con tope de 2560 px** (v2.8.4): la de 4000 px ocupaba ~42 MB de memoria gráfica y daba tirones.
- **Fotos regeneradas en alta calidad** desde los originales de 4000 px (WebP calidad 92, enfoque suave).
  El siguiente salto de calidad requiere fotos de cámara originales (las de prueba ya venían agrandadas con IA).
- **Pirámide visible en la portada** (v2.8.5): la foto de portada se subió para que la pirámide quede entre el título
  y los textos, en PC y celular; en celular se pide la foto de 2560 px.
- **Marca en el código (v2.9.0):** `includes\brand.php` cambia una sola vez el título del sitio a "QHAPAQ ÑAN TRAVEL" y la descripción
  corta (opción `curamba_cc_brand_done`), y pone título, meta descripción y Open Graph en la portada (se desactiva si hay Yoast/Rank Math).
  El nombre en pie de página, páginas legales y correos sale del título del sitio (Ajustes → Generales).
- **Precios oficiales (CINADE):** Curamba Esencial S/ 145 · Curamba + Sotccmayo S/ 185 · Curamba Educativo desde S/ 155 (15+ personas)
  · Salidas privadas por cotización · adelanto del 50 %. No inventar formas de pago ni usar números personales del documento.
- **Look natural (v2.9.1):** las fotos de prueba traen de origen un filtro HDR fuerte (cielo azul eléctrico, halos). Se corrigieron con
  un ajuste suave (menos saturación en azules, menos contraste, sin enfoque artificial) y se quitaron/aclararon los velos de color del CSS
  (escena 2 ya no tiñe la foto de verde-azul, velos neutros más suaves, sol y brillo más tenues). Mejor solución futura: fotos de cámara sin filtro.
- Foto nueva de la plataforma (de piero) en el 4.º mosaico de la escena 3 ("Experiencias comunitarias"): `curamba-plataforma-nueva-900/1440.webp`
  (original de solo 956 px; se ve bien en mosaico, no alcanza para fondo a pantalla completa).
- **Productos = modalidades CINADE (v2.9.2):** `brand.php` los cambia una sola vez al abrir la web (opción `curamba_cc_products_done`),
  solo si el producto aún tiene su nombre de prueba: Experiencia principal → Curamba Esencial (S/ 145), Ruta cultural → Curamba + Sotccmayo
  (S/ 185, 9 h), Ruta de naturaleza → Curamba Educativo ("Desde S/ 155", meta `_cc_precio_desde`), Experiencia gastronómica → Salida privada
  (sin precio = "Precio por cotización"). "Tour por los alrededores de Andahuaylas" quedó como borrador (no eliminado).
  Se borró la dificultad (no hay dato oficial). Se mantuvieron fotos y fechas de prueba.
- **Tarjetas del buscador ordenadas (v2.9.3):** foto y textos arriba; precio y botón "Reservar" en una franja propia abajo, del ancho de la tarjeta,
  alineada igual en todas. Tamaño del precio fijo (el estilo de WooCommerce lo agrandaba y sacaba el botón del cuadro).
- **Productos sin foto (v2.9.4):** en el carrusel y el buscador muestran la foto del mirador de Curamba (`mini-mirador`) en vez del ícono vacío
  de WooCommerce. Hoy aplica a "Salida privada". La página del producto sigue sin foto hasta que se le asigne una en WooCommerce.
  No se pudo bajar fotos de internet desde la sesión (Wikimedia Commons bloqueado por la red de la sesión).
- **Forma de pago (21/11/2026, actualizado 12:43 p. m.):** por ahora SOLO Yape (número y código QR). Plin y transferencia quedan fuera.
  Se configurará desde el panel de WooCommerce como método de pago manual "Yape" (pedido en espera hasta que piero confirme el pago).
  Tarjeta más adelante, cuando haya RUC. Pendiente de piero: número y titular de Yape, imagen del QR, si se cobra el adelanto del 50 % o el total,
  y a dónde se envía la constancia. piero inicia sesión él mismo en /wp-admin/.
- Antes de cambiar archivos se guarda copia en una carpeta `respaldo-…` dentro del proyecto.

## Pendientes (prioridad)
0. Marca: recargar la portada (Ctrl+F5) y comprobar título, línea "QHAPAQ ÑAN TRAVEL", chat y pie. Revisar en celular que la línea nueva
   no tape la pirámide. Productos: comprobar en Productos (WooCommerce) que quedaron las 4 modalidades; poner fotos y fechas reales.
   Falta: logotipo y favicon nuevos, colores CINADE, WhatsApp Business de la empresa, forma de pago del adelanto, política de cancelación.
1. Confirmar en la PC y en un teléfono real que el vuelo va fluido y que la pirámide se ve bien (Ctrl+F5).
2. Diagnosticar por qué la portada se quedó "cargando" en Brave la primera vez (posible lentitud del servidor local de PHP).
3. ¿Rediseñar las páginas de producto, carrito, checkout y Mi cuenta con el estilo de la portada? (se le preguntó a piero; sin respuesta).
4. Pendientes de `AUDITORIA-LANZAMIENTO.md`: datos de la empresa (RUC, razón social, MINCETUR), textos de relleno entre corchetes,
   respuestas del chat, fotos definitivas con permiso, descripciones de experiencias, pasarela de pago (Yape/Plin/tarjeta),
   hosting + dominio + SSL + correo SMTP, SEO (meta, favicon, enlaces permanentes, páginas en español), copias de seguridad,
   cambiar la contraseña del administrador y activar 2FA.
5. No hay repositorio de GitHub. Para crearlo: conectar GitHub, crear un repo privado vacío (p. ej. `curamba-cinematic`)
   y subir solo la carpeta del plugin.

## Errores conocidos
- El sitio local es muy lento (servidor de pruebas de PHP + SQLite); no representa el hosting real.
- La primera carga en Brave se quedó en blanco "cargando"; no se llegó a diagnosticar.
- La "pantalla en blanco entre escenas" en celular (auditoría) sigue sin confirmarse en un teléfono real.

## Fotos de internet (desde v2.9.5)
- Mosaicos de la escena 3 usan fotos de Wikimedia Commons en `assets\photos\web\` (créditos en `curamba_cc_photo_credits()` de `includes\helpers.php`).
- Las licencias CC BY / CC BY-SA exigen mostrar autor y licencia: no quitar la línea `.cc-credits` bajo los mosaicos.
- Descarga: Wikimedia limita mucho los originales (error 429); usar miniaturas de 1280 o 1920 px.
- Desde v2.9.6 las tarjetas de Experiencias (carrusel y buscador) usan fotos de internet por slug, y mandan sobre la imagen de WooCommerce:
  `curamba-sotccmayo` = chacras del valle del río Sotccomayo, `curamba-educativo` = taller escolar de arqueología (Escuela de Nivín),
  `salida-privada` = pueblo en el valle (prov. de Andahuaylas). Mapa en `curamba_cc_product_web_photo()` (`includes\helpers.php`);
  quitar una línea devuelve la foto subida en WooCommerce. Curamba Esencial conserva su foto propia de la plataforma.
- La foto de Educativo muestra estudiantes reales: cuando haya fotos propias de grupos escolares (con permiso), reemplazarla.
- Estilo de portada (desde v2.9.7, pedido por piero con referencia de Pacucha Glamping): sobrio y profesional. Foto oscurecida con filtro,
  título CURAMBA en Montserrat 800 blanco con letras espaciadas, lema en mayúsculas finas, línea separadora, etiquetas como texto
  con separadores y botones rectos (blanco sólido + contorno blanco). Bloque al final de `assets\css\curamba-cinematic.css`.
- Ojo: en modo cinemático el JS saca las capas de `.cc-ch1`, así que los selectores `.cc-ch1 .x` no aplican en PC; usar `.cc-intro .x`.
- La foto de portada (curamba-campo) ya viene suavizada desde el origen (todas las versiones guardadas). Para nitidez real hace falta
  la foto original de cámara/celular sin procesar.
- Desde v2.9.8 la portada lleva un velo parejo `.cc-hero-shade` (capa 3D a profundidad 0, en `includes\render.php`) con degradado
  oscuro hacia abajo y grano fino: tapa el pasto suavizado de la foto. Ya no se usa la mancha oscura detrás del texto.
- Desde v2.9.9 el primer plano de la portada (`curamba-campo-primer-plano-1600/2560.webp`) tiene un desenfoque gradual hacia abajo,
  como profundidad de campo, para que el pasto se vea parejo. Originales en `respaldo-plugin-v2.9.8\assets\photos\prueba\`.
- Desde v2.9.10 el movimiento con el mouse en la portada desplaza cielo y primer plano juntos, la misma distancia en pantalla
  (se compensa la profundidad de cada capa). piero no quiere que las capas de la foto se muevan distinto.
- Mensajes de WhatsApp (desde v2.9.11): tono cálido, con emojis y saltos de línea. General: "¡Hola, QHAPAQ ÑAN TRAVEL! 👋🏔️ ...";
  por experiencia: nombre en *negrita*, más líneas para 📅 fecha y 👥 personas. Textos en `curamba_cc_default_settings()`
  (`wa_message`, `wa_product_msg`); `curamba_cc_wa_product_text()` los usa en la página de producto y el botón flotante global.
  Si Elementor tenía guardado el texto viejo exacto, se reemplaza solo por el nuevo. El asistente (curamba-chat.js) usa los mismos.

## Seguridad (21/11/2026)
- Plan priorizado en `PLAN-SEGURIDAD.md` (raíz de la carpeta del proyecto). Todo con pasos en el panel, sin código.
- Repositorio ECC (affaan-m/ECC, "everything-claude-code"): es un kit de agentes/skills para Claude Code, NO una herramienta de seguridad
  de WordPress. Usarlo implica código y varios agentes, que las instrucciones de cuenta de piero no permiten. Solo se tomó su lista de control.
  Ojo: hay copias falsas con malware; usar solo la cuenta original.
- Herramientas elegidas: Two Factor (2FA), UpdraftPlus (copias), Wordfence (firewall/escáner), Simple Cloudflare Turnstile (anti-bots),
  Akismet (reseñas). Yape: nunca confirmar pedidos por captura; verificar en la app.
- El servidor local se ve desde todo el Wi-Fi: usarlo solo en la red de casa.
