--
-- PostgreSQL database dump
--

\restrict DLsjHvBF6Wc1xVb0PcFYGTc9NEqWyn9DGWZfTRGYeFGXumpvcQKabDNw2d76QXE

-- Dumped from database version 17.7
-- Dumped by pg_dump version 17.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.tramite_requisito DROP CONSTRAINT IF EXISTS tramite_requisito_tramite_id_fkey;
ALTER TABLE IF EXISTS ONLY public.tramite_requisito DROP CONSTRAINT IF EXISTS tramite_requisito_tipo_documento_id_fkey;
ALTER TABLE IF EXISTS ONLY public.tramite_requisito DROP CONSTRAINT IF EXISTS tramite_requisito_grupo_id_fkey;
ALTER TABLE IF EXISTS ONLY public.tramite_relacion DROP CONSTRAINT IF EXISTS tramite_relacion_tramite_relacionado_id_fkey;
ALTER TABLE IF EXISTS ONLY public.tramite_relacion DROP CONSTRAINT IF EXISTS tramite_relacion_tramite_id_fkey;
ALTER TABLE IF EXISTS ONLY public.tipo_documento_alias DROP CONSTRAINT IF EXISTS tipo_documento_alias_tipo_documento_id_fkey;
ALTER TABLE IF EXISTS ONLY public.solicitud DROP CONSTRAINT IF EXISTS solicitud_tramite_id_fkey;
ALTER TABLE IF EXISTS ONLY public.solicitud DROP CONSTRAINT IF EXISTS solicitud_inmueble_id_fkey;
ALTER TABLE IF EXISTS ONLY public.solicitud_documento DROP CONSTRAINT IF EXISTS solicitud_documento_tramite_requisito_id_fkey;
ALTER TABLE IF EXISTS ONLY public.solicitud_documento DROP CONSTRAINT IF EXISTS solicitud_documento_solicitud_id_fkey;
ALTER TABLE IF EXISTS ONLY public.solicitud_documento DROP CONSTRAINT IF EXISTS solicitud_documento_documento_id_fkey;
ALTER TABLE IF EXISTS ONLY public.solicitud DROP CONSTRAINT IF EXISTS solicitud_contribuyente_id_fkey;
ALTER TABLE IF EXISTS ONLY public.representante DROP CONSTRAINT IF EXISTS representante_contribuyente_id_fkey;
ALTER TABLE IF EXISTS ONLY public.inmueble_contribuyente DROP CONSTRAINT IF EXISTS inmueble_contribuyente_inmueble_id_fkey;
ALTER TABLE IF EXISTS ONLY public.inmueble_contribuyente DROP CONSTRAINT IF EXISTS inmueble_contribuyente_contribuyente_id_fkey;
ALTER TABLE IF EXISTS ONLY public.grupo_documento_tipo DROP CONSTRAINT IF EXISTS grupo_documento_tipo_tipo_documento_id_fkey;
ALTER TABLE IF EXISTS ONLY public.grupo_documento_tipo DROP CONSTRAINT IF EXISTS grupo_documento_tipo_grupo_id_fkey;
ALTER TABLE IF EXISTS ONLY public.documento DROP CONSTRAINT IF EXISTS documento_tipo_documento_id_fkey;
ALTER TABLE IF EXISTS ONLY public.documento DROP CONSTRAINT IF EXISTS documento_reemplazado_por_fkey;
ALTER TABLE IF EXISTS ONLY public.documento DROP CONSTRAINT IF EXISTS documento_inmueble_id_fkey;
ALTER TABLE IF EXISTS ONLY public.documento DROP CONSTRAINT IF EXISTS documento_contribuyente_id_fkey;
DROP TRIGGER IF EXISTS documento_scope_chk ON public.documento;
DROP INDEX IF EXISTS public.ix_solicitud_tramite;
DROP INDEX IF EXISTS public.ix_solicitud_estado;
DROP INDEX IF EXISTS public.ix_solicitud_contribuyente;
DROP INDEX IF EXISTS public.ix_soldoc_doc;
DROP INDEX IF EXISTS public.ix_req_tramite_persona;
DROP INDEX IF EXISTS public.ix_representante_contrib;
DROP INDEX IF EXISTS public.ix_documento_vigencia;
DROP INDEX IF EXISTS public.ix_documento_sha256;
DROP INDEX IF EXISTS public.ix_documento_inmueble_tipo;
DROP INDEX IF EXISTS public.ix_documento_contrib_tipo;
DROP INDEX IF EXISTS public.ix_contribuyente_tipo;
DROP INDEX IF EXISTS public.ix_contribuyente_nombre;
ALTER TABLE IF EXISTS ONLY public.documento DROP CONSTRAINT IF EXISTS uq_doc_contrib_sha;
ALTER TABLE IF EXISTS ONLY public.tramite_requisito DROP CONSTRAINT IF EXISTS tramite_requisito_tramite_id_aplica_a_orden_key;
ALTER TABLE IF EXISTS ONLY public.tramite_requisito DROP CONSTRAINT IF EXISTS tramite_requisito_pkey;
ALTER TABLE IF EXISTS ONLY public.tramite_relacion DROP CONSTRAINT IF EXISTS tramite_relacion_pkey;
ALTER TABLE IF EXISTS ONLY public.tramite DROP CONSTRAINT IF EXISTS tramite_pkey;
ALTER TABLE IF EXISTS ONLY public.tramite DROP CONSTRAINT IF EXISTS tramite_codigo_key;
ALTER TABLE IF EXISTS ONLY public.tipo_documento DROP CONSTRAINT IF EXISTS tipo_documento_pkey;
ALTER TABLE IF EXISTS ONLY public.tipo_documento DROP CONSTRAINT IF EXISTS tipo_documento_codigo_key;
ALTER TABLE IF EXISTS ONLY public.tipo_documento_alias DROP CONSTRAINT IF EXISTS tipo_documento_alias_pkey;
ALTER TABLE IF EXISTS ONLY public.solicitud DROP CONSTRAINT IF EXISTS solicitud_pkey;
ALTER TABLE IF EXISTS ONLY public.solicitud DROP CONSTRAINT IF EXISTS solicitud_folio_key;
ALTER TABLE IF EXISTS ONLY public.solicitud_documento DROP CONSTRAINT IF EXISTS solicitud_documento_pkey;
ALTER TABLE IF EXISTS ONLY public.representante DROP CONSTRAINT IF EXISTS representante_pkey;
ALTER TABLE IF EXISTS ONLY public.inmueble DROP CONSTRAINT IF EXISTS inmueble_pkey;
ALTER TABLE IF EXISTS ONLY public.inmueble_contribuyente DROP CONSTRAINT IF EXISTS inmueble_contribuyente_pkey;
ALTER TABLE IF EXISTS ONLY public.inmueble DROP CONSTRAINT IF EXISTS inmueble_clave_catastral_key;
ALTER TABLE IF EXISTS ONLY public.grupo_documento_tipo DROP CONSTRAINT IF EXISTS grupo_documento_tipo_pkey;
ALTER TABLE IF EXISTS ONLY public.grupo_documento DROP CONSTRAINT IF EXISTS grupo_documento_pkey;
ALTER TABLE IF EXISTS ONLY public.grupo_documento DROP CONSTRAINT IF EXISTS grupo_documento_codigo_key;
ALTER TABLE IF EXISTS ONLY public.documento DROP CONSTRAINT IF EXISTS documento_pkey;
ALTER TABLE IF EXISTS ONLY public.contribuyente DROP CONSTRAINT IF EXISTS contribuyente_rfc_key;
ALTER TABLE IF EXISTS ONLY public.contribuyente DROP CONSTRAINT IF EXISTS contribuyente_pkey;
ALTER TABLE IF EXISTS ONLY public.contribuyente DROP CONSTRAINT IF EXISTS contribuyente_email_key;
ALTER TABLE IF EXISTS ONLY public.contribuyente DROP CONSTRAINT IF EXISTS contribuyente_curp_key;
ALTER TABLE IF EXISTS public.tramite_requisito ALTER COLUMN tramite_requisito_id DROP DEFAULT;
DROP VIEW IF EXISTS public.v_solicitud_checklist;
DROP VIEW IF EXISTS public.v_documentos_reutilizables;
DROP SEQUENCE IF EXISTS public.tramite_requisito_tramite_requisito_id_seq;
DROP TABLE IF EXISTS public.tramite_requisito;
DROP TABLE IF EXISTS public.tramite_relacion;
DROP TABLE IF EXISTS public.tramite;
DROP TABLE IF EXISTS public.tipo_documento_alias;
DROP TABLE IF EXISTS public.tipo_documento;
DROP TABLE IF EXISTS public.solicitud_documento;
DROP TABLE IF EXISTS public.solicitud;
DROP TABLE IF EXISTS public.representante;
DROP TABLE IF EXISTS public.inmueble_contribuyente;
DROP TABLE IF EXISTS public.inmueble;
DROP TABLE IF EXISTS public.grupo_documento_tipo;
DROP TABLE IF EXISTS public.grupo_documento;
DROP TABLE IF EXISTS public.documento;
DROP TABLE IF EXISTS public.contribuyente;
DROP FUNCTION IF EXISTS public.trg_documento_scope_check();
DROP TYPE IF EXISTS public.tipo_persona;
DROP TYPE IF EXISTS public.solicitud_estado;
DROP TYPE IF EXISTS public.sol_doc_estado;
DROP TYPE IF EXISTS public.doc_scope;
DROP TYPE IF EXISTS public.doc_estado;
DROP TYPE IF EXISTS public.area_responsable;
DROP EXTENSION IF EXISTS pgcrypto;
DROP EXTENSION IF EXISTS citext;
--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: area_responsable; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.area_responsable AS ENUM (
    'CATASTRO',
    'IMPUESTO_PREDIAL',
    'TRASLADO_DOMINIO',
    'EJECUCION_FISCAL',
    'TESORERIA_GENERAL'
);


--
-- Name: doc_estado; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.doc_estado AS ENUM (
    'VIGENTE',
    'VENCIDO',
    'RECHAZADO',
    'REEMPLAZADO'
);


--
-- Name: doc_scope; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.doc_scope AS ENUM (
    'CONTRIBUYENTE',
    'INMUEBLE',
    'SOLICITUD'
);


--
-- Name: sol_doc_estado; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.sol_doc_estado AS ENUM (
    'PENDIENTE',
    'ENTREGADO',
    'VALIDADO',
    'OBSERVADO',
    'RECHAZADO'
);


--
-- Name: solicitud_estado; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.solicitud_estado AS ENUM (
    'BORRADOR',
    'DOCUMENTOS_PENDIENTES',
    'EN_REVISION',
    'OBSERVADA',
    'APROBADA',
    'RECHAZADA',
    'FINALIZADA',
    'CANCELADA'
);


