# ROADMAP — ATHLIX STORE
> Última actualización: Abril 2026
> Estado: Pre-lanzamiento (pendiente trámites legales)

---

## LEYENDA
- ✅ Completado
- 🔄 En progreso
- ⏳ Pendiente
- 💰 Requiere costo/suscripción
- 🚀 Para lanzamiento público

---

## FASE 0 — BASE TÉCNICA (completado)

| # | Tarea | Estado |
|---|-------|--------|
| 0.1 | Integración Supabase (productos, cotizaciones, clientes) | ✅ |
| 0.2 | Panel admin con login Supabase Auth | ✅ |
| 0.3 | Formulario de cotización con EmailJS | ✅ |
| 0.4 | Carrito con localStorage | ✅ |
| 0.5 | Menú mobile (hamburguesa) | ✅ |
| 0.6 | Tabla clientes con línea de crédito | ✅ |
| 0.7 | SKUs de productos (ATH-FUT-001, etc.) | ✅ |
| 0.8 | Estandarización carpeta Catalogo/ | ✅ |
| 0.9 | Supabase Storage para imágenes | ✅ |
| 0.10 | Tipo de documento Boleta/Factura en cotización | ✅ |
| 0.11 | Restaurar tab activo al recargar admin | ✅ |

---

## FASE 1 — CORRECCIONES SIN COSTO (inmediato)

| # | Tarea | Estado | Impacto | Esfuerzo |
|---|-------|--------|---------|---------|
| 1.1 | Número COT dinámico en modal de confirmación | ✅ | Alto | Bajo |
| 1.2 | Reemplazar alert() por modal profesional de transferencia | ✅ | Medio | Bajo |
| 1.3 | Meta tags + Open Graph + SEO básico | ✅ | Alto | Bajo |
| 1.4 | Font-size 16px en inputs mobile (iOS zoom) | ✅ | Medio | Bajo |
| 1.5 | Hero layout corregido en mobile (grid 1fr) | ✅ | Medio | Bajo |
| 1.6 | Búsqueda de texto dentro del catálogo (por nombre, SKU, descripción) | ✅ | Alto | Bajo |
| 1.7 | CTAs más persuasivos ("Cotizar gratis ahora", "Ver catálogo completo") | ✅ | Medio | Bajo |

---

## FASE 2 — LANZAMIENTO PÚBLICO 🚀
> Prerequisito: trámites legales resueltos

| # | Tarea | Estado | Impacto | Prioridad |
|---|-------|--------|---------|-----------|
| 2.1 | Integrar pasarela de pago Flow (Chile) | 💰 ⏳ | Crítico | 1 |
| 2.2 | Configurar dominio propio (ej. athlixstore.cl) | 💰 ⏳ | Alto | 1 |
| 2.3 | Subir sitio a hosting (Netlify gratuito / Vercel) | ⏳ | Crítico | 1 |
| 2.4 | Instalar Google Analytics 4 | ⏳ | Alto | 2 |
| 2.5 | Configurar Search Console de Google | ⏳ | Alto | 2 |
| 2.6 | Agregar términos y condiciones / política de privacidad | ⏳ | Crítico legal | 1 |
| 2.7 | Agregar política de despacho y devoluciones | ⏳ | Alto | 2 |
| 2.8 | Configurar HTTPS / SSL | ⏳ | Crítico | 1 |
| 2.9 | Probar flujo completo de cotización real | ⏳ | Crítico | 1 |
| 2.10 | Validar RLS Supabase en producción | ⏳ | Crítico | 1 |

---

## FASE 3 — MEJORAS UX Y CONVERSIÓN (1-2 meses post-lanzamiento)

| # | Tarea | Estado | Impacto | Prioridad |
|---|-------|--------|---------|-----------|
| 3.1 | Testimonios y logos de clientes en la home | ⏳ | Muy alto | 1 |
| 3.2 | Galería de instalaciones reales (fotos clientes) | ⏳ | Alto | 1 |
| 3.3 | Ampliar sección "Nosotros" (historia, equipo, garantía) | ⏳ | Alto | 2 |
| 3.4 | WhatsApp contextual (precarga nombre del producto) | ⏳ | Medio | 2 |
| 3.5 | Captura de email en footer (newsletter) | 💰 ⏳ | Medio | 3 |
| 3.6 | Contador de stock bajo / urgencia en productos | ⏳ | Medio | 3 |
| 3.7 | Galería múltiple de imágenes por producto | ⏳ | Medio | 2 |
| 3.8 | Especificaciones técnicas estructuradas por producto | ⏳ | Alto | 2 |
| 3.9 | Recomendaciones de productos relacionados | ⏳ | Medio | 3 |
| 3.10 | Schema.org para productos (rich snippets Google) | ⏳ | Alto SEO | 2 |
| 3.11 | Comparador de productos (2-3 lado a lado) | ⏳ | Medio | 3 |
| 3.12 | Sección "Armá tu cancha" (packs configurables) | ⏳ | Alto | 2 |

---

## FASE 4 — AUTOMATIZACIÓN Y OPERACIÓN (2-3 meses)

