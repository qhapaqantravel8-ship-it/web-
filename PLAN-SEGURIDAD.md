# Plan de seguridad — QHAPAQ ÑAN TRAVEL (Curamba Travel)

_Preparado el 21/11/2026. Sitio de prueba local (WordPress + Elementor + WooCommerce + plugin curamba-cinematic v2.9.x)._

Marca cada punto con `[x]` cuando quede hecho. Todo se hace desde el panel de WordPress (/wp-admin/) o desde el panel del hosting, sin tocar código.

---

## 0. ¿Sirve el repositorio ECC para esto?

**ECC (github.com/affaan-m/ECC, antes "everything-claude-code")** es una colección de configuraciones para el programa Claude Code: agentes, "skills", reglas, comandos y ganchos para que una IA programe y revise código. Trae, por ejemplo, un agente revisor de seguridad y un escáner de la propia configuración de Claude Code.

- **No es una herramienta de WordPress.** No instala firewall, no bloquea ataques, no hace copias de seguridad ni escanea un sitio web.
- Para usarlo habría que instalarlo en Claude Code y ponerlo a revisar y modificar código con varios agentes a la vez. Eso es justo lo que tus instrucciones de cuenta piden no hacer (sin código y sin subagentes).
- **Cuidado:** hay copias falsas de ese repositorio circulando con malware. Si algún día se usa, solo desde la cuenta original `affaan-m`.
- **Lo útil que sí tomamos de ECC:** su lista de control de seguridad (contraseñas, secretos fuera de los archivos públicos, datos de clientes validados, permisos mínimos, actualizaciones, registros). Está aplicada abajo, adaptada a WordPress.

---

## 🔴 Prioridad 1 — Hazlo ya, en el sitio de prueba (≈1 hora)

### 1. Contraseña y verificación en dos pasos (2FA)
- [ ] Cambia la contraseña del administrador en *Usuarios → Perfil*: 16 caracteres o más, que no uses en otro lado. Guárdala en un gestor de contraseñas (Bitwarden es gratis), no en un .txt.
- [ ] Borra tú mismo `CONTRASENA-ADMIN.txt` del Escritorio (se compartió por chat, ya no es secreta).
- [ ] Activa 2FA: *Plugins → Añadir nuevo* → busca **"Two Factor"** (plugin oficial de WordPress.org) → Instalar → Activar → en tu perfil activa "Aplicación de autenticación" y escanea el código con Google Authenticator o Microsoft Authenticator. Guarda los códigos de respaldo.
- [ ] Revisa *Usuarios*: debe haber un solo administrador. Cualquier otro usuario, rol "Cliente" o "Editor", nunca "Administrador".

### 2. Actualizaciones
- [ ] *Escritorio → Actualizaciones*: actualiza WordPress, WooCommerce, Elementor y el tema. Antes, haz la copia del punto 3.
- [ ] *Plugins*: desactiva y borra los que no uses (cada plugin extra es una puerta más). *Apariencia → Temas*: deja el tema activo y uno de respaldo (Twenty Twenty-Five); borra los demás.
- [ ] Activa las actualizaciones automáticas de seguridad: en *Plugins*, "Activar actualizaciones automáticas" en cada plugin de confianza.

### 3. Copias de seguridad
- [ ] Instala **UpdraftPlus** (gratis). *Ajustes → Copias de seguridad UpdraftPlus*: base de datos cada día, archivos cada semana, guardar 7 copias, destino Google Drive.
- [ ] Haz una copia manual ahora y **prueba restaurarla una vez**. Una copia que nunca se probó no cuenta.
- [ ] Sigue guardando la carpeta `base de datos CURAMBA` completa en un disco externo o en la nube cada semana.

### 4. Firewall y escáner
- [ ] Instala **Wordfence Security** (gratis): firewall, escáner de malware y aviso de plugins vulnerables. Al activarlo, sigue el asistente y deja el firewall en "modo aprendizaje" una semana y luego en "Habilitado y protegiendo".
- [ ] En Wordfence → *Escanear*, haz un escaneo completo y anota lo que encuentre.
- [ ] El plugin propio ya bloquea tras 5 intentos fallidos. Para no tener dos bloqueos que choquen, deja activo solo uno (recomiendo el de Wordfence en el hosting y desactivar el del plugin propio en *Ajustes → Curamba*, si tiene esa opción; si no, déjalos y avisa si ves bloqueos raros).
- [ ] Alternativa si Wordfence se siente pesado: **Solid Security** (antes iThemes). Solo uno de los dos, no ambos.