--
-- Name: tipo_persona; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.tipo_persona AS ENUM (
    'FISICA',
    'JURIDICA',
    'INSTITUCION_PUBLICA'
);


--
-- Name: trg_documento_scope_check(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trg_documento_scope_check() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE v_scope doc_scope;
BEGIN
    SELECT scope INTO v_scope FROM tipo_documento WHERE tipo_documento_id = NEW.tipo_documento_id;
    IF v_scope = 'INMUEBLE' AND NEW.inmueble_id IS NULL THEN
        RAISE EXCEPTION 'El tipo_documento % tiene scope INMUEBLE y requiere inmueble_id', NEW.tipo_documento_id;
    END IF;
    RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: contribuyente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contribuyente (
    contribuyente_id uuid DEFAULT gen_random_uuid() NOT NULL,
    tipo_persona public.tipo_persona NOT NULL,
    curp character varying(18),
    rfc character varying(13),
    nombre_razon_social character varying(255) NOT NULL,
    apellido_paterno character varying(120),
    apellido_materno character varying(120),
    acta_constitutiva_fecha date,
    email public.citext,
    telefono character varying(20),
    calle character varying(255),
    numero_ext character varying(20),
    numero_int character varying(20),
    colonia character varying(120),
    municipio character varying(120),
    estado character varying(120) DEFAULT 'México'::character varying,
    codigo_postal character varying(10),
    creado_en timestamp with time zone DEFAULT now() NOT NULL,
    actualizado_en timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT ck_contrib_fisica_tiene_curp CHECK (((tipo_persona <> 'FISICA'::public.tipo_persona) OR (curp IS NOT NULL))),
    CONSTRAINT ck_contrib_jur_tiene_razon CHECK (((tipo_persona = 'FISICA'::public.tipo_persona) OR (nombre_razon_social IS NOT NULL)))
);


--
-- Name: documento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.documento (
    documento_id uuid DEFAULT gen_random_uuid() NOT NULL,
    contribuyente_id uuid NOT NULL,
    inmueble_id uuid,
    tipo_documento_id smallint NOT NULL,
    nombre_original character varying(255) NOT NULL,
    mime_type character varying(120) NOT NULL,
    tamano_bytes bigint NOT NULL,
    sha256 character(64) NOT NULL,
    almacenamiento_uri text NOT NULL,
    vigente_desde date DEFAULT CURRENT_DATE NOT NULL,
    vigente_hasta date,
    estado public.doc_estado DEFAULT 'VIGENTE'::public.doc_estado NOT NULL,
    validado_por uuid,
    validado_en timestamp with time zone,
    motivo_rechazo text,
    reemplazado_por uuid,
    creado_en timestamp with time zone DEFAULT now() NOT NULL,
    actualizado_en timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT ck_sha256_len CHECK ((char_length(sha256) = 64)),
    CONSTRAINT documento_tamano_bytes_check CHECK ((tamano_bytes > 0))
);


--
-- Name: grupo_documento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grupo_documento (
    grupo_id smallint NOT NULL,
    codigo character varying(60) NOT NULL,
    nombre character varying(200) NOT NULL,
    descripcion text
);


--
-- Name: grupo_documento_tipo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grupo_documento_tipo (
    grupo_id smallint NOT NULL,
    tipo_documento_id smallint NOT NULL
);


--
-- Name: inmueble; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inmueble (
    inmueble_id uuid DEFAULT gen_random_uuid() NOT NULL,
    clave_catastral character varying(40),
    calle character varying(255),
    numero_ext character varying(20),
    numero_int character varying(20),
    colonia character varying(120),
    localidad character varying(120),
    municipio character varying(120) DEFAULT 'Ecatepec de Morelos'::character varying NOT NULL,
    estado character varying(120) DEFAULT 'México'::character varying NOT NULL,
    codigo_postal character varying(10),
    superficie_terreno_m2 numeric(12,2),
    superficie_construccion_m2 numeric(12,2),
    valor_catastral numeric(14,2),
    creado_en timestamp with time zone DEFAULT now() NOT NULL,
    actualizado_en timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: inmueble_contribuyente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inmueble_contribuyente (
    inmueble_id uuid NOT NULL,
    contribuyente_id uuid NOT NULL,
    tipo_vinculo character varying(30) DEFAULT 'PROPIETARIO'::character varying NOT NULL,
    porcentaje numeric(5,2) DEFAULT 100.00,
    vigente_desde date DEFAULT CURRENT_DATE NOT NULL,
    vigente_hasta date,
    CONSTRAINT inmueble_contribuyente_porcentaje_check CHECK (((porcentaje > (0)::numeric) AND (porcentaje <= (100)::numeric)))
);


--
-- Name: representante; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.representante (
    representante_id uuid DEFAULT gen_random_uuid() NOT NULL,
    contribuyente_id uuid NOT NULL,
    nombre_completo character varying(255) NOT NULL,
    curp character varying(18),
    tipo_representacion character varying(40) NOT NULL,
    vigente_desde date DEFAULT CURRENT_DATE NOT NULL,
    vigente_hasta date,
    creado_en timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: solicitud; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.solicitud (
    solicitud_id uuid DEFAULT gen_random_uuid() NOT NULL,
    folio character varying(30) NOT NULL,
    tramite_id smallint NOT NULL,
    contribuyente_id uuid NOT NULL,
    inmueble_id uuid,
    aplica_a public.tipo_persona NOT NULL,
    estado public.solicitud_estado DEFAULT 'BORRADOR'::public.solicitud_estado NOT NULL,
    creado_en timestamp with time zone DEFAULT now() NOT NULL,
    enviada_en timestamp with time zone,
    finalizada_en timestamp with time zone,
    resultado_uri text,
    observaciones text
);


--
-- Name: solicitud_documento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.solicitud_documento (
    solicitud_id uuid NOT NULL,
    tramite_requisito_id integer NOT NULL,
    documento_id uuid,
    estado public.sol_doc_estado DEFAULT 'PENDIENTE'::public.sol_doc_estado NOT NULL,
    observacion text,
    asignado_en timestamp with time zone,
    validado_por uuid,
    validado_en timestamp with time zone
);


--
-- Name: tipo_documento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipo_documento (
    tipo_documento_id smallint NOT NULL,
    codigo character varying(60) NOT NULL,
    nombre character varying(200) NOT NULL,
    scope public.doc_scope NOT NULL,
    vigencia_meses integer,
    vigencia_tipo character varying(30) DEFAULT 'PERMANENTE'::character varying NOT NULL,
    descripcion text,
    notas text,
    activo boolean DEFAULT true NOT NULL,
    CONSTRAINT ck_vigencia CHECK (((((vigencia_tipo)::text = 'MESES'::text) AND (vigencia_meses IS NOT NULL)) OR ((vigencia_tipo)::text <> 'MESES'::text)))
);


--
-- Name: tipo_documento_alias; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipo_documento_alias (
    tipo_documento_id smallint NOT NULL,
    alias character varying(200) NOT NULL
);


--
-- Name: tramite; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tramite (
    tramite_id smallint NOT NULL,
    codigo character varying(80) NOT NULL,
    nombre character varying(200) NOT NULL,
    tipo character varying(20) NOT NULL,
    area public.area_responsable NOT NULL,
    descripcion text,
    documento_a_obtener character varying(255),
    vigencia_resultado character varying(120),
    fundamento_legal text,
    casos_aplicables text,
    sujeto_inspeccion boolean DEFAULT false NOT NULL,
    se_realiza_en_linea boolean DEFAULT false NOT NULL,
    direccion_web character varying(255),
    tiempo_max_respuesta character varying(80),
    costo_descripcion character varying(255),
    costo_monto numeric(10,2),
    costo_es_variable boolean DEFAULT false NOT NULL,
    costo_es_gratuito boolean DEFAULT false NOT NULL,
    pago_efectivo boolean DEFAULT true NOT NULL,
    pago_tdc boolean DEFAULT false NOT NULL,
    pago_tdb boolean DEFAULT false NOT NULL,
    pago_portal boolean DEFAULT false NOT NULL,
    fecha_actualizacion date,
    activo boolean DEFAULT true NOT NULL,
    anticipo_pct numeric(5,2),
    CONSTRAINT tramite_anticipo_pct_check CHECK (((anticipo_pct IS NULL) OR ((anticipo_pct > (0)::numeric) AND (anticipo_pct <= (100)::numeric)))),
    CONSTRAINT tramite_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['TRAMITE'::character varying, 'SERVICIO'::character varying])::text[])))
);


--
-- Name: COLUMN tramite.anticipo_pct; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.tramite.anticipo_pct IS 'Porcentaje de anticipo requerido al iniciar el tramite (ej. Convenio = 20%). No es un documento, es una condicion de pago.';


--
-- Name: tramite_relacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tramite_relacion (
    tramite_id smallint NOT NULL,
    tramite_relacionado_id smallint NOT NULL,
    relacion character varying(30) DEFAULT 'RELACIONADO'::character varying NOT NULL,
    CONSTRAINT tramite_relacion_check CHECK ((tramite_id <> tramite_relacionado_id))
);


--
-- Name: tramite_requisito; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tramite_requisito (
    tramite_requisito_id integer NOT NULL,
    tramite_id smallint NOT NULL,
    aplica_a public.tipo_persona NOT NULL,
    orden smallint NOT NULL,
    tipo_documento_id smallint,
    grupo_id smallint,
    original_requerido boolean DEFAULT false NOT NULL,
    copias_requeridas smallint DEFAULT 0 NOT NULL,
    obligatorio boolean DEFAULT true NOT NULL,
    condicion text,
    notas text,
    CONSTRAINT ck_req_tipo_xor_grupo CHECK ((((tipo_documento_id IS NOT NULL) AND (grupo_id IS NULL)) OR ((tipo_documento_id IS NULL) AND (grupo_id IS NOT NULL))))
);


--
-- Name: tramite_requisito_tramite_requisito_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tramite_requisito_tramite_requisito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tramite_requisito_tramite_requisito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tramite_requisito_tramite_requisito_id_seq OWNED BY public.tramite_requisito.tramite_requisito_id;


--
-- Name: v_documentos_reutilizables; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_documentos_reutilizables AS
 SELECT d.documento_id,
    d.contribuyente_id,
    d.inmueble_id,
    d.tipo_documento_id,
    td.nombre AS tipo_nombre,
    td.scope,
    d.vigente_desde,
    d.vigente_hasta,
    d.nombre_original,
    d.sha256
   FROM (public.documento d
     JOIN public.tipo_documento td ON ((td.tipo_documento_id = d.tipo_documento_id)))
  WHERE ((d.estado = 'VIGENTE'::public.doc_estado) AND ((d.vigente_hasta IS NULL) OR (d.vigente_hasta >= CURRENT_DATE)));


