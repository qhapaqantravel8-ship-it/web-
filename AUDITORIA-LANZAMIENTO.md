# Auditoría para el lanzamiento — Curamba Travel

Revisión del 6 de noviembre de 2026 · plugin curamba-cinematic v2.6.1 · sitio de prueba local (WordPress + Elementor + WooCommerce)

Marca cada punto con `[x]` cuando quede resuelto.

---

## ✅ Lo que ya funciona bien
- **Reservas por fecha y cupos**: probadas. Rechaza reservas sin fecha, con fechas inexistentes y por encima de los cupos (también si alguien cambia la cantidad desde el carrito).
- **Buscador**: trae experiencias reales y los filtros responden.
- **Carrusel de experiencias, botones de WhatsApp (número +51 933 920 638) y chat de ayuda**: funcionan en PC y en celular.
- **Seguridad del panel**: un solo administrador, bloqueo tras 5 intentos fallidos, lista de usuarios oculta, sin editor de código.
- **Código del plugin**: ordenado, con los datos limpios y bien escapados. No encontré vulnerabilidades graves.
- **No se sale de la pantalla en celular** (sin barra de desplazamiento lateral).

---

## 🔴 Prioridad 1 — Imprescindible antes de lanzar

### Contenido y legal
- [x] **Libro de Reclamaciones virtual.** *(v2.7.0)* Formulario con los campos de la hoja de reclamación (reclamo o queja), número correlativo por año, copia por correo al cliente y a la agencia, registro en el panel (*Reclamaciones*) con plazo de 15 días hábiles y respuesta por correo. Protegido contra spam. Probado en local.
- [x] **Páginas de privacidad y términos.** *(v2.7.0)* Creadas con un borrador completo (datos personales según la Ley 29733, reservas, pagos, cancelaciones y fuerza mayor) y enlazadas al checkout.
- [x] **Pie de página.** *(v2.7.0)* Contacto, enlaces legales y botón del Libro de Reclamaciones en toda la web (incluida la portada). Se ocultó el pie de ejemplo del tema.
- [ ] **Completar en *Ajustes → Curamba → Datos de la empresa*:** razón social, RUC, domicilio fiscal, correo de atención, registro de agencia (MINCETUR/DIRCETUR) y redes sociales.
- [ ] **Completar en los Términos** lo que está entre corchetes: adelanto o pago total, IGV, medios de pago, boleta o factura, porcentajes y plazos de cancelación y reembolso, mínimo de participantes.
- [ ] **Hacer revisar ambos textos por un abogado** antes del lanzamiento.
- [ ] **En el hosting:** configurar el envío de correos (WP Mail SMTP) y probar que llega la copia del reclamo.
- [ ] **Verificar con un contador o abogado** si te corresponde inscribir el banco de datos ante la Autoridad de Protección de Datos Personales y reportar los reclamos en el SIREC de INDECOPI (depende del tamaño de la empresa).
- [ ] **Textos de relleno a la vista**: "[DATO DESTACADO]", "[INFORMACIÓN DEL DESTINO]", el texto de la escena 2 y "Texto de prueba" en las 5 experiencias.
- [ ] **Respuestas del chat**: 5 de las 6 preguntas frecuentes responden con un texto de relleno entre corchetes (formas de pago, horarios, cómo llegar…). Se completan en *Ajustes → Asistente Curamba*.
- [ ] **Fotos definitivas** con permiso de uso. La experiencia "Gastronómica" no tiene foto.
- [ ] **Descripción larga en cada experiencia** (itinerario, qué incluye y qué no, punto de encuentro). Hoy la pestaña solo muestra "Valoraciones".

### Pagos
- [ ] **Solo está activa la transferencia bancaria.** Para Perú conviene agregar tarjeta + Yape/Plin con una pasarela (Mercado Pago, Izipay, Culqi o Niubiz).
- [x] **Los pedidos por transferencia apartaban cupos aunque no se pagaran.** *(v2.6.2)* Ahora se cancelan solos pasado un plazo (48 h por defecto, se cambia en *Ajustes → Curamba → Reservas*) y los cupos se liberan. El cliente ve el plazo al terminar su pedido.

### Celular
- [x] **Los botones flotantes tapaban el carrusel.** *(v2.6.2)* El chat y WhatsApp ahora van en fila, abajo a la derecha. En el modo cinemático las tarjetas son algo más compactas y ya no se tapan las flechas ni el botón "Reservar" (comprobado midiendo posiciones a 375 px de ancho).
- [ ] **Pantalla en blanco durante el "vuelo" entre escenas** (simulador). *(v2.6.2)* Se agregó un fondo oscuro de respaldo para que nunca se vea blanco. **Falta confirmarlo en un teléfono real.** Si sigue ocurriendo, cambiar *Widget → Movimiento → Celular* a "Secciones simples".

---

## 🟠 Prioridad 2 — Muy recomendable (rendimiento y seguridad)

### Velocidad
- [x] **Fotos de la portada.** *(v2.6.2)* Las fotos del plugin pasaron de 7,2 MB a 2,4 MB (máximo 1920 px y miniaturas de 40 a 90 KB). En celular, la portada bajó de 2,9 MB a 1,6 MB. Los originales están en `respaldo-fotos-originales/`. El plugin pasó de 8,1 MB a 3,0 MB.
  - [ ] Al subir las fotos definitivas, súbelas en WebP de 1920 px como máximo (las que hay hoy en la Biblioteca de Medios, como las de los productos, siguen pesando lo mismo).
