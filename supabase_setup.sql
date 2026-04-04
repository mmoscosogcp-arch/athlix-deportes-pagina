-- ════════════════════════════════════════════════════════════════
-- ATHLIX STORE — Base de datos Supabase (versión completa)
-- Pega todo esto en el SQL Editor de Supabase y ejecuta
-- ════════════════════════════════════════════════════════════════

-- ── 1. TABLA DE PRODUCTOS ────────────────────────────────────────
CREATE TABLE IF NOT EXISTS products (
  id          BIGSERIAL PRIMARY KEY,
  name        TEXT NOT NULL,
  brand       TEXT DEFAULT 'Athlix',
  sport       TEXT NOT NULL,
  price       INTEGER NOT NULL,
  old_price   INTEGER,
  img_url     TEXT,
  emoji       TEXT DEFAULT '🏅',
  badge       TEXT,
  badge_type  TEXT DEFAULT '',
  tags        TEXT[] DEFAULT '{}',
  abono       TEXT,
  description TEXT,
  in_stock    BOOLEAN DEFAULT TRUE,
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- ── 2. TABLA DE COTIZACIONES ─────────────────────────────────────
CREATE TABLE IF NOT EXISTS quotations (
  id              BIGSERIAL PRIMARY KEY,
  cot_number      TEXT UNIQUE NOT NULL,       -- COT-2026-001
  status          TEXT DEFAULT 'pendiente',   -- pendiente | en_proceso | enviada | aprobada | rechazada

  -- Datos del cliente (del formulario web)
  client_name     TEXT NOT NULL,
  client_email    TEXT NOT NULL,
  client_phone    TEXT,
  client_type     TEXT,                        -- Colegio, Club, Municipalidad, etc.
  products_interest TEXT,                     -- Productos seleccionados en el formulario
  quantity_approx TEXT,
  region          TEXT,
  message         TEXT,

  -- Datos adicionales (rellena el admin)
  client_rut      TEXT,
  client_address  TEXT,
  client_city     TEXT,
  client_company  TEXT,
  vendor          TEXT DEFAULT 'Athlix Store',
  payment_condition TEXT DEFAULT 'Transferencia / Abonos',
  valid_days      INTEGER DEFAULT 15,
  shipping_info   TEXT,
  notes           TEXT,
  bank_info       TEXT,

  -- Items de la cotización formal (JSON array)
  -- [{code, description, category, qty, unit_price, discount, total}]
  items           JSONB DEFAULT '[]',

  -- Totales (calculados)
  subtotal        INTEGER DEFAULT 0,
  discount_extra  INTEGER DEFAULT 0,
  iva             INTEGER DEFAULT 0,
  other_charges   INTEGER DEFAULT 0,
  total           INTEGER DEFAULT 0,

  -- Metadata
  created_at      TIMESTAMPTZ DEFAULT NOW(),
  updated_at      TIMESTAMPTZ DEFAULT NOW()
);

-- ── 3. SEGURIDAD (Row Level Security) ───────────────────────────
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE quotations ENABLE ROW LEVEL SECURITY;

-- Productos: lectura pública, escritura solo admin autenticado
DROP POLICY IF EXISTS "Lectura pública productos" ON products;
DROP POLICY IF EXISTS "Escritura admin productos" ON products;

CREATE POLICY "Lectura pública productos" ON products
  FOR SELECT USING (true);
CREATE POLICY "Escritura admin productos" ON products
  FOR ALL USING (auth.role() = 'authenticated');

-- Cotizaciones: inserción pública (formulario web), gestión solo admin autenticado
DROP POLICY IF EXISTS "Insertar cotización desde web" ON quotations;
DROP POLICY IF EXISTS "Admin gestiona cotizaciones" ON quotations;

CREATE POLICY "Insertar cotización desde web" ON quotations
  FOR INSERT WITH CHECK (true);
CREATE POLICY "Admin gestiona cotizaciones" ON quotations
  FOR ALL USING (auth.role() = 'authenticated');

-- ── 4. FUNCIÓN PARA ACTUALIZAR updated_at ───────────────────────
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER quotations_updated_at
  BEFORE UPDATE ON quotations
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- ── 5. DATOS INICIALES DE PRODUCTOS ─────────────────────────────
INSERT INTO products (id, name, brand, sport, price, old_price, img_url, emoji, badge, badge_type, tags, abono, description, in_stock) VALUES
(1,  'Arco de Fútbol Metálico 3,00×2,00 mts', 'Athlix', 'Fútbol',         359990, 399900,  'Productos/arco_3x2_dospulgadas.png',   '🥅',  'Oferta',    '',      ARRAY['Acero galvanizado','Desmontable'],     'Desde $200.000/abono', 'Arco de fútbol en tubo galvanizado calibre 2". Medidas 3.00×2.00 mts. Desmontable. Red incluida.',  TRUE),
(2,  'Arco de Fútbol Baby-fútbol 3×2 m',      'Athlix', 'Fútbol',         89000,  NULL,     NULL,                                   '⚽',  'Nuevo',     'blue',  ARRAY['Tubo 1.25"','Red incluida'],          'Desde $29.700/abono',  'Arco de baby-fútbol en estructura metálica resistente. Red incluida.',                              TRUE),
(3,  'Tablero Básquetbol Profesional',         'Athlix', 'Básquetbol',     189000, 225000,   NULL,                                   '🏀',  'Destacado', 'blue',  ARRAY['Altura regulable','Acero'],            'Desde $63.000/abono',  'Tablero de básquetbol en acero galvanizado. Altura regulable 2.4–3.05 m.',                          TRUE),
(4,  'Parantes de Voleibol con Red',           'Athlix', 'Voleibol',       124000, NULL,     NULL,                                   '🏐',  NULL,        '',      ARRAY['Reglamentario','Set completo'],        'Desde $41.300/abono',  'Set de parantes de voleibol en acero. Red FIVB incluida.',                                          TRUE),
(5,  'Taca Taca Madera Premium',               'Athlix', 'Taca Taca',      329990, 279990,   NULL                                   '🎯',  'Oferta',    '',      ARRAY['Doble tornamesa','MDF + vidrio'],      'Desde $49.700/abono',  'Mesa de taca-taca en MDF con vidrio templado. 8 jugadores. 2 balones incluidos.',                   TRUE),
(6,  'Taca Taca Escolar Básico',               'Athlix', 'Taca Taca',      99000,  NULL,     NULL,                                   '🎯',  'Nuevo',     'green', ARRAY['Uso intensivo','MDF reforzado'],        'Desde $33.000/abono',  'Mesa de taca-taca para uso escolar intensivo.',                                                     TRUE),
(7,  'Red de Voleibol Reglamentaria',          'Athlix', 'Voleibol',       32900,  NULL,     NULL,                                   '🕸️', NULL,        '',      ARRAY['FIVB','Antenas incluidas'],            'Desde $11.000/abono',  'Red oficial de voleibol con antenas laterales. Medidas FIVB.',                                      TRUE),
(8,  'Arco de Fútbol Portátil PVC',            'Athlix', 'Fútbol',         49000,  62000,    NULL,                                   '🥅',  'Oferta',    '',      ARRAY['PVC resistente','Liviano'],            'Desde $16.300/abono',  'Arco portátil en PVC de alta resistencia. Armado sin herramientas.',                               TRUE),
(9,  'Canasta Básquetbol Mural',               'Athlix', 'Básquetbol',     69000,  85000,    NULL,                                   '🏀',  'Oferta',    '',      ARRAY['Montaje en muro','Tablero incluido'],  'Desde $23.000/abono',  'Canasta de básquetbol para montaje en muro o poste.',                                               TRUE),
(10, 'Set Deportivo Escolar Completo',          'Athlix', 'Fútbol',         390000, 480000,  NULL,                                   '🏟️', 'Pack',      'blue',  ARRAY['Todo incluido','Colegios'],            'Desde $130.000/abono', 'Pack: 2 arcos + tablero básquetbol + parantes de voleibol. Precio institucional.',                   TRUE),
(11, 'Aro de Básquetbol con Poste',            'Athlix', 'Básquetbol',     95000,  NULL,     NULL,                                   '🏀',  'Nuevo',     'green', ARRAY['Poste incluido','Exterior'],           'Desde $31.700/abono',  'Aro de básquetbol con poste de acero 3 m. Red incluida.',                                           TRUE),
(12, 'Parante de Arco Baby-fútbol',            'Athlix', 'Otros deportes', 45000,  55000,    NULL,                                   '🏅',  'Oferta',    '',      ARRAY['Metálico','Par'],                      'Desde $15.000/abono',  'Par de parantes metálicos para baby-fútbol.',                                                       TRUE),
(13, 'Mesa de Ping Pong Profesional',          'Athlix', 'Otros deportes', 189000, 229000,   NULL,        '🏓',  'Oferta',    '',      ARRAY['Plegable','Interior y exterior'],      'Desde $63.000/abono',  'Mesa de ping pong plegable con ruedas. Red incluida.',                                              TRUE);

SELECT SETVAL(pg_get_serial_sequence('products', 'id'), 13);

-- ── 6. COLUMNA TIPO_DOCUMENTO EN COTIZACIONES ───────────────────
ALTER TABLE quotations ADD COLUMN IF NOT EXISTS tipo_documento TEXT DEFAULT 'boleta';

-- ── 7. TABLA DE CLIENTES ─────────────────────────────────────────
CREATE TABLE IF NOT EXISTS clients (
  id             BIGSERIAL PRIMARY KEY,
  email          TEXT UNIQUE NOT NULL,
  name           TEXT NOT NULL,
  phone          TEXT,
  rut            TEXT,
  company_name   TEXT,
  client_type    TEXT DEFAULT 'natural',   -- natural | empresa
  credit_line    INTEGER DEFAULT 0,        -- línea de crédito aprobada en CLP
  credit_used    INTEGER DEFAULT 0,        -- monto utilizado (suma de cotizaciones aprobadas)
  credit_notes   TEXT,
  created_at     TIMESTAMPTZ DEFAULT NOW(),
  updated_at     TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE clients ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Admin gestiona clientes" ON clients;
CREATE POLICY "Admin gestiona clientes" ON clients
  FOR ALL USING (auth.role() = 'authenticated');

-- Trigger updated_at para clients
CREATE TRIGGER clients_updated_at
  BEFORE UPDATE ON clients
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- ── 8. BUCKET DE IMÁGENES ────────────────────────────────────────
-- Hacer esto manualmente en Supabase → Storage:
-- 1. New bucket → nombre: "productos" → marcar como Public
-- 2. En Policies del bucket, permitir SELECT público