--
-- Name: v_solicitud_checklist; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_solicitud_checklist AS
 SELECT s.solicitud_id,
    s.folio,
    s.contribuyente_id,
    s.inmueble_id,
    s.aplica_a,
    r.tramite_requisito_id,
    r.orden,
    r.obligatorio,
    r.original_requerido,
    r.copias_requeridas,
    r.condicion,
    COALESCE(td.nombre, g.nombre) AS requisito,
        CASE
            WHEN (r.tipo_documento_id IS NOT NULL) THEN 'TIPO'::text
            ELSE 'GRUPO'::text
        END AS requisito_clase,
    sd.documento_id,
    sd.estado AS estado_requisito
   FROM ((((public.solicitud s
     JOIN public.tramite_requisito r ON (((r.tramite_id = s.tramite_id) AND (r.aplica_a = s.aplica_a))))
     LEFT JOIN public.tipo_documento td ON ((td.tipo_documento_id = r.tipo_documento_id)))
     LEFT JOIN public.grupo_documento g ON ((g.grupo_id = r.grupo_id)))
     LEFT JOIN public.solicitud_documento sd ON (((sd.solicitud_id = s.solicitud_id) AND (sd.tramite_requisito_id = r.tramite_requisito_id))));


--
-- Name: tramite_requisito tramite_requisito_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tramite_requisito ALTER COLUMN tramite_requisito_id SET DEFAULT nextval('public.tramite_requisito_tramite_requisito_id_seq'::regclass);


--
-- Data for Name: contribuyente; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contribuyente (contribuyente_id, tipo_persona, curp, rfc, nombre_razon_social, apellido_paterno, apellido_materno, acta_constitutiva_fecha, email, telefono, calle, numero_ext, numero_int, colonia, municipio, estado, codigo_postal, creado_en, actualizado_en) FROM stdin;
\.


--
-- Data for Name: documento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.documento (documento_id, contribuyente_id, inmueble_id, tipo_documento_id, nombre_original, mime_type, tamano_bytes, sha256, almacenamiento_uri, vigente_desde, vigente_hasta, estado, validado_por, validado_en, motivo_rechazo, reemplazado_por, creado_en, actualizado_en) FROM stdin;
\.


--
-- Data for Name: grupo_documento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.grupo_documento (grupo_id, codigo, nombre, descripcion) FROM stdin;
1	ACREDITA_PROPIEDAD	Documento que acredita la propiedad	Cualquiera de: escritura pública, testimonio notarial, sentencia judicial con ejecutoria, manifestación de traslado de dominio y recibo, cédula IMEVIS/INSUS/CORETT, acta de entrega de vivienda, contrato compra-venta, cesión de derechos.
2	IDENT_O_RECIBO_PREDIAL	Identificacion oficial o ultimo recibo predial	Cualquiera de los dos acredita al contribuyente registrado en el padron; basta con uno.
\.


--
-- Data for Name: grupo_documento_tipo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.grupo_documento_tipo (grupo_id, tipo_documento_id) FROM stdin;
1	5
1	6
1	7
1	8
1	9
1	10
1	11
2	1
2	18
\.


--
-- Data for Name: inmueble; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inmueble (inmueble_id, clave_catastral, calle, numero_ext, numero_int, colonia, localidad, municipio, estado, codigo_postal, superficie_terreno_m2, superficie_construccion_m2, valor_catastral, creado_en, actualizado_en) FROM stdin;
\.


--
-- Data for Name: inmueble_contribuyente; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inmueble_contribuyente (inmueble_id, contribuyente_id, tipo_vinculo, porcentaje, vigente_desde, vigente_hasta) FROM stdin;
\.


--
-- Data for Name: representante; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.representante (representante_id, contribuyente_id, nombre_completo, curp, tipo_representacion, vigente_desde, vigente_hasta, creado_en) FROM stdin;
\.


--
-- Data for Name: solicitud; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.solicitud (solicitud_id, folio, tramite_id, contribuyente_id, inmueble_id, aplica_a, estado, creado_en, enviada_en, finalizada_en, resultado_uri, observaciones) FROM stdin;
\.


--
-- Data for Name: solicitud_documento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.solicitud_documento (solicitud_id, tramite_requisito_id, documento_id, estado, observacion, asignado_en, validado_por, validado_en) FROM stdin;
\.


--
-- Data for Name: tipo_documento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tipo_documento (tipo_documento_id, codigo, nombre, scope, vigencia_meses, vigencia_tipo, descripcion, notas, activo) FROM stdin;
1	IDENTIFICACION_OFICIAL	Identificación oficial vigente	CONTRIBUYENTE	\N	VENCIMIENTO_DOC	Credencial para votar, cartilla militar, pasaporte o cédula profesional.	\N	t
2	CARTA_PODER	Carta poder con testigos e identificaciones	CONTRIBUYENTE	12	MESES	Carta poder con dos testigos y copia de identificaciones.	\N	t
3	PODER_NOTARIAL	Poder notarial	CONTRIBUYENTE	\N	PERMANENTE	Instrumento notarial que acredita representación legal.	\N	t
4	ACTA_CONSTITUTIVA	Acta constitutiva	CONTRIBUYENTE	\N	PERMANENTE	Acta constitutiva de la persona jurídica.	\N	t
5	ESCRITURA_PUBLICA	Escritura pública / Testimonio notarial	INMUEBLE	\N	PERMANENTE	Escritura pública expedida por notario o testimonio notarial.	\N	t
6	SENTENCIA_JUDICIAL	Sentencia judicial con ejecutoria	INMUEBLE	\N	PERMANENTE	Resolución judicial o administrativa con ejecutoria que consigna el acto traslativo.	\N	t
7	MANIFESTACION_TRASLADO_DOMINIO	Manifestación de traslado de dominio y recibo de pago	INMUEBLE	\N	PERMANENTE	Documento de traslado de dominio acompañado de su recibo.	\N	t
8	CEDULA_IMEVIS_INSUS_CORETT	Cédula de contratación IMEVIS/INSUS/CORETT	INMUEBLE	\N	PERMANENTE	Cédula de vivienda social (IMEVIS, INSUS o CORETT).	\N	t
9	ACTA_ENTREGA_VIVIENDA	Acta de entrega y/o liberación de vivienda	INMUEBLE	\N	PERMANENTE	Acta de entrega de vivienda de interés social (incluye FONHAPO).	\N	t
10	CONTRATO_COMPRAVENTA	Contrato de compra-venta	INMUEBLE	\N	PERMANENTE	Contrato de compra-venta (cotejado ante notario si es privado).	\N	t
11	CESION_DERECHOS	Cesión de derechos	INMUEBLE	\N	PERMANENTE	Documento de cesión de derechos.	\N	t
12	CONTRATO_DONACION	Contrato de donación	INMUEBLE	\N	PERMANENTE	Documento privado de donación.	\N	t
13	FORMATO_SOL_SERV_CATASTRALES	Formato de Solicitud de Servicios Catastrales	SOLICITUD	\N	UNICO_USO	Formato debidamente llenado, firmado y requisitado.	\N	t
14	MANIFESTACION_CATASTRAL	Manifestación catastral (modificación de superficie)	INMUEBLE	\N	EJERCICIO_FISCAL	Manifestación para actualización de inscripción en el padrón catastral.	\N	t
15	FOTOGRAFIA_FACHADA	Fotografía de la fachada del inmueble a color	INMUEBLE	24	MESES	Fotografía reciente a color de la fachada del inmueble.	\N	t
16	CROQUIS_LOCALIZACION	Croquis de localización del inmueble	INMUEBLE	\N	PERMANENTE	Croquis de localización (mientras no cambie el entorno).	\N	t
17	RELACION_COLINDANTES	Relación de colindantes y dos testigos	SOLICITUD	\N	UNICO_USO	Lista de nombres de colindantes y dos testigos con domicilio en el municipio.	\N	t
18	RECIBO_PREDIAL_VIGENTE	Recibo de pago de impuesto predial al corriente	INMUEBLE	\N	EJERCICIO_FISCAL	Último recibo de predial al corriente del ejercicio fiscal.	\N	t
19	BOUCHER_BANCARIO	Comprobante de pago bancario (boucher)	SOLICITUD	\N	UNICO_USO	Comprobante de línea de captura pagada en banco o en línea.	\N	t
20	RECIBO_PAGO_DERECHOS	Recibo de pago de derechos del trámite	SOLICITUD	\N	UNICO_USO	Recibo oficial de pago de derechos del servicio.	\N	t
21	RECIBO_PERIODO_ANTERIOR	Recibo de pago del periodo inmediato anterior	SOLICITUD	\N	UNICO_USO	Recibo del periodo previo (trámites recurrentes mensuales/bimestrales).	\N	t
22	OFICIO_TESORERO	Oficio / petición por escrito al Tesorero Municipal	SOLICITUD	\N	UNICO_USO	Escrito libre dirigido al Tesorero Municipal.	\N	t
23	LIQUIDACION_CUENTA	Liquidación / cuenta a pagar emitida por dependencia	SOLICITUD	\N	UNICO_USO	Liquidación o cuenta emitida por una dependencia municipal.	\N	t
24	SOL_EXENCION_CATASTRAL	Solicitud de exención de servicios catastrales	SOLICITUD	\N	UNICO_USO	Solicitud de exención Art. 23 CFEM (sólo Instituciones Públicas).	\N	t
25	TESTIMONIAL_NOMBRE	Testimonial de nombre (notario o juzgado)	CONTRIBUYENTE	\N	PERMANENTE	Testimonial de nombre para corregir datos del documento de propiedad.	\N	t
26	OFICIO_AUT_SUBDIVISION	Oficio de autorización, planos y gaceta (SEDUO)	INMUEBLE	\N	PERMANENTE	Autorización de subdivisión/fusión/lotificación emitida por SEDUO EdoMex.	\N	t
27	CERT_CLAVE_VALOR_CATASTRAL	Certificación de clave y valor catastral	INMUEBLE	\N	EJERCICIO_FISCAL	Documento emitido por Catastro (resultado de otro trámite).	\N	t
28	CERT_NO_ADEUDO_PREDIAL	Certificación de no adeudo predial	INMUEBLE	\N	EJERCICIO_FISCAL	Emitida por Tesorería (resultado de otro trámite).	\N	t
29	APORTACION_MEJORAS	Certificación / copia de aportación de mejoras	INMUEBLE	\N	EJERCICIO_FISCAL	Constancia de aportación de mejoras.	\N	t
30	CERT_NO_ADEUDO_AGUA	Certificación de no adeudo de agua / constancia SAPASE	INMUEBLE	\N	EJERCICIO_FISCAL	Emitida por SAPASE o pozo independiente.	\N	t
31	FORMATO_TRASLADO_DOMINIO	Formato de traslado de dominio y pago original	INMUEBLE	\N	PERMANENTE	Formato físico de traslado de dominio (usado para correcciones y copias certificadas).	\N	t
32	FORMATO_VENTANILLA	Formato de ventanilla llenado (tinta azul / máquina)	SOLICITUD	\N	UNICO_USO	Formato proporcionado en ventanilla 1 o 2 del Departamento de Traslado de Dominio.	\N	t
\.