### 5. El sitio de prueba en tu red
- [ ] El servidor local se ve desde cualquier aparato de tu Wi-Fi (http://192.168.10.20:8080/). Úsalo solo en tu red de casa, nunca en un Wi-Fi público, y cierra la ventana negra cuando no lo uses.
- [ ] En Windows, deja el perfil de red "Privada" solo para tu Wi-Fi de casa.

---

## 🟠 Prioridad 2 — Proteger reservas y checkout

(La configuración de Yape se lleva en otro hilo; aquí solo va la parte de seguridad.)

- [ ] **Nunca confirmes un pedido por una captura de pantalla.** Las capturas falsas de Yape son la estafa más común. Abre tu app de Yape y confirma que el dinero entró antes de pasar el pedido a "Procesando".
- [ ] Los pedidos sin pago ya se cancelan solos a las 48 h y liberan cupos (v2.6.2). Revisa que ese plazo te sirva en *Ajustes → Curamba → Reservas*.
- [ ] Anti-bots en checkout, registro y Libro de Reclamaciones: instala **"Simple Cloudflare Turnstile"** (gratis, sin acertijos molestos) y actívalo en el formulario de checkout de WooCommerce y en el de acceso.
- [ ] *WooCommerce → Ajustes → Cuentas y privacidad*: permite comprar sin crear cuenta, no guardes datos más tiempo del necesario y activa el borrado de datos de clientes a pedido (Ley 29733).
- [ ] Reseñas: cerrarlas o activar **Akismet** hasta tener clientes reales.
- [ ] Haz una compra de prueba de punta a punta y revisa que el correo al cliente no muestre datos de otros clientes.

---

## 🟡 Prioridad 3 — Al pasar al hosting (el día del lanzamiento)

Pídele al hosting estos puntos; la mayoría los activan con un clic:
- [ ] **SSL (HTTPS) activo y forzado** en todo el sitio.
- [ ] **PHP 8.2 o superior.**
- [ ] **Modo de depuración apagado** (`WP_DEBUG` en falso) y que no queden públicos `readme.html` ni `debug.log`.
- [ ] **Permisos de archivos correctos:** carpetas 755, archivos 644 y `wp-config.php` 440 o 400. Cualquier hosting serio lo hace por ti; pregúntales.
- [ ] Acceso por **SFTP**, nunca FTP sin cifrar. Contraseña distinta para el hosting, el correo y WordPress, y 2FA también en el panel del hosting y en el dominio.
- [ ] **Cloudflare** gratis delante del sitio (protección contra ataques y caché). Si se usa, el hosting o yo agregamos la línea de IP real que está anotada en `LEEME.md` del plugin.
- [ ] Copias automáticas del hosting **además** de UpdraftPlus.
- [ ] Correo del dominio con SPF, DKIM y DMARC (el hosting los configura) para que los correos de reservas no caigan en spam ni puedan falsificarse.
- [ ] Monitor de caída gratis (UptimeRobot) que te avise por correo si la web se cae.

---

## 🔵 Prioridad 4 — El plugin propio (curamba-cinematic)

- En la auditoría del 6/11 el código estaba ordenado y con los datos bien escapados; ya se bloqueó XML-RPC, se ocultaron los autores y se desactivó el editor de código.
- Una nueva revisión de código no la hago por tus instrucciones de cuenta. Alternativas sin código:
  - [ ] El escaneo de Wordfence (punto 4) revisa también los archivos del plugin.
  - [ ] Antes de lanzar, pide al hosting o a un desarrollador una revisión de seguridad del plugin (1–2 horas de trabajo).
  - [ ] No compartas el .zip del plugin públicamente; guárdalo en un repositorio **privado** si se crea uno.

---

## Rutina de mantenimiento (después del lanzamiento)
- Cada semana: aplicar actualizaciones, mirar el correo de Wordfence y revisar pedidos raros.
- Cada mes: probar restaurar una copia y revisar la lista de usuarios.
- Cada 6 meses: cambiar contraseñas importantes.