| # | Tarea | Estado | Impacto | Prioridad |
|---|-------|--------|---------|-----------|
| 4.1 | Email automático de confirmación al cliente al cotizar | 💰 ⏳ | Alto | 1 |
| 4.2 | Email automático al admin por nueva cotización | ⏳ | Alto | 1 |
| 4.3 | Seguimiento de cotizaciones por estado (pipeline) | ✅ | Alto | - |
| 4.4 | PDF automático de cotización formal | ✅ | Alto | - |
| 4.5 | Alertas de stock bajo en panel admin | ⏳ | Medio | 2 |
| 4.6 | Resumen semanal de cotizaciones por email | ⏳ | Medio | 3 |
| 4.7 | Integración CRM básico (ej. HubSpot free tier) | 💰 ⏳ | Alto | 2 |
| 4.8 | Webhook de Supabase → Slack/email al recibir cotización | ⏳ | Alto | 2 |

---

## FASE 5 — ESCALABILIDAD (3-6 meses)

| # | Tarea | Estado | Impacto | Prioridad |
|---|-------|--------|---------|-----------|
| 5.1 | Portal B2B con login (colegios, municipalidades) | ⏳ | Muy alto | 1 |
| 5.2 | Precios especiales por tipo de cliente | ⏳ | Alto | 2 |
| 5.3 | Sistema de órdenes con estado en tiempo real | ⏳ | Alto | 2 |
| 5.4 | Facturación electrónica (SII Chile) | 💰 ⏳ | Crítico legal | 1 |
| 5.5 | App móvil (PWA básica) | ⏳ | Medio | 3 |
| 5.6 | Optimizar imágenes a formato WebP | ⏳ | Medio perf. | 2 |
| 5.7 | Migrar a framework moderno (Next.js / Astro) | ⏳ | Alto | 3 |
| 5.8 | CI/CD automatizado (GitHub Actions → Netlify) | ⏳ | Medio | 3 |
| 5.9 | Tests automatizados (Playwright E2E) | ⏳ | Alto | 3 |
| 5.10 | Blog / contenido SEO (Google para búsquedas B2B) | ⏳ | Alto | 2 |

---

## FASE 6 — CRECIMIENTO (6-12 meses)

| # | Tarea | Estado | Impacto | Prioridad |
|---|-------|--------|---------|-----------|
| 6.1 | Marketplace para distribuidores/resellers | ⏳ | Muy alto | 2 |
| 6.2 | Integración con GCP para imágenes y storage | ⏳ | Medio | 2 |
| 6.3 | Programa de fidelidad / puntos | ⏳ | Medio | 3 |
| 6.4 | Campañas Meta Ads / Google Ads | 💰 ⏳ | Muy alto | 1 |
| 6.5 | Integración con marketplaces (Mercado Libre, etc.) | ⏳ | Alto | 2 |
| 6.6 | Versión en inglés (para exportación) | ⏳ | Bajo-Medio | 3 |

---

## TAREAS LEGALES (prerequisito lanzamiento)

| # | Tarea | Estado |
|---|-------|--------|
| L.1 | Constitución empresa / razón social | ⏳ |
| L.2 | Inicio de actividades SII | ⏳ |
| L.3 | Cuenta bancaria empresa | ⏳ |
| L.4 | Términos y condiciones redactados | ⏳ |
| L.5 | Política de privacidad (Ley 19.628 Chile) | ⏳ |
| L.6 | Política de despacho y devoluciones | ⏳ |
| L.7 | Habilitación emisión boletas/facturas electrónicas (SII) | ⏳ |

---

## HERRAMIENTAS RECOMENDADAS (gratuitas)

| Herramienta | Para qué | Costo |
|------------|---------|-------|
| **Netlify** | Hosting del sitio | Gratis |
| **Vercel** | Alternativa hosting | Gratis |
| **Google Analytics 4** | Analytics | Gratis |
| **Google Search Console** | SEO monitoring | Gratis |
| **MailerLite** | Newsletter (hasta 1.000 subs) | Gratis |
| **HubSpot Free** | CRM básico | Gratis |
| **Supabase** | BD + Auth + Storage (ya en uso) | Gratis (tier actual) |
| **EmailJS** | Emails cotizaciones (ya en uso) | Gratis (200/mes) |
| **Notion / Linear** | Gestión de tareas | Gratis |
| **Cloudflare** | CDN + DNS + SSL | Gratis |

---

## NOTAS TÉCNICAS

- **Stack actual:** HTML + CSS + JS vanilla + Supabase + EmailJS
- **Imágenes:** Carpeta `Catalogo/` local → migrar a Supabase Storage o GCP a futuro
- **SKU formato:** `ATH-[CAT]-[NUM]` (FUT, BAS, VOL, TAC, PAK, OTR)
- **Convención de ramas git:** `main` (producción), `dev` (desarrollo)
- **Admin:** `admin.html` — acceso con Supabase Auth
- **DB host:** `db.fyuhmedgyauvkfwswlnx.supabase.co`