--
-- Data for Name: tipo_documento_alias; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tipo_documento_alias (tipo_documento_id, alias) FROM stdin;
1	Credencial para votar vigente
1	INE
1	Cartilla militar
1	Pasaporte
1	Cédula profesional
2	Carta poder con dos testigos
3	Poder Notarial con respectivas identificaciones
5	Copia certificada de la Escritura Pública
5	Testimonio Notarial
6	Resolución Judicial o Administrativa que haya causado ejecutoria
7	Manifestación de traslado de dominio y recibo de pago
8	IMEVIS
8	INSUS
8	CORETT
9	Acta de entrega y/o liberación de inmueble de interés social
9	Acta de entrega de FONHAPO y finiquito
10	Contrato de compraventa notariado
10	Documentos Privados (Compra-Venta)
13	Formato de Solicitud de Servicios Catastrales debidamente llenado, firmado y requisitado
14	Manifestación debidamente llenada para actualización de padrón catastral
15	Fotografía fachada a color
16	Croquis de localización
18	Último recibo predial
18	Boleta predial
18	Recibo de pago de predio
19	Línea de captura con boucher bancario
19	Pago bancario
22	Petición por escrito dirigida al Tesorero Municipal
31	Formato de Traslado de Dominio
31	Pago de Traslado de Dominio Original
32	Formato proporcionado en ventanilla 1 o 2
\.


--
-- Data for Name: tramite; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tramite (tramite_id, codigo, nombre, tipo, area, descripcion, documento_a_obtener, vigencia_resultado, fundamento_legal, casos_aplicables, sujeto_inspeccion, se_realiza_en_linea, direccion_web, tiempo_max_respuesta, costo_descripcion, costo_monto, costo_es_variable, costo_es_gratuito, pago_efectivo, pago_tdc, pago_tdb, pago_portal, fecha_actualizacion, activo, anticipo_pct) FROM stdin;
1	ASIGNACION_CLAVE_CATASTRAL	Asignación de clave catastral	TRAMITE	CATASTRO	Asignación de claves catastrales a predios dentro de la jurisdicción municipal.	Certificación de clave y valor catastral	Ejercicio fiscal vigente	Arts. 167, 168, 171, 173, 175, 179, 182 y 183 CFEM; 22 I a y b Reglamento Título Quinto.	\N	t	f	\N	25 días hábiles	$282.85 (2.5 UMA)	282.85	f	f	t	t	t	t	2024-01-31	t	\N
2	CAMBIO_BOUCHER_RECIBO	Emisión de recibo oficial (cambio de boucher bancario)	TRAMITE	IMPUESTO_PREDIAL	Se extiende comprobante de pagos realizados a Tesorería (línea, transferencia o banco).	Recibo oficial de pago de predio	Sin plazo — a petición del contribuyente	Arts. 20 Bis, 26 párrafos 6 y 7 CFEM.	\N	f	f	\N	Media hora	Gratuito año fiscal corriente; $24.00 copia simple años anteriores	\N	t	f	t	t	t	f	2025-01-31	t	\N
3	CERT_CLAVE_VALOR_CATASTRAL	Certificación de clave y valor catastral	TRAMITE	CATASTRO	Se certifica la clave y el valor catastral con base en el sistema de gestión catastral.	Certificación de clave y valor catastral	Ejercicio fiscal vigente	Arts. 166 II, 167, 168, 171, 173, 175, 182 CFEM; 21 y 22 II d Reglamento Título Quinto.	\N	t	f	\N	25 días hábiles	Art. 166 II CFEM	\N	t	f	t	t	t	t	2025-01-31	t	\N
4	CERT_NO_ADEUDO_PREDIAL	Certificación de no adeudo predial y aportación de mejoras	SERVICIO	IMPUESTO_PREDIAL	Certificación para inscribir el inmueble en el Registro Público de la Propiedad o para venta.	Certificado de no adeudo de impuesto predial o aportación de mejoras	Año en que se emite	Arts. 2, 7, 9 Ley de Ingresos; Art. 8 CPEUM; 147 III CFEM.	\N	f	f	\N	15 días	$283.00	283.00	f	f	t	t	t	f	2025-01-31	t	\N
5	CERT_PLANO_MANZANERO	Certificación de plano manzanero catastral	TRAMITE	CATASTRO	Expedir copia certificada del plano de la manzana con los datos catastrales del inmueble.	Certificación de plano manzanero catastral	Ejercicio fiscal vigente	Arts. 166 III, 167, 168, 169 IV, 171, 173, 175, 179, 182 CFEM; 21, 22 II c Reglamento T5.	\N	t	f	\N	25 días hábiles	$282.85 (2.5 UMA)	282.85	f	f	t	t	t	t	2025-01-31	t	\N
6	CERT_TRASLADO_DOMINIO	Certificación de traslado de dominio	TRAMITE	TRASLADO_DOMINIO	Certificación cuando el usuario pierde el formato o pago del traslado de dominio.	Certificación de traslado de dominio	Permanente	Arts. 70, 71, 113 CFEM; 4 LI Municipios; 3, 13, 15, 48 VI LOAP EdoMex.	\N	f	f	\N	30 días hábiles	$452.00	452.00	f	f	t	t	t	t	2025-02-06	t	\N
7	CONSTANCIA_IDENT_CATASTRAL	Constancia de identificación catastral	TRAMITE	CATASTRO	Hace constar los datos técnicos registrados en el padrón catastral del inmueble.	Constancia de identificación catastral	Ejercicio fiscal vigente (desde emisión hasta fin de año)	Arts. 166 IV, 167, 168, 169 IV, 171, 173, 175, 179, 182 CFEM.	\N	f	f	\N	15 días hábiles	$282.85 (2.5 UMA)	282.85	f	f	t	t	t	t	2025-01-31	t	\N
9	COPIA_CERT_TRASLADO_DOMINIO	Copia certificada de traslado de dominio	TRAMITE	TRASLADO_DOMINIO	Emisión de copia certificada cuando no se cuenta con el formato y pago originales del traslado.	Copia certificada de traslado de dominio	Permanente	Arts. 70, 71, 73, 113 CFEM.	\N	f	f	\N	30 días hábiles	1 copia $96.00 / 2 copias $143.00	96.00	t	f	t	t	t	t	2025-02-06	t	\N
10	COPIAS_SIMPLES_PREDIAL	Copias simples y certificadas del expediente predial	SERVICIO	IMPUESTO_PREDIAL	Copias simples o certificadas del expediente o recibos bajo resguardo de Tesorería.	Copias del expediente o recibo certificado	Sin plazo (a solicitud del contribuyente)	Art. 147 a y b; 171 VIII CFEM; 135 CPA.	\N	f	f	\N	15 días	1ra foja $96.00 / 2da foja $47.00	96.00	t	f	t	t	t	f	2025-01-31	t	\N
11	CORRECCION_DATOS_TRASLADO	Corrección de datos en traslado de dominio	TRAMITE	TRASLADO_DOMINIO	Corrección de dato incorrecto en el formato de traslado de dominio.	Corrección de datos en traslado de dominio	Permanente	Arts. 70, 71, 113 CFEM.	\N	f	f	\N	30 días hábiles	$113.00	113.00	f	f	t	t	t	t	2025-02-06	t	\N
12	CORRECCION_MEDIDAS	Corrección de medidas y colindancias (terreno y/o construcción)	SERVICIO	CATASTRO	Rectificación de medidas o superficie mediante verificación de campo.	Certificación de clave y valor catastral	Ejercicio fiscal vigente	Arts. 167, 168, 171, 173, 175, 181, 182 CFEM; 21, 22 I b y c Reglamento T5.	\N	t	f	\N	8 días hábiles posteriores a la visita	$282.85 (2.5 UMA)	282.85	f	f	t	t	t	t	2025-01-31	t	\N
13	DEGUELLO_RASTRO	Degüello en rastro	SERVICIO	EJECUCION_FISCAL	Derecho por el sacrificio de animales destinados al consumo humano.	Recibo de pago mensual	La que indique el recibo	Arts. 48 I y III, 150, 151, 361 XIII CFEM.	\N	t	f	\N	Inmediato	Gratuito	\N	f	t	t	t	t	f	2025-01-31	t	\N
14	ESTACIONAMIENTOS	Derechos por servicio de estacionamiento	SERVICIO	EJECUCION_FISCAL	Derecho por prestar servicio de estacionamiento en lugares públicos y privados.	Recibo de pago bimestral	La que indique el recibo	Arts. 48 I y III, 157, 158, 361 XIII CFEM.	\N	t	f	\N	Inmediato	Gratuito	\N	f	t	t	t	t	f	2025-01-31	t	\N
15	ISAI_TRASLATIVA_DOMINIO	Impuesto sobre la adquisición de inmuebles (ISAI) / Traslativa de dominio	TRAMITE	TRASLADO_DOMINIO	Registro del predio a nombre del nuevo propietario tras adquisición.	Formato de traslado de dominio y recibo de pago autorizados	Permanente	Arts. 46 III, 113, 114, 115, 116, 117, 171 I CFEM; 4 LI Municipios.	\N	f	f	\N	30 días hábiles	Fijo según tabla de valores (Arts. 115 y 116 CFEM)	\N	t	f	t	t	t	t	2025-02-06	t	\N
16	JUEGOS_MAQUINITAS	Impuesto sobre juegos (maquinitas)	SERVICIO	EJECUCION_FISCAL	Impuesto sobre ingresos por explotación de maquinitas.	Recibo de pago mensual	La que indique el recibo	Arts. 48 I y III, 122, 123, 361 XIII CFEM.	\N	t	f	\N	Inmediato	Gratuito	\N	f	t	t	t	t	f	2025-01-31	t	\N
17	LEVANTAMIENTO_TOPOGRAFICO	Levantamiento topográfico catastral	SERVICIO	CATASTRO	Levantamiento topográfico con base en documento de propiedad y evidencias físicas.	Acta administrativa y plano de levantamiento topográfico	Permanente (salvo modificación)	Arts. 166 V, 167, 168, 169 IV, 171, 173, 175, 179, 182 CFEM.	\N	t	f	\N	25 días hábiles posteriores a la visita	Variable según superficie (Art. 166 V CFEM)	\N	t	f	t	t	t	t	2025-01-31	t	\N
18	PAGO_IMPUESTO_PREDIAL	Pago del impuesto predial	SERVICIO	IMPUESTO_PREDIAL	Pago anual del impuesto predial por contribuyentes inscritos en el padrón.	Recibo de pago de impuesto predial	Periodo del recibo	Art. 8 CPEUM; 2, 7, 9 LI EdoMex; 107-112 CFEM.	\N	f	t	https://sfpya.edomexico.gob.mx/predial/	15 minutos	Sin costo (el pago del propio impuesto)	\N	t	t	t	t	t	t	2025-01-31	t	\N
19	SUBDIVISION_LOTIFICACION	Subdivisión, fusión, lotificación o relotificación	SERVICIO	CATASTRO	Actualización del padrón catastral por subdivisión, fusión, lotificación o relotificación previa autorización SEDUO.	Certificado de clave y valor catastral	Ejercicio fiscal vigente	Arts. 167, 168, 171, 173, 175, 175 Bis, 182 CFEM.	\N	t	f	\N	Variable	Conforme a Art. 166 II CFEM	\N	t	f	t	t	t	t	2025-01-31	t	\N
20	VERIFICACION_LINDEROS	Verificación de linderos	SERVICIO	CATASTRO	Verificación de linderos y superficies sin notificación a colindantes.	Oficio y plano de levantamiento topográfico	Permanente (salvo modificación)	Arts. 166 VI, 167, 168, 169, 171, 173, 175, 179, 182 CFEM.	\N	t	f	\N	25 días hábiles posteriores a la visita	Variable según superficie (Art. 166 VI CFEM)	\N	t	f	t	t	t	t	2025-01-31	t	\N
8	CONVENIO	Convenio de pago en parcialidades	SERVICIO	EJECUCION_FISCAL	Pago en parcialidades mensuales de contribuciones municipales.	Recibo por parcialidad y carta finiquito al término	No aplica	Arts. 17, 30, 32, 33, 34 CFEM; 47 Bando Municipal 2025.	\N	f	f	\N	Inmediato	Gratuito	\N	f	t	t	t	t	f	2025-01-31	t	20.00
\.


