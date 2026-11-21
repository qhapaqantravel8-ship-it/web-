# Guía de velocidad: QHAPAQ ÑAN TRAVEL (Curamba)

_21/11/2026, sitio de prueba local (http://127.0.0.1:8080/)_

## 1. Lo más importante, en corto

- **La lentitud que ves hoy viene sobre todo del servidor local, no de tu web.** El sitio de prueba corre en el "servidor de pruebas" de PHP con una base de datos SQLite. Ese servidor atiende **un archivo a la vez**: la portada pide unos 70 archivos (estilos, scripts, fotos) y el carrito más de 100, y todos hacen fila. Un hosting de verdad los entrega en paralelo y con caché.
- **No esperes que el entorno local se vuelva rápido.** Por mucho que se optimice la web, en tu PC va a seguir tardando varios segundos por página. Sirve para probar que todo funcione, no para medir velocidad.
- **Lo que sí dependía de la web ya lo mejoré** (plugins que no usas, ver punto 2). El resto se hace al pasar al hosting (punto 4).

## 2. Lo que ya hice hoy

Antes, copia de la base de datos en `respaldo-velocidad-2026-11-21\`.

Desactivé (no borré) 6 plugins que cargaban en cada página y no usas:

| Plugin | Por qué |
|---|---|
| Jetpack | Muy pesado; además corría su propio firewall en cada visita. |
| MailPoet | Boletines por correo; no se usa. |
| WooCommerce PayPal Payments | No cobras con PayPal (solo Yape). En el carrito daba **2 errores del servidor** en cada visita y cargaba sus scripts. |
| Google for WooCommerce | Anuncios en Google; no configurado. |
| Reddit for WooCommerce | Rastreador de anuncios; cargaba un script en cada página. |
| Snapchat for WooCommerce | Igual que Reddit. |

Quedan activos solo los 4 necesarios: **Curamba Cinematic, Elementor, WooCommerce y SQLite** (este último solo existe en el sitio local).

Comprobado después: el carrito ya no da errores de PayPal y **Yape sigue activo** como única forma de pago.

Si algún día necesitas uno de ellos: *Plugins → Inactivos → Activar*. Sus ajustes se conservan.
Para borrarlos del todo, hazlo junto con el plan de seguridad (Paso 2 de ese hilo).

## 3. Cómo probar la velocidad "como un cliente"

Cuando entras con tu usuario de administrador, WordPress carga además la barra negra de arriba y las herramientas de edición de Elementor (React, Backbone y unos 20 scripts más). **Tus clientes no cargan eso.**

Para ver la web como la ve un cliente: abre una **ventana privada** (Ctrl+Shift+N en Chrome o Brave) y entra a http://127.0.0.1:8080/. Mientras el sitio esté en modo «Próximamente» (ver punto 7), ahí solo verás esa página: la prueba de compra se hace con tu sesión y la medición real, en el hosting.

## 4. Al pasar al hosting (aquí está el salto grande)

### Qué hosting elegir
Para un WordPress con WooCommerce y Elementor, con visitantes en Perú:

- **Servidor LiteSpeed** (trae caché propia muy rápida y gratuita: el plugin *LiteSpeed Cache*).
- **Centro de datos en Sudamérica (São Paulo, Brasil)** o en EE. UU. (Miami). Desde Perú, São Paulo es lo más cercano que ofrecen los hostings comunes.
- **PHP 8.2 o superior, base de datos MySQL/MariaDB** (no SQLite), SSL gratis, copias automáticas y correo del dominio.
- Al menos **2 GB de RAM** o un plan tipo "Business"/"Cloud" (los planes más baratos se quedan cortos con WooCommerce + Elementor).

Opciones que cumplen esto (revisa precios actuales antes de pagar, cambian seguido):
1. **Hostinger, plan Business o Cloud Startup**: LiteSpeed, centro de datos en Brasil, panel sencillo en español. Mi recomendación para empezar por precio y facilidad.
2. **SiteGround, plan GrowBig**: muy estable y buen soporte, más caro; centros de datos en EE. UU.
3. **Cloudways (Vultr o DigitalOcean)**: más potente y flexible, pero el panel es más técnico.

### Qué activar el día del lanzamiento (todo desde el panel, sin código)
1. **Caché:** instala *LiteSpeed Cache* (si el hosting es LiteSpeed) o *WP Super Cache* (si no lo es). Activa "caché de páginas". Excluye del caché el **carrito, el checkout y Mi cuenta** (LiteSpeed y WooCommerce ya lo hacen solos; solo revisa que esté marcado).
2. **Cloudflare gratis** delante del sitio: guarda las fotos, estilos y scripts en servidores cercanos a tus clientes.
3. **Elementor → Ajustes → Funcionalidades:** deja activadas "Carga optimizada de recursos" y "CSS mejorado". Si usas pocos íconos, desactiva "Font Awesome 4 Support".
4. **Modo de depuración apagado** (pídeselo al hosting). Hoy el sitio local escribe un registro de errores (`debug.log`) que en el hosting no debe estar activo.
5. **WooCommerce → Ajustes → Avanzado → Características:** activa "Almacenamiento de pedidos de alto rendimiento" si el hosting ya trae WooCommerce nuevo.
6. **Mide** en https://pagespeed.web.dev con la dirección real del sitio (no funciona con 127.0.0.1). Meta razonable: portada en menos de 3 s en celular.

## 5. Imágenes

Las fotos ya están bien preparadas: formato WebP, varios tamaños (900, 1600 y 2560 px) y el navegador pide el tamaño justo según la pantalla. No hace falta otro plugin de imágenes.
Lo único: las fotos que subas tú a WooCommerce (productos) súbelas de **máximo 1600 px de ancho**; WordPress crea las copias pequeñas solo.

## 6. Qué NO conviene hacer ahora

- Instalar un plugin de caché en el sitio local: no ayuda, porque el freno es el servidor de pruebas, y puede hacer que no veas tus cambios al recargar.
- Instalar "optimizadores" que juntan o minifican scripts: pueden romper la portada 3D y el carrito. Si algún día se prueba, solo en el hosting y probando la reserva completa después.

## 7. Reserva de prueba (21/11/2026)

Hecha de punta a punta en el sitio local: Curamba Esencial, 24/01/2027, 1 persona, pago con Yape.

| Paso | Tiempo aproximado (en tu PC) |
|---|---|
| Abrir la tienda | ~3 s |
| Abrir la experiencia | ~2 s |
| Añadir al carrito | ~3 s |
| Abrir el checkout | ~4 s |
| «Realizar el pedido» hasta la página de gracias | ~5–8 s |

Todo funcionó: la página de gracias muestra las instrucciones y el QR de Yape. El pedido de prueba (n.º 37) se canceló, su cupo volvió y se mandó a la papelera.

**Ojo para el lanzamiento:** el sitio está en modo **«Próximamente»**. Un cliente sin sesión solo ve la página de "próximamente", no la tienda. El día que publiques: *WooCommerce → Ajustes → Visibilidad del sitio → En vivo*.