- [x] **Cinzel y Montserrat duplicadas.** *(v2.6.2)* El plugin ya no carga las copias de Elementor en la página del widget.
  - [ ] Roboto y Roboto Slab vienen de la tipografía por defecto de Elementor: cambiarla a Montserrat en *Elementor → Ajustes del sitio → Tipografía global* y se dejan de cargar.
- [ ] En el hosting: **LiteSpeed Cache** u otra caché de página, y comprobar con PageSpeed Insights (meta: más de 80 en celular).
- Nota: el sitio local tarda mucho (de 8 a 20 s) porque usa el servidor de pruebas de PHP con SQLite. **No es representativo**; hay que medir de nuevo en el hosting real.

### Seguridad
- [x] **XML-RPC.** *(v2.6.2)* Bloqueado por completo (responde 403), incluido el pingback.
- [x] **Autor en el mapa del sitio y en las páginas de autor.** *(v2.6.2)* Se quitó el mapa de usuarios, `/author/…` redirige a la portada y el oEmbed ya no muestra el autor.
- [x] **Bloqueo por IP detrás de un proxy.** *(v2.6.2)* Ya se puede leer la IP real. **Pendiente en el hosting:** si usa Cloudflare, agregar `define( 'CURAMBA_CC_PROXY_HEADER', 'HTTP_CF_CONNECTING_IP' );` en `wp-config.php` (detalles en LEEME.md).
- [ ] **Contraseña**: cambiarla (se compartió por chat) y borrar `CONTRASENA-ADMIN.txt` del escritorio. Activar la verificación en dos pasos (2FA) para el administrador.
- [ ] **En producción**: `WP_DEBUG` en false, HTTPS forzado, y borrar `readme.html` y `debug.log` (hoy se pueden abrir públicamente en el sitio local).
- [ ] **Copias de seguridad automáticas** (UpdraftPlus o las del hosting) antes de abrir al público.

---

## 🟡 Prioridad 3 — Para que se encuentre en Google y se vea profesional

- [ ] **Sin meta descripción, sin imagen para compartir (og:image) y sin favicon.** Al compartir el enlace por WhatsApp o Facebook no sale foto. Instalar Rank Math o Yoast y subir el ícono del sitio.
- [ ] **Enlaces bonitos** (Ajustes → Enlaces permanentes → "Nombre de la entrada"). Hoy son `?product=…` y `?page_id=…`.
- [ ] **Páginas en inglés y de ejemplo**: "Cart", "Checkout", "My account", "Shop" y "Sample Page" → renombrarlas a Carrito, Finalizar compra, Mi cuenta y Experiencias, y borrar la de ejemplo.
- [ ] **Las páginas de producto usan el tema básico Twenty Twenty-Five** y no se parecen a la portada. Diseñarlas con Elementor (Theme Builder → Producto individual) o con un tema acorde. La foto principal tarda en aparecer.
- [ ] **El menú del encabezado no tiene enlaces** (no hay menú configurado).
- [ ] **Valoraciones abiertas sin moderación anti-spam**: activar Akismet o cerrar las reseñas hasta tener clientes reales.
- [x] **Precio partido en dos líneas** en el buscador. *(v2.6.2)*
- [x] **Contraste del texto de la portada.** *(v2.6.2)* Velo más oscuro detrás del texto.
- [x] **Mensaje del límite de cupos.** *(v2.6.2)* Ahora dice "Ya tienes 2 en tu carrito para esa fecha: solo puedes agregar 4 más." (probado).
- [x] **Medición, parte técnica.** *(v2.8.0)* Campo "ID de Google Analytics 4" en *Ajustes → Curamba*. Carga la etiqueta oficial en toda la web, sin contar al administrador (probado con un ID ficticio, que luego borré).
  - [ ] Crear la propiedad de pruebas en GA4 y pegar su código G-. Al lanzar, cambiarlo por el de la propiedad definitiva y marcar como conversiones `whatsapp_click` y `reservar_click`.
  - [ ] Meta Pixel, si vas a hacer publicidad en Facebook o Instagram.
- [x] **Opiniones de testers.** *(v2.8.0)* Botón "¿Qué te pareció la web?" con estrellas y comentarios. Se guarda solo en la base de datos local, en el menú *Opiniones* del panel. Probado en PC y celular.
  - [ ] Apagarlo antes del lanzamiento, si no se quiere dejar para clientes reales.

---

## Antes del día del lanzamiento (lista final)
- [ ] Hosting en Perú o con buena latencia, dominio propio y SSL activo.
- [ ] Correo del dominio (reservas@…) y correos de WooCommerce probados (confirmación de pedido al cliente y aviso a la agencia).
- [ ] Una compra real de prueba de punta a punta con cada medio de pago, y su reembolso.
- [ ] Prueba en 2 o 3 teléfonos reales (Android de gama media incluido).
- [ ] Registrar el sitio en Google Search Console y crear o reclamar la ficha de Google Business.