--
-- Data for Name: tramite_relacion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tramite_relacion (tramite_id, tramite_relacionado_id, relacion) FROM stdin;
4	3	RELACIONADO
15	3	PRERREQUISITO
15	4	PRERREQUISITO
18	4	RELACIONADO
17	3	RELACIONADO
20	3	RELACIONADO
12	3	RELACIONADO
\.


--
-- Data for Name: tramite_requisito; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tramite_requisito (tramite_requisito_id, tramite_id, aplica_a, orden, tipo_documento_id, grupo_id, original_requerido, copias_requeridas, obligatorio, condicion, notas) FROM stdin;
1	1	FISICA	1	13	\N	t	0	t	\N	\N
2	1	FISICA	2	14	\N	t	1	t	Cuando hay modificaciones de superficie	\N
3	1	FISICA	3	\N	1	f	1	t	\N	\N
4	1	FISICA	4	1	\N	f	1	t	Del propietario y/o representante legal	\N
5	1	FISICA	5	15	\N	t	0	t	\N	\N
6	1	FISICA	6	16	\N	t	0	t	\N	\N
7	1	INSTITUCION_PUBLICA	1	13	\N	t	0	t	Solicita exención	\N
8	1	INSTITUCION_PUBLICA	2	14	\N	t	0	t	Si hay modificación de superficie	\N
9	1	INSTITUCION_PUBLICA	3	\N	1	t	1	t	\N	\N
10	1	INSTITUCION_PUBLICA	4	1	\N	f	1	t	\N	\N
11	1	INSTITUCION_PUBLICA	5	24	\N	t	0	t	\N	\N
12	1	INSTITUCION_PUBLICA	6	15	\N	t	0	t	\N	\N
13	1	INSTITUCION_PUBLICA	7	16	\N	t	0	t	\N	\N
14	2	FISICA	1	18	\N	t	1	t	\N	\N
15	2	FISICA	2	\N	1	t	1	t	\N	\N
16	2	FISICA	3	19	\N	t	1	t	\N	\N
17	2	FISICA	4	1	\N	t	1	t	Titular, o carta poder con dos testigos	\N
18	2	FISICA	5	2	\N	t	1	f	Si no acude el titular	\N
19	2	JURIDICA	1	\N	1	t	1	t	\N	\N
20	2	JURIDICA	2	3	\N	t	1	t	\N	\N
21	2	JURIDICA	3	4	\N	t	0	t	\N	\N
22	2	JURIDICA	4	18	\N	t	1	t	\N	\N
23	2	JURIDICA	5	19	\N	t	1	t	\N	\N
24	2	INSTITUCION_PUBLICA	1	1	\N	t	1	t	\N	\N
25	2	INSTITUCION_PUBLICA	2	3	\N	t	1	t	\N	\N
26	2	INSTITUCION_PUBLICA	3	4	\N	t	1	t	\N	\N
27	2	INSTITUCION_PUBLICA	4	18	\N	t	1	t	\N	\N
28	2	INSTITUCION_PUBLICA	5	19	\N	t	1	t	\N	\N
29	3	FISICA	1	13	\N	t	0	t	\N	\N
30	3	FISICA	2	14	\N	t	0	t	Si hay modificaciones de superficie	\N
31	3	FISICA	3	\N	1	t	1	t	\N	\N
32	3	FISICA	4	1	\N	f	1	t	\N	\N
33	3	FISICA	5	2	\N	t	0	f	Si no es el propietario/representante	\N
34	3	FISICA	6	18	\N	f	1	t	\N	\N
35	3	FISICA	7	20	\N	t	1	t	\N	\N
36	3	FISICA	8	15	\N	t	0	t	\N	\N
37	3	FISICA	9	16	\N	t	0	t	\N	\N
38	3	JURIDICA	1	13	\N	t	0	t	\N	\N
39	3	JURIDICA	2	\N	1	t	1	t	\N	\N
40	3	JURIDICA	3	3	\N	t	1	t	\N	\N
41	3	JURIDICA	4	4	\N	t	1	t	\N	\N
42	3	JURIDICA	5	1	\N	f	1	t	\N	\N
43	3	JURIDICA	6	18	\N	f	1	t	\N	\N
44	3	JURIDICA	7	20	\N	t	1	t	\N	\N
45	3	JURIDICA	8	15	\N	t	0	t	\N	\N
46	3	JURIDICA	9	16	\N	t	0	t	\N	\N
47	3	INSTITUCION_PUBLICA	1	13	\N	t	0	t	\N	\N
48	3	INSTITUCION_PUBLICA	2	14	\N	t	0	t	\N	\N
49	3	INSTITUCION_PUBLICA	3	\N	1	t	1	t	\N	\N
50	3	INSTITUCION_PUBLICA	4	1	\N	f	1	t	\N	\N
51	3	INSTITUCION_PUBLICA	5	2	\N	t	0	f	\N	\N
52	3	INSTITUCION_PUBLICA	6	24	\N	t	1	t	\N	\N
53	4	FISICA	1	\N	1	t	1	t	\N	\N
54	4	FISICA	2	1	\N	t	1	t	\N	\N
55	4	FISICA	3	18	\N	t	1	t	\N	\N
56	4	JURIDICA	1	1	\N	t	1	t	\N	\N
57	4	JURIDICA	2	3	\N	t	1	t	\N	\N
58	4	JURIDICA	3	4	\N	t	1	t	\N	\N
59	4	INSTITUCION_PUBLICA	1	1	\N	t	1	t	\N	\N
60	4	INSTITUCION_PUBLICA	2	3	\N	t	1	t	\N	\N
61	4	INSTITUCION_PUBLICA	3	4	\N	t	1	t	\N	\N
62	5	FISICA	1	13	\N	t	0	t	\N	\N
63	5	FISICA	2	\N	1	t	1	t	\N	\N
64	5	FISICA	3	1	\N	f	1	t	\N	\N
65	5	FISICA	4	18	\N	f	1	t	\N	\N
66	5	FISICA	5	20	\N	t	1	t	\N	\N
67	5	FISICA	6	2	\N	t	0	f	Si no es el propietario	\N
68	5	FISICA	7	15	\N	t	0	t	\N	\N
69	5	FISICA	8	16	\N	t	0	t	\N	\N
70	5	JURIDICA	1	13	\N	t	0	t	\N	\N
71	5	JURIDICA	2	\N	1	t	1	t	\N	\N
72	5	JURIDICA	3	1	\N	f	1	t	\N	\N
73	5	JURIDICA	4	3	\N	t	1	t	\N	\N
74	5	JURIDICA	5	18	\N	f	1	t	\N	\N
75	5	JURIDICA	6	20	\N	t	1	t	\N	\N
76	5	JURIDICA	7	15	\N	t	0	t	\N	\N
77	5	JURIDICA	8	16	\N	t	0	t	\N	\N
78	5	INSTITUCION_PUBLICA	1	13	\N	t	0	t	\N	\N
79	5	INSTITUCION_PUBLICA	2	\N	1	t	1	t	\N	\N
80	5	INSTITUCION_PUBLICA	3	1	\N	f	1	t	\N	\N
81	5	INSTITUCION_PUBLICA	4	2	\N	t	1	f	\N	\N
82	5	INSTITUCION_PUBLICA	5	24	\N	t	1	t	\N	\N
83	5	INSTITUCION_PUBLICA	6	15	\N	t	0	t	\N	\N
84	5	INSTITUCION_PUBLICA	7	16	\N	t	0	t	\N	\N
85	6	FISICA	1	5	\N	f	1	t	\N	\N
86	6	FISICA	2	6	\N	f	1	f	Si hay resolución judicial	\N
87	6	FISICA	3	31	\N	f	1	f	Si existe el formato y pago original	\N
88	6	FISICA	4	\N	1	t	1	t	Documento privado cotejado ante notario	\N
89	6	FISICA	5	1	\N	t	1	t	\N	\N
90	6	FISICA	6	32	\N	t	1	t	\N	\N
91	6	FISICA	7	18	\N	f	1	t	\N	\N
92	6	INSTITUCION_PUBLICA	1	5	\N	f	1	t	\N	\N
93	6	INSTITUCION_PUBLICA	2	6	\N	f	1	f	\N	\N
94	6	INSTITUCION_PUBLICA	3	31	\N	f	1	f	\N	\N
95	6	INSTITUCION_PUBLICA	4	\N	1	t	1	t	\N	\N
96	6	INSTITUCION_PUBLICA	5	3	\N	t	0	t	\N	\N
97	6	INSTITUCION_PUBLICA	6	32	\N	t	1	t	\N	\N
98	6	INSTITUCION_PUBLICA	7	18	\N	f	1	t	\N	\N
99	7	FISICA	1	13	\N	t	0	t	\N	\N
100	7	FISICA	2	14	\N	t	0	t	Si hay modificaciones de superficie	\N
101	7	FISICA	3	\N	1	t	1	t	\N	\N
102	7	FISICA	4	1	\N	t	1	t	\N	\N
103	7	FISICA	5	18	\N	f	1	t	\N	\N
104	7	FISICA	6	20	\N	t	1	t	\N	\N
105	7	FISICA	7	15	\N	t	0	t	\N	\N
106	7	FISICA	8	16	\N	t	0	t	\N	\N
107	7	JURIDICA	1	13	\N	t	0	t	\N	\N
108	7	JURIDICA	2	\N	1	t	1	t	\N	\N
109	7	JURIDICA	3	3	\N	t	1	t	\N	\N
110	7	JURIDICA	4	4	\N	t	1	t	\N	\N
111	7	JURIDICA	5	1	\N	t	1	t	\N	\N
112	7	JURIDICA	6	18	\N	f	1	t	\N	\N
113	7	JURIDICA	7	20	\N	t	1	t	\N	\N
114	7	JURIDICA	8	15	\N	t	0	t	\N	\N
115	7	JURIDICA	9	16	\N	t	0	t	\N	\N
116	7	INSTITUCION_PUBLICA	1	13	\N	t	0	t	\N	\N
117	7	INSTITUCION_PUBLICA	2	\N	1	t	1	t	\N	\N
118	7	INSTITUCION_PUBLICA	3	1	\N	t	1	t	\N	\N
119	7	INSTITUCION_PUBLICA	4	24	\N	t	1	t	\N	\N
120	7	INSTITUCION_PUBLICA	5	15	\N	t	0	t	\N	\N
121	7	INSTITUCION_PUBLICA	6	16	\N	t	0	t	\N	\N
122	8	FISICA	1	22	\N	t	0	t	\N	\N
123	8	FISICA	2	23	\N	t	0	t	\N	\N
124	8	FISICA	3	\N	1	t	0	f	Si convenio es por predial o traslado de dominio	\N
125	8	FISICA	4	2	\N	t	0	f	En lugar de propiedad, si aplica	\N
126	8	FISICA	5	1	\N	t	0	t	\N	\N
127	8	JURIDICA	1	22	\N	t	0	t	\N	\N
128	8	JURIDICA	2	23	\N	t	0	t	\N	\N
129	8	JURIDICA	3	\N	1	t	0	f	\N	\N
130	8	JURIDICA	4	3	\N	t	0	t	\N	\N
131	8	JURIDICA	5	1	\N	t	0	t	\N	\N
132	8	INSTITUCION_PUBLICA	1	22	\N	t	0	t	\N	\N
133	8	INSTITUCION_PUBLICA	2	23	\N	t	0	t	\N	\N
134	8	INSTITUCION_PUBLICA	3	\N	1	t	0	f	\N	\N
135	8	INSTITUCION_PUBLICA	4	3	\N	t	0	t	\N	\N
136	8	INSTITUCION_PUBLICA	5	1	\N	t	0	t	\N	\N
137	9	FISICA	1	5	\N	f	1	t	\N	\N
138	9	FISICA	2	6	\N	f	1	f	\N	\N
139	9	FISICA	3	9	\N	f	1	f	Si es vivienda FONHAPO	\N
140	9	FISICA	4	\N	1	t	0	f	Documento privado	\N
141	9	FISICA	5	1	\N	t	1	t	\N	\N
142	9	FISICA	6	32	\N	t	1	t	Llenado con tinta azul	\N
143	9	FISICA	7	18	\N	f	1	t	\N	\N
144	9	INSTITUCION_PUBLICA	1	5	\N	f	1	t	\N	\N
145	9	INSTITUCION_PUBLICA	2	6	\N	f	1	f	\N	\N
146	9	INSTITUCION_PUBLICA	3	9	\N	f	1	f	\N	\N
147	9	INSTITUCION_PUBLICA	4	\N	1	t	0	f	\N	\N
148	9	INSTITUCION_PUBLICA	5	3	\N	t	1	t	\N	\N
149	9	INSTITUCION_PUBLICA	6	32	\N	t	1	t	\N	\N
150	9	INSTITUCION_PUBLICA	7	18	\N	f	1	t	\N	\N
151	10	FISICA	1	\N	1	t	0	t	\N	\N
152	10	FISICA	2	1	\N	t	0	t	\N	\N
153	10	JURIDICA	1	\N	1	t	0	t	\N	\N
154	10	JURIDICA	2	3	\N	t	0	t	\N	\N
155	10	JURIDICA	3	4	\N	t	0	t	\N	\N
156	10	INSTITUCION_PUBLICA	1	1	\N	t	0	t	\N	\N
157	10	INSTITUCION_PUBLICA	2	3	\N	t	0	t	\N	\N
158	10	INSTITUCION_PUBLICA	3	4	\N	t	0	t	\N	\N
159	11	FISICA	1	5	\N	f	1	t	\N	\N
160	11	FISICA	2	6	\N	f	1	f	\N	\N
161	11	FISICA	3	\N	1	t	0	f	\N	\N
162	11	FISICA	4	31	\N	t	1	t	\N	\N
163	11	FISICA	5	1	\N	t	1	t	\N	\N
164	11	FISICA	6	32	\N	f	1	t	\N	\N
165	11	FISICA	7	18	\N	f	1	t	\N	\N
166	11	FISICA	8	25	\N	t	1	f	Si el error proviene del nombre en documento de propiedad	\N
167	11	INSTITUCION_PUBLICA	1	5	\N	f	1	t	\N	\N
168	11	INSTITUCION_PUBLICA	2	6	\N	f	1	f	\N	\N
169	11	INSTITUCION_PUBLICA	3	31	\N	t	1	t	\N	\N
170	11	INSTITUCION_PUBLICA	4	3	\N	t	1	t	\N	\N
171	11	INSTITUCION_PUBLICA	5	32	\N	t	1	t	\N	\N
172	11	INSTITUCION_PUBLICA	6	18	\N	f	1	t	\N	\N
173	12	FISICA	1	13	\N	t	0	t	\N	\N
174	12	FISICA	2	\N	1	f	1	t	\N	\N
175	12	FISICA	3	18	\N	f	1	t	\N	\N
176	12	FISICA	4	1	\N	f	1	t	\N	\N
177	12	FISICA	5	2	\N	t	0	f	Si no es el propietario	\N
178	12	FISICA	6	20	\N	t	1	t	\N	\N
179	12	FISICA	7	15	\N	t	0	t	\N	\N
180	12	FISICA	8	16	\N	t	0	t	\N	\N
181	12	JURIDICA	1	13	\N	t	0	t	\N	\N
182	12	JURIDICA	2	\N	1	f	1	t	\N	\N
183	12	JURIDICA	3	18	\N	f	1	t	\N	\N
184	12	JURIDICA	4	3	\N	t	1	t	\N	\N
185	12	JURIDICA	5	1	\N	f	1	t	\N	\N
186	12	JURIDICA	6	20	\N	t	1	t	\N	\N
187	12	JURIDICA	7	15	\N	t	0	t	\N	\N
188	12	JURIDICA	8	16	\N	t	0	t	\N	\N
189	12	INSTITUCION_PUBLICA	1	13	\N	t	0	t	\N	\N
190	12	INSTITUCION_PUBLICA	2	\N	1	f	1	t	\N	\N
191	12	INSTITUCION_PUBLICA	3	1	\N	f	1	t	\N	\N
192	12	INSTITUCION_PUBLICA	4	2	\N	t	0	f	\N	\N
193	12	INSTITUCION_PUBLICA	5	24	\N	t	0	t	\N	\N
194	12	INSTITUCION_PUBLICA	6	15	\N	t	0	t	\N	\N
195	12	INSTITUCION_PUBLICA	7	16	\N	t	0	t	\N	\N
196	13	FISICA	1	22	\N	t	0	t	Manifestando número de animales sacrificados	\N
197	13	FISICA	2	21	\N	f	1	t	\N	\N
198	13	JURIDICA	1	22	\N	t	0	t	\N	\N
199	13	JURIDICA	2	21	\N	f	1	t	\N	\N
200	13	INSTITUCION_PUBLICA	1	22	\N	t	0	t	\N	\N
201	13	INSTITUCION_PUBLICA	2	21	\N	f	1	t	\N	\N
202	14	FISICA	1	21	\N	f	1	t	\N	\N
203	14	JURIDICA	1	21	\N	f	1	t	\N	\N
204	14	INSTITUCION_PUBLICA	1	21	\N	f	1	t	\N	\N
205	15	FISICA	1	5	\N	f	1	t	\N	\N
206	15	FISICA	2	6	\N	f	1	f	\N	\N
207	15	FISICA	3	\N	1	t	0	f	Documento privado cotejado	\N
208	15	FISICA	4	27	\N	t	1	t	\N	\N
209	15	FISICA	5	29	\N	t	1	f	\N	\N
210	15	FISICA	6	28	\N	t	1	t	\N	\N
211	15	FISICA	7	30	\N	t	1	t	\N	\N
212	15	FISICA	8	1	\N	t	1	t	\N	\N
213	15	FISICA	9	32	\N	t	1	t	\N	\N
214	15	INSTITUCION_PUBLICA	1	5	\N	t	1	t	\N	\N
215	15	INSTITUCION_PUBLICA	2	6	\N	t	1	f	\N	\N
216	15	INSTITUCION_PUBLICA	3	\N	1	t	1	f	\N	\N
217	15	INSTITUCION_PUBLICA	4	27	\N	t	1	t	\N	\N
218	15	INSTITUCION_PUBLICA	5	29	\N	t	1	f	\N	\N
219	15	INSTITUCION_PUBLICA	6	28	\N	t	1	t	\N	\N
220	15	INSTITUCION_PUBLICA	7	30	\N	t	1	t	\N	\N
221	15	INSTITUCION_PUBLICA	8	3	\N	t	1	t	\N	\N
222	15	INSTITUCION_PUBLICA	9	32	\N	t	1	t	\N	\N
223	16	FISICA	1	21	\N	f	1	t	\N	\N
224	16	JURIDICA	1	21	\N	f	1	t	\N	\N
225	16	INSTITUCION_PUBLICA	1	21	\N	f	1	t	\N	\N
226	17	FISICA	1	13	\N	t	0	t	\N	\N
227	17	FISICA	2	\N	1	f	1	t	\N	\N
228	17	FISICA	3	18	\N	f	1	t	\N	\N
229	17	FISICA	4	1	\N	f	1	t	\N	\N
230	17	FISICA	5	2	\N	t	0	f	Si no es el propietario	\N
231	17	FISICA	6	17	\N	t	0	t	\N	\N
232	17	FISICA	7	20	\N	t	1	t	\N	\N
233	17	FISICA	8	15	\N	t	0	t	\N	\N
234	17	FISICA	9	16	\N	t	0	t	\N	\N
235	17	JURIDICA	1	13	\N	t	0	t	\N	\N
236	17	JURIDICA	2	\N	1	f	1	t	\N	\N
237	17	JURIDICA	3	18	\N	f	1	t	\N	\N
238	17	JURIDICA	4	1	\N	f	1	t	\N	\N
239	17	JURIDICA	5	3	\N	t	1	t	\N	\N
240	17	JURIDICA	6	17	\N	t	0	t	\N	\N
241	17	JURIDICA	7	20	\N	t	1	t	\N	\N
242	17	JURIDICA	8	15	\N	t	0	t	\N	\N
243	17	JURIDICA	9	16	\N	t	0	t	\N	\N
244	17	INSTITUCION_PUBLICA	1	13	\N	t	0	t	\N	\N
245	17	INSTITUCION_PUBLICA	2	\N	1	f	1	t	\N	\N
246	17	INSTITUCION_PUBLICA	3	1	\N	t	0	t	\N	\N
247	17	INSTITUCION_PUBLICA	4	2	\N	t	0	f	\N	\N
248	17	INSTITUCION_PUBLICA	5	24	\N	t	0	t	\N	\N
249	17	INSTITUCION_PUBLICA	6	15	\N	t	0	t	\N	\N
250	17	INSTITUCION_PUBLICA	7	16	\N	t	0	t	\N	\N
257	19	FISICA	1	13	\N	t	0	t	\N	\N
258	19	FISICA	2	14	\N	t	0	t	\N	\N
259	19	FISICA	3	26	\N	t	1	t	\N	\N
260	19	FISICA	4	\N	1	f	1	t	\N	\N
261	19	FISICA	5	1	\N	f	1	t	\N	\N
262	19	FISICA	6	18	\N	f	1	t	\N	\N
263	19	FISICA	7	2	\N	t	0	f	Si no es el propietario	\N
264	19	FISICA	8	20	\N	f	1	t	\N	\N
265	19	FISICA	9	15	\N	t	0	t	\N	\N
266	19	FISICA	10	16	\N	t	0	t	\N	\N
267	19	JURIDICA	1	13	\N	t	0	t	\N	\N
268	19	JURIDICA	2	14	\N	t	0	t	\N	\N
269	19	JURIDICA	3	26	\N	t	1	t	\N	\N
270	19	JURIDICA	4	\N	1	f	1	t	\N	\N
271	19	JURIDICA	5	3	\N	t	1	t	\N	\N
272	19	JURIDICA	6	1	\N	f	1	t	\N	\N
273	19	JURIDICA	7	18	\N	f	1	t	\N	\N
274	19	JURIDICA	8	20	\N	f	1	t	\N	\N
275	19	JURIDICA	9	15	\N	t	0	t	\N	\N
276	19	JURIDICA	10	16	\N	t	0	t	\N	\N
277	19	INSTITUCION_PUBLICA	1	13	\N	t	0	t	\N	\N
278	19	INSTITUCION_PUBLICA	2	14	\N	t	0	t	\N	\N
279	19	INSTITUCION_PUBLICA	3	26	\N	t	1	t	\N	\N
280	19	INSTITUCION_PUBLICA	4	\N	1	f	1	t	\N	\N
281	19	INSTITUCION_PUBLICA	5	1	\N	f	1	t	\N	\N
282	19	INSTITUCION_PUBLICA	6	18	\N	f	1	t	\N	\N
283	19	INSTITUCION_PUBLICA	7	2	\N	t	0	f	\N	\N
284	19	INSTITUCION_PUBLICA	8	24	\N	t	0	t	\N	\N
285	20	FISICA	1	13	\N	t	0	t	\N	\N
286	20	FISICA	2	\N	1	f	1	t	\N	\N
287	20	FISICA	3	18	\N	f	1	t	\N	\N
288	20	FISICA	4	1	\N	f	1	t	\N	\N
289	20	FISICA	5	2	\N	t	0	f	Si no es el propietario	\N
290	20	FISICA	6	20	\N	t	1	t	\N	\N
291	20	FISICA	7	15	\N	t	0	t	\N	\N
292	20	FISICA	8	16	\N	t	0	t	\N	\N
293	20	JURIDICA	1	13	\N	t	0	t	\N	\N
294	20	JURIDICA	2	\N	1	f	1	t	\N	\N
295	20	JURIDICA	3	18	\N	f	1	t	\N	\N
296	20	JURIDICA	4	1	\N	f	1	t	\N	\N
297	20	JURIDICA	5	3	\N	t	1	t	\N	\N
298	20	JURIDICA	6	20	\N	t	1	t	\N	\N
299	20	JURIDICA	7	15	\N	t	0	t	\N	\N
300	20	JURIDICA	8	16	\N	t	0	t	\N	\N
301	20	INSTITUCION_PUBLICA	1	13	\N	t	0	t	\N	\N
302	20	INSTITUCION_PUBLICA	2	\N	1	f	1	t	\N	\N
303	20	INSTITUCION_PUBLICA	3	1	\N	f	1	t	\N	\N
304	20	INSTITUCION_PUBLICA	4	2	\N	t	0	f	\N	\N
305	20	INSTITUCION_PUBLICA	5	27	\N	t	0	t	\N	\N
306	20	INSTITUCION_PUBLICA	6	17	\N	t	0	t	\N	\N
307	20	INSTITUCION_PUBLICA	7	24	\N	t	0	t	\N	\N
308	20	INSTITUCION_PUBLICA	8	15	\N	t	0	t	\N	\N
309	20	INSTITUCION_PUBLICA	9	16	\N	t	0	t	\N	\N
310	18	FISICA	1	\N	2	f	1	t	Ultimo recibo predial o identificacion oficial	\N
311	18	JURIDICA	1	\N	2	f	1	t	Ultimo recibo predial o identificacion oficial	\N
312	18	INSTITUCION_PUBLICA	1	\N	2	f	1	t	Ultimo recibo predial o identificacion oficial	\N
313	1	JURIDICA	1	13	\N	t	0	t	\N	\N
314	1	JURIDICA	2	14	\N	t	1	t	Cuando hay modificaciones de superficie	\N
315	1	JURIDICA	3	\N	1	f	1	t	\N	\N
316	1	JURIDICA	4	1	\N	f	1	t	Del propietario y/o representante legal	\N
317	1	JURIDICA	5	15	\N	t	0	t	\N	\N
318	1	JURIDICA	6	16	\N	t	0	t	\N	\N
319	6	JURIDICA	1	5	\N	f	1	t	\N	\N
320	6	JURIDICA	2	6	\N	f	1	f	Si hay resolución judicial	\N
321	6	JURIDICA	3	31	\N	f	1	f	Si existe el formato y pago original	\N
322	6	JURIDICA	4	\N	1	t	1	t	Documento privado cotejado ante notario	\N
323	6	JURIDICA	5	1	\N	t	1	t	\N	\N
324	6	JURIDICA	6	32	\N	t	1	t	\N	\N
325	6	JURIDICA	7	18	\N	f	1	t	\N	\N
326	9	JURIDICA	1	5	\N	f	1	t	\N	\N
327	9	JURIDICA	2	6	\N	f	1	f	\N	\N
328	9	JURIDICA	3	9	\N	f	1	f	Si es vivienda FONHAPO	\N
329	9	JURIDICA	4	\N	1	t	0	f	Documento privado	\N
330	9	JURIDICA	5	1	\N	t	1	t	\N	\N
331	9	JURIDICA	6	32	\N	t	1	t	Llenado con tinta azul	\N
332	9	JURIDICA	7	18	\N	f	1	t	\N	\N
333	11	JURIDICA	1	5	\N	f	1	t	\N	\N
334	11	JURIDICA	2	6	\N	f	1	f	\N	\N
335	11	JURIDICA	3	\N	1	t	0	f	\N	\N
336	11	JURIDICA	4	31	\N	t	1	t	\N	\N
337	11	JURIDICA	5	1	\N	t	1	t	\N	\N
338	11	JURIDICA	6	32	\N	f	1	t	\N	\N
339	11	JURIDICA	7	18	\N	f	1	t	\N	\N
340	11	JURIDICA	8	25	\N	t	1	f	Si el error proviene del nombre en documento de propiedad	\N
341	11	JURIDICA	9	3	\N	t	1	t	\N	Agregado por herencia JURIDICA
342	9	JURIDICA	8	3	\N	t	1	t	\N	Agregado por herencia JURIDICA
343	1	JURIDICA	7	3	\N	t	1	t	\N	Agregado por herencia JURIDICA
344	6	JURIDICA	8	3	\N	t	1	t	\N	Agregado por herencia JURIDICA
345	11	JURIDICA	10	4	\N	t	1	t	\N	Agregado por herencia JURIDICA
346	9	JURIDICA	9	4	\N	t	1	t	\N	Agregado por herencia JURIDICA
347	1	JURIDICA	8	4	\N	t	1	t	\N	Agregado por herencia JURIDICA
348	6	JURIDICA	9	4	\N	t	1	t	\N	Agregado por herencia JURIDICA
\.


