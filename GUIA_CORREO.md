# Guía para recibir cotizaciones en athlixchile@gmail.com

Sigue estos pasos una sola vez. Tarda ~10 minutos.

---

## Paso 1 — Crear cuenta en EmailJS

1. Ve a **emailjs.com**
2. Clic en "Sign Up" — regístrate con `athlixchile@gmail.com`
3. Confirma tu cuenta desde el correo que te llega

---

## Paso 2 — Conectar Gmail

1. En EmailJS, ve a **Email Services → Add New Service**
2. Selecciona **Gmail**
3. Clic en "Connect Account" → autoriza con `athlixchile@gmail.com`
4. Ponle el nombre: `athlix_gmail`
5. Clic en "Create Service"
6. Copia el **Service ID** (algo como `service_abc123`) → lo necesitas después

---

## Paso 3 — Crear la plantilla del correo

1. Ve a **Email Templates → Create New Template**
2. Ponle el nombre: `cotizacion_athlix`
3. En el campo **"To Email"** pon: `athlixchile@gmail.com`
4. En **Subject** pon exactamente:
   ```
   Nueva cotización de {{from_name}} — Athlix Store
   ```
5. En el cuerpo del correo (HTML o texto), pega esto:
   ```
   NUEVA SOLICITUD DE COTIZACIÓN — ATHLIX STORE
   ═══════════════════════════════════════════

   DATOS DEL CLIENTE
   ─────────────────
   Nombre:    {{from_name}}
   Email:     {{from_email}}
   Teléfono:  {{phone}}
   Tipo:      {{tipo}}

   LO QUE NECESITA
   ───────────────
   Productos:  {{productos}}
   Cantidad:   {{cantidad}}
   Región:     {{region}}

   COMENTARIOS
   ───────────
   {{mensaje}}

   ───────────────────────────────────────────
   Enviado desde athlixstore.cl
   ```
6. Clic en **Save**
7. Copia el **Template ID** (algo como `template_xyz456`)

---

## Paso 4 — Copiar tus claves al código

1. En EmailJS ve a **Account → API Keys**
2. Copia la **Public Key** (algo como `user_XXXXX`)

Abre `index.html` con el editor de texto y busca estas 3 líneas:

```
const EMAILJS_PUBLIC_KEY  = 'PEGA_TU_PUBLIC_KEY';
const EMAILJS_SERVICE_ID  = 'PEGA_TU_SERVICE_ID';
const EMAILJS_TEMPLATE_ID = 'PEGA_TU_TEMPLATE_ID';
```

Reemplaza los valores entre comillas con los tuyos. Ejemplo:

```
const EMAILJS_PUBLIC_KEY  = 'user_AbCdEf123456';
const EMAILJS_SERVICE_ID  = 'service_abc123';
const EMAILJS_TEMPLATE_ID = 'template_xyz456';
```

---

## Paso 5 — Subir y probar

1. Sube el sitio a Netlify Drop (arrastra la carpeta "Tienda Deporte")
2. Abre la página → ve a "Cotización"
3. Llena el formulario con tus propios datos y envíalo
4. Revisa `athlixchile@gmail.com` — debería llegar en segundos

---

## Plan gratuito de EmailJS

El plan gratis incluye **200 correos al mes**, que es más que suficiente para cotizaciones. Si necesitas más, el plan básico cuesta ~$9 USD/mes.

---

## ¿Algo no funciona?

- Revisa que los 3 valores (Public Key, Service ID, Template ID) estén exactamente iguales a los de EmailJS
- Revisa la carpeta Spam de Gmail
- Asegúrate de que Gmail esté correctamente conectado en EmailJS (Email Services → tu servicio → debería decir "Connected")
