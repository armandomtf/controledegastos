--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2018-07-16 17:40:22 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2181 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 33428)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cliente (
    cd_cliente integer NOT NULL,
    endereco_cd_endereco integer,
    nm_razaosocial character varying,
    nm_fantasia character varying,
    ds_email character varying,
    cod_identificacao integer
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 33437)
-- Name: endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE endereco (
    cd_endereco integer NOT NULL,
    nm_rua character varying,
    nr_casa numeric,
    ds_complemento character varying,
    nm_bairro character varying,
    nm_cidade character varying,
    ds_cep text,
    telefone1 numeric,
    telefone2 numeric
);


ALTER TABLE endereco OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 33434)
-- Name: funcao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funcao (
    cd_funcao integer NOT NULL,
    ds_funcao character varying,
    tp_visivel character(1)
);


ALTER TABLE funcao OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 33431)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funcionario (
    cd_funcionario integer NOT NULL,
    funcao_cd_funcao integer,
    endereco_cd_endereco integer,
    nm_funcionario character varying,
    ds_senha character varying,
    nick name,
    tp_visivel character(1)
);


ALTER TABLE funcionario OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 33440)
-- Name: ordem_serviço; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "ordem_serviço" (
    cd_ordem_servico integer NOT NULL,
    funcionario_cd_funcionario integer,
    cliente_cd_cliente integer,
    dt_ordem_servico date,
    vl_total numeric,
    bool_total boolean
);


ALTER TABLE "ordem_serviço" OWNER TO postgres;

--
-- TOC entry 2169 (class 0 OID 33428)
-- Dependencies: 181
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cliente (cd_cliente, endereco_cd_endereco, nm_razaosocial, nm_fantasia, ds_email, cod_identificacao) FROM stdin;
\.


--
-- TOC entry 2172 (class 0 OID 33437)
-- Dependencies: 184
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY endereco (cd_endereco, nm_rua, nr_casa, ds_complemento, nm_bairro, nm_cidade, ds_cep, telefone1, telefone2) FROM stdin;
\.


--
-- TOC entry 2171 (class 0 OID 33434)
-- Dependencies: 183
-- Data for Name: funcao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funcao (cd_funcao, ds_funcao, tp_visivel) FROM stdin;
\.


--
-- TOC entry 2170 (class 0 OID 33431)
-- Dependencies: 182
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funcionario (cd_funcionario, funcao_cd_funcao, endereco_cd_endereco, nm_funcionario, ds_senha, nick, tp_visivel) FROM stdin;
\.


--
-- TOC entry 2173 (class 0 OID 33440)
-- Dependencies: 185
-- Data for Name: ordem_serviço; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "ordem_serviço" (cd_ordem_servico, funcionario_cd_funcionario, cliente_cd_cliente, dt_ordem_servico, vl_total, bool_total) FROM stdin;
\.


--
-- TOC entry 2039 (class 2606 OID 33475)
-- Name: pk_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT pk_cliente PRIMARY KEY (cd_cliente);


--
-- TOC entry 2047 (class 2606 OID 33477)
-- Name: pk_endereco; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT pk_endereco PRIMARY KEY (cd_endereco);


--
-- TOC entry 2045 (class 2606 OID 33479)
-- Name: pk_funcao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcao
    ADD CONSTRAINT pk_funcao PRIMARY KEY (cd_funcao);


--
-- TOC entry 2043 (class 2606 OID 33481)
-- Name: pk_funcionario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT pk_funcionario PRIMARY KEY (cd_funcionario);


--
-- TOC entry 2050 (class 2606 OID 33483)
-- Name: pk_ordem; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ordem_serviço"
    ADD CONSTRAINT pk_ordem PRIMARY KEY (cd_ordem_servico);


--
-- TOC entry 2040 (class 1259 OID 33494)
-- Name: fki_funcionario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_funcionario ON funcionario USING btree (funcao_cd_funcao);


--
-- TOC entry 2041 (class 1259 OID 33500)
-- Name: fki_funcionario2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_funcionario2 ON funcionario USING btree (endereco_cd_endereco);


--
-- TOC entry 2048 (class 1259 OID 33506)
-- Name: fki_ordemservico; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_ordemservico ON "ordem_serviço" USING btree (cliente_cd_cliente);


--
-- TOC entry 2051 (class 2606 OID 33484)
-- Name: fk_enderecocliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT fk_enderecocliente FOREIGN KEY (endereco_cd_endereco) REFERENCES cliente(cd_cliente);


--
-- TOC entry 2052 (class 2606 OID 33489)
-- Name: fk_funcionario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT fk_funcionario FOREIGN KEY (funcao_cd_funcao) REFERENCES funcionario(cd_funcionario);


--
-- TOC entry 2053 (class 2606 OID 33495)
-- Name: fk_funcionario2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT fk_funcionario2 FOREIGN KEY (endereco_cd_endereco) REFERENCES funcionario(cd_funcionario);


--
-- TOC entry 2054 (class 2606 OID 33501)
-- Name: fk_ordemservico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ordem_serviço"
    ADD CONSTRAINT fk_ordemservico FOREIGN KEY (cliente_cd_cliente) REFERENCES "ordem_serviço"(cd_ordem_servico);


--
-- TOC entry 2180 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-07-16 17:40:22 BRT

--
-- PostgreSQL database dump complete
--