--
-- Name: tramite_requisito_tramite_requisito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tramite_requisito_tramite_requisito_id_seq', 348, true);


--
-- Name: contribuyente contribuyente_curp_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuyente
    ADD CONSTRAINT contribuyente_curp_key UNIQUE (curp);


--
-- Name: contribuyente contribuyente_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuyente
    ADD CONSTRAINT contribuyente_email_key UNIQUE (email);


--
-- Name: contribuyente contribuyente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuyente
    ADD CONSTRAINT contribuyente_pkey PRIMARY KEY (contribuyente_id);


--
-- Name: contribuyente contribuyente_rfc_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribuyente
    ADD CONSTRAINT contribuyente_rfc_key UNIQUE (rfc);


--
-- Name: documento documento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT documento_pkey PRIMARY KEY (documento_id);


--
-- Name: grupo_documento grupo_documento_codigo_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo_documento
    ADD CONSTRAINT grupo_documento_codigo_key UNIQUE (codigo);


--
-- Name: grupo_documento grupo_documento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo_documento
    ADD CONSTRAINT grupo_documento_pkey PRIMARY KEY (grupo_id);


--
-- Name: grupo_documento_tipo grupo_documento_tipo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo_documento_tipo
    ADD CONSTRAINT grupo_documento_tipo_pkey PRIMARY KEY (grupo_id, tipo_documento_id);


