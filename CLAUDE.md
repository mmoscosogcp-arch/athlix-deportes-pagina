# ATHLIX STORE — Contexto del proyecto

## Qué es
Tienda e-commerce de equipamiento deportivo (arcos, tableros, taca-taca, etc.) orientada a colegios, clubes y municipalidades en Chile. Marca: **Athlix Store**. Contacto: athlixchile@gmail.com / +56 9 6432 9683.

## Stack técnico
- Sitio estático: HTML + CSS + JS vanilla (sin framework, sin bundler)
- Base de datos: **Supabase** (PostgreSQL) — proyecto `athlix-store`
  - URL: `https://fyuhmedgyauvkfwswlnx.supabase.co`
  - Instancia global: `const sb = window.supabase.createClient(SUPABASE_URL, SUPABASE_KEY)`
- Autenticación: Supabase Auth (`signInWithPassword`) — nunca contraseñas en código
- Email: **EmailJS** para notificaciones de cotizaciones
- Mapas: OpenStreetMap iframe (sin API key)

## Archivos principales
- `index.html` — tienda pública (~2500+ líneas, todo en un archivo)
- `admin.html` — panel de administración (login, productos, cotizaciones, clientes)
- `supabase_setup.sql` — script completo para crear/recrear la base de datos
- `paletas_colores.json` — paleta de colores del proyecto (no eliminar)
- `GUIA_ADMIN.md` — documentación para el administrador
- `GUIA_CORREO.md` — guía de configuración EmailJS

## Estructura de carpetas
```
Tienda Deporte/
├── Catalogo/          ← ÚNICA carpeta de imágenes (estandarizado)
├── Cotizaciones/      ← plantilla Excel de cotización
├── index.html
├── admin.html
├── supabase_setup.sql
└── paletas_colores.json
```

## Base de datos — tablas
| Tabla | Descripción |
|-------|-------------|
| `products` | Productos de la tienda. RLS: lectura pública, escritura solo autenticado |
| `quotations` | Solicitudes de cotización. RLS: inserción pública, gestión solo autenticado |
| `clients` | Clientes derivados de cotizaciones. RLS: solo autenticado |

Columnas relevantes de `quotations`: `tipo_documento` (boleta/factura), `client_rut`, `client_company`.
Columnas relevantes de `clients`: `credit_line`, `credit_used`, `credit_notes`, `client_type` (natural/empresa).

## Convenciones del código
- Variables CSS en `:root` — usar siempre `var(--blue)`, `var(--orange)`, etc.
- IDs del formulario de cotización: `cq-*` (ej. `cq-name`, `cq-email`, `cq-tipo-doc-boleta`)
- Tipo de documento: radio buttons `name="tipo-doc"`, leer con `document.querySelector('input[name="tipo-doc"]:checked').value`
- Imágenes: rutas relativas desde `Catalogo/` (ej. `Catalogo/arco_3x2_dospulgadas.png`)
- Toast: `showToast(msg, isError=false)` — segundo parámetro `true` para error en rojo
- No usar `alert()`, `confirm()` del browser — usar los modales/toasts del proyecto

## Secciones de index.html
`home` | `catalogo` | `nosotros` | `contacto` — navegación via `showSection(id)`

## Tabs de admin.html
`productos` | `cotizaciones` | `clientes` — navegación via `switchTab(nombre)`

## Reglas importantes
- Las claves de Supabase (URL + anon key) van directamente en el HTML — el sitio es estático, no hay servidor. El anon key es público por diseño.
- El `.env` existe pero no se usa en producción — es solo referencia local.
- Nunca usar `Productos/` como ruta de imágenes — siempre `Catalogo/`.
- Al agregar productos en Supabase o en el fallback local de JS, usar `Catalogo/` en `img_url`.
- El fallback de productos (cuando Supabase no responde) está hardcodeado en `index.html` y `admin.html`.
- RLS policies: ejecutar en Supabase SQL Editor o DBeaver antes de probar inserción/lectura.
