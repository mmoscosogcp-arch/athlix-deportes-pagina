# GUIA DE ADMINISTRACIÓN — ATHLIX STORE

---

## ÍNDICE

1. [Panel de Administración (admin.html)](#1-panel-de-administración)
2. [Gestión de Productos](#2-gestión-de-productos)
3. [Gestión de Cotizaciones](#3-gestión-de-cotizaciones)
4. [Supabase — Administración en la nube](#4-supabase)
5. [DBeaver — Administración con SQL](#5-dbeaver)
6. [Preguntas frecuentes](#6-preguntas-frecuentes)

---

## 1. PANEL DE ADMINISTRACIÓN

### Cómo acceder

Abre el archivo `admin.html` directamente en tu navegador (doble clic) o súbelo a tu servidor.

### Login

El panel usa **Supabase Authentication** — credenciales reales, no una contraseña guardada en el código.

| Campo | Valor |
|-------|-------|
| Email | el que creaste en Supabase → Authentication → Users |
| Contraseña | la que asignaste al crear el usuario |

> Si necesitas crear o cambiar el usuario admin, ve a **Supabase → Authentication → Users → Add user**.

### Cerrar sesión

Botón **"Salir"** en la esquina superior derecha. La sesión se cierra de forma segura.

---

## 2. GESTIÓN DE PRODUCTOS

### Ver todos los productos

Al entrar al panel, la pestaña **"Productos"** muestra todos los productos con:
- Nombre, deporte, precio
- Estado de stock (toggle verde/rojo)
- Botones de editar y eliminar

### Agregar un producto nuevo

1. Clic en **"+ Nuevo producto"**
2. Completa los campos:

| Campo | Descripción | Ejemplo |
|-------|-------------|---------|
| **Nombre** | Nombre completo del producto | Arco de Fútbol 3×2 |
| **Deporte** | Categoría (lista desplegable) | Fútbol |
| **Precio** | Precio en pesos CLP, sin puntos | 359990 |
| **Precio anterior** | Precio tachado (opcional, para mostrar oferta) | 399900 |
| **Abono desde** | Texto de cuota mínima | Desde $120.000/abono |
| **Badge** | Etiqueta de destacado (opcional) | Oferta / Nuevo / Destacado |
| **Descripción** | Texto largo del producto | Arco metálico calibre 2"... |
| **Stock** | Toggle para activar/desactivar disponibilidad | On / Off |
| **Tags** | Palabras clave (máx. 3) | Acero galvanizado |
| **Imagen** | Foto del producto (máx. 5 MB) | JPG o PNG |

3. Clic en **"Guardar producto"**

El producto aparece de inmediato en `index.html`.

### Editar un producto existente

1. Busca el producto en la lista
2. Clic en **✏️ Editar**
3. Modifica los campos que necesites
4. Clic en **"Guardar cambios"**

### Cambiar precio de un producto

1. Editar el producto
2. Modifica el campo **Precio**
3. Opcionalmente agrega el precio anterior en **Precio anterior** para mostrar el descuento
4. Guarda — el precio se actualiza en la tienda en tiempo real

### Cambiar la foto de un producto

1. Editar el producto
2. En la sección de imagen, haz clic en **"Cambiar imagen"**
3. Selecciona una nueva foto desde tu computador
4. Guarda — la imagen se sube automáticamente a Supabase Storage

> **Requisitos de imagen:** JPG o PNG, máximo 5 MB. Se recomienda formato cuadrado (800×800 px).

### Cambiar la descripción

1. Editar el producto
2. Modifica el campo **Descripción** en la parte inferior del formulario
3. Guarda

### Controlar el stock

Cada producto tiene un **toggle de stock** (verde = disponible, rojo = sin stock):

- **Activar stock:** clic en el toggle → verde → el producto aparece normal en la tienda
- **Desactivar stock:** clic en el toggle → rojo → el producto aparece con overlay "Sin stock" y el botón de carrito queda deshabilitado

No es necesario eliminar el producto para marcarlo sin stock.

### Eliminar un producto

1. Clic en **🗑** del producto
2. Confirmar en el diálogo de confirmación

> Esta acción no se puede deshacer. Si solo quieres ocultar temporalmente, usa el toggle de stock.

---

## 3. GESTIÓN DE COTIZACIONES

### Ver cotizaciones recibidas

Pestaña **"Cotizaciones"** — muestra todas las solicitudes enviadas desde el formulario de la tienda.

Puedes filtrar por estado:
- ⏳ Pendiente — recién llegó, sin revisar
- 🔄 En proceso — en seguimiento
- 📨 Enviada — cotización formal enviada al cliente
- ✅ Aprobada — el cliente aceptó
- ❌ Rechazada — no prosperó

### Abrir una cotización

Clic en **"Abrir →"** para ver el detalle completo y editar:

- Datos del cliente (RUT, dirección, empresa)
- Items de la cotización (productos, cantidad, precio unitario, descuento)
- Totales automáticos (subtotal, IVA, total)
- Notas internas y datos bancarios para transferencia
- Cambiar el estado de la cotización

### Imprimir / exportar cotización

Dentro del detalle, botón **"Imprimir / PDF"** — abre una vista de impresión profesional lista para guardar como PDF o enviar al cliente.

---

## 4. SUPABASE

### Acceder al panel

Ve a [supabase.com](https://supabase.com) → inicia sesión → abre tu proyecto **athlix-store**.

### Tablas principales

| Tabla | Contenido |
|-------|-----------|
| `products` | Todos los productos de la tienda |
| `quotations` | Solicitudes de cotización del formulario web |

### Ver y editar datos directamente

1. Supabase → **Table Editor**
2. Selecciona `products` o `quotations`
3. Puedes editar celdas directamente haciendo doble clic

### Crear usuario admin

1. Supabase → **Authentication** → **Users**
2. Clic en **"Add user"** → **"Create new user"**
3. Ingresa email y contraseña
4. Este usuario podrá entrar al `admin.html`

### Cambiar contraseña de admin

1. Supabase → **Authentication** → **Users**
2. Busca el usuario → **"Send password recovery"** o edita directamente

### Bucket de imágenes (Storage)

Las imágenes de productos se guardan en:
**Supabase → Storage → productos**

Para agregar manualmente:
1. Storage → `productos` → **Upload file**
2. Copia la URL pública del archivo
3. Pégala en el campo `img_url` del producto

### Respaldo de datos

1. Supabase → **SQL Editor**
2. Ejecuta:
```sql
-- Exportar productos
SELECT * FROM products;

-- Exportar cotizaciones
SELECT * FROM quotations ORDER BY created_at DESC;
```
3. Descarga los resultados como CSV desde el botón de descarga

---

## 5. DBEAVER

### Conectar a Supabase

| Campo | Valor |
|-------|-------|
| Host | `db.fyuhmedgyauvkfwswlnx.supabase.co` |
| Port | `5432` |
| Database | `postgres` |
| User | `postgres` |
| Password | La contraseña del proyecto Supabase |
| SSL | Activado |

### Consultas útiles

#### Ver todos los productos
```sql
SELECT id, name, sport, price, in_stock
FROM products
ORDER BY id;
```

#### Cambiar el precio de un producto
```sql
UPDATE products
SET price = 299990
WHERE id = 1;
```

#### Cambiar descripción
```sql
UPDATE products
SET description = 'Nueva descripción aquí'
WHERE name = 'Arco de Fútbol Metálico 3,00×2,00 mts';
```

#### Activar/desactivar stock
```sql
-- Desactivar
UPDATE products SET in_stock = false WHERE id = 5;

-- Activar
UPDATE products SET in_stock = true WHERE id = 5;
```

#### Ver cotizaciones recientes
```sql
SELECT cot_number, client_name, client_email, status, created_at
FROM quotations
ORDER BY created_at DESC
LIMIT 20;
```

#### Agregar producto nuevo por SQL
```sql
INSERT INTO products (name, sport, price, old_price, emoji, badge, badge_type, tags, abono, description, in_stock)
VALUES (
  'Nombre del producto',
  'Fútbol',
  99000,
  120000,
  '🥅',
  'Nuevo',
  'blue',
  ARRAY['Tag 1', 'Tag 2'],
  'Desde $33.000/abono',
  'Descripción detallada del producto.',
  true
);
```

#### Eliminar producto
```sql
DELETE FROM products WHERE id = 13;
```

#### Ver IDs de todos los productos
```sql
SELECT id, name FROM products ORDER BY id;
```

### Ejecutar el script de configuración inicial

Si necesitas recrear las tablas desde cero:
1. Abre DBeaver → conexión Supabase
2. Nuevo SQL Script
3. Pega el contenido del archivo `supabase_setup.sql`
4. Ejecuta con `Ctrl + Alt + Enter`

> **Atención:** el script usa `CREATE TABLE IF NOT EXISTS`, no borra datos existentes.

---

## 6. PREGUNTAS FRECUENTES

**¿Puedo agregar más de 3 tags a un producto?**
No, el sistema acepta máximo 3 tags por producto (limitación del formulario admin). Puedes cambiarlo en el SQL directamente si necesitas más.

**¿Las fotos se guardan en Supabase?**
Sí, en el bucket de Storage llamado `productos`. Asegúrate de que el bucket esté configurado como público.

**¿Qué pasa si Supabase no responde?**
La tienda (`index.html`) carga un catálogo de respaldo con los productos predefinidos en el código. El admin muestra un aviso si no puede conectar.

**¿Cómo cambio la contraseña del panel admin?**
Ve a Supabase → Authentication → Users → busca tu usuario → Edit. No está en ningún archivo de código.

**¿Puedo tener más de un administrador?**
Sí. Crea múltiples usuarios en Supabase → Authentication → Users. Todos pueden acceder al panel con sus propias credenciales.

**¿Cómo actualizo las políticas RLS después de cambios?**
Ejecuta en DBeaver o en el SQL Editor de Supabase el bloque de políticas del archivo `supabase_setup.sql` (sección 3).

**¿Dónde encuentro mi URL y clave de Supabase?**
Supabase → Project Settings → API → Project URL y anon public key.