--
-- Name: inmueble inmueble_clave_catastral_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inmueble
    ADD CONSTRAINT inmueble_clave_catastral_key UNIQUE (clave_catastral);


--
-- Name: inmueble_contribuyente inmueble_contribuyente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inmueble_contribuyente
    ADD CONSTRAINT inmueble_contribuyente_pkey PRIMARY KEY (inmueble_id, contribuyente_id, tipo_vinculo);


--
-- Name: inmueble inmueble_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inmueble
    ADD CONSTRAINT inmueble_pkey PRIMARY KEY (inmueble_id);


--
-- Name: representante representante_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.representante
    ADD CONSTRAINT representante_pkey PRIMARY KEY (representante_id);


--
-- Name: solicitud_documento solicitud_documento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.solicitud_documento
    ADD CONSTRAINT solicitud_documento_pkey PRIMARY KEY (solicitud_id, tramite_requisito_id);


--
-- Name: solicitud solicitud_folio_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.solicitud
    ADD CONSTRAINT solicitud_folio_key UNIQUE (folio);


--
-- Name: solicitud solicitud_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.solicitud
    ADD CONSTRAINT solicitud_pkey PRIMARY KEY (solicitud_id);


--
-- Name: tipo_documento_alias tipo_documento_alias_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_documento_alias
    ADD CONSTRAINT tipo_documento_alias_pkey PRIMARY KEY (tipo_documento_id, alias);


--
-- Name: tipo_documento tipo_documento_codigo_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_documento
    ADD CONSTRAINT tipo_documento_codigo_key UNIQUE (codigo);


--
-- Name: tipo_documento tipo_documento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_documento
    ADD CONSTRAINT tipo_documento_pkey PRIMARY KEY (tipo_documento_id);


--
-- Name: tramite tramite_codigo_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tramite
    ADD CONSTRAINT tramite_codigo_key UNIQUE (codigo);


--
-- Name: tramite tramite_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tramite
    ADD CONSTRAINT tramite_pkey PRIMARY KEY (tramite_id);


--
-- Name: tramite_relacion tramite_relacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tramite_relacion
    ADD CONSTRAINT tramite_relacion_pkey PRIMARY KEY (tramite_id, tramite_relacionado_id);


--
-- Name: tramite_requisito tramite_requisito_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tramite_requisito
    ADD CONSTRAINT tramite_requisito_pkey PRIMARY KEY (tramite_requisito_id);


--
-- Name: tramite_requisito tramite_requisito_tramite_id_aplica_a_orden_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tramite_requisito
    ADD CONSTRAINT tramite_requisito_tramite_id_aplica_a_orden_key UNIQUE (tramite_id, aplica_a, orden);


--
-- Name: documento uq_doc_contrib_sha; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT uq_doc_contrib_sha UNIQUE (contribuyente_id, sha256);


--
-- Name: ix_contribuyente_nombre; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_contribuyente_nombre ON public.contribuyente USING btree (nombre_razon_social);


--
-- Name: ix_contribuyente_tipo; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_contribuyente_tipo ON public.contribuyente USING btree (tipo_persona);


--
-- Name: ix_documento_contrib_tipo; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_documento_contrib_tipo ON public.documento USING btree (contribuyente_id, tipo_documento_id) WHERE (estado = 'VIGENTE'::public.doc_estado);


--
-- Name: ix_documento_inmueble_tipo; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_documento_inmueble_tipo ON public.documento USING btree (inmueble_id, tipo_documento_id) WHERE (estado = 'VIGENTE'::public.doc_estado);


--
-- Name: ix_documento_sha256; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_documento_sha256 ON public.documento USING btree (sha256);


--
-- Name: ix_documento_vigencia; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_documento_vigencia ON public.documento USING btree (vigente_hasta) WHERE (vigente_hasta IS NOT NULL);


--
-- Name: ix_representante_contrib; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_representante_contrib ON public.representante USING btree (contribuyente_id);


--
-- Name: ix_req_tramite_persona; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_req_tramite_persona ON public.tramite_requisito USING btree (tramite_id, aplica_a);


--
-- Name: ix_soldoc_doc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_soldoc_doc ON public.solicitud_documento USING btree (documento_id);


--
-- Name: ix_solicitud_contribuyente; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_solicitud_contribuyente ON public.solicitud USING btree (contribuyente_id);


--
-- Name: ix_solicitud_estado; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_solicitud_estado ON public.solicitud USING btree (estado);


--
-- Name: ix_solicitud_tramite; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_solicitud_tramite ON public.solicitud USING btree (tramite_id);


--
-- Name: documento documento_scope_chk; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER documento_scope_chk BEFORE INSERT OR UPDATE ON public.documento FOR EACH ROW EXECUTE FUNCTION public.trg_documento_scope_check();


--
-- Name: documento documento_contribuyente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT documento_contribuyente_id_fkey FOREIGN KEY (contribuyente_id) REFERENCES public.contribuyente(contribuyente_id) ON DELETE CASCADE;


--
-- Name: documento documento_inmueble_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT documento_inmueble_id_fkey FOREIGN KEY (inmueble_id) REFERENCES public.inmueble(inmueble_id) ON DELETE SET NULL;


--
-- Name: documento documento_reemplazado_por_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT documento_reemplazado_por_fkey FOREIGN KEY (reemplazado_por) REFERENCES public.documento(documento_id);


--
-- Name: documento documento_tipo_documento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT documento_tipo_documento_id_fkey FOREIGN KEY (tipo_documento_id) REFERENCES public.tipo_documento(tipo_documento_id);


--
-- Name: grupo_documento_tipo grupo_documento_tipo_grupo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo_documento_tipo
    ADD CONSTRAINT grupo_documento_tipo_grupo_id_fkey FOREIGN KEY (grupo_id) REFERENCES public.grupo_documento(grupo_id) ON DELETE CASCADE;


--
-- Name: grupo_documento_tipo grupo_documento_tipo_tipo_documento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo_documento_tipo
    ADD CONSTRAINT grupo_documento_tipo_tipo_documento_id_fkey FOREIGN KEY (tipo_documento_id) REFERENCES public.tipo_documento(tipo_documento_id) ON DELETE CASCADE;


--
-- Name: inmueble_contribuyente inmueble_contribuyente_contribuyente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inmueble_contribuyente
    ADD CONSTRAINT inmueble_contribuyente_contribuyente_id_fkey FOREIGN KEY (contribuyente_id) REFERENCES public.contribuyente(contribuyente_id) ON DELETE CASCADE;


--
-- Name: inmueble_contribuyente inmueble_contribuyente_inmueble_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inmueble_contribuyente
    ADD CONSTRAINT inmueble_contribuyente_inmueble_id_fkey FOREIGN KEY (inmueble_id) REFERENCES public.inmueble(inmueble_id) ON DELETE CASCADE;


--
-- Name: representante representante_contribuyente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.representante
    ADD CONSTRAINT representante_contribuyente_id_fkey FOREIGN KEY (contribuyente_id) REFERENCES public.contribuyente(contribuyente_id) ON DELETE CASCADE;


--
-- Name: solicitud solicitud_contribuyente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.solicitud
    ADD CONSTRAINT solicitud_contribuyente_id_fkey FOREIGN KEY (contribuyente_id) REFERENCES public.contribuyente(contribuyente_id);


--
-- Name: solicitud_documento solicitud_documento_documento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.solicitud_documento
    ADD CONSTRAINT solicitud_documento_documento_id_fkey FOREIGN KEY (documento_id) REFERENCES public.documento(documento_id);


--
-- Name: solicitud_documento solicitud_documento_solicitud_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.solicitud_documento
    ADD CONSTRAINT solicitud_documento_solicitud_id_fkey FOREIGN KEY (solicitud_id) REFERENCES public.solicitud(solicitud_id) ON DELETE CASCADE;


--
-- Name: solicitud_documento solicitud_documento_tramite_requisito_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.solicitud_documento
    ADD CONSTRAINT solicitud_documento_tramite_requisito_id_fkey FOREIGN KEY (tramite_requisito_id) REFERENCES public.tramite_requisito(tramite_requisito_id);


--
-- Name: solicitud solicitud_inmueble_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.solicitud
    ADD CONSTRAINT solicitud_inmueble_id_fkey FOREIGN KEY (inmueble_id) REFERENCES public.inmueble(inmueble_id);


--
-- Name: solicitud solicitud_tramite_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.solicitud
    ADD CONSTRAINT solicitud_tramite_id_fkey FOREIGN KEY (tramite_id) REFERENCES public.tramite(tramite_id);


--
-- Name: tipo_documento_alias tipo_documento_alias_tipo_documento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_documento_alias
    ADD CONSTRAINT tipo_documento_alias_tipo_documento_id_fkey FOREIGN KEY (tipo_documento_id) REFERENCES public.tipo_documento(tipo_documento_id) ON DELETE CASCADE;


--
-- Name: tramite_relacion tramite_relacion_tramite_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tramite_relacion
    ADD CONSTRAINT tramite_relacion_tramite_id_fkey FOREIGN KEY (tramite_id) REFERENCES public.tramite(tramite_id) ON DELETE CASCADE;


--
-- Name: tramite_relacion tramite_relacion_tramite_relacionado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tramite_relacion
    ADD CONSTRAINT tramite_relacion_tramite_relacionado_id_fkey FOREIGN KEY (tramite_relacionado_id) REFERENCES public.tramite(tramite_id) ON DELETE CASCADE;


--
-- Name: tramite_requisito tramite_requisito_grupo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tramite_requisito
    ADD CONSTRAINT tramite_requisito_grupo_id_fkey FOREIGN KEY (grupo_id) REFERENCES public.grupo_documento(grupo_id);


--
-- Name: tramite_requisito tramite_requisito_tipo_documento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tramite_requisito
    ADD CONSTRAINT tramite_requisito_tipo_documento_id_fkey FOREIGN KEY (tipo_documento_id) REFERENCES public.tipo_documento(tipo_documento_id);


--
-- Name: tramite_requisito tramite_requisito_tramite_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tramite_requisito
    ADD CONSTRAINT tramite_requisito_tramite_id_fkey FOREIGN KEY (tramite_id) REFERENCES public.tramite(tramite_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict DLsjHvBF6Wc1xVb0PcFYGTc9NEqWyn9DGWZfTRGYeFGXumpvcQKabDNw2d76QXE

