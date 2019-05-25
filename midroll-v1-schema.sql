--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.11
-- Dumped by pg_dump version 9.6.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track execution statistics of all SQL statements executed';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: f_relative_end(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.f_relative_end(period text, relation text, context text) RETURNS date
    LANGUAGE sql
    AS $_$  
select
(date_trunc($1,
          (case 
   			when $3 = 'c' then
					(case
					   when $2 = 'any' then date '1/1/2100'
						when $2 = 'this' then
							(case
                  		when $1 = 'quarter' then current_date + interval '3 months'
                  		when $1 = 'month' then current_date + interval '1 month'
                  		when $1 = 'year' then current_date + interval '1 year'
               		end)
                	when $2 = 'last' then current_date + interval '0 days'
                	when $2 = 'next' then
                  	(case
                    		when $1 = 'quarter' then current_date + interval '6 months'
                    		when $1 = 'month' then current_date + interval '2 month'
                    		when $1 = 'year' then current_date + interval '2 year'
                  	end)
               end)
            else
 					(case
 					   when $2 = 'any' then date '1/1/2100'
                	when $2 = 'this' then current_date + interval '0 days'
						when $2 = 'last' then
							(case
                  		when $1 = 'quarter' then current_date + interval '-3 months'
                  		when $1 = 'month' then current_date + interval '-1 month'
                  		when $1 = 'year' then current_date + interval '-1 year'
               		end)

                	when $2 = 'next' then
                  	(case
                    		when $1 = 'quarter' then current_date + interval '3 months'
                    		when $1 = 'month' then current_date + interval '1 month'
                    		when $1 = 'year' then current_date + interval '1 year'
                  	end)
               end)
				end))- interval '1 day')::date
 $_$;


--
-- Name: f_relative_start(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.f_relative_start(period text, relation text, context text) RETURNS date
    LANGUAGE sql
    AS $_$  
select
date_trunc(period,
           (case 
              when $3 = 'c' then
             (case 
                  when $2 = 'any' then date '1/1/1901'
                  when $2 = 'this' then current_date + interval '0 days'
                  when $2 = 'last' then
                    (case
                      when $1 = 'quarter' then current_date + interval '-3 months'
                      when $1 = 'month' then current_date + interval '-1 month'
                      when $1 = 'year' then current_date + interval '-1 year'
                    end)
                  when $2 = 'next' then
                    (case
                      when $1 = 'quarter' then current_date + interval '3 months'
                      when $1 = 'month' then current_date + interval '1 month'
                      when $1 = 'year' then current_date + interval '1 year'
                    end)
               end)
               else
               (case 
                  when $2 = 'any' then date '1/1/1901'
                  when $2 = 'this' then 
                    (case
                      when $1 = 'quarter' then current_date + interval '-3 months'
                      when $1 = 'month' then current_date + interval '-1 month'
                      when $1 = 'year' then current_date + interval '-1 year'
                    end)
                  when $2 = 'last' then
                    (case
                      when $1 = 'quarter' then current_date + interval '-6 months'
                      when $1 = 'month' then current_date + interval '-2 month'
                      when $1 = 'year' then current_date + interval '-2 year'
                    end)
                  when $2 = 'next' then current_date + interval '0 days'
               end)
				end)
			  )::date 
$_$;


--
-- Name: ftest_relative_end(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ftest_relative_end(period text, relation text, context text) RETURNS date
    LANGUAGE sql
    AS $_$   
select
(date_trunc((case when $2 = 'to date' then 'day' else $1 end),
          (case 
   			when $3 = 'c' then
					(case
					   when $2 = 'any' then date '1/1/2100'
						when $2 = 'this' then
							(case
                  		when $1 = 'quarter' then current_date + interval '3 months'
                  		when $1 = 'month' then current_date + interval '1 month'
                  		when $1 = 'year' then current_date + interval '1 year'
               		end)
                	when $2 = 'last' then current_date + interval '0 days'
                	when $2 = 'next' then
                  	(case
                    		when $1 = 'quarter' then current_date + interval '6 months'
                    		when $1 = 'month' then current_date + interval '2 month'
                    		when $1 = 'year' then current_date + interval '2 year'
                  	end)
                  when $2 = 'to date' then current_date
               end)
            else
 					(case
 					   when $2 = 'any' then date '1/1/2100'
                	when $2 = 'this' then current_date + interval '0 days'
						when $2 = 'last' then
							(case
                  		when $1 = 'quarter' then current_date + interval '-3 months'
                  		when $1 = 'month' then current_date + interval '-1 month'
                  		when $1 = 'year' then current_date + interval '-1 year'
               		end)

                	when $2 = 'next' then
                  	(case
                    		when $1 = 'quarter' then current_date + interval '3 months'
                    		when $1 = 'month' then current_date + interval '1 month'
                    		when $1 = 'year' then current_date + interval '1 year'
                  	end)
                  when $2 = 'to date' then
                  	(case
                  		when $1 = 'quarter' then current_date + interval '-3 months'
                  		when $1 = 'month' then current_date + interval '-1 months'
                  		when $1 = 'year' then current_date + interval '-1 years'
                  	end)
               end)
				end))- interval '1 day')::date
  $_$;


--
-- Name: ftest_relative_start(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ftest_relative_start(period text, relation text, context text) RETURNS date
    LANGUAGE sql
    AS $_$   
select
date_trunc($1,
           (case 
              when $3 = 'c' then
             (case 
                  when $2 = 'any' then date '1/1/1901'
                  when $2 = 'this' then current_date + interval '0 days'
                  when $2 = 'last' then
                    (case
                      when $1 = 'quarter' then current_date + interval '-3 months'
                      when $1 = 'month' then current_date + interval '-1 month'
                      when $1 = 'year' then current_date + interval '-1 year'
                    end)
                  when $2 = 'next' then
                    (case
                      when $1 = 'quarter' then current_date + interval '3 months'
                      when $1 = 'month' then current_date + interval '1 month'
                      when $1 = 'year' then current_date + interval '1 year'
                    end)
                  when $2 = 'to date' then current_date
               end)
               else
               (case 
                  when $2 = 'any' then date '1/1/1901'
                  when $2 = 'this' then 
                    (case
                      when $1 = 'quarter' then current_date + interval '-3 months'
                      when $1 = 'month' then current_date + interval '-1 month'
                      when $1 = 'year' then current_date + interval '-1 year'
                    end)
                  when $2 = 'last' then
                    (case
                      when $1 = 'quarter' then current_date + interval '-6 months'
                      when $1 = 'month' then current_date + interval '-2 month'
                      when $1 = 'year' then current_date + interval '-2 year'
                    end)
                  when $2 = 'next' then current_date + interval '0 days'
                  when $2 = 'to date' then 
                  	(case
	                      when $1 = 'quarter' then current_date + interval '-3 months'
   	                   when $1 = 'month' then current_date + interval '-1 month'
      	                when $1 = 'year' then current_date + interval '-1 year'
      	             end)
               end)
				end)
			  )::date 
$_$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: activities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.activities (
    id integer NOT NULL,
    trackable_id integer,
    trackable_type character varying(255),
    owner_id integer,
    owner_type character varying(255),
    key character varying(255),
    parameters text,
    recipient_id integer,
    recipient_type character varying(255),
    recipients integer[] DEFAULT '{}'::integer[],
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.activities_id_seq OWNED BY public.activities.id;


--
-- Name: ad_agencies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ad_agencies (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    billing_contact_id integer,
    billing_instructions text,
    budget_source character varying
);


--
-- Name: ad_agencies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ad_agencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ad_agencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ad_agencies_id_seq OWNED BY public.ad_agencies.id;


--
-- Name: ad_agency_markets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ad_agency_markets (
    id integer NOT NULL,
    market_id integer NOT NULL,
    ad_agency_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ad_agency_markets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ad_agency_markets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ad_agency_markets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ad_agency_markets_id_seq OWNED BY public.ad_agency_markets.id;


--
-- Name: ad_spot_actuals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ad_spot_actuals (
    id integer NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    ad_spot_id integer,
    actual_impressions integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: ad_spot_actuals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ad_spot_actuals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ad_spot_actuals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ad_spot_actuals_id_seq OWNED BY public.ad_spot_actuals.id;


--
-- Name: ad_spot_airchecks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ad_spot_airchecks (
    id integer NOT NULL,
    ad_spot_id integer NOT NULL,
    link character varying(255),
    audio character varying(255),
    audio_content_type character varying(255),
    audio_file_size integer,
    audio_updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    poster_id integer,
    ad_starts_at_seconds integer
);


--
-- Name: ad_spot_airchecks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ad_spot_airchecks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ad_spot_airchecks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ad_spot_airchecks_id_seq OWNED BY public.ad_spot_airchecks.id;


--
-- Name: ad_spot_comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ad_spot_comments (
    id integer NOT NULL,
    ad_spot_id integer NOT NULL,
    poster_id integer NOT NULL,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    active boolean DEFAULT true
);


--
-- Name: ad_spot_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ad_spot_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ad_spot_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ad_spot_comments_id_seq OWNED BY public.ad_spot_comments.id;


--
-- Name: ad_spot_copies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ad_spot_copies (
    id integer NOT NULL,
    ad_spot_id integer DEFAULT 0 NOT NULL,
    pdf_file_name character varying(255) NOT NULL,
    pdf_content_type character varying(255),
    pdf_file_size integer,
    pdf_updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    poster_id integer,
    offer_code_or_url character varying(255)
);


--
-- Name: ad_spot_copies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ad_spot_copies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ad_spot_copies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ad_spot_copies_id_seq OWNED BY public.ad_spot_copies.id;


--
-- Name: ad_spot_schedules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ad_spot_schedules (
    id integer NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    ad_spot_id integer,
    scheduled_impressions integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: ad_spot_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ad_spot_schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ad_spot_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ad_spot_schedules_id_seq OWNED BY public.ad_spot_schedules.id;


--
-- Name: ad_spots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ad_spots (
    id integer NOT NULL,
    advertiser_id integer,
    episode_id integer,
    start_on date NOT NULL,
    end_on date,
    forecasted_downloads integer NOT NULL,
    cost money,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    actual_downloads integer,
    ad_unit_id integer,
    cpm money NOT NULL,
    ad_type_cd integer NOT NULL,
    unit_number integer NOT NULL,
    campaign_id integer,
    invoice_id integer,
    payout_id integer,
    discount_percent numeric(2,2) DEFAULT 0 NOT NULL,
    blocked boolean DEFAULT false NOT NULL,
    service_fee double precision,
    sold_at timestamp without time zone,
    insertion_order_id integer,
    podcast_id integer NOT NULL,
    store public.hstore DEFAULT ''::public.hstore NOT NULL,
    active boolean DEFAULT true NOT NULL,
    prototype_spot_id integer,
    end_delivery_date date,
    fallback_forecasted_downloads integer,
    fallback_cpm numeric(8,2)
);


--
-- Name: ad_spots_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ad_spots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ad_spots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ad_spots_id_seq OWNED BY public.ad_spots.id;


--
-- Name: ad_spots_reports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ad_spots_reports (
    id integer NOT NULL,
    ad_spot_id integer,
    report_id integer
);


--
-- Name: ad_spots_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ad_spots_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ad_spots_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ad_spots_reports_id_seq OWNED BY public.ad_spots_reports.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.addresses (
    id integer NOT NULL,
    street1 character varying NOT NULL,
    street2 character varying,
    city character varying NOT NULL,
    state character varying,
    country character varying NOT NULL,
    zip_code character varying,
    addressable_id integer NOT NULL,
    addressable_type character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: advertiser_approvals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.advertiser_approvals (
    id integer NOT NULL,
    podcast_id integer NOT NULL,
    advertiser_id integer NOT NULL,
    approved boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    decline_reason character varying,
    advertiser_type character varying DEFAULT 'Advertiser'::character varying NOT NULL,
    podcast_type character varying DEFAULT 'Podcast'::character varying NOT NULL
);


--
-- Name: advertiser_approvals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.advertiser_approvals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: advertiser_approvals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.advertiser_approvals_id_seq OWNED BY public.advertiser_approvals.id;


--
-- Name: advertiser_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.advertiser_categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    parent_id integer,
    active boolean DEFAULT true NOT NULL
);


--
-- Name: advertiser_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.advertiser_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: advertiser_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.advertiser_categories_id_seq OWNED BY public.advertiser_categories.id;


--
-- Name: advertiser_markets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.advertiser_markets (
    id integer NOT NULL,
    market_id integer NOT NULL,
    advertiser_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: advertiser_markets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.advertiser_markets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: advertiser_markets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.advertiser_markets_id_seq OWNED BY public.advertiser_markets.id;


--
-- Name: advertiser_reports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.advertiser_reports (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    advertiser_id integer NOT NULL,
    start_on date NOT NULL,
    end_on date NOT NULL,
    token uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: advertiser_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.advertiser_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: advertiser_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.advertiser_reports_id_seq OWNED BY public.advertiser_reports.id;


--
-- Name: advertisers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.advertisers (
    id integer NOT NULL,
    name character varying(255),
    url character varying(255),
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer,
    photo_updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description text,
    net_30_terms boolean DEFAULT false NOT NULL,
    ad_agency_id integer,
    active boolean DEFAULT true NOT NULL,
    lead_source character varying(255),
    category_id integer,
    billing_cd integer DEFAULT 0,
    cpm_override boolean DEFAULT false,
    billing_contact_id integer,
    billing_instructions text,
    ignore_missing_copy boolean DEFAULT false NOT NULL,
    budget_source character varying,
    client_direct boolean DEFAULT false NOT NULL,
    contact_phone character varying
);


--
-- Name: advertisers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.advertisers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: advertisers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.advertisers_id_seq OWNED BY public.advertisers.id;


--
-- Name: advertisers_podcasts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.advertisers_podcasts (
    id integer NOT NULL,
    advertiser_id integer,
    podcast_id integer
);


--
-- Name: advertisers_podcasts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.advertisers_podcasts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: advertisers_podcasts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.advertisers_podcasts_id_seq OWNED BY public.advertisers_podcasts.id;


--
-- Name: advertisers_salespeople; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.advertisers_salespeople (
    id integer NOT NULL,
    advertiser_id integer NOT NULL,
    salesperson_id integer NOT NULL,
    end_on timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: advertisers_salespeople_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.advertisers_salespeople_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: advertisers_salespeople_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.advertisers_salespeople_id_seq OWNED BY public.advertisers_salespeople.id;


--
-- Name: blended_demos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blended_demos (
    id integer NOT NULL,
    user_id integer,
    podcast_ids integer[],
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    survey_version integer
);


--
-- Name: blended_demos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.blended_demos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blended_demos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.blended_demos_id_seq OWNED BY public.blended_demos.id;


--
-- Name: bulk_ad_copies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bulk_ad_copies (
    id integer NOT NULL,
    advertiser_id integer NOT NULL,
    name character varying(255) NOT NULL,
    ad_type_copy public.hstore DEFAULT ''::public.hstore NOT NULL,
    podcast_variables json DEFAULT '{}'::json,
    start_on date NOT NULL,
    end_on date,
    ignored_podcast_ids text[] DEFAULT '{}'::text[],
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: bulk_ad_copies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bulk_ad_copies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bulk_ad_copies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bulk_ad_copies_id_seq OWNED BY public.bulk_ad_copies.id;


--
-- Name: campaigns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.campaigns (
    id integer NOT NULL,
    advertiser_id integer NOT NULL,
    name character varying(255) NOT NULL,
    start_on date NOT NULL,
    end_on date NOT NULL,
    target_spend numeric(8,2),
    target_impressions integer,
    ad_types text,
    picked_ad_spot_ids text,
    excluded_ad_spot_ids text,
    category_ids text,
    sold_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    filters text,
    description text,
    ad_copy_document_file_name character varying(255),
    ad_copy_document_content_type character varying(255),
    ad_copy_document_file_size integer,
    ad_copy_document_updated_at timestamp without time zone,
    campaign_code_document_file_name character varying(255),
    campaign_code_document_content_type character varying(255),
    campaign_code_document_file_size integer,
    campaign_code_document_updated_at timestamp without time zone,
    deadline timestamp without time zone,
    approval_process_completed boolean DEFAULT false NOT NULL,
    excluded_podcast_ids text,
    picked_podcast_ids text,
    token uuid DEFAULT public.uuid_generate_v4(),
    held_at timestamp without time zone,
    discount_percent numeric(2,2) DEFAULT 0 NOT NULL,
    approved_at timestamp without time zone,
    approved_by integer,
    created_by integer,
    order_document_file_name character varying(255),
    order_document_content_type character varying(255),
    order_document_file_size integer,
    order_document_updated_at timestamp without time zone,
    survey_filters text,
    network_ids text,
    unhold_at timestamp without time zone,
    job_reference integer,
    held_by_user_id integer,
    survey_version_filter integer,
    preemptible boolean DEFAULT false NOT NULL
);


--
-- Name: campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.campaigns_id_seq OWNED BY public.campaigns.id;


--
-- Name: cancelations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cancelations (
    id integer NOT NULL,
    token uuid DEFAULT public.uuid_generate_v4(),
    advertiser_id integer NOT NULL,
    ad_spot_ids integer[] DEFAULT '{}'::integer[],
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: cancelations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cancelations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cancelations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cancelations_id_seq OWNED BY public.cancelations.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: categories_podcasts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories_podcasts (
    id integer NOT NULL,
    category_id integer,
    podcast_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: categories_podcasts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_podcasts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_podcasts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_podcasts_id_seq OWNED BY public.categories_podcasts.id;


--
-- Name: comment_read_statuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comment_read_statuses (
    id integer NOT NULL,
    user_id integer NOT NULL,
    comment_id integer NOT NULL,
    ad_spot_id integer NOT NULL,
    unread boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: comment_read_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comment_read_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comment_read_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comment_read_statuses_id_seq OWNED BY public.comment_read_statuses.id;


--
-- Name: dai_profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dai_profiles (
    id integer NOT NULL,
    podcast_id integer,
    ad_type_cd integer,
    spot_count integer,
    cpm numeric(8,2),
    min_cpm numeric(8,2),
    min_impressions integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    duration integer
);


--
-- Name: dai_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dai_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dai_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dai_profiles_id_seq OWNED BY public.dai_profiles.id;


--
-- Name: dai_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dai_statistics (
    id integer NOT NULL,
    ad_spot_id integer NOT NULL,
    downloads integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: dai_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dai_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dai_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dai_statistics_id_seq OWNED BY public.dai_statistics.id;


--
-- Name: delayed_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.delayed_jobs (
    id integer NOT NULL,
    priority integer DEFAULT 0,
    attempts integer DEFAULT 0,
    handler text,
    last_error text,
    run_at timestamp without time zone,
    locked_at timestamp without time zone,
    failed_at timestamp without time zone,
    locked_by character varying(255),
    queue character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.delayed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.delayed_jobs_id_seq OWNED BY public.delayed_jobs.id;


--
-- Name: download_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.download_statistics (
    id integer NOT NULL,
    episode_id integer NOT NULL,
    downloads integer DEFAULT 0,
    plays integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type character varying(255) NOT NULL,
    youtube_views integer DEFAULT 0,
    day_80 boolean,
    details text,
    day_60 boolean,
    day_7 boolean
);


--
-- Name: download_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.download_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: download_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.download_statistics_id_seq OWNED BY public.download_statistics.id;


--
-- Name: dropdown_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dropdown_options (
    id integer NOT NULL,
    type_cd integer NOT NULL,
    title character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: dropdown_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dropdown_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dropdown_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dropdown_options_id_seq OWNED BY public.dropdown_options.id;


--
-- Name: episode_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.episode_logs (
    id integer NOT NULL,
    episode_id integer NOT NULL,
    user_id integer NOT NULL,
    subject_id integer,
    subject_type character varying(255),
    action character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: episode_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.episode_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: episode_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.episode_logs_id_seq OWNED BY public.episode_logs.id;


--
-- Name: episodes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.episodes (
    id integer NOT NULL,
    podcast_id integer NOT NULL,
    episode_number character varying(255),
    published_on date NOT NULL,
    additional_downloads integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying(255),
    soundcloud_id integer,
    ad_spots_count integer,
    earwolf_id integer,
    impressions_cache integer,
    tracking_identifier character varying(255),
    download_url character varying(255),
    prototype_id integer NOT NULL,
    impressions_at_report_end integer,
    soundcloud_url character varying(255),
    gross_up double precision DEFAULT 1.0 NOT NULL,
    youtube_url character varying(255),
    art19_episode character varying(255),
    episode_url character varying,
    spotify_uri character varying,
    uncommon boolean DEFAULT false
);


--
-- Name: episodes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.episodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: episodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.episodes_id_seq OWNED BY public.episodes.id;


--
-- Name: guests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.guests (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer,
    photo_updated_at timestamp without time zone
);


--
-- Name: guests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.guests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: guests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.guests_id_seq OWNED BY public.guests.id;


--
-- Name: guests_podcasts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.guests_podcasts (
    id integer NOT NULL,
    guest_id integer NOT NULL,
    podcast_id integer NOT NULL
);


--
-- Name: guests_podcasts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.guests_podcasts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: guests_podcasts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.guests_podcasts_id_seq OWNED BY public.guests_podcasts.id;


--
-- Name: hosts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hosts (
    id integer NOT NULL,
    name character varying(255),
    bio text,
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer,
    photo_updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    imported boolean DEFAULT false NOT NULL
);


--
-- Name: hosts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hosts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hosts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hosts_id_seq OWNED BY public.hosts.id;


--
-- Name: hosts_podcasts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hosts_podcasts (
    id integer NOT NULL,
    host_id integer NOT NULL,
    podcast_id integer NOT NULL
);


--
-- Name: hosts_podcasts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hosts_podcasts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hosts_podcasts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hosts_podcasts_id_seq OWNED BY public.hosts_podcasts.id;


--
-- Name: insertion_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.insertion_orders (
    id integer NOT NULL,
    advertiser_id integer NOT NULL,
    campaign_id integer,
    amount numeric(10,2) DEFAULT 0 NOT NULL,
    discounted_amount numeric(10,2) DEFAULT 0 NOT NULL,
    name character varying(255),
    email character varying(255),
    order_number character varying(255),
    notes text,
    internal_notes text,
    other_terms text,
    additional_fields text,
    sponsor_delivery_date date,
    payment_due_date date,
    payment_terms_cd integer,
    created_by integer,
    accepted_on date,
    contract_file_name character varying(255),
    contract_content_type character varying(255),
    contract_file_size integer,
    contract_created_at timestamp without time zone,
    sent boolean DEFAULT false NOT NULL,
    token uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    resigning_needed_at timestamp without time zone,
    key_account boolean DEFAULT false
);


--
-- Name: insertion_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.insertion_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: insertion_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.insertion_orders_id_seq OWNED BY public.insertion_orders.id;


--
-- Name: invites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invites (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    advertiser_id integer,
    podcast_id integer,
    user_id integer,
    emailed_at timestamp without time zone,
    used_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: invites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.invites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.invites_id_seq OWNED BY public.invites.id;


--
-- Name: invoice_transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invoice_transactions (
    id integer NOT NULL,
    invoice_id integer,
    reference character varying(255),
    amount money,
    refunded_on timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    payment_method character varying(255) DEFAULT 'Credit Card'::character varying,
    applied_at timestamp without time zone,
    stripe_fee money,
    type character varying NOT NULL,
    reference_invoice_id integer
);


--
-- Name: invoice_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.invoice_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invoice_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.invoice_transactions_id_seq OWNED BY public.invoice_transactions.id;


--
-- Name: invoice_transitions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invoice_transitions (
    id integer NOT NULL,
    to_state character varying(255),
    metadata text,
    sort_key integer,
    invoice_id integer,
    created_at timestamp without time zone
);


--
-- Name: invoice_transitions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.invoice_transitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invoice_transitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.invoice_transitions_id_seq OWNED BY public.invoice_transitions.id;


--
-- Name: invoices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invoices (
    id integer NOT NULL,
    advertiser_id integer,
    campaign_id integer,
    amount money,
    authorization_id character varying(255),
    paid_on timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    status character varying(255) DEFAULT 'active'::character varying,
    name character varying(255),
    email character varying(255),
    notes text,
    internal_notes text,
    discount_percent numeric(2,2) DEFAULT 0 NOT NULL,
    order_number character varying(255),
    sponsor_delivery_date date,
    other_terms text,
    payment_terms_cd integer,
    payment_due_date date,
    other_payment_terms text,
    created_by integer,
    sent boolean DEFAULT false NOT NULL,
    ad_agency_id integer,
    token uuid DEFAULT public.uuid_generate_v4(),
    discounted_amount numeric(10,2)
);


--
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.invoices_id_seq OWNED BY public.invoices.id;


--
-- Name: leads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.leads (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    budget_range character varying(255),
    lead_source character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    details text,
    lead_type character varying(255)
);


--
-- Name: leads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.leads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: leads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.leads_id_seq OWNED BY public.leads.id;


--
-- Name: markets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.markets (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: markets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.markets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: markets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.markets_id_seq OWNED BY public.markets.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    title character varying(255),
    body text,
    slug character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    template character varying(255)
);


--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: payment_adjustments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment_adjustments (
    id integer NOT NULL,
    podcast_id integer NOT NULL,
    period character varying NOT NULL,
    notes text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: payment_adjustments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payment_adjustments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payment_adjustments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payment_adjustments_id_seq OWNED BY public.payment_adjustments.id;


--
-- Name: payment_uploads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment_uploads (
    id integer NOT NULL,
    podcast_id integer NOT NULL,
    period character varying NOT NULL,
    upload_file_name character varying,
    upload_content_type character varying,
    upload_file_size integer,
    upload_updated_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


--
-- Name: payment_uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payment_uploads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payment_uploads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payment_uploads_id_seq OWNED BY public.payment_uploads.id;


--
-- Name: podcasts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.podcasts (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    started date,
    length character varying(255) NOT NULL,
    downloads character varying(255),
    url character varying(255) NOT NULL,
    itunes_url character varying(255),
    twitter_name character varying(255),
    facebook_url character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer,
    photo_updated_at timestamp without time zone,
    slug character varying(255) NOT NULL,
    sample_aircheck_file_name character varying(255),
    sample_aircheck_content_type character varying(255),
    sample_aircheck_file_size integer,
    sample_aircheck_updated_at timestamp without time zone,
    rec_camp_duration character varying(255),
    minimum_spend character varying(255),
    imported boolean DEFAULT false NOT NULL,
    network character varying(255),
    soundcloud boolean DEFAULT false,
    rss_feed character varying(255),
    frequency_number integer,
    frequency_time_cd integer,
    csv_name character varying(255),
    earwolf_id integer,
    youtube_id character varying(255),
    inactive boolean DEFAULT false,
    service_fee double precision DEFAULT 0.2 NOT NULL,
    gross_up double precision DEFAULT 1 NOT NULL,
    earwolf_show_cache text,
    soundcloud_client_id character varying(255),
    twitter_followers integer,
    facebook_likes integer,
    podcast_network_id integer,
    revenue_summary text,
    revenue_summary_updated_on date,
    survey_slug character varying(255),
    hide_from_survey_list boolean DEFAULT false NOT NULL,
    signed_contract boolean DEFAULT false NOT NULL,
    agreement_type_cd integer,
    relationship character varying(255)[] DEFAULT '{}'::character varying[],
    contact character varying(255),
    contract_expires_on date,
    monthly_contract boolean DEFAULT false NOT NULL,
    advance numeric(10,2),
    guarantee numeric(10,2),
    target_sales numeric(10,2),
    bank_info_on_file_cd integer,
    format text,
    preferred_contacts text,
    internal_notes text,
    featured boolean DEFAULT false NOT NULL,
    disallow_adding_inventory boolean DEFAULT false NOT NULL,
    video_cd integer DEFAULT 0 NOT NULL,
    show_in_directory boolean DEFAULT false,
    include_in_proposal_builder boolean DEFAULT false,
    ad_spot_type_lengths public.hstore DEFAULT ''::public.hstore NOT NULL,
    art19_series character varying(255),
    art19_token character varying(255),
    art19_credentials character varying(255),
    expect_automatic_stats boolean DEFAULT true,
    expect_manual_stats boolean DEFAULT false,
    product_code character varying,
    dai_available boolean DEFAULT false NOT NULL,
    monthly_back_catalog_forecast integer,
    owned_and_operated boolean DEFAULT false,
    minimum_guarantee boolean DEFAULT false,
    producer character varying,
    use_survey_version integer,
    stitcher_url character varying
);


--
-- Name: taggings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taggings (
    id integer NOT NULL,
    tag_id integer,
    taggable_id integer,
    taggable_type character varying,
    tagger_id integer,
    tagger_type character varying,
    context character varying(128),
    created_at timestamp without time zone
);


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying,
    taggings_count integer DEFAULT 0
);


--
-- Name: vrt_ad_spots; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vrt_ad_spots AS
 SELECT ad_spots.id,
    ad_spots.advertiser_id,
    ad_spots.episode_id,
    ad_spots.start_on,
    ad_spots.end_on,
    ad_spots.forecasted_downloads,
    ad_spots.cost,
    ad_spots.created_at,
    ad_spots.updated_at,
    ad_spots.actual_downloads,
    ad_spots.ad_unit_id,
    ad_spots.cpm,
    ad_spots.ad_type_cd,
    ad_spots.unit_number,
    ad_spots.campaign_id,
    ad_spots.invoice_id,
    ad_spots.payout_id,
    ad_spots.discount_percent,
    ad_spots.blocked,
    ad_spots.service_fee,
    ad_spots.sold_at,
    ad_spots.insertion_order_id,
    ad_spots.podcast_id,
    ad_spots.store,
    ad_spots.active,
    ( SELECT advertisers_salespeople.salesperson_id
           FROM public.advertisers_salespeople
          WHERE ((advertisers_salespeople.advertiser_id = ad_spots.advertiser_id) AND (COALESCE(advertisers_salespeople.end_on, '9999-12-31 00:00:00'::timestamp without time zone) = ( SELECT COALESCE(min(advertisers_salespeople_1.end_on), '9999-12-31 00:00:00'::timestamp without time zone) AS "coalesce"
                   FROM public.advertisers_salespeople advertisers_salespeople_1
                  WHERE ((COALESCE(advertisers_salespeople_1.end_on, '9999-12-31 00:00:00'::timestamp without time zone) > ad_spots.sold_at) AND (advertisers_salespeople_1.advertiser_id = ad_spots.advertiser_id)))))
         LIMIT 1) AS sold_by,
    (EXISTS ( SELECT 1
           FROM (public.tags
             JOIN public.taggings ON ((tags.id = taggings.tag_id)))
          WHERE ((taggings.taggable_id = ad_spots.id) AND ad_spots.blocked AND ((taggings.taggable_type)::text = 'AdSpot'::text) AND ((taggings.context)::text = 'blocks'::text) AND ((tags.name)::text = 'sold_by_podcaster'::text)))) AS sold_by_podcaster,
    (EXISTS ( SELECT 1
           FROM (public.tags
             JOIN public.taggings ON ((tags.id = taggings.tag_id)))
          WHERE ((taggings.taggable_id = ad_spots.id) AND ad_spots.blocked AND ((taggings.taggable_type)::text = 'AdSpot'::text) AND ((taggings.context)::text = 'blocks'::text) AND ((tags.name)::text = 'topic_sensitivity'::text)))) AS topic_sensitivity,
    (EXISTS ( SELECT 1
           FROM (public.tags
             JOIN public.taggings ON ((tags.id = taggings.tag_id)))
          WHERE ((taggings.taggable_id = ad_spots.id) AND ad_spots.blocked AND ((taggings.taggable_type)::text = 'AdSpot'::text) AND ((taggings.context)::text = 'blocks'::text) AND ((tags.name)::text = 'recording_deadline_passed'::text)))) AS recording_deadline_passed
   FROM public.ad_spots
  WHERE (ad_spots.active IS TRUE);


--
-- Name: payments_and_payouts; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.payments_and_payouts AS
 WITH payments AS (
         SELECT invoice_transactions.invoice_id,
            sum(invoice_transactions.amount) AS total
           FROM public.invoice_transactions
          GROUP BY invoice_transactions.invoice_id
        )
 SELECT podcasts.name AS podcast,
    podcasts.id AS podcast_id,
    ltrim(btrim(((((COALESCE(episodes.name, ''::character varying))::text ||
        CASE
            WHEN (episodes.episode_number IS NULL) THEN ''::text
            ELSE (' #'::text || (episodes.episode_number)::text)
        END) || ' - '::text) ||
        CASE vrt_ad_spots.ad_type_cd
            WHEN 0 THEN 'Pre-Roll'::text
            WHEN 1 THEN 'Mid-Roll'::text
            WHEN 2 THEN 'Post-Roll'::text
            WHEN 10 THEN 'BC Pre-Roll'::text
            WHEN 11 THEN 'BC Mid-Roll'::text
            WHEN 12 THEN 'BC Post-Roll'::text
            WHEN 3 THEN 'Banner'::text
            ELSE 'Other'::text
        END), ' '::text), '- '::text) AS episode,
    vrt_ad_spots.start_on AS drop_date,
    advertisers.name AS advertiser,
    advertisers.id AS advertiser_id,
        CASE vrt_ad_spots.ad_type_cd
            WHEN 0 THEN 'Pre-Roll'::text
            WHEN 1 THEN 'Mid-Roll'::text
            WHEN 2 THEN 'Post-Roll'::text
            WHEN 10 THEN 'BC Pre-Roll'::text
            WHEN 11 THEN 'BC Mid-Roll'::text
            WHEN 12 THEN 'BC Post-Roll'::text
            WHEN 3 THEN 'Banner'::text
            ELSE 'Other'::text
        END AS type,
    vrt_ad_spots.id AS ad_spot_id,
    COALESCE(vrt_ad_spots.cost, ((vrt_ad_spots.cpm * vrt_ad_spots.forecasted_downloads) / 1000)) AS gross,
    (COALESCE(vrt_ad_spots.cost, ((vrt_ad_spots.cpm * vrt_ad_spots.forecasted_downloads) / 1000)) - (COALESCE(vrt_ad_spots.cost, ((vrt_ad_spots.cpm * vrt_ad_spots.forecasted_downloads) / 1000)) * vrt_ad_spots.service_fee)) AS net,
    ((payments.total - sum(COALESCE(vrt_ad_spots.cost, ((vrt_ad_spots.cpm * vrt_ad_spots.forecasted_downloads) / 1000))) OVER (PARTITION BY vrt_ad_spots.invoice_id ORDER BY episodes.published_on, vrt_ad_spots.ad_type_cd)) >= (0)::money) AS paid_to_tmr,
        CASE
            WHEN (vrt_ad_spots.payout_id IS NULL) THEN false
            ELSE true
        END AS paid_to_podcaster
   FROM ((((public.advertisers
     JOIN public.vrt_ad_spots ON ((advertisers.id = vrt_ad_spots.advertiser_id)))
     LEFT JOIN public.episodes ON ((vrt_ad_spots.episode_id = episodes.id)))
     JOIN public.podcasts ON ((vrt_ad_spots.podcast_id = podcasts.id)))
     JOIN payments ON ((vrt_ad_spots.invoice_id = payments.invoice_id)));


--
-- Name: payouts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payouts (
    id integer NOT NULL,
    podcast_id integer NOT NULL,
    amount money NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    paid_on date DEFAULT ('now'::text)::date NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: payouts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payouts_id_seq OWNED BY public.payouts.id;


--
-- Name: pending_ad_spots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pending_ad_spots (
    id integer NOT NULL,
    ad_spot_id integer NOT NULL,
    campaign_id integer NOT NULL,
    cpm money,
    forecasted_downloads integer,
    cost money,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    held_advertiser_id integer
);


--
-- Name: pending_ad_spots_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pending_ad_spots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pending_ad_spots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pending_ad_spots_id_seq OWNED BY public.pending_ad_spots.id;


--
-- Name: perma_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.perma_logs (
    id integer NOT NULL,
    message text,
    tag character varying(255),
    data public.hstore,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: perma_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.perma_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: perma_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.perma_logs_id_seq OWNED BY public.perma_logs.id;


--
-- Name: podcast_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.podcast_categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying(255) NOT NULL
);


--
-- Name: podcast_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.podcast_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: podcast_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.podcast_categories_id_seq OWNED BY public.podcast_categories.id;


--
-- Name: podcast_categories_podcasts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.podcast_categories_podcasts (
    podcast_id integer NOT NULL,
    podcast_category_id integer NOT NULL
);


--
-- Name: podcast_networks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.podcast_networks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: podcast_networks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.podcast_networks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: podcast_networks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.podcast_networks_id_seq OWNED BY public.podcast_networks.id;


--
-- Name: podcasts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.podcasts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: podcasts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.podcasts_id_seq OWNED BY public.podcasts.id;


--
-- Name: podcasts_reports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.podcasts_reports (
    id integer NOT NULL,
    podcast_id integer,
    report_id integer
);


--
-- Name: TABLE podcasts_reports; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.podcasts_reports IS 'TJC - to my knowledge this is not used';


--
-- Name: podcasts_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.podcasts_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: podcasts_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.podcasts_reports_id_seq OWNED BY public.podcasts_reports.id;


--
-- Name: podcasts_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.podcasts_users (
    id integer NOT NULL,
    user_id integer NOT NULL,
    podcast_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: podcasts_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.podcasts_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: podcasts_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.podcasts_users_id_seq OWNED BY public.podcasts_users.id;


--
-- Name: prototype_episodes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prototype_episodes (
    id integer NOT NULL,
    podcast_id integer NOT NULL,
    name character varying(255) NOT NULL,
    store text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    frequency character varying(255) DEFAULT 'Every week'::character varying,
    pre_roll_duration integer DEFAULT 20,
    mid_roll_duration integer DEFAULT 60,
    post_roll_duration integer DEFAULT 20,
    forecasted_downloads integer NOT NULL,
    effective_start_date date,
    effective_end_date date,
    hidden boolean DEFAULT false NOT NULL,
    representative boolean DEFAULT false NOT NULL,
    active boolean DEFAULT true NOT NULL
);


--
-- Name: prototype_episodes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prototype_episodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prototype_episodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.prototype_episodes_id_seq OWNED BY public.prototype_episodes.id;


--
-- Name: prototype_spots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prototype_spots (
    id integer NOT NULL,
    ad_type_cd integer,
    forecasted_downloads integer,
    cpm numeric(8,2),
    min_cpm numeric(8,2),
    duration integer,
    unit_number integer,
    prototype_episode_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    active boolean DEFAULT true NOT NULL
);


--
-- Name: prototype_spots_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prototype_spots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prototype_spots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.prototype_spots_id_seq OWNED BY public.prototype_spots.id;


--
-- Name: rate_cards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rate_cards (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    smart_search text DEFAULT '{}'::text NOT NULL
);


--
-- Name: rate_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rate_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rate_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rate_cards_id_seq OWNED BY public.rate_cards.id;


--
-- Name: resources; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resources (
    id integer NOT NULL,
    file_file_name character varying(255),
    file_content_type character varying(255),
    file_file_size integer,
    file_updated_at timestamp without time zone,
    parent_id integer,
    parent_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: resources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resources_id_seq OWNED BY public.resources.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    description text
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: roles_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles_users (
    id integer NOT NULL,
    role_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: roles_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roles_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roles_users_id_seq OWNED BY public.roles_users.id;


--
-- Name: sample_airchecks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sample_airchecks (
    id integer NOT NULL,
    podcast_id integer NOT NULL,
    soundcloud_url character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    audio_file_name character varying(255) NOT NULL,
    audio_content_type character varying(255),
    audio_file_size integer,
    audio_updated_at timestamp without time zone,
    name character varying(255)
);


--
-- Name: sample_airchecks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sample_airchecks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sample_airchecks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sample_airchecks_id_seq OWNED BY public.sample_airchecks.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: signatures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.signatures (
    id integer NOT NULL,
    user_id integer,
    signable_id integer NOT NULL,
    signable_type character varying NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    ip character varying NOT NULL,
    user_agent character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    source character varying,
    datahash text,
    pdf_file_name character varying,
    pdf_content_type character varying,
    pdf_file_size integer,
    pdf_updated_at timestamp without time zone
);


--
-- Name: signatures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.signatures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: signatures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.signatures_id_seq OWNED BY public.signatures.id;


--
-- Name: slides; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.slides (
    id integer NOT NULL,
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer,
    photo_updated_at timestamp without time zone,
    photo_caption character varying(255),
    slide_type character varying(255),
    stat_midline character varying(255),
    stat_number character varying(255),
    stat_text character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    private boolean DEFAULT false
);


--
-- Name: slides_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.slides_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: slides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.slides_id_seq OWNED BY public.slides.id;


--
-- Name: sound_cloud_histories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sound_cloud_histories (
    id integer NOT NULL,
    podcast_id integer,
    episode_id integer,
    url character varying(255),
    status integer,
    downloads_count integer,
    plays_count integer,
    version timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: sound_cloud_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sound_cloud_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sound_cloud_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sound_cloud_histories_id_seq OWNED BY public.sound_cloud_histories.id;


--
-- Name: survey_answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.survey_answers (
    id integer NOT NULL,
    survey_question_id integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    resp_count integer DEFAULT 0,
    survey_version integer NOT NULL,
    answer_id integer NOT NULL
);


--
-- Name: survey_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.survey_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: survey_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.survey_answers_id_seq OWNED BY public.survey_answers.id;


--
-- Name: survey_percentages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.survey_percentages (
    podcast_id integer,
    survey_question_id integer,
    question_id integer,
    q_responses bigint,
    survey_answer_id integer,
    answer_id integer,
    a_responses bigint,
    percent double precision,
    survey_version integer
);

ALTER TABLE ONLY public.survey_percentages REPLICA IDENTITY NOTHING;


--
-- Name: survey_questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.survey_questions (
    id integer NOT NULL,
    podcast_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    resp_count integer,
    parent_id integer,
    survey_version integer NOT NULL,
    unanswered_count integer,
    question_id integer NOT NULL
);


--
-- Name: survey_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.survey_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: survey_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.survey_questions_id_seq OWNED BY public.survey_questions.id;


--
-- Name: survey_respondents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.survey_respondents (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    podcast_ids integer[],
    ua text,
    ip character varying(255),
    email character varying(255),
    country character varying(255),
    state character varying(2),
    city character varying(255),
    postal_code character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    other_podcasts text,
    survey_version integer NOT NULL,
    answers_by_question_id text,
    unanswered_ids text,
    latitude double precision,
    longitude double precision,
    raw_response text,
    response_hash character varying
);


--
-- Name: taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.taggings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.taggings_id_seq OWNED BY public.taggings.id;


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    encrypted_password character varying(255) NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying(255),
    admin boolean DEFAULT false NOT NULL,
    advertiser_id integer,
    from_admin boolean DEFAULT false NOT NULL,
    authentication_token character varying(255),
    always_notify boolean DEFAULT false NOT NULL,
    notification_frequency_cd integer DEFAULT 1,
    purchase_notifications boolean DEFAULT true,
    podcast_network_id integer,
    ad_agency_id integer,
    contract_access boolean DEFAULT false NOT NULL,
    sales_notifications boolean DEFAULT true NOT NULL,
    data_notifications boolean DEFAULT true NOT NULL,
    financial_notifications boolean DEFAULT true NOT NULL,
    timezone character varying(255),
    missing_aircheck_reminders boolean DEFAULT true NOT NULL,
    missing_download_numbers boolean DEFAULT true NOT NULL,
    new_ads_booked boolean DEFAULT true NOT NULL,
    roundup_emails boolean DEFAULT true NOT NULL,
    new_ad_copy_cd integer DEFAULT 1 NOT NULL,
    new_advertisers boolean DEFAULT true,
    scripps_id integer,
    user_sub_type_cd integer,
    active boolean DEFAULT true NOT NULL,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: v_80day_downloads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.v_80day_downloads (
    podcast_id integer,
    podcast_name character varying(255),
    episode_id integer,
    episode_number character varying(255),
    published_on date,
    update_date date,
    total_plays integer,
    sc_downloads integer,
    sc_plays integer,
    yt_plays integer,
    other_plays integer
);

ALTER TABLE ONLY public.v_80day_downloads REPLICA IDENTITY NOTHING;


--
-- Name: v_avg_episode_forecast; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.v_avg_episode_forecast (
    episode_id integer,
    avg_forecast numeric
);

ALTER TABLE ONLY public.v_avg_episode_forecast REPLICA IDENTITY NOTHING;


--
-- Name: v_episode_revenue; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.v_episode_revenue (
    podcast_id integer,
    id integer,
    revenue numeric,
    avg_forecast numeric,
    sold_impressions bigint,
    actual_downloads integer,
    published_on date
);

ALTER TABLE ONLY public.v_episode_revenue REPLICA IDENTITY NOTHING;


--
-- Name: v_current_tiers; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_current_tiers AS
 WITH tsm_performance AS (
         SELECT podcasts.name AS "Podcast",
            round((sum(er.revenue) / (sum(er.avg_forecast) * 0.001)), 2) AS "RPM",
            round(avg(er.avg_forecast), 0) AS "Forecast",
            sum(er.revenue) AS "Revenue",
            podcasts.id AS podcast_id
           FROM public.v_episode_revenue er,
            public.episodes,
            public.podcasts
          WHERE ((episodes.podcast_id = podcasts.id) AND (er.id = episodes.id) AND (er.avg_forecast > (0)::numeric) AND ((episodes.published_on >= (('now'::text)::date - '180 days'::interval)) AND (episodes.published_on <= ('now'::text)::date)))
          GROUP BY podcasts.name, podcasts.id
        )
 SELECT tsm_performance."Podcast",
    tsm_performance."RPM",
    tsm_performance."Forecast",
    tsm_performance."Revenue",
    tsm_performance.podcast_id,
        CASE
            WHEN ((tsm_performance."Forecast" >= (100000)::numeric) AND (tsm_performance."RPM" >= (25)::numeric)) THEN 1
            WHEN ((tsm_performance."Forecast" < (100000)::numeric) AND (tsm_performance."RPM" >= (25)::numeric)) THEN 2
            WHEN ((tsm_performance."Forecast" >= (100000)::numeric) AND (tsm_performance."RPM" < (25)::numeric)) THEN 3
            ELSE 4
        END AS client_tier
   FROM tsm_performance;


--
-- Name: v_latest_downloads; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_latest_downloads AS
 SELECT download_statistics.episode_id,
    download_statistics.updated_at AS last_update,
    download_statistics.type AS kind,
    COALESCE((download_statistics.plays + download_statistics.downloads), download_statistics.youtube_views) AS plays
   FROM public.download_statistics
  WHERE (download_statistics.id IN ( SELECT max(download_statistics_1.id) AS max
           FROM public.download_statistics download_statistics_1
          GROUP BY download_statistics_1.type, download_statistics_1.episode_id))
  ORDER BY download_statistics.episode_id, download_statistics.type;


--
-- Name: v_episode_downloads; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_episode_downloads AS
 WITH latest_totals AS (
         SELECT vld.episode_id,
            sum(vld.plays) AS total_plays
           FROM public.v_latest_downloads vld
          GROUP BY vld.episode_id
        )
 SELECT e.id AS episode_id,
    (avg(ads.forecasted_downloads))::integer AS avg_forecast,
    tot.total_plays AS soundcloud_youtube,
    e.additional_downloads AS other_sources,
    (COALESCE(tot.total_plays, (0)::bigint) + COALESCE(e.additional_downloads, 0)) AS total_downloads
   FROM public.podcasts p,
    public.vrt_ad_spots ads,
    (public.episodes e
     LEFT JOIN latest_totals tot ON ((tot.episode_id = e.id)))
  WHERE ((p.id = e.podcast_id) AND (ads.episode_id = e.id))
  GROUP BY e.id, tot.total_plays, e.additional_downloads;


--
-- Name: v_n60day_downloads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.v_n60day_downloads (
    podcast_id integer,
    podcast_name character varying(255),
    episode_id integer,
    episode_number character varying(255),
    published_on date,
    update_date date,
    total_plays integer,
    sc_downloads integer,
    sc_plays integer,
    yt_plays integer,
    other_plays integer
);

ALTER TABLE ONLY public.v_n60day_downloads REPLICA IDENTITY NOTHING;


--
-- Name: v_n7day_downloads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.v_n7day_downloads (
    podcast_id integer,
    podcast_name character varying(255),
    episode_id integer,
    episode_number character varying(255),
    published_on date,
    update_date date,
    total_plays integer,
    sc_downloads integer,
    sc_plays integer,
    yt_plays integer,
    other_plays integer
);

ALTER TABLE ONLY public.v_n7day_downloads REPLICA IDENTITY NOTHING;


--
-- Name: v_n80day_downloads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.v_n80day_downloads (
    podcast_id integer,
    podcast_name character varying(255),
    episode_id integer,
    episode_number character varying(255),
    published_on date,
    update_date date,
    total_plays integer,
    sc_downloads integer,
    sc_plays integer,
    yt_plays integer,
    other_plays integer
);

ALTER TABLE ONLY public.v_n80day_downloads REPLICA IDENTITY NOTHING;


--
-- Name: v_quarterly_revenue; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_quarterly_revenue AS
 SELECT date_part('year'::text, ads.start_on) AS year_part,
    date_part('quarter'::text, ads.start_on) AS quarter_part,
    (date_trunc('quarter'::text, (ads.start_on)::timestamp with time zone))::date AS quarter_date,
    round((sum(((((ads.forecasted_downloads)::numeric * 0.001))::double precision * ads.cpm)))::numeric, 2) AS total_revenue
   FROM public.vrt_ad_spots ads
  WHERE (ads.advertiser_id IS NOT NULL)
  GROUP BY (date_part('year'::text, ads.start_on)), (date_part('quarter'::text, ads.start_on)), ((date_trunc('quarter'::text, (ads.start_on)::timestamp with time zone))::date)
  ORDER BY (date_part('year'::text, ads.start_on)) DESC, (date_part('quarter'::text, ads.start_on)) DESC;


--
-- Name: v_window_downloads; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_window_downloads AS
 SELECT download_statistics.episode_id,
    max(download_statistics.updated_at) AS window_update,
    download_statistics.type AS kind,
    max(COALESCE((download_statistics.plays + download_statistics.downloads), download_statistics.youtube_views)) AS window_plays
   FROM public.download_statistics,
    public.episodes
  WHERE ((episodes.id = download_statistics.episode_id) AND (download_statistics.created_at <= (episodes.published_on + '60 days'::interval)))
  GROUP BY download_statistics.episode_id, download_statistics.type;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.versions (
    id integer NOT NULL,
    item_type character varying(255) NOT NULL,
    item_id integer NOT NULL,
    event character varying(255) NOT NULL,
    whodunnit character varying(255),
    object text,
    created_at timestamp without time zone,
    object_changes text
);


--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.versions_id_seq OWNED BY public.versions.id;


--
-- Name: vrt_advertisers; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vrt_advertisers AS
 SELECT advertisers.id,
    advertisers.name,
    advertisers.url,
    advertisers.photo_file_name,
    advertisers.photo_content_type,
    advertisers.photo_file_size,
    advertisers.photo_updated_at,
    advertisers.created_at,
    advertisers.updated_at,
    advertisers.description,
    advertisers.net_30_terms,
    advertisers.ad_agency_id,
    advertisers.active,
    advertisers.lead_source,
    advertisers.category_id,
    advertisers.billing_cd,
    advertisers.cpm_override,
    advertisers.billing_contact_id,
    advertisers.billing_instructions,
    advertisers.ignore_missing_copy,
    advertisers.budget_source,
    advertisers.client_direct,
    ( SELECT advertisers_salespeople.salesperson_id
           FROM public.advertisers_salespeople
          WHERE ((advertisers_salespeople.advertiser_id = advertisers.id) AND (advertisers_salespeople.end_on IS NULL))) AS sold_by,
    (EXISTS ( SELECT 1
           FROM public.tags,
            public.taggings
          WHERE ((tags.id = taggings.tag_id) AND (taggings.taggable_id = advertisers.id) AND ((taggings.taggable_type)::text = 'Advertiser'::text) AND ((taggings.context)::text = 'tags'::text) AND ((tags.name)::text = 'house-account'::text)))) AS house_account
   FROM public.advertisers;


--
-- Name: wolfpop_signups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wolfpop_signups (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    message text
);


--
-- Name: wolfpop_signups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wolfpop_signups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wolfpop_signups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wolfpop_signups_id_seq OWNED BY public.wolfpop_signups.id;


--
-- Name: activities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activities ALTER COLUMN id SET DEFAULT nextval('public.activities_id_seq'::regclass);


--
-- Name: ad_agencies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_agencies ALTER COLUMN id SET DEFAULT nextval('public.ad_agencies_id_seq'::regclass);


--
-- Name: ad_agency_markets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_agency_markets ALTER COLUMN id SET DEFAULT nextval('public.ad_agency_markets_id_seq'::regclass);


--
-- Name: ad_spot_actuals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spot_actuals ALTER COLUMN id SET DEFAULT nextval('public.ad_spot_actuals_id_seq'::regclass);


--
-- Name: ad_spot_airchecks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spot_airchecks ALTER COLUMN id SET DEFAULT nextval('public.ad_spot_airchecks_id_seq'::regclass);


--
-- Name: ad_spot_comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spot_comments ALTER COLUMN id SET DEFAULT nextval('public.ad_spot_comments_id_seq'::regclass);


--
-- Name: ad_spot_copies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spot_copies ALTER COLUMN id SET DEFAULT nextval('public.ad_spot_copies_id_seq'::regclass);


--
-- Name: ad_spot_schedules id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spot_schedules ALTER COLUMN id SET DEFAULT nextval('public.ad_spot_schedules_id_seq'::regclass);


--
-- Name: ad_spots id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spots ALTER COLUMN id SET DEFAULT nextval('public.ad_spots_id_seq'::regclass);


--
-- Name: ad_spots_reports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spots_reports ALTER COLUMN id SET DEFAULT nextval('public.ad_spots_reports_id_seq'::regclass);


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: advertiser_approvals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertiser_approvals ALTER COLUMN id SET DEFAULT nextval('public.advertiser_approvals_id_seq'::regclass);


--
-- Name: advertiser_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertiser_categories ALTER COLUMN id SET DEFAULT nextval('public.advertiser_categories_id_seq'::regclass);


--
-- Name: advertiser_markets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertiser_markets ALTER COLUMN id SET DEFAULT nextval('public.advertiser_markets_id_seq'::regclass);


--
-- Name: advertiser_reports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertiser_reports ALTER COLUMN id SET DEFAULT nextval('public.advertiser_reports_id_seq'::regclass);


--
-- Name: advertisers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertisers ALTER COLUMN id SET DEFAULT nextval('public.advertisers_id_seq'::regclass);


--
-- Name: advertisers_podcasts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertisers_podcasts ALTER COLUMN id SET DEFAULT nextval('public.advertisers_podcasts_id_seq'::regclass);


--
-- Name: advertisers_salespeople id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertisers_salespeople ALTER COLUMN id SET DEFAULT nextval('public.advertisers_salespeople_id_seq'::regclass);


--
-- Name: blended_demos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blended_demos ALTER COLUMN id SET DEFAULT nextval('public.blended_demos_id_seq'::regclass);


--
-- Name: bulk_ad_copies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bulk_ad_copies ALTER COLUMN id SET DEFAULT nextval('public.bulk_ad_copies_id_seq'::regclass);


--
-- Name: campaigns id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.campaigns ALTER COLUMN id SET DEFAULT nextval('public.campaigns_id_seq'::regclass);


--
-- Name: cancelations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cancelations ALTER COLUMN id SET DEFAULT nextval('public.cancelations_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: categories_podcasts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories_podcasts ALTER COLUMN id SET DEFAULT nextval('public.categories_podcasts_id_seq'::regclass);


--
-- Name: comment_read_statuses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comment_read_statuses ALTER COLUMN id SET DEFAULT nextval('public.comment_read_statuses_id_seq'::regclass);


--
-- Name: dai_profiles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dai_profiles ALTER COLUMN id SET DEFAULT nextval('public.dai_profiles_id_seq'::regclass);


--
-- Name: dai_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dai_statistics ALTER COLUMN id SET DEFAULT nextval('public.dai_statistics_id_seq'::regclass);


--
-- Name: delayed_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delayed_jobs ALTER COLUMN id SET DEFAULT nextval('public.delayed_jobs_id_seq'::regclass);


--
-- Name: download_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.download_statistics ALTER COLUMN id SET DEFAULT nextval('public.download_statistics_id_seq'::regclass);


--
-- Name: dropdown_options id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dropdown_options ALTER COLUMN id SET DEFAULT nextval('public.dropdown_options_id_seq'::regclass);


--
-- Name: episode_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.episode_logs ALTER COLUMN id SET DEFAULT nextval('public.episode_logs_id_seq'::regclass);


--
-- Name: episodes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.episodes ALTER COLUMN id SET DEFAULT nextval('public.episodes_id_seq'::regclass);


--
-- Name: guests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guests ALTER COLUMN id SET DEFAULT nextval('public.guests_id_seq'::regclass);


--
-- Name: guests_podcasts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guests_podcasts ALTER COLUMN id SET DEFAULT nextval('public.guests_podcasts_id_seq'::regclass);


--
-- Name: hosts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hosts ALTER COLUMN id SET DEFAULT nextval('public.hosts_id_seq'::regclass);


--
-- Name: hosts_podcasts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hosts_podcasts ALTER COLUMN id SET DEFAULT nextval('public.hosts_podcasts_id_seq'::regclass);


--
-- Name: insertion_orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.insertion_orders ALTER COLUMN id SET DEFAULT nextval('public.insertion_orders_id_seq'::regclass);


--
-- Name: invites id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invites ALTER COLUMN id SET DEFAULT nextval('public.invites_id_seq'::regclass);


--
-- Name: invoice_transactions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice_transactions ALTER COLUMN id SET DEFAULT nextval('public.invoice_transactions_id_seq'::regclass);


--
-- Name: invoice_transitions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice_transitions ALTER COLUMN id SET DEFAULT nextval('public.invoice_transitions_id_seq'::regclass);


--
-- Name: invoices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices ALTER COLUMN id SET DEFAULT nextval('public.invoices_id_seq'::regclass);


--
-- Name: leads id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leads ALTER COLUMN id SET DEFAULT nextval('public.leads_id_seq'::regclass);


--
-- Name: markets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.markets ALTER COLUMN id SET DEFAULT nextval('public.markets_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: payment_adjustments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_adjustments ALTER COLUMN id SET DEFAULT nextval('public.payment_adjustments_id_seq'::regclass);


--
-- Name: payment_uploads id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_uploads ALTER COLUMN id SET DEFAULT nextval('public.payment_uploads_id_seq'::regclass);


--
-- Name: payouts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payouts ALTER COLUMN id SET DEFAULT nextval('public.payouts_id_seq'::regclass);


--
-- Name: pending_ad_spots id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pending_ad_spots ALTER COLUMN id SET DEFAULT nextval('public.pending_ad_spots_id_seq'::regclass);


--
-- Name: perma_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.perma_logs ALTER COLUMN id SET DEFAULT nextval('public.perma_logs_id_seq'::regclass);


--
-- Name: podcast_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.podcast_categories ALTER COLUMN id SET DEFAULT nextval('public.podcast_categories_id_seq'::regclass);


--
-- Name: podcast_networks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.podcast_networks ALTER COLUMN id SET DEFAULT nextval('public.podcast_networks_id_seq'::regclass);


--
-- Name: podcasts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.podcasts ALTER COLUMN id SET DEFAULT nextval('public.podcasts_id_seq'::regclass);


--
-- Name: podcasts_reports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.podcasts_reports ALTER COLUMN id SET DEFAULT nextval('public.podcasts_reports_id_seq'::regclass);


--
-- Name: podcasts_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.podcasts_users ALTER COLUMN id SET DEFAULT nextval('public.podcasts_users_id_seq'::regclass);


--
-- Name: prototype_episodes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prototype_episodes ALTER COLUMN id SET DEFAULT nextval('public.prototype_episodes_id_seq'::regclass);


--
-- Name: prototype_spots id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prototype_spots ALTER COLUMN id SET DEFAULT nextval('public.prototype_spots_id_seq'::regclass);


--
-- Name: rate_cards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rate_cards ALTER COLUMN id SET DEFAULT nextval('public.rate_cards_id_seq'::regclass);


--
-- Name: resources id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resources ALTER COLUMN id SET DEFAULT nextval('public.resources_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: roles_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles_users ALTER COLUMN id SET DEFAULT nextval('public.roles_users_id_seq'::regclass);


--
-- Name: sample_airchecks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sample_airchecks ALTER COLUMN id SET DEFAULT nextval('public.sample_airchecks_id_seq'::regclass);


--
-- Name: signatures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.signatures ALTER COLUMN id SET DEFAULT nextval('public.signatures_id_seq'::regclass);


--
-- Name: slides id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slides ALTER COLUMN id SET DEFAULT nextval('public.slides_id_seq'::regclass);


--
-- Name: sound_cloud_histories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sound_cloud_histories ALTER COLUMN id SET DEFAULT nextval('public.sound_cloud_histories_id_seq'::regclass);


--
-- Name: survey_answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.survey_answers ALTER COLUMN id SET DEFAULT nextval('public.survey_answers_id_seq'::regclass);


--
-- Name: survey_questions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.survey_questions ALTER COLUMN id SET DEFAULT nextval('public.survey_questions_id_seq'::regclass);


--
-- Name: taggings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taggings ALTER COLUMN id SET DEFAULT nextval('public.taggings_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: versions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.versions ALTER COLUMN id SET DEFAULT nextval('public.versions_id_seq'::regclass);


--
-- Name: wolfpop_signups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wolfpop_signups ALTER COLUMN id SET DEFAULT nextval('public.wolfpop_signups_id_seq'::regclass);


--
-- Name: activities activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: ad_agencies ad_agencies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_agencies
    ADD CONSTRAINT ad_agencies_pkey PRIMARY KEY (id);


--
-- Name: ad_agency_markets ad_agency_markets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_agency_markets
    ADD CONSTRAINT ad_agency_markets_pkey PRIMARY KEY (id);


--
-- Name: ad_spot_actuals ad_spot_actuals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spot_actuals
    ADD CONSTRAINT ad_spot_actuals_pkey PRIMARY KEY (id);


--
-- Name: ad_spot_airchecks ad_spot_airchecks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spot_airchecks
    ADD CONSTRAINT ad_spot_airchecks_pkey PRIMARY KEY (id);


--
-- Name: ad_spot_comments ad_spot_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spot_comments
    ADD CONSTRAINT ad_spot_comments_pkey PRIMARY KEY (id);


--
-- Name: ad_spot_copies ad_spot_copies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spot_copies
    ADD CONSTRAINT ad_spot_copies_pkey PRIMARY KEY (id);


--
-- Name: ad_spot_schedules ad_spot_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spot_schedules
    ADD CONSTRAINT ad_spot_schedules_pkey PRIMARY KEY (id);


--
-- Name: ad_spots ad_spots_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spots
    ADD CONSTRAINT ad_spots_pkey PRIMARY KEY (id);


--
-- Name: ad_spots_reports ad_spots_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spots_reports
    ADD CONSTRAINT ad_spots_reports_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: advertiser_approvals advertiser_approvals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertiser_approvals
    ADD CONSTRAINT advertiser_approvals_pkey PRIMARY KEY (id);


--
-- Name: advertiser_categories advertiser_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertiser_categories
    ADD CONSTRAINT advertiser_categories_pkey PRIMARY KEY (id);


--
-- Name: advertiser_markets advertiser_markets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertiser_markets
    ADD CONSTRAINT advertiser_markets_pkey PRIMARY KEY (id);


--
-- Name: advertiser_reports advertiser_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertiser_reports
    ADD CONSTRAINT advertiser_reports_pkey PRIMARY KEY (id);


--
-- Name: advertisers advertisers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertisers
    ADD CONSTRAINT advertisers_pkey PRIMARY KEY (id);


--
-- Name: advertisers_podcasts advertisers_podcasts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertisers_podcasts
    ADD CONSTRAINT advertisers_podcasts_pkey PRIMARY KEY (id);


--
-- Name: advertisers_salespeople advertisers_salespeople_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertisers_salespeople
    ADD CONSTRAINT advertisers_salespeople_pkey PRIMARY KEY (id);


--
-- Name: blended_demos blended_demos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blended_demos
    ADD CONSTRAINT blended_demos_pkey PRIMARY KEY (id);


--
-- Name: bulk_ad_copies bulk_ad_copies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bulk_ad_copies
    ADD CONSTRAINT bulk_ad_copies_pkey PRIMARY KEY (id);


--
-- Name: campaigns campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (id);


--
-- Name: cancelations cancelations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cancelations
    ADD CONSTRAINT cancelations_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories_podcasts categories_podcasts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories_podcasts
    ADD CONSTRAINT categories_podcasts_pkey PRIMARY KEY (id);


--
-- Name: comment_read_statuses comment_read_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comment_read_statuses
    ADD CONSTRAINT comment_read_statuses_pkey PRIMARY KEY (id);


--
-- Name: dai_profiles dai_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dai_profiles
    ADD CONSTRAINT dai_profiles_pkey PRIMARY KEY (id);


--
-- Name: dai_statistics dai_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dai_statistics
    ADD CONSTRAINT dai_statistics_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs delayed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delayed_jobs
    ADD CONSTRAINT delayed_jobs_pkey PRIMARY KEY (id);


--
-- Name: dropdown_options dropdown_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dropdown_options
    ADD CONSTRAINT dropdown_options_pkey PRIMARY KEY (id);


--
-- Name: episode_logs episode_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.episode_logs
    ADD CONSTRAINT episode_logs_pkey PRIMARY KEY (id);


--
-- Name: guests guests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guests
    ADD CONSTRAINT guests_pkey PRIMARY KEY (id);


--
-- Name: guests_podcasts guests_podcasts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guests_podcasts
    ADD CONSTRAINT guests_podcasts_pkey PRIMARY KEY (id);


--
-- Name: hosts hosts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_pkey PRIMARY KEY (id);


--
-- Name: hosts_podcasts hosts_podcasts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hosts_podcasts
    ADD CONSTRAINT hosts_podcasts_pkey PRIMARY KEY (id);


--
-- Name: insertion_orders insertion_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.insertion_orders
    ADD CONSTRAINT insertion_orders_pkey PRIMARY KEY (id);


--
-- Name: invites invites_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invites
    ADD CONSTRAINT invites_pkey PRIMARY KEY (id);


--
-- Name: invoice_transactions invoice_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice_transactions
    ADD CONSTRAINT invoice_transactions_pkey PRIMARY KEY (id);


--
-- Name: invoice_transitions invoice_transitions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice_transitions
    ADD CONSTRAINT invoice_transitions_pkey PRIMARY KEY (id);


--
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: leads leads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leads
    ADD CONSTRAINT leads_pkey PRIMARY KEY (id);


--
-- Name: markets markets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.markets
    ADD CONSTRAINT markets_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: payment_adjustments payment_adjustments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_adjustments
    ADD CONSTRAINT payment_adjustments_pkey PRIMARY KEY (id);


--
-- Name: payment_uploads payment_uploads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_uploads
    ADD CONSTRAINT payment_uploads_pkey PRIMARY KEY (id);


--
-- Name: payouts payouts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payouts
    ADD CONSTRAINT payouts_pkey PRIMARY KEY (id);


--
-- Name: pending_ad_spots pending_ad_spots_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pending_ad_spots
    ADD CONSTRAINT pending_ad_spots_pkey PRIMARY KEY (id);


--
-- Name: perma_logs perma_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.perma_logs
    ADD CONSTRAINT perma_logs_pkey PRIMARY KEY (id);


--
-- Name: podcast_categories podcast_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.podcast_categories
    ADD CONSTRAINT podcast_categories_pkey PRIMARY KEY (id);


--
-- Name: episodes podcast_episodes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.episodes
    ADD CONSTRAINT podcast_episodes_pkey PRIMARY KEY (id);


--
-- Name: podcast_networks podcast_networks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.podcast_networks
    ADD CONSTRAINT podcast_networks_pkey PRIMARY KEY (id);


--
-- Name: users podcast_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT podcast_users_pkey PRIMARY KEY (id);


--
-- Name: podcasts_users podcast_users_podcasts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.podcasts_users
    ADD CONSTRAINT podcast_users_podcasts_pkey PRIMARY KEY (id);


--
-- Name: podcasts podcasts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.podcasts
    ADD CONSTRAINT podcasts_pkey PRIMARY KEY (id);


--
-- Name: podcasts_reports podcasts_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.podcasts_reports
    ADD CONSTRAINT podcasts_reports_pkey PRIMARY KEY (id);


--
-- Name: prototype_episodes prototype_episodes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prototype_episodes
    ADD CONSTRAINT prototype_episodes_pkey PRIMARY KEY (id);


--
-- Name: prototype_spots prototype_spots_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prototype_spots
    ADD CONSTRAINT prototype_spots_pkey PRIMARY KEY (id);


--
-- Name: rate_cards rate_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rate_cards
    ADD CONSTRAINT rate_cards_pkey PRIMARY KEY (id);


--
-- Name: resources resources_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: roles_users roles_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles_users
    ADD CONSTRAINT roles_users_pkey PRIMARY KEY (id);


--
-- Name: sample_airchecks sample_airchecks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sample_airchecks
    ADD CONSTRAINT sample_airchecks_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: signatures signatures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.signatures
    ADD CONSTRAINT signatures_pkey PRIMARY KEY (id);


--
-- Name: slides slides_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slides
    ADD CONSTRAINT slides_pkey PRIMARY KEY (id);


--
-- Name: sound_cloud_histories sound_cloud_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sound_cloud_histories
    ADD CONSTRAINT sound_cloud_histories_pkey PRIMARY KEY (id);


--
-- Name: download_statistics soundcloud_scrapes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.download_statistics
    ADD CONSTRAINT soundcloud_scrapes_pkey PRIMARY KEY (id);


--
-- Name: survey_answers survey_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.survey_answers
    ADD CONSTRAINT survey_answers_pkey PRIMARY KEY (id);


--
-- Name: survey_questions survey_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.survey_questions
    ADD CONSTRAINT survey_questions_pkey PRIMARY KEY (id);


--
-- Name: survey_respondents survey_respondents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.survey_respondents
    ADD CONSTRAINT survey_respondents_pkey PRIMARY KEY (id);


--
-- Name: taggings taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taggings
    ADD CONSTRAINT taggings_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: wolfpop_signups wolfpop_signups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wolfpop_signups
    ADD CONSTRAINT wolfpop_signups_pkey PRIMARY KEY (id);


--
-- Name: access_60_day; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX access_60_day ON public.download_statistics USING btree (episode_id, type) WHERE (day_60 IS NOT NULL);


--
-- Name: access_7_day; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX access_7_day ON public.download_statistics USING btree (episode_id, type) WHERE (day_7 IS NOT NULL);


--
-- Name: access_80_day; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX access_80_day ON public.download_statistics USING btree (episode_id, type) WHERE (day_80 IS NOT NULL);


--
-- Name: delayed_jobs_priority; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX delayed_jobs_priority ON public.delayed_jobs USING btree (priority, run_at);


--
-- Name: index_ad_agency_markets_on_ad_agency_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_agency_markets_on_ad_agency_id ON public.ad_agency_markets USING btree (ad_agency_id);


--
-- Name: index_ad_agency_markets_on_market_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_agency_markets_on_market_id ON public.ad_agency_markets USING btree (market_id);


--
-- Name: index_ad_spot_actuals_on_ad_spot_id_and_year_and_month; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_spot_actuals_on_ad_spot_id_and_year_and_month ON public.ad_spot_actuals USING btree (ad_spot_id, year, month);


--
-- Name: index_ad_spot_airchecks_on_ad_spot_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_spot_airchecks_on_ad_spot_id ON public.ad_spot_airchecks USING btree (ad_spot_id);


--
-- Name: index_ad_spot_comments_on_ad_spot_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_spot_comments_on_ad_spot_id ON public.ad_spot_comments USING btree (ad_spot_id);


--
-- Name: index_ad_spot_comments_on_poster_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_spot_comments_on_poster_id ON public.ad_spot_comments USING btree (poster_id);


--
-- Name: index_ad_spot_copies_on_ad_spot_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_spot_copies_on_ad_spot_id ON public.ad_spot_copies USING btree (ad_spot_id);


--
-- Name: index_ad_spot_copies_on_poster_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_spot_copies_on_poster_id ON public.ad_spot_copies USING btree (poster_id);


--
-- Name: index_ad_spot_schedules_on_ad_spot_id_and_year_and_month; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_spot_schedules_on_ad_spot_id_and_year_and_month ON public.ad_spot_schedules USING btree (ad_spot_id, year, month);


--
-- Name: index_ad_spots_on_advertiser_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_spots_on_advertiser_id ON public.ad_spots USING btree (advertiser_id);


--
-- Name: index_ad_spots_on_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_spots_on_campaign_id ON public.ad_spots USING btree (campaign_id);


--
-- Name: index_ad_spots_on_episode_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_spots_on_episode_id ON public.ad_spots USING btree (episode_id);


--
-- Name: index_ad_spots_on_insertion_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_spots_on_insertion_order_id ON public.ad_spots USING btree (insertion_order_id);


--
-- Name: index_ad_spots_on_invoice_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_spots_on_invoice_id ON public.ad_spots USING btree (invoice_id);


--
-- Name: index_ad_spots_on_payout_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_spots_on_payout_id ON public.ad_spots USING btree (payout_id);


--
-- Name: index_ad_spots_on_podcast_id_and_start_on; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_spots_on_podcast_id_and_start_on ON public.ad_spots USING btree (podcast_id, start_on);


--
-- Name: index_ad_spots_on_prototype_spot_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_spots_on_prototype_spot_id ON public.ad_spots USING btree (prototype_spot_id);


--
-- Name: index_ad_spots_on_start_on; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ad_spots_on_start_on ON public.ad_spots USING btree (start_on);


--
-- Name: index_advertiser_approvals_on_advertiser_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_advertiser_approvals_on_advertiser_id ON public.advertiser_approvals USING btree (advertiser_id);


--
-- Name: index_advertiser_markets_on_advertiser_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_advertiser_markets_on_advertiser_id ON public.advertiser_markets USING btree (advertiser_id);


--
-- Name: index_advertiser_markets_on_market_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_advertiser_markets_on_market_id ON public.advertiser_markets USING btree (market_id);


--
-- Name: index_advertiser_reports_on_advertiser_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_advertiser_reports_on_advertiser_id ON public.advertiser_reports USING btree (advertiser_id);


--
-- Name: index_advertisers_on_ad_agency_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_advertisers_on_ad_agency_id ON public.advertisers USING btree (ad_agency_id);


--
-- Name: index_advertisers_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_advertisers_on_category_id ON public.advertisers USING btree (category_id);


--
-- Name: index_advertisers_salespeople_on_advertiser_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_advertisers_salespeople_on_advertiser_id ON public.advertisers_salespeople USING btree (advertiser_id);


--
-- Name: index_advertisers_salespeople_on_salesperson_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_advertisers_salespeople_on_salesperson_id ON public.advertisers_salespeople USING btree (salesperson_id);


--
-- Name: index_bulk_ad_copies_on_advertiser_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bulk_ad_copies_on_advertiser_id ON public.bulk_ad_copies USING btree (advertiser_id);


--
-- Name: index_campaigns_on_advertiser_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_campaigns_on_advertiser_id ON public.campaigns USING btree (advertiser_id);


--
-- Name: index_campaigns_on_approved_by; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_campaigns_on_approved_by ON public.campaigns USING btree (approved_by);


--
-- Name: index_campaigns_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_campaigns_on_created_at ON public.campaigns USING btree (created_at);


--
-- Name: index_campaigns_on_created_by; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_campaigns_on_created_by ON public.campaigns USING btree (created_by);


--
-- Name: index_campaigns_on_held_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_campaigns_on_held_by_user_id ON public.campaigns USING btree (held_by_user_id);


--
-- Name: index_campaigns_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_campaigns_on_token ON public.campaigns USING btree (token);


--
-- Name: index_comment_read_statuses_on_ad_spot_id_and_unread; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comment_read_statuses_on_ad_spot_id_and_unread ON public.comment_read_statuses USING btree (ad_spot_id, unread);


--
-- Name: index_comment_read_statuses_on_comment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comment_read_statuses_on_comment_id ON public.comment_read_statuses USING btree (comment_id);


--
-- Name: index_dai_profiles_on_podcast_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dai_profiles_on_podcast_id ON public.dai_profiles USING btree (podcast_id);


--
-- Name: index_dai_statistics_on_ad_spot_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dai_statistics_on_ad_spot_id ON public.dai_statistics USING btree (ad_spot_id);


--
-- Name: index_download_statistics_on_episode_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_download_statistics_on_episode_id ON public.download_statistics USING btree (episode_id);


--
-- Name: index_episode_logs_on_episode_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_episode_logs_on_episode_id ON public.episode_logs USING btree (episode_id);


--
-- Name: index_episode_logs_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_episode_logs_on_user_id ON public.episode_logs USING btree (user_id);


--
-- Name: index_episodes_on_podcast_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_episodes_on_podcast_id ON public.episodes USING btree (podcast_id);


--
-- Name: index_episodes_on_prototype_id_and_published_on; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_episodes_on_prototype_id_and_published_on ON public.episodes USING btree (prototype_id, published_on);


--
-- Name: index_episodes_on_published_on; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_episodes_on_published_on ON public.episodes USING btree (published_on);


--
-- Name: index_episodes_on_spotify_uri; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_episodes_on_spotify_uri ON public.episodes USING btree (spotify_uri);


--
-- Name: index_guests_podcasts_on_guest_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_guests_podcasts_on_guest_id ON public.guests_podcasts USING btree (guest_id);


--
-- Name: index_guests_podcasts_on_podcast_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_guests_podcasts_on_podcast_id ON public.guests_podcasts USING btree (podcast_id);


--
-- Name: index_hosts_podcasts_on_host_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hosts_podcasts_on_host_id ON public.hosts_podcasts USING btree (host_id);


--
-- Name: index_hosts_podcasts_on_podcast_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hosts_podcasts_on_podcast_id ON public.hosts_podcasts USING btree (podcast_id);


--
-- Name: index_insertion_orders_on_advertiser_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_insertion_orders_on_advertiser_id ON public.insertion_orders USING btree (advertiser_id);


--
-- Name: index_insertion_orders_on_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_insertion_orders_on_campaign_id ON public.insertion_orders USING btree (campaign_id);


--
-- Name: index_invites_on_advertiser_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_invites_on_advertiser_id ON public.invites USING btree (advertiser_id);


--
-- Name: index_invites_on_podcast_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_invites_on_podcast_id ON public.invites USING btree (podcast_id);


--
-- Name: index_invoice_transactions_on_invoice_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_invoice_transactions_on_invoice_id ON public.invoice_transactions USING btree (invoice_id);


--
-- Name: index_invoice_transitions_on_invoice_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_invoice_transitions_on_invoice_id ON public.invoice_transitions USING btree (invoice_id);


--
-- Name: index_invoices_on_ad_agency_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_invoices_on_ad_agency_id ON public.invoices USING btree (ad_agency_id);


--
-- Name: index_invoices_on_advertiser_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_invoices_on_advertiser_id ON public.invoices USING btree (advertiser_id);


--
-- Name: index_invoices_on_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_invoices_on_campaign_id ON public.invoices USING btree (campaign_id);


--
-- Name: index_invoices_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_invoices_on_status ON public.invoices USING btree (status);


--
-- Name: index_payment_adjustments_on_podcast_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_payment_adjustments_on_podcast_id ON public.payment_adjustments USING btree (podcast_id);


--
-- Name: index_payment_uploads_on_podcast_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_payment_uploads_on_podcast_id ON public.payment_uploads USING btree (podcast_id);


--
-- Name: index_payouts_on_podcast_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_payouts_on_podcast_id ON public.payouts USING btree (podcast_id);


--
-- Name: index_pending_ad_spots_on_ad_spot_id_and_held_advertiser_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pending_ad_spots_on_ad_spot_id_and_held_advertiser_id ON public.pending_ad_spots USING btree (ad_spot_id, held_advertiser_id);


--
-- Name: index_pending_ad_spots_on_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pending_ad_spots_on_campaign_id ON public.pending_ad_spots USING btree (campaign_id);


--
-- Name: index_podcast_categories_podcasts_on_podcast_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_podcast_categories_podcasts_on_podcast_category_id ON public.podcast_categories_podcasts USING btree (podcast_category_id);


--
-- Name: index_podcast_categories_podcasts_on_podcast_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_podcast_categories_podcasts_on_podcast_id ON public.podcast_categories_podcasts USING btree (podcast_id);


--
-- Name: index_podcast_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_podcast_users_on_email ON public.users USING btree (email);


--
-- Name: index_podcast_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_podcast_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_podcasts_on_podcast_network_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_podcasts_on_podcast_network_id ON public.podcasts USING btree (podcast_network_id);


--
-- Name: index_podcasts_on_product_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_podcasts_on_product_code ON public.podcasts USING btree (product_code);


--
-- Name: index_podcasts_on_survey_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_podcasts_on_survey_slug ON public.podcasts USING btree (survey_slug);


--
-- Name: index_podcasts_users_on_podcast_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_podcasts_users_on_podcast_id ON public.podcasts_users USING btree (podcast_id);


--
-- Name: index_podcasts_users_on_podcast_id_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_podcasts_users_on_podcast_id_and_user_id ON public.podcasts_users USING btree (podcast_id, user_id);


--
-- Name: index_podcasts_users_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_podcasts_users_on_user_id ON public.podcasts_users USING btree (user_id);


--
-- Name: index_prototype_episodes_on_podcast_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_prototype_episodes_on_podcast_id ON public.prototype_episodes USING btree (podcast_id);


--
-- Name: index_prototype_spots_on_prototype_episode_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_prototype_spots_on_prototype_episode_id ON public.prototype_spots USING btree (prototype_episode_id);


--
-- Name: index_resources_on_parent_id_and_parent_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_resources_on_parent_id_and_parent_type ON public.resources USING btree (parent_id, parent_type);


--
-- Name: index_roles_users_on_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_roles_users_on_role_id ON public.roles_users USING btree (role_id);


--
-- Name: index_roles_users_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_roles_users_on_user_id ON public.roles_users USING btree (user_id);


--
-- Name: index_sample_airchecks_on_podcast_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sample_airchecks_on_podcast_id ON public.sample_airchecks USING btree (podcast_id);


--
-- Name: index_signatures_on_signable_type_and_signable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_signatures_on_signable_type_and_signable_id ON public.signatures USING btree (signable_type, signable_id);


--
-- Name: index_survey_answers_on_survey_question_id_and_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_survey_answers_on_survey_question_id_and_answer_id ON public.survey_answers USING btree (survey_question_id, answer_id);


--
-- Name: index_survey_questions_on_podcast_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_survey_questions_on_podcast_id ON public.survey_questions USING btree (podcast_id);


--
-- Name: index_survey_questions_on_question_id_podcast_id_survey_version; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_survey_questions_on_question_id_podcast_id_survey_version ON public.survey_questions USING btree (question_id, podcast_id, survey_version);


--
-- Name: index_survey_respondents_on_response_hash; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_survey_respondents_on_response_hash ON public.survey_respondents USING btree (response_hash);


--
-- Name: index_survey_respondents_on_survey_version; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_survey_respondents_on_survey_version ON public.survey_respondents USING btree (survey_version);


--
-- Name: index_taggings_on_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_taggings_on_context ON public.taggings USING btree (context);


--
-- Name: index_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_taggings_on_tag_id ON public.taggings USING btree (tag_id);


--
-- Name: index_taggings_on_taggable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_taggings_on_taggable_id ON public.taggings USING btree (taggable_id);


--
-- Name: index_taggings_on_taggable_id_and_taggable_type_and_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_taggings_on_taggable_id_and_taggable_type_and_context ON public.taggings USING btree (taggable_id, taggable_type, context);


--
-- Name: index_taggings_on_taggable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_taggings_on_taggable_type ON public.taggings USING btree (taggable_type);


--
-- Name: index_tags_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tags_on_name ON public.tags USING btree (name);


--
-- Name: index_users_on_ad_agency_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_ad_agency_id ON public.users USING btree (ad_agency_id);


--
-- Name: index_users_on_advertiser_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_advertiser_id ON public.users USING btree (advertiser_id);


--
-- Name: index_users_on_podcast_network_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_podcast_network_id ON public.users USING btree (podcast_network_id);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_versions_on_item_type_and_item_id ON public.versions USING btree (item_type, item_id);


--
-- Name: items_day_of_creation_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX items_day_of_creation_idx ON public.versions USING btree (item_type, ((created_at)::date));


--
-- Name: prototype_spots_uniq_unit_number_for_ad_type; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX prototype_spots_uniq_unit_number_for_ad_type ON public.prototype_spots USING btree (prototype_episode_id, ad_type_cd, unit_number);


--
-- Name: taggings_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX taggings_idx ON public.taggings USING btree (tag_id, taggable_id, taggable_type, context, tagger_id, tagger_type);


--
-- Name: taggings_idy; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX taggings_idy ON public.taggings USING btree (taggable_id, taggable_type, tagger_id, context);


--
-- Name: unique_poly; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_poly ON public.advertiser_approvals USING btree (podcast_id, podcast_type, advertiser_type, advertiser_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- Name: v_80day_downloads _RETURN; Type: RULE; Schema: public; Owner: -
--

CREATE RULE "_RETURN" AS
    ON SELECT TO public.v_80day_downloads DO INSTEAD  WITH max_update AS (
         SELECT e_1.id,
            (max(date_trunc('day'::text, ds_1.updated_at)))::date AS last_update_date,
            max(ds_1.id) AS ds_id,
            (max(date_trunc('day'::text, ds_1.updated_at)) - (e_1.published_on)::timestamp without time zone) AS report_length
           FROM (public.episodes e_1
             LEFT JOIN public.download_statistics ds_1 ON (((ds_1.episode_id = e_1.id) AND (ds_1.updated_at <= (e_1.published_on + '80 days'::interval)))))
          WHERE ((e_1.published_on < ('now'::text)::date) AND ((ds_1.type)::text <> 'ManualDownload'::text))
          GROUP BY e_1.id
        )
 SELECT p.id AS podcast_id,
    p.name AS podcast_name,
    e.id AS episode_id,
    e.episode_number,
    e.published_on,
    mu.last_update_date AS update_date,
    (((max(COALESCE(ds.downloads, 0)) + max(COALESCE(ds.plays, 0))) + max(COALESCE(ds.youtube_views, 0))) + max(e.additional_downloads)) AS total_plays,
    max(COALESCE(ds.downloads, 0)) AS sc_downloads,
    max(COALESCE(ds.plays, 0)) AS sc_plays,
    max(COALESCE(ds.youtube_views, 0)) AS yt_plays,
    max(e.additional_downloads) AS other_plays
   FROM public.podcasts p,
    public.episodes e,
    (max_update mu
     LEFT JOIN public.download_statistics ds ON ((ds.id = mu.ds_id)))
  WHERE ((p.id = e.podcast_id) AND (e.id = mu.id) AND (e.published_on < ('now'::text)::date))
  GROUP BY e.episode_number, p.id, p.name, e.id, e.published_on, mu.last_update_date;


--
-- Name: survey_percentages _RETURN; Type: RULE; Schema: public; Owner: -
--

CREATE RULE "_RETURN" AS
    ON SELECT TO public.survey_percentages DO INSTEAD  SELECT sq.podcast_id,
    sq.id AS survey_question_id,
    sq.question_id,
    s1.d AS q_responses,
    sa.id AS survey_answer_id,
    sa.answer_id,
    sum(sa.resp_count) AS a_responses,
    (((100.0 * (sum(sa.resp_count))::numeric) / (s1.d)::numeric))::double precision AS percent,
    sq.survey_version
   FROM (public.survey_answers sa
     JOIN public.survey_questions sq ON ((sa.survey_question_id = sq.id))),
    LATERAL ( SELECT survey_questions.resp_count AS d
           FROM public.survey_questions
          WHERE ((sq.id = survey_questions.id) AND (sq.question_id = ANY (ARRAY[16, 35, 43, 57, 70, 71, 72, 73, 79, 80])))
        UNION
         SELECT sum(saa.resp_count) AS d
           FROM public.survey_answers saa
          WHERE ((saa.survey_question_id = sq.id) AND (saa.answer_id <> ALL (ARRAY[3, 152])) AND (sq.question_id <> ALL (ARRAY[16, 35, 43, 57, 70, 71, 72, 73, 79, 80])))) s1
  WHERE ((sq.resp_count > 0) AND (sa.resp_count > 0) AND (sa.answer_id <> ALL (ARRAY[3, 152])) AND (s1.d > 0))
  GROUP BY sq.podcast_id, sq.id, sa.id, s1.d;


--
-- Name: v_n80day_downloads _RETURN; Type: RULE; Schema: public; Owner: -
--

CREATE RULE "_RETURN" AS
    ON SELECT TO public.v_n80day_downloads DO INSTEAD  WITH max_update AS (
         SELECT e_1.id,
            ds_1.type,
            (max(date_trunc('day'::text, ds_1.updated_at)))::date AS last_update_date,
            max(ds_1.id) AS ds_id,
            (max(date_trunc('day'::text, ds_1.updated_at)) - (e_1.published_on)::timestamp without time zone) AS report_length
           FROM (public.episodes e_1
             LEFT JOIN public.download_statistics ds_1 ON (((ds_1.episode_id = e_1.id) AND (ds_1.day_80 IS NOT NULL))))
          WHERE (e_1.published_on < ('now'::text)::date)
          GROUP BY e_1.id, ds_1.type
        )
 SELECT p.id AS podcast_id,
    p.name AS podcast_name,
    e.id AS episode_id,
    e.episode_number,
    e.published_on,
    max(mu.last_update_date) AS update_date,
    (((sum(COALESCE(ds.downloads, 0)) + sum(COALESCE(ds.plays, 0))) + sum(COALESCE(ds.youtube_views, 0))))::integer AS total_plays,
    (sum(COALESCE(ds.downloads, 0)))::integer AS sc_downloads,
    (sum(COALESCE(ds.plays, 0)))::integer AS sc_plays,
    (sum(COALESCE(ds.youtube_views, 0)))::integer AS yt_plays,
    max(e.additional_downloads) AS other_plays
   FROM public.podcasts p,
    public.episodes e,
    (max_update mu
     LEFT JOIN public.download_statistics ds ON ((ds.id = mu.ds_id)))
  WHERE ((p.id = e.podcast_id) AND (e.id = mu.id) AND (e.published_on < ('now'::text)::date))
  GROUP BY e.episode_number, p.id, p.name, e.id, e.published_on;


--
-- Name: v_avg_episode_forecast _RETURN; Type: RULE; Schema: public; Owner: -
--

CREATE RULE "_RETURN" AS
    ON SELECT TO public.v_avg_episode_forecast DO INSTEAD  SELECT episodes.id AS episode_id,
    COALESCE(round(avg(ad_spots.forecasted_downloads), 0), (( SELECT prototype_episodes.forecasted_downloads
           FROM public.prototype_episodes
          WHERE (prototype_episodes.id = episodes.prototype_id)))::numeric) AS avg_forecast
   FROM (public.episodes
     LEFT JOIN public.ad_spots ON ((ad_spots.episode_id = episodes.id)))
  GROUP BY episodes.id;


--
-- Name: v_episode_revenue _RETURN; Type: RULE; Schema: public; Owner: -
--

CREATE RULE "_RETURN" AS
    ON SELECT TO public.v_episode_revenue DO INSTEAD  SELECT episodes.podcast_id,
    episodes.id,
    round(sum(
        CASE
            WHEN (ad_spots.advertiser_id IS NOT NULL) THEN (((ad_spots.forecasted_downloads)::numeric * 0.001) * (ad_spots.cpm)::numeric)
            ELSE (0)::numeric
        END), 2) AS revenue,
    v_avg_episode_forecast.avg_forecast,
    sum(
        CASE
            WHEN (ad_spots.advertiser_id IS NOT NULL) THEN ad_spots.forecasted_downloads
            ELSE 0
        END) AS sold_impressions,
    max(COALESCE(episodes.impressions_at_report_end,
        CASE
            WHEN (episodes.impressions_cache > 0) THEN episodes.impressions_cache
            ELSE NULL::integer
        END, NULL::integer)) AS actual_downloads,
    episodes.published_on
   FROM (((public.episodes
     JOIN public.v_avg_episode_forecast ON ((v_avg_episode_forecast.episode_id = episodes.id)))
     JOIN public.podcasts ON ((episodes.podcast_id = podcasts.id)))
     LEFT JOIN public.ad_spots ON ((ad_spots.episode_id = episodes.id)))
  GROUP BY episodes.podcast_id, episodes.id, v_avg_episode_forecast.avg_forecast;


--
-- Name: v_n60day_downloads _RETURN; Type: RULE; Schema: public; Owner: -
--

CREATE RULE "_RETURN" AS
    ON SELECT TO public.v_n60day_downloads DO INSTEAD  WITH max_update AS (
         SELECT e_1.id,
            ds_1.type,
            (max(date_trunc('day'::text, ds_1.updated_at)))::date AS last_update_date,
            max(ds_1.id) AS ds_id,
            (max(date_trunc('day'::text, ds_1.updated_at)) - (e_1.published_on)::timestamp without time zone) AS report_length
           FROM (public.episodes e_1
             LEFT JOIN public.download_statistics ds_1 ON (((ds_1.episode_id = e_1.id) AND (ds_1.day_60 IS NOT NULL))))
          WHERE (e_1.published_on < ('now'::text)::date)
          GROUP BY e_1.id, ds_1.type
        )
 SELECT p.id AS podcast_id,
    p.name AS podcast_name,
    e.id AS episode_id,
    e.episode_number,
    e.published_on,
    max(mu.last_update_date) AS update_date,
    (((sum(COALESCE(ds.downloads, 0)) + sum(COALESCE(ds.plays, 0))) + sum(COALESCE(ds.youtube_views, 0))))::integer AS total_plays,
    (sum(COALESCE(ds.downloads, 0)))::integer AS sc_downloads,
    (sum(COALESCE(ds.plays, 0)))::integer AS sc_plays,
    (sum(COALESCE(ds.youtube_views, 0)))::integer AS yt_plays,
    max(e.additional_downloads) AS other_plays
   FROM public.podcasts p,
    public.episodes e,
    (max_update mu
     LEFT JOIN public.download_statistics ds ON ((ds.id = mu.ds_id)))
  WHERE ((p.id = e.podcast_id) AND (e.id = mu.id) AND (e.published_on < ('now'::text)::date))
  GROUP BY e.episode_number, p.id, p.name, e.id, e.published_on;


--
-- Name: v_n7day_downloads _RETURN; Type: RULE; Schema: public; Owner: -
--

CREATE RULE "_RETURN" AS
    ON SELECT TO public.v_n7day_downloads DO INSTEAD  WITH max_update AS (
         SELECT e_1.id,
            ds_1.type,
            (max(date_trunc('day'::text, ds_1.updated_at)))::date AS last_update_date,
            max(ds_1.id) AS ds_id,
            (max(date_trunc('day'::text, ds_1.updated_at)) - (e_1.published_on)::timestamp without time zone) AS report_length
           FROM (public.episodes e_1
             LEFT JOIN public.download_statistics ds_1 ON (((ds_1.episode_id = e_1.id) AND (ds_1.day_7 IS NOT NULL))))
          WHERE (e_1.published_on < ('now'::text)::date)
          GROUP BY e_1.id, ds_1.type
        )
 SELECT p.id AS podcast_id,
    p.name AS podcast_name,
    e.id AS episode_id,
    e.episode_number,
    e.published_on,
    max(mu.last_update_date) AS update_date,
    (((sum(COALESCE(ds.downloads, 0)) + sum(COALESCE(ds.plays, 0))) + sum(COALESCE(ds.youtube_views, 0))))::integer AS total_plays,
    (sum(COALESCE(ds.downloads, 0)))::integer AS sc_downloads,
    (sum(COALESCE(ds.plays, 0)))::integer AS sc_plays,
    (sum(COALESCE(ds.youtube_views, 0)))::integer AS yt_plays,
    max(e.additional_downloads) AS other_plays
   FROM public.podcasts p,
    public.episodes e,
    (max_update mu
     LEFT JOIN public.download_statistics ds ON ((ds.id = mu.ds_id)))
  WHERE ((p.id = e.podcast_id) AND (e.id = mu.id) AND (e.published_on < ('now'::text)::date))
  GROUP BY e.episode_number, p.id, p.name, e.id, e.published_on;


--
-- Name: ad_spot_airchecks ad_spot_aircheck_ad_spot_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spot_airchecks
    ADD CONSTRAINT ad_spot_aircheck_ad_spot_id_fk FOREIGN KEY (ad_spot_id) REFERENCES public.ad_spots(id) ON DELETE CASCADE;


--
-- Name: ad_spot_comments ad_spot_comment_ad_spot_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spot_comments
    ADD CONSTRAINT ad_spot_comment_ad_spot_id_fk FOREIGN KEY (ad_spot_id) REFERENCES public.ad_spots(id) ON DELETE CASCADE;


--
-- Name: ad_spot_comments ad_spot_comment_poster_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spot_comments
    ADD CONSTRAINT ad_spot_comment_poster_id_fk FOREIGN KEY (poster_id) REFERENCES public.users(id);


--
-- Name: invoices fk_rails_012126620a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT fk_rails_012126620a FOREIGN KEY (ad_agency_id) REFERENCES public.ad_agencies(id);


--
-- Name: hosts_podcasts fk_rails_034cb2b76b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hosts_podcasts
    ADD CONSTRAINT fk_rails_034cb2b76b FOREIGN KEY (host_id) REFERENCES public.hosts(id);


--
-- Name: download_statistics fk_rails_040b87db5e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.download_statistics
    ADD CONSTRAINT fk_rails_040b87db5e FOREIGN KEY (episode_id) REFERENCES public.episodes(id);


--
-- Name: dai_statistics fk_rails_058311ca4d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dai_statistics
    ADD CONSTRAINT fk_rails_058311ca4d FOREIGN KEY (ad_spot_id) REFERENCES public.ad_spots(id);


--
-- Name: advertisers_salespeople fk_rails_0a263cd32c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertisers_salespeople
    ADD CONSTRAINT fk_rails_0a263cd32c FOREIGN KEY (advertiser_id) REFERENCES public.advertisers(id);


--
-- Name: campaigns fk_rails_0bf7dd05c5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT fk_rails_0bf7dd05c5 FOREIGN KEY (held_by_user_id) REFERENCES public.users(id);


--
-- Name: ad_spot_copies fk_rails_0ffccb5b9b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spot_copies
    ADD CONSTRAINT fk_rails_0ffccb5b9b FOREIGN KEY (poster_id) REFERENCES public.users(id);


--
-- Name: comment_read_statuses fk_rails_11fe10b32e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comment_read_statuses
    ADD CONSTRAINT fk_rails_11fe10b32e FOREIGN KEY (ad_spot_id) REFERENCES public.ad_spots(id);


--
-- Name: advertiser_markets fk_rails_157b402b8b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertiser_markets
    ADD CONSTRAINT fk_rails_157b402b8b FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: pending_ad_spots fk_rails_18a8abbd15; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pending_ad_spots
    ADD CONSTRAINT fk_rails_18a8abbd15 FOREIGN KEY (held_advertiser_id) REFERENCES public.advertisers(id);


--
-- Name: ad_agencies fk_rails_18fd8665de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_agencies
    ADD CONSTRAINT fk_rails_18fd8665de FOREIGN KEY (billing_contact_id) REFERENCES public.users(id);


--
-- Name: ad_agency_markets fk_rails_193a4fddf5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_agency_markets
    ADD CONSTRAINT fk_rails_193a4fddf5 FOREIGN KEY (ad_agency_id) REFERENCES public.ad_agencies(id);


--
-- Name: podcasts_users fk_rails_1b4b59322a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.podcasts_users
    ADD CONSTRAINT fk_rails_1b4b59322a FOREIGN KEY (podcast_id) REFERENCES public.podcasts(id);


--
-- Name: insertion_orders fk_rails_1b904ca81b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.insertion_orders
    ADD CONSTRAINT fk_rails_1b904ca81b FOREIGN KEY (campaign_id) REFERENCES public.campaigns(id);


--
-- Name: bulk_ad_copies fk_rails_2db5ab188a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bulk_ad_copies
    ADD CONSTRAINT fk_rails_2db5ab188a FOREIGN KEY (advertiser_id) REFERENCES public.advertisers(id);


--
-- Name: advertisers fk_rails_353d0921e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertisers
    ADD CONSTRAINT fk_rails_353d0921e5 FOREIGN KEY (ad_agency_id) REFERENCES public.ad_agencies(id);


--
-- Name: payment_uploads fk_rails_35f996afad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_uploads
    ADD CONSTRAINT fk_rails_35f996afad FOREIGN KEY (podcast_id) REFERENCES public.podcasts(id);


--
-- Name: prototype_spots fk_rails_3c1033171d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prototype_spots
    ADD CONSTRAINT fk_rails_3c1033171d FOREIGN KEY (prototype_episode_id) REFERENCES public.prototype_episodes(id);


--
-- Name: advertisers fk_rails_3d1817fe30; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertisers
    ADD CONSTRAINT fk_rails_3d1817fe30 FOREIGN KEY (billing_contact_id) REFERENCES public.users(id);


--
-- Name: guests_podcasts fk_rails_3e8e8f646d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guests_podcasts
    ADD CONSTRAINT fk_rails_3e8e8f646d FOREIGN KEY (guest_id) REFERENCES public.guests(id);


--
-- Name: advertisers_salespeople fk_rails_4389f2eae6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertisers_salespeople
    ADD CONSTRAINT fk_rails_4389f2eae6 FOREIGN KEY (salesperson_id) REFERENCES public.users(id);


--
-- Name: comment_read_statuses fk_rails_464ba79788; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comment_read_statuses
    ADD CONSTRAINT fk_rails_464ba79788 FOREIGN KEY (comment_id) REFERENCES public.ad_spot_comments(id);


--
-- Name: insertion_orders fk_rails_478d77e2f1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.insertion_orders
    ADD CONSTRAINT fk_rails_478d77e2f1 FOREIGN KEY (advertiser_id) REFERENCES public.advertisers(id);


--
-- Name: episode_logs fk_rails_486106844d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.episode_logs
    ADD CONSTRAINT fk_rails_486106844d FOREIGN KEY (episode_id) REFERENCES public.episodes(id);


--
-- Name: prototype_episodes fk_rails_51ef3d396e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prototype_episodes
    ADD CONSTRAINT fk_rails_51ef3d396e FOREIGN KEY (podcast_id) REFERENCES public.podcasts(id);


--
-- Name: hosts_podcasts fk_rails_5731d357af; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hosts_podcasts
    ADD CONSTRAINT fk_rails_5731d357af FOREIGN KEY (podcast_id) REFERENCES public.podcasts(id);


--
-- Name: ad_spots fk_rails_5ae1665436; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spots
    ADD CONSTRAINT fk_rails_5ae1665436 FOREIGN KEY (invoice_id) REFERENCES public.invoices(id);


--
-- Name: ad_agency_markets fk_rails_6ab569b646; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_agency_markets
    ADD CONSTRAINT fk_rails_6ab569b646 FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: invites fk_rails_6b4d83f9ec; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invites
    ADD CONSTRAINT fk_rails_6b4d83f9ec FOREIGN KEY (podcast_id) REFERENCES public.podcasts(id);


--
-- Name: campaigns fk_rails_6ba0b7aaf4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT fk_rails_6ba0b7aaf4 FOREIGN KEY (approved_by) REFERENCES public.users(id);


--
-- Name: ad_spots fk_rails_74b1eb8b01; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spots
    ADD CONSTRAINT fk_rails_74b1eb8b01 FOREIGN KEY (payout_id) REFERENCES public.payouts(id);


--
-- Name: advertiser_markets fk_rails_75067e576e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertiser_markets
    ADD CONSTRAINT fk_rails_75067e576e FOREIGN KEY (advertiser_id) REFERENCES public.advertisers(id);


--
-- Name: episodes fk_rails_77002f9ee3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.episodes
    ADD CONSTRAINT fk_rails_77002f9ee3 FOREIGN KEY (podcast_id) REFERENCES public.podcasts(id);


--
-- Name: pending_ad_spots fk_rails_7717ae2d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pending_ad_spots
    ADD CONSTRAINT fk_rails_7717ae2d59 FOREIGN KEY (campaign_id) REFERENCES public.campaigns(id) ON DELETE CASCADE;


--
-- Name: pending_ad_spots fk_rails_7a1ac36717; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pending_ad_spots
    ADD CONSTRAINT fk_rails_7a1ac36717 FOREIGN KEY (ad_spot_id) REFERENCES public.ad_spots(id) ON DELETE CASCADE;


--
-- Name: invoice_transitions fk_rails_7add3f22e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice_transitions
    ADD CONSTRAINT fk_rails_7add3f22e5 FOREIGN KEY (invoice_id) REFERENCES public.invoices(id) ON DELETE CASCADE;


--
-- Name: users fk_rails_835691958d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_835691958d FOREIGN KEY (podcast_network_id) REFERENCES public.podcast_networks(id);


--
-- Name: episodes fk_rails_8419e1f5e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.episodes
    ADD CONSTRAINT fk_rails_8419e1f5e3 FOREIGN KEY (prototype_id) REFERENCES public.prototype_episodes(id);


--
-- Name: invites fk_rails_8802d88872; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invites
    ADD CONSTRAINT fk_rails_8802d88872 FOREIGN KEY (advertiser_id) REFERENCES public.advertisers(id);


--
-- Name: podcasts fk_rails_8be1059606; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.podcasts
    ADD CONSTRAINT fk_rails_8be1059606 FOREIGN KEY (podcast_network_id) REFERENCES public.podcast_networks(id);


--
-- Name: campaigns fk_rails_8cc6b27da2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT fk_rails_8cc6b27da2 FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: ad_spots fk_rails_93e574f2b6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spots
    ADD CONSTRAINT fk_rails_93e574f2b6 FOREIGN KEY (episode_id) REFERENCES public.episodes(id);


--
-- Name: cancelations fk_rails_958f3a4d4f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cancelations
    ADD CONSTRAINT fk_rails_958f3a4d4f FOREIGN KEY (advertiser_id) REFERENCES public.advertisers(id);


--
-- Name: podcasts_users fk_rails_983ae2b90c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.podcasts_users
    ADD CONSTRAINT fk_rails_983ae2b90c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: sample_airchecks fk_rails_986b175635; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sample_airchecks
    ADD CONSTRAINT fk_rails_986b175635 FOREIGN KEY (podcast_id) REFERENCES public.podcasts(id);


--
-- Name: roles_users fk_rails_9dada905f6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles_users
    ADD CONSTRAINT fk_rails_9dada905f6 FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: guests_podcasts fk_rails_a020020d45; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.guests_podcasts
    ADD CONSTRAINT fk_rails_a020020d45 FOREIGN KEY (podcast_id) REFERENCES public.podcasts(id);


--
-- Name: episode_logs fk_rails_a0b2e3278e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.episode_logs
    ADD CONSTRAINT fk_rails_a0b2e3278e FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: campaigns fk_rails_a27ecda997; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT fk_rails_a27ecda997 FOREIGN KEY (advertiser_id) REFERENCES public.advertisers(id);


--
-- Name: comment_read_statuses fk_rails_a873d3e987; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comment_read_statuses
    ADD CONSTRAINT fk_rails_a873d3e987 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: ad_spots fk_rails_be3c65217b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spots
    ADD CONSTRAINT fk_rails_be3c65217b FOREIGN KEY (podcast_id) REFERENCES public.podcasts(id);


--
-- Name: ad_spots fk_rails_c123d1c128; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spots
    ADD CONSTRAINT fk_rails_c123d1c128 FOREIGN KEY (prototype_spot_id) REFERENCES public.prototype_spots(id);


--
-- Name: users fk_rails_cb21e61b7b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_cb21e61b7b FOREIGN KEY (advertiser_id) REFERENCES public.advertisers(id);


--
-- Name: invoices fk_rails_d076606d25; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT fk_rails_d076606d25 FOREIGN KEY (campaign_id) REFERENCES public.campaigns(id);


--
-- Name: survey_questions fk_rails_d144b62fef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.survey_questions
    ADD CONSTRAINT fk_rails_d144b62fef FOREIGN KEY (podcast_id) REFERENCES public.podcasts(id);


--
-- Name: ad_spot_copies fk_rails_d47ac5d611; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spot_copies
    ADD CONSTRAINT fk_rails_d47ac5d611 FOREIGN KEY (ad_spot_id) REFERENCES public.ad_spots(id) ON DELETE CASCADE;


--
-- Name: ad_spots fk_rails_d47f952b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spots
    ADD CONSTRAINT fk_rails_d47f952b11 FOREIGN KEY (insertion_order_id) REFERENCES public.insertion_orders(id);


--
-- Name: survey_answers fk_rails_d5508fe8d0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.survey_answers
    ADD CONSTRAINT fk_rails_d5508fe8d0 FOREIGN KEY (survey_question_id) REFERENCES public.survey_questions(id);


--
-- Name: dai_profiles fk_rails_d9cafa842e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dai_profiles
    ADD CONSTRAINT fk_rails_d9cafa842e FOREIGN KEY (podcast_id) REFERENCES public.podcasts(id);


--
-- Name: roles_users fk_rails_e2a7142459; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles_users
    ADD CONSTRAINT fk_rails_e2a7142459 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: payment_adjustments fk_rails_e953227220; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_adjustments
    ADD CONSTRAINT fk_rails_e953227220 FOREIGN KEY (podcast_id) REFERENCES public.podcasts(id);


--
-- Name: invoices fk_rails_eed57f387a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT fk_rails_eed57f387a FOREIGN KEY (advertiser_id) REFERENCES public.advertisers(id);


--
-- Name: advertiser_reports fk_rails_f204277704; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertiser_reports
    ADD CONSTRAINT fk_rails_f204277704 FOREIGN KEY (advertiser_id) REFERENCES public.advertisers(id);


--
-- Name: ad_spots fk_rails_f26cd913d0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spots
    ADD CONSTRAINT fk_rails_f26cd913d0 FOREIGN KEY (advertiser_id) REFERENCES public.advertisers(id);


--
-- Name: users fk_rails_f62a638031; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_f62a638031 FOREIGN KEY (ad_agency_id) REFERENCES public.ad_agencies(id);


--
-- Name: payouts fk_rails_f7cd6676d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payouts
    ADD CONSTRAINT fk_rails_f7cd6676d6 FOREIGN KEY (podcast_id) REFERENCES public.podcasts(id);


--
-- Name: ad_spots fk_rails_fc2b72511e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ad_spots
    ADD CONSTRAINT fk_rails_fc2b72511e FOREIGN KEY (campaign_id) REFERENCES public.campaigns(id);


--
-- Name: advertisers fk_rails_fdd7f98bc1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.advertisers
    ADD CONSTRAINT fk_rails_fdd7f98bc1 FOREIGN KEY (category_id) REFERENCES public.advertiser_categories(id);


--
-- Name: invoice_transactions fk_rails_ff2105350a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice_transactions
    ADD CONSTRAINT fk_rails_ff2105350a FOREIGN KEY (invoice_id) REFERENCES public.invoices(id) ON DELETE CASCADE;


--
-- Name: invites fk_rails_ff69dbb2ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invites
    ADD CONSTRAINT fk_rails_ff69dbb2ac FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: signatures fk_rails_ff92bb8ee0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.signatures
    ADD CONSTRAINT fk_rails_ff92bb8ee0 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20130220165332');

INSERT INTO schema_migrations (version) VALUES ('20130220165612');

INSERT INTO schema_migrations (version) VALUES ('20130220170325');

INSERT INTO schema_migrations (version) VALUES ('20130220175515');

INSERT INTO schema_migrations (version) VALUES ('20130220180436');

INSERT INTO schema_migrations (version) VALUES ('20130220181429');

INSERT INTO schema_migrations (version) VALUES ('20130220185219');

INSERT INTO schema_migrations (version) VALUES ('20130220185341');

INSERT INTO schema_migrations (version) VALUES ('20130220185637');

INSERT INTO schema_migrations (version) VALUES ('20130220190748');

INSERT INTO schema_migrations (version) VALUES ('20130220191113');

INSERT INTO schema_migrations (version) VALUES ('20130220191627');

INSERT INTO schema_migrations (version) VALUES ('20130220195239');

INSERT INTO schema_migrations (version) VALUES ('20130221042934');

INSERT INTO schema_migrations (version) VALUES ('20130221184340');

INSERT INTO schema_migrations (version) VALUES ('20130222201357');

INSERT INTO schema_migrations (version) VALUES ('20130222205754');

INSERT INTO schema_migrations (version) VALUES ('20130222213600');

INSERT INTO schema_migrations (version) VALUES ('20130223201701');

INSERT INTO schema_migrations (version) VALUES ('20130223201714');

INSERT INTO schema_migrations (version) VALUES ('20130225194135');

INSERT INTO schema_migrations (version) VALUES ('20130225194946');

INSERT INTO schema_migrations (version) VALUES ('20130225195106');

INSERT INTO schema_migrations (version) VALUES ('20130225195339');

INSERT INTO schema_migrations (version) VALUES ('20130225195547');

INSERT INTO schema_migrations (version) VALUES ('20130225201257');

INSERT INTO schema_migrations (version) VALUES ('20130225220218');

INSERT INTO schema_migrations (version) VALUES ('20130225220545');

INSERT INTO schema_migrations (version) VALUES ('20130225221758');

INSERT INTO schema_migrations (version) VALUES ('20130225224651');

INSERT INTO schema_migrations (version) VALUES ('20130225231312');

INSERT INTO schema_migrations (version) VALUES ('20130225231705');

INSERT INTO schema_migrations (version) VALUES ('20130226000310');

INSERT INTO schema_migrations (version) VALUES ('20130226000439');

INSERT INTO schema_migrations (version) VALUES ('20130226204204');

INSERT INTO schema_migrations (version) VALUES ('20130228031013');

INSERT INTO schema_migrations (version) VALUES ('20130228031735');

INSERT INTO schema_migrations (version) VALUES ('20130228041915');

INSERT INTO schema_migrations (version) VALUES ('20130228042348');

INSERT INTO schema_migrations (version) VALUES ('20130301183917');

INSERT INTO schema_migrations (version) VALUES ('20130301184516');

INSERT INTO schema_migrations (version) VALUES ('20130301193916');

INSERT INTO schema_migrations (version) VALUES ('20130303020258');

INSERT INTO schema_migrations (version) VALUES ('20130303020334');

INSERT INTO schema_migrations (version) VALUES ('20130303020902');

INSERT INTO schema_migrations (version) VALUES ('20130306215338');

INSERT INTO schema_migrations (version) VALUES ('20130308205836');

INSERT INTO schema_migrations (version) VALUES ('20130310035135');

INSERT INTO schema_migrations (version) VALUES ('20130311035822');

INSERT INTO schema_migrations (version) VALUES ('20130312201453');

INSERT INTO schema_migrations (version) VALUES ('20130312205143');

INSERT INTO schema_migrations (version) VALUES ('20130313213222');

INSERT INTO schema_migrations (version) VALUES ('20130314022513');

INSERT INTO schema_migrations (version) VALUES ('20130314023238');

INSERT INTO schema_migrations (version) VALUES ('20130314025155');

INSERT INTO schema_migrations (version) VALUES ('20130314214144');

INSERT INTO schema_migrations (version) VALUES ('20130320065230');

INSERT INTO schema_migrations (version) VALUES ('20130320073607');

INSERT INTO schema_migrations (version) VALUES ('20130320073709');

INSERT INTO schema_migrations (version) VALUES ('20130320154050');

INSERT INTO schema_migrations (version) VALUES ('20130320162031');

INSERT INTO schema_migrations (version) VALUES ('20130320200153');

INSERT INTO schema_migrations (version) VALUES ('20130320212153');

INSERT INTO schema_migrations (version) VALUES ('20130321004809');

INSERT INTO schema_migrations (version) VALUES ('20130322023218');

INSERT INTO schema_migrations (version) VALUES ('20130322025636');

INSERT INTO schema_migrations (version) VALUES ('20130325045552');

INSERT INTO schema_migrations (version) VALUES ('20130325210020');

INSERT INTO schema_migrations (version) VALUES ('20130329173219');

INSERT INTO schema_migrations (version) VALUES ('20130330000459');

INSERT INTO schema_migrations (version) VALUES ('20130330160339');

INSERT INTO schema_migrations (version) VALUES ('20130331230404');

INSERT INTO schema_migrations (version) VALUES ('20130331230425');

INSERT INTO schema_migrations (version) VALUES ('20130401033207');

INSERT INTO schema_migrations (version) VALUES ('20130401034104');

INSERT INTO schema_migrations (version) VALUES ('20130403023619');

INSERT INTO schema_migrations (version) VALUES ('20130403032710');

INSERT INTO schema_migrations (version) VALUES ('20130403160802');

INSERT INTO schema_migrations (version) VALUES ('20130403232727');

INSERT INTO schema_migrations (version) VALUES ('20130403233946');

INSERT INTO schema_migrations (version) VALUES ('20130404000633');

INSERT INTO schema_migrations (version) VALUES ('20130404004546');

INSERT INTO schema_migrations (version) VALUES ('20130405003156');

INSERT INTO schema_migrations (version) VALUES ('20130405012018');

INSERT INTO schema_migrations (version) VALUES ('20130405210656');

INSERT INTO schema_migrations (version) VALUES ('20130408032624');

INSERT INTO schema_migrations (version) VALUES ('20130408171919');

INSERT INTO schema_migrations (version) VALUES ('20130408193806');

INSERT INTO schema_migrations (version) VALUES ('20130408200833');

INSERT INTO schema_migrations (version) VALUES ('20130408204313');

INSERT INTO schema_migrations (version) VALUES ('20130408205411');

INSERT INTO schema_migrations (version) VALUES ('20130408222521');

INSERT INTO schema_migrations (version) VALUES ('20130408223923');

INSERT INTO schema_migrations (version) VALUES ('20130408235421');

INSERT INTO schema_migrations (version) VALUES ('20130409012750');

INSERT INTO schema_migrations (version) VALUES ('20130409172937');

INSERT INTO schema_migrations (version) VALUES ('20130410001452');

INSERT INTO schema_migrations (version) VALUES ('20130410002825');

INSERT INTO schema_migrations (version) VALUES ('20130410215050');

INSERT INTO schema_migrations (version) VALUES ('20130410231659');

INSERT INTO schema_migrations (version) VALUES ('20130410233155');

INSERT INTO schema_migrations (version) VALUES ('20130412172916');

INSERT INTO schema_migrations (version) VALUES ('20130412182403');

INSERT INTO schema_migrations (version) VALUES ('20130412185418');

INSERT INTO schema_migrations (version) VALUES ('20130412185916');

INSERT INTO schema_migrations (version) VALUES ('20130412211137');

INSERT INTO schema_migrations (version) VALUES ('20130413011345');

INSERT INTO schema_migrations (version) VALUES ('20130416215426');

INSERT INTO schema_migrations (version) VALUES ('20130417005119');

INSERT INTO schema_migrations (version) VALUES ('20130417012441');

INSERT INTO schema_migrations (version) VALUES ('20130417202005');

INSERT INTO schema_migrations (version) VALUES ('20130417203241');

INSERT INTO schema_migrations (version) VALUES ('20130417224418');

INSERT INTO schema_migrations (version) VALUES ('20130417231216');

INSERT INTO schema_migrations (version) VALUES ('20130417231706');

INSERT INTO schema_migrations (version) VALUES ('20130418012846');

INSERT INTO schema_migrations (version) VALUES ('20130418014429');

INSERT INTO schema_migrations (version) VALUES ('20130418185529');

INSERT INTO schema_migrations (version) VALUES ('20130419213437');

INSERT INTO schema_migrations (version) VALUES ('20130422181204');

INSERT INTO schema_migrations (version) VALUES ('20130422202144');

INSERT INTO schema_migrations (version) VALUES ('20130423184817');

INSERT INTO schema_migrations (version) VALUES ('20130424185615');

INSERT INTO schema_migrations (version) VALUES ('20130424191323');

INSERT INTO schema_migrations (version) VALUES ('20130425010344');

INSERT INTO schema_migrations (version) VALUES ('20130425012626');

INSERT INTO schema_migrations (version) VALUES ('20130426001223');

INSERT INTO schema_migrations (version) VALUES ('20130426191405');

INSERT INTO schema_migrations (version) VALUES ('20130429203635');

INSERT INTO schema_migrations (version) VALUES ('20130429213146');

INSERT INTO schema_migrations (version) VALUES ('20130430003124');

INSERT INTO schema_migrations (version) VALUES ('20130430005039');

INSERT INTO schema_migrations (version) VALUES ('20130501005756');

INSERT INTO schema_migrations (version) VALUES ('20130506170050');

INSERT INTO schema_migrations (version) VALUES ('20130514174427');

INSERT INTO schema_migrations (version) VALUES ('20130515230623');

INSERT INTO schema_migrations (version) VALUES ('20130515230701');

INSERT INTO schema_migrations (version) VALUES ('20130515230927');

INSERT INTO schema_migrations (version) VALUES ('20130515234041');

INSERT INTO schema_migrations (version) VALUES ('20130528175706');

INSERT INTO schema_migrations (version) VALUES ('20130528175840');

INSERT INTO schema_migrations (version) VALUES ('20130528175944');

INSERT INTO schema_migrations (version) VALUES ('20130529162637');

INSERT INTO schema_migrations (version) VALUES ('20130725222727');

INSERT INTO schema_migrations (version) VALUES ('20130727000508');

INSERT INTO schema_migrations (version) VALUES ('20130801235830');

INSERT INTO schema_migrations (version) VALUES ('20130802011805');

INSERT INTO schema_migrations (version) VALUES ('20130807195824');

INSERT INTO schema_migrations (version) VALUES ('20130813005150');

INSERT INTO schema_migrations (version) VALUES ('20130825234503');

INSERT INTO schema_migrations (version) VALUES ('20130826002540');

INSERT INTO schema_migrations (version) VALUES ('20130826002820');

INSERT INTO schema_migrations (version) VALUES ('20130826203911');

INSERT INTO schema_migrations (version) VALUES ('20130829193819');

INSERT INTO schema_migrations (version) VALUES ('20130906195347');

INSERT INTO schema_migrations (version) VALUES ('20130906200656');

INSERT INTO schema_migrations (version) VALUES ('20130909163251');

INSERT INTO schema_migrations (version) VALUES ('20130910231350');

INSERT INTO schema_migrations (version) VALUES ('20130910232014');

INSERT INTO schema_migrations (version) VALUES ('20130927180006');

INSERT INTO schema_migrations (version) VALUES ('20131023140044');

INSERT INTO schema_migrations (version) VALUES ('20131031170305');

INSERT INTO schema_migrations (version) VALUES ('20131113235920');

INSERT INTO schema_migrations (version) VALUES ('20131114142737');

INSERT INTO schema_migrations (version) VALUES ('20131114162705');

INSERT INTO schema_migrations (version) VALUES ('20131114210842');

INSERT INTO schema_migrations (version) VALUES ('20131114223821');

INSERT INTO schema_migrations (version) VALUES ('20131120015626');

INSERT INTO schema_migrations (version) VALUES ('20131120020105');

INSERT INTO schema_migrations (version) VALUES ('20131202191445');

INSERT INTO schema_migrations (version) VALUES ('20131203190030');

INSERT INTO schema_migrations (version) VALUES ('20131204234025');

INSERT INTO schema_migrations (version) VALUES ('20131205225923');

INSERT INTO schema_migrations (version) VALUES ('20131205234841');

INSERT INTO schema_migrations (version) VALUES ('20131206002650');

INSERT INTO schema_migrations (version) VALUES ('20131208070240');

INSERT INTO schema_migrations (version) VALUES ('20131209221709');

INSERT INTO schema_migrations (version) VALUES ('20131210185409');

INSERT INTO schema_migrations (version) VALUES ('20131216181517');

INSERT INTO schema_migrations (version) VALUES ('20131217214144');

INSERT INTO schema_migrations (version) VALUES ('20131217214145');

INSERT INTO schema_migrations (version) VALUES ('20131230183132');

INSERT INTO schema_migrations (version) VALUES ('20140106210417');

INSERT INTO schema_migrations (version) VALUES ('20140107185008');

INSERT INTO schema_migrations (version) VALUES ('20140108182647');

INSERT INTO schema_migrations (version) VALUES ('20140109134920');

INSERT INTO schema_migrations (version) VALUES ('20140109200256');

INSERT INTO schema_migrations (version) VALUES ('20140113220254');

INSERT INTO schema_migrations (version) VALUES ('20140120155046');

INSERT INTO schema_migrations (version) VALUES ('20140120181316');

INSERT INTO schema_migrations (version) VALUES ('20140122214940');

INSERT INTO schema_migrations (version) VALUES ('20140128132428');

INSERT INTO schema_migrations (version) VALUES ('20140128151219');

INSERT INTO schema_migrations (version) VALUES ('20140128163226');

INSERT INTO schema_migrations (version) VALUES ('20140203201157');

INSERT INTO schema_migrations (version) VALUES ('20140210131652');

INSERT INTO schema_migrations (version) VALUES ('20140212224525');

INSERT INTO schema_migrations (version) VALUES ('20140213185129');

INSERT INTO schema_migrations (version) VALUES ('20140214181204');

INSERT INTO schema_migrations (version) VALUES ('20140219155324');

INSERT INTO schema_migrations (version) VALUES ('20140226200625');

INSERT INTO schema_migrations (version) VALUES ('20140228191432');

INSERT INTO schema_migrations (version) VALUES ('20140228194128');

INSERT INTO schema_migrations (version) VALUES ('20140303204434');

INSERT INTO schema_migrations (version) VALUES ('20140306194720');

INSERT INTO schema_migrations (version) VALUES ('20140306202146');

INSERT INTO schema_migrations (version) VALUES ('20140311154001');

INSERT INTO schema_migrations (version) VALUES ('20140311155237');

INSERT INTO schema_migrations (version) VALUES ('20140311180233');

INSERT INTO schema_migrations (version) VALUES ('20140313164020');

INSERT INTO schema_migrations (version) VALUES ('20140313173330');

INSERT INTO schema_migrations (version) VALUES ('20140314142401');

INSERT INTO schema_migrations (version) VALUES ('20140314203033');

INSERT INTO schema_migrations (version) VALUES ('20140317134700');

INSERT INTO schema_migrations (version) VALUES ('20140317141133');

INSERT INTO schema_migrations (version) VALUES ('20140317150607');

INSERT INTO schema_migrations (version) VALUES ('20140318135929');

INSERT INTO schema_migrations (version) VALUES ('20140325234038');

INSERT INTO schema_migrations (version) VALUES ('20140402210531');

INSERT INTO schema_migrations (version) VALUES ('20140404135105');

INSERT INTO schema_migrations (version) VALUES ('20140404140051');

INSERT INTO schema_migrations (version) VALUES ('20140404170220');

INSERT INTO schema_migrations (version) VALUES ('20140404170229');

INSERT INTO schema_migrations (version) VALUES ('20140407171651');

INSERT INTO schema_migrations (version) VALUES ('20140421181729');

INSERT INTO schema_migrations (version) VALUES ('20140505225707');

INSERT INTO schema_migrations (version) VALUES ('20140506141855');

INSERT INTO schema_migrations (version) VALUES ('20140507123019');

INSERT INTO schema_migrations (version) VALUES ('20140515193840');

INSERT INTO schema_migrations (version) VALUES ('20140516132814');

INSERT INTO schema_migrations (version) VALUES ('20140523195817');

INSERT INTO schema_migrations (version) VALUES ('20140527135757');

INSERT INTO schema_migrations (version) VALUES ('20140527142537');

INSERT INTO schema_migrations (version) VALUES ('20140528172325');

INSERT INTO schema_migrations (version) VALUES ('20140603001033');

INSERT INTO schema_migrations (version) VALUES ('20140612131904');

INSERT INTO schema_migrations (version) VALUES ('20140619163749');

INSERT INTO schema_migrations (version) VALUES ('20140620140037');

INSERT INTO schema_migrations (version) VALUES ('20140625135536');

INSERT INTO schema_migrations (version) VALUES ('20140630111322');

INSERT INTO schema_migrations (version) VALUES ('20140630161447');

INSERT INTO schema_migrations (version) VALUES ('20140701123051');

INSERT INTO schema_migrations (version) VALUES ('20140702135516');

INSERT INTO schema_migrations (version) VALUES ('20140711132714');

INSERT INTO schema_migrations (version) VALUES ('20140718183438');

INSERT INTO schema_migrations (version) VALUES ('20140807193206');

INSERT INTO schema_migrations (version) VALUES ('20140819234836');

INSERT INTO schema_migrations (version) VALUES ('20140828175238');

INSERT INTO schema_migrations (version) VALUES ('20140828224821');

INSERT INTO schema_migrations (version) VALUES ('20140829034727');

INSERT INTO schema_migrations (version) VALUES ('20140904223421');

INSERT INTO schema_migrations (version) VALUES ('20140909001727');

INSERT INTO schema_migrations (version) VALUES ('20140925234136');

INSERT INTO schema_migrations (version) VALUES ('20141103085430');

INSERT INTO schema_migrations (version) VALUES ('20141103090356');

INSERT INTO schema_migrations (version) VALUES ('20141214125113');

INSERT INTO schema_migrations (version) VALUES ('20141214144900');

INSERT INTO schema_migrations (version) VALUES ('20150109002125');

INSERT INTO schema_migrations (version) VALUES ('20150318181302');

INSERT INTO schema_migrations (version) VALUES ('20150318181810');

INSERT INTO schema_migrations (version) VALUES ('20150318184159');

INSERT INTO schema_migrations (version) VALUES ('20150318184928');

INSERT INTO schema_migrations (version) VALUES ('20150318190101');

INSERT INTO schema_migrations (version) VALUES ('20150320011754');

INSERT INTO schema_migrations (version) VALUES ('20150408032159');

INSERT INTO schema_migrations (version) VALUES ('20150408033129');

INSERT INTO schema_migrations (version) VALUES ('20150408033130');

INSERT INTO schema_migrations (version) VALUES ('20150414041924');

INSERT INTO schema_migrations (version) VALUES ('20150414201437');

INSERT INTO schema_migrations (version) VALUES ('20150414203146');

INSERT INTO schema_migrations (version) VALUES ('20150415211129');

INSERT INTO schema_migrations (version) VALUES ('20150421165515');

INSERT INTO schema_migrations (version) VALUES ('20150421173351');

INSERT INTO schema_migrations (version) VALUES ('20150424023435');

INSERT INTO schema_migrations (version) VALUES ('20150504180454');

INSERT INTO schema_migrations (version) VALUES ('20150506213035');

INSERT INTO schema_migrations (version) VALUES ('20150511065518');

INSERT INTO schema_migrations (version) VALUES ('20150514190429');

INSERT INTO schema_migrations (version) VALUES ('20150520060155');

INSERT INTO schema_migrations (version) VALUES ('20150520182937');

INSERT INTO schema_migrations (version) VALUES ('20150522034202');

INSERT INTO schema_migrations (version) VALUES ('20150522041535');

INSERT INTO schema_migrations (version) VALUES ('20150522181928');

INSERT INTO schema_migrations (version) VALUES ('20150522193101');

INSERT INTO schema_migrations (version) VALUES ('20150522220000');

INSERT INTO schema_migrations (version) VALUES ('20150526192751');

INSERT INTO schema_migrations (version) VALUES ('20150527184207');

INSERT INTO schema_migrations (version) VALUES ('20150527184500');

INSERT INTO schema_migrations (version) VALUES ('20150528062438');

INSERT INTO schema_migrations (version) VALUES ('20150530000628');

INSERT INTO schema_migrations (version) VALUES ('20150616215955');

INSERT INTO schema_migrations (version) VALUES ('20150622221025');

INSERT INTO schema_migrations (version) VALUES ('20151112151205');

INSERT INTO schema_migrations (version) VALUES ('20151117140700');

INSERT INTO schema_migrations (version) VALUES ('20151130183849');

INSERT INTO schema_migrations (version) VALUES ('20151215153636');

INSERT INTO schema_migrations (version) VALUES ('20160122170910');

INSERT INTO schema_migrations (version) VALUES ('20160525192940');

INSERT INTO schema_migrations (version) VALUES ('20160706140000');

INSERT INTO schema_migrations (version) VALUES ('20160706151752');

INSERT INTO schema_migrations (version) VALUES ('20160706165626');

INSERT INTO schema_migrations (version) VALUES ('20160711183717');

INSERT INTO schema_migrations (version) VALUES ('20160711232415');

INSERT INTO schema_migrations (version) VALUES ('20160713004215');

INSERT INTO schema_migrations (version) VALUES ('20160719000109');

INSERT INTO schema_migrations (version) VALUES ('20160720002921');

INSERT INTO schema_migrations (version) VALUES ('20160720010534');

INSERT INTO schema_migrations (version) VALUES ('20160726214906');

INSERT INTO schema_migrations (version) VALUES ('20160726220324');

INSERT INTO schema_migrations (version) VALUES ('20160726220521');

INSERT INTO schema_migrations (version) VALUES ('20160726220850');

INSERT INTO schema_migrations (version) VALUES ('20160804143329');

INSERT INTO schema_migrations (version) VALUES ('20160804144933');

INSERT INTO schema_migrations (version) VALUES ('20160804145114');

INSERT INTO schema_migrations (version) VALUES ('20160804152011');

INSERT INTO schema_migrations (version) VALUES ('20160808230541');

INSERT INTO schema_migrations (version) VALUES ('20160812144120');

INSERT INTO schema_migrations (version) VALUES ('20160813143317');

INSERT INTO schema_migrations (version) VALUES ('20160813143718');

INSERT INTO schema_migrations (version) VALUES ('20160813144704');

INSERT INTO schema_migrations (version) VALUES ('20160813150546');

INSERT INTO schema_migrations (version) VALUES ('20160813152103');

INSERT INTO schema_migrations (version) VALUES ('20160813152449');

INSERT INTO schema_migrations (version) VALUES ('20160817220229');

INSERT INTO schema_migrations (version) VALUES ('20160818150752');

INSERT INTO schema_migrations (version) VALUES ('20160822172150');

INSERT INTO schema_migrations (version) VALUES ('20160905155852');

INSERT INTO schema_migrations (version) VALUES ('20160906153908');

INSERT INTO schema_migrations (version) VALUES ('20160906205057');

INSERT INTO schema_migrations (version) VALUES ('20160907201927');

INSERT INTO schema_migrations (version) VALUES ('20160907202650');

INSERT INTO schema_migrations (version) VALUES ('20160907203638');

INSERT INTO schema_migrations (version) VALUES ('20160907203952');

INSERT INTO schema_migrations (version) VALUES ('20160907204450');

INSERT INTO schema_migrations (version) VALUES ('20160907205208');

INSERT INTO schema_migrations (version) VALUES ('20160907205656');

INSERT INTO schema_migrations (version) VALUES ('20160907211749');

INSERT INTO schema_migrations (version) VALUES ('20160908175014');

INSERT INTO schema_migrations (version) VALUES ('20160912210149');

INSERT INTO schema_migrations (version) VALUES ('20160913171135');

INSERT INTO schema_migrations (version) VALUES ('20160917212323');

INSERT INTO schema_migrations (version) VALUES ('20160918145959');

INSERT INTO schema_migrations (version) VALUES ('20160920221850');

INSERT INTO schema_migrations (version) VALUES ('20160921222144');

INSERT INTO schema_migrations (version) VALUES ('20160926155322');

INSERT INTO schema_migrations (version) VALUES ('20160926161838');

INSERT INTO schema_migrations (version) VALUES ('20160926175346');

INSERT INTO schema_migrations (version) VALUES ('20160926175737');

INSERT INTO schema_migrations (version) VALUES ('20160926183020');

INSERT INTO schema_migrations (version) VALUES ('20160926223835');

INSERT INTO schema_migrations (version) VALUES ('20160930164121');

INSERT INTO schema_migrations (version) VALUES ('20160930165030');

INSERT INTO schema_migrations (version) VALUES ('20160930171031');

INSERT INTO schema_migrations (version) VALUES ('20160930171604');

INSERT INTO schema_migrations (version) VALUES ('20160930172256');

INSERT INTO schema_migrations (version) VALUES ('20160930195843');

INSERT INTO schema_migrations (version) VALUES ('20160930200252');

INSERT INTO schema_migrations (version) VALUES ('20160930201208');

INSERT INTO schema_migrations (version) VALUES ('20160930201425');

INSERT INTO schema_migrations (version) VALUES ('20160930201653');

INSERT INTO schema_migrations (version) VALUES ('20160930203438');

INSERT INTO schema_migrations (version) VALUES ('20160930203836');

INSERT INTO schema_migrations (version) VALUES ('20160930204926');

INSERT INTO schema_migrations (version) VALUES ('20160930205343');

INSERT INTO schema_migrations (version) VALUES ('20160930211146');

INSERT INTO schema_migrations (version) VALUES ('20160930213204');

INSERT INTO schema_migrations (version) VALUES ('20160930220446');

INSERT INTO schema_migrations (version) VALUES ('20160930223110');

INSERT INTO schema_migrations (version) VALUES ('20161001140843');

INSERT INTO schema_migrations (version) VALUES ('20161001141730');

INSERT INTO schema_migrations (version) VALUES ('20161001151723');

INSERT INTO schema_migrations (version) VALUES ('20161001152831');

INSERT INTO schema_migrations (version) VALUES ('20161001153216');

INSERT INTO schema_migrations (version) VALUES ('20161001153437');

INSERT INTO schema_migrations (version) VALUES ('20161001154350');

INSERT INTO schema_migrations (version) VALUES ('20161001160629');

INSERT INTO schema_migrations (version) VALUES ('20161001163109');

INSERT INTO schema_migrations (version) VALUES ('20161001163940');

INSERT INTO schema_migrations (version) VALUES ('20161001164556');

INSERT INTO schema_migrations (version) VALUES ('20161001170139');

INSERT INTO schema_migrations (version) VALUES ('20161001192246');

INSERT INTO schema_migrations (version) VALUES ('20161002160611');

INSERT INTO schema_migrations (version) VALUES ('20161002161140');

INSERT INTO schema_migrations (version) VALUES ('20161002162705');

INSERT INTO schema_migrations (version) VALUES ('20161002163331');

INSERT INTO schema_migrations (version) VALUES ('20161002164855');

INSERT INTO schema_migrations (version) VALUES ('20161003163842');

INSERT INTO schema_migrations (version) VALUES ('20161003164646');

INSERT INTO schema_migrations (version) VALUES ('20161003222743');

INSERT INTO schema_migrations (version) VALUES ('20161004215343');

INSERT INTO schema_migrations (version) VALUES ('20161005203320');

INSERT INTO schema_migrations (version) VALUES ('20161005203633');

INSERT INTO schema_migrations (version) VALUES ('20161008160919');

INSERT INTO schema_migrations (version) VALUES ('20161008204200');

INSERT INTO schema_migrations (version) VALUES ('20161008215141');

INSERT INTO schema_migrations (version) VALUES ('20161009191502');

INSERT INTO schema_migrations (version) VALUES ('20161009192359');

INSERT INTO schema_migrations (version) VALUES ('20161010171516');

INSERT INTO schema_migrations (version) VALUES ('20161013183056');

INSERT INTO schema_migrations (version) VALUES ('20161013191945');

INSERT INTO schema_migrations (version) VALUES ('20161014153500');

INSERT INTO schema_migrations (version) VALUES ('20161020223643');

INSERT INTO schema_migrations (version) VALUES ('20161021162447');

INSERT INTO schema_migrations (version) VALUES ('20161021210846');

INSERT INTO schema_migrations (version) VALUES ('20161024154921');

INSERT INTO schema_migrations (version) VALUES ('20161026145818');

INSERT INTO schema_migrations (version) VALUES ('20161110222954');

INSERT INTO schema_migrations (version) VALUES ('20161115185756');

INSERT INTO schema_migrations (version) VALUES ('20161118193854');

INSERT INTO schema_migrations (version) VALUES ('20161123002729');

INSERT INTO schema_migrations (version) VALUES ('20161123205157');

INSERT INTO schema_migrations (version) VALUES ('20161206213647');

INSERT INTO schema_migrations (version) VALUES ('20161206214407');

INSERT INTO schema_migrations (version) VALUES ('20161206214839');

INSERT INTO schema_migrations (version) VALUES ('20161206221156');

INSERT INTO schema_migrations (version) VALUES ('20161206221824');

INSERT INTO schema_migrations (version) VALUES ('20161206225110');

INSERT INTO schema_migrations (version) VALUES ('20161213200026');

INSERT INTO schema_migrations (version) VALUES ('20170102191032');

INSERT INTO schema_migrations (version) VALUES ('20170102191635');

INSERT INTO schema_migrations (version) VALUES ('20170102194157');

INSERT INTO schema_migrations (version) VALUES ('20170102195308');

INSERT INTO schema_migrations (version) VALUES ('20170102200021');

INSERT INTO schema_migrations (version) VALUES ('20170104202347');

INSERT INTO schema_migrations (version) VALUES ('20170106225505');

INSERT INTO schema_migrations (version) VALUES ('20170106231404');

INSERT INTO schema_migrations (version) VALUES ('20170106234102');

INSERT INTO schema_migrations (version) VALUES ('20170109222028');

INSERT INTO schema_migrations (version) VALUES ('20170109228240');

INSERT INTO schema_migrations (version) VALUES ('20170112201442');

INSERT INTO schema_migrations (version) VALUES ('20170124215806');

INSERT INTO schema_migrations (version) VALUES ('20170124221537');

INSERT INTO schema_migrations (version) VALUES ('20170127181819');

INSERT INTO schema_migrations (version) VALUES ('20170130235832');

INSERT INTO schema_migrations (version) VALUES ('20170131001941');

INSERT INTO schema_migrations (version) VALUES ('20170131205153');

INSERT INTO schema_migrations (version) VALUES ('20170202190008');

INSERT INTO schema_migrations (version) VALUES ('20170202190629');

INSERT INTO schema_migrations (version) VALUES ('20170202193334');

INSERT INTO schema_migrations (version) VALUES ('20170202193707');

INSERT INTO schema_migrations (version) VALUES ('20170202232746');

INSERT INTO schema_migrations (version) VALUES ('20170203164611');

INSERT INTO schema_migrations (version) VALUES ('20170204000138');

INSERT INTO schema_migrations (version) VALUES ('20170207183109');

INSERT INTO schema_migrations (version) VALUES ('20170209233701');

INSERT INTO schema_migrations (version) VALUES ('20170214175758');

INSERT INTO schema_migrations (version) VALUES ('20170214215414');

INSERT INTO schema_migrations (version) VALUES ('20170214225320');

INSERT INTO schema_migrations (version) VALUES ('20170215235403');

INSERT INTO schema_migrations (version) VALUES ('20170220183518');

INSERT INTO schema_migrations (version) VALUES ('20170220202545');

INSERT INTO schema_migrations (version) VALUES ('20170222232834');

INSERT INTO schema_migrations (version) VALUES ('20170223224947');

INSERT INTO schema_migrations (version) VALUES ('20170228215340');

INSERT INTO schema_migrations (version) VALUES ('20170315231009');

INSERT INTO schema_migrations (version) VALUES ('20170324230121');

INSERT INTO schema_migrations (version) VALUES ('20170324231504');

INSERT INTO schema_migrations (version) VALUES ('20170406155554');

INSERT INTO schema_migrations (version) VALUES ('20170406170735');

INSERT INTO schema_migrations (version) VALUES ('20170407204155');

INSERT INTO schema_migrations (version) VALUES ('20170407210723');

INSERT INTO schema_migrations (version) VALUES ('20170407222121');

INSERT INTO schema_migrations (version) VALUES ('20170408182031');

INSERT INTO schema_migrations (version) VALUES ('20170409202001');

INSERT INTO schema_migrations (version) VALUES ('20170409225811');

INSERT INTO schema_migrations (version) VALUES ('20170412174242');

INSERT INTO schema_migrations (version) VALUES ('20170426204356');

INSERT INTO schema_migrations (version) VALUES ('20170428160347');

INSERT INTO schema_migrations (version) VALUES ('20170503213818');

INSERT INTO schema_migrations (version) VALUES ('20170505171622');

INSERT INTO schema_migrations (version) VALUES ('20170505180154');

INSERT INTO schema_migrations (version) VALUES ('20170505215853');

INSERT INTO schema_migrations (version) VALUES ('20170510155428');

INSERT INTO schema_migrations (version) VALUES ('20170511224144');

INSERT INTO schema_migrations (version) VALUES ('20170511225926');

INSERT INTO schema_migrations (version) VALUES ('20170511232538');

INSERT INTO schema_migrations (version) VALUES ('20170512161647');

INSERT INTO schema_migrations (version) VALUES ('20170512203108');

INSERT INTO schema_migrations (version) VALUES ('20170522152406');

INSERT INTO schema_migrations (version) VALUES ('20170523154214');

INSERT INTO schema_migrations (version) VALUES ('20170622225606');

INSERT INTO schema_migrations (version) VALUES ('20170623154033');

INSERT INTO schema_migrations (version) VALUES ('20170705190709');

INSERT INTO schema_migrations (version) VALUES ('20170808161752');

INSERT INTO schema_migrations (version) VALUES ('20170815172515');

INSERT INTO schema_migrations (version) VALUES ('20170905151201');

INSERT INTO schema_migrations (version) VALUES ('20170908144617');

INSERT INTO schema_migrations (version) VALUES ('20170908175835');

INSERT INTO schema_migrations (version) VALUES ('20170912214022');

INSERT INTO schema_migrations (version) VALUES ('20170912233157');

INSERT INTO schema_migrations (version) VALUES ('20170919235752');

INSERT INTO schema_migrations (version) VALUES ('20170920145618');

INSERT INTO schema_migrations (version) VALUES ('20170921184003');

INSERT INTO schema_migrations (version) VALUES ('20170921213336');

INSERT INTO schema_migrations (version) VALUES ('20170921214713');

INSERT INTO schema_migrations (version) VALUES ('20170921215807');

INSERT INTO schema_migrations (version) VALUES ('20170921221718');

INSERT INTO schema_migrations (version) VALUES ('20170922203649');

INSERT INTO schema_migrations (version) VALUES ('20170927180744');

INSERT INTO schema_migrations (version) VALUES ('20170928204136');

INSERT INTO schema_migrations (version) VALUES ('20170928220012');

INSERT INTO schema_migrations (version) VALUES ('20170928221242');

INSERT INTO schema_migrations (version) VALUES ('20171003191435');

INSERT INTO schema_migrations (version) VALUES ('20171009213310');

INSERT INTO schema_migrations (version) VALUES ('20171010172731');

INSERT INTO schema_migrations (version) VALUES ('20171010174858');

INSERT INTO schema_migrations (version) VALUES ('20171012153646');

INSERT INTO schema_migrations (version) VALUES ('20171012182303');

INSERT INTO schema_migrations (version) VALUES ('20171013172739');

INSERT INTO schema_migrations (version) VALUES ('20171023160240');

INSERT INTO schema_migrations (version) VALUES ('20171023162041');

INSERT INTO schema_migrations (version) VALUES ('20171023163145');

INSERT INTO schema_migrations (version) VALUES ('20171024203747');

INSERT INTO schema_migrations (version) VALUES ('20171030182429');

INSERT INTO schema_migrations (version) VALUES ('20171031191144');

INSERT INTO schema_migrations (version) VALUES ('20171102192859');

INSERT INTO schema_migrations (version) VALUES ('20171102192911');

INSERT INTO schema_migrations (version) VALUES ('20171103000429');

INSERT INTO schema_migrations (version) VALUES ('20171103175615');

INSERT INTO schema_migrations (version) VALUES ('20171110174107');

INSERT INTO schema_migrations (version) VALUES ('20171117194709');

INSERT INTO schema_migrations (version) VALUES ('20171117194710');

INSERT INTO schema_migrations (version) VALUES ('20171117194711');

INSERT INTO schema_migrations (version) VALUES ('20171117194712');

INSERT INTO schema_migrations (version) VALUES ('20171117194713');

INSERT INTO schema_migrations (version) VALUES ('20171117194714');

INSERT INTO schema_migrations (version) VALUES ('20171118233946');

INSERT INTO schema_migrations (version) VALUES ('20171119000926');

INSERT INTO schema_migrations (version) VALUES ('20171120170308');

INSERT INTO schema_migrations (version) VALUES ('20171120171105');

INSERT INTO schema_migrations (version) VALUES ('20171122203408');

INSERT INTO schema_migrations (version) VALUES ('20171129010454');

INSERT INTO schema_migrations (version) VALUES ('20171204161520');

INSERT INTO schema_migrations (version) VALUES ('20171206163050');

INSERT INTO schema_migrations (version) VALUES ('20171206164624');

INSERT INTO schema_migrations (version) VALUES ('20171212184900');

INSERT INTO schema_migrations (version) VALUES ('20171214203240');

INSERT INTO schema_migrations (version) VALUES ('20171215000441');

INSERT INTO schema_migrations (version) VALUES ('20171219205507');

INSERT INTO schema_migrations (version) VALUES ('20171221171323');

INSERT INTO schema_migrations (version) VALUES ('20171221211839');

INSERT INTO schema_migrations (version) VALUES ('20180104214955');

INSERT INTO schema_migrations (version) VALUES ('20180110003112');

INSERT INTO schema_migrations (version) VALUES ('20180110195617');

INSERT INTO schema_migrations (version) VALUES ('20180110201147');

INSERT INTO schema_migrations (version) VALUES ('20180110225012');

INSERT INTO schema_migrations (version) VALUES ('20180111220443');

INSERT INTO schema_migrations (version) VALUES ('20180112012358');

INSERT INTO schema_migrations (version) VALUES ('20180118181813');

INSERT INTO schema_migrations (version) VALUES ('20180122230837');

INSERT INTO schema_migrations (version) VALUES ('20180123171115');

INSERT INTO schema_migrations (version) VALUES ('20180124184920');

INSERT INTO schema_migrations (version) VALUES ('20180124230113');

INSERT INTO schema_migrations (version) VALUES ('20180124233127');

INSERT INTO schema_migrations (version) VALUES ('20180214172819');

INSERT INTO schema_migrations (version) VALUES ('20180214191825');

INSERT INTO schema_migrations (version) VALUES ('20180215173633');

INSERT INTO schema_migrations (version) VALUES ('20180215174504');

INSERT INTO schema_migrations (version) VALUES ('20180215192002');

INSERT INTO schema_migrations (version) VALUES ('20180215195428');

INSERT INTO schema_migrations (version) VALUES ('20180216003621');

INSERT INTO schema_migrations (version) VALUES ('20180216154908');

INSERT INTO schema_migrations (version) VALUES ('20180216200706');

INSERT INTO schema_migrations (version) VALUES ('20180220154859');

INSERT INTO schema_migrations (version) VALUES ('20180221225718');

INSERT INTO schema_migrations (version) VALUES ('20180222001815');

INSERT INTO schema_migrations (version) VALUES ('20180226173451');

INSERT INTO schema_migrations (version) VALUES ('20180302011449');

INSERT INTO schema_migrations (version) VALUES ('20180304004946');

INSERT INTO schema_migrations (version) VALUES ('20180307000808');

INSERT INTO schema_migrations (version) VALUES ('20180312180245');

INSERT INTO schema_migrations (version) VALUES ('20180312184726');

INSERT INTO schema_migrations (version) VALUES ('20180319174109');

INSERT INTO schema_migrations (version) VALUES ('20180319220336');

INSERT INTO schema_migrations (version) VALUES ('20180319222839');

INSERT INTO schema_migrations (version) VALUES ('20180320214641');

INSERT INTO schema_migrations (version) VALUES ('20180320224508');

INSERT INTO schema_migrations (version) VALUES ('20180321232008');

INSERT INTO schema_migrations (version) VALUES ('20180322173854');

INSERT INTO schema_migrations (version) VALUES ('20180323000636');

INSERT INTO schema_migrations (version) VALUES ('20180326194013');

INSERT INTO schema_migrations (version) VALUES ('20180326212252');

INSERT INTO schema_migrations (version) VALUES ('20180327234048');

INSERT INTO schema_migrations (version) VALUES ('20180329201647');

INSERT INTO schema_migrations (version) VALUES ('20180406181903');

INSERT INTO schema_migrations (version) VALUES ('20180406212006');

INSERT INTO schema_migrations (version) VALUES ('20180409151403');

INSERT INTO schema_migrations (version) VALUES ('20180410183411');

INSERT INTO schema_migrations (version) VALUES ('20180418173608');

INSERT INTO schema_migrations (version) VALUES ('20180420225231');

INSERT INTO schema_migrations (version) VALUES ('20180423180525');

INSERT INTO schema_migrations (version) VALUES ('20180423211014');

INSERT INTO schema_migrations (version) VALUES ('20180424155451');

INSERT INTO schema_migrations (version) VALUES ('20180510214521');

INSERT INTO schema_migrations (version) VALUES ('20180511000634');

INSERT INTO schema_migrations (version) VALUES ('20180511213626');

INSERT INTO schema_migrations (version) VALUES ('20180514181406');

INSERT INTO schema_migrations (version) VALUES ('20180514220441');

INSERT INTO schema_migrations (version) VALUES ('20180515155011');

INSERT INTO schema_migrations (version) VALUES ('20180515160648');

INSERT INTO schema_migrations (version) VALUES ('20180524201329');

INSERT INTO schema_migrations (version) VALUES ('20180524204513');

INSERT INTO schema_migrations (version) VALUES ('20180601210155');

INSERT INTO schema_migrations (version) VALUES ('20180608170900');

INSERT INTO schema_migrations (version) VALUES ('20180613173613');

INSERT INTO schema_migrations (version) VALUES ('20180613220904');

INSERT INTO schema_migrations (version) VALUES ('20180614183512');

INSERT INTO schema_migrations (version) VALUES ('20180615215748');

INSERT INTO schema_migrations (version) VALUES ('20180615220913');

INSERT INTO schema_migrations (version) VALUES ('20180619180151');

INSERT INTO schema_migrations (version) VALUES ('20180619202511');

INSERT INTO schema_migrations (version) VALUES ('20180619203541');

INSERT INTO schema_migrations (version) VALUES ('20180625202124');

INSERT INTO schema_migrations (version) VALUES ('20180626162119');

INSERT INTO schema_migrations (version) VALUES ('20180626170043');

INSERT INTO schema_migrations (version) VALUES ('20180626201959');

INSERT INTO schema_migrations (version) VALUES ('20180626213312');

INSERT INTO schema_migrations (version) VALUES ('20180628182120');

INSERT INTO schema_migrations (version) VALUES ('20180703214136');

INSERT INTO schema_migrations (version) VALUES ('20180703222049');

INSERT INTO schema_migrations (version) VALUES ('20180705184252');

INSERT INTO schema_migrations (version) VALUES ('20180706200622');

INSERT INTO schema_migrations (version) VALUES ('20180706201251');

INSERT INTO schema_migrations (version) VALUES ('20180710151835');

INSERT INTO schema_migrations (version) VALUES ('20180712153842');

INSERT INTO schema_migrations (version) VALUES ('20180712175226');

INSERT INTO schema_migrations (version) VALUES ('20180712184011');

INSERT INTO schema_migrations (version) VALUES ('20180716175518');

INSERT INTO schema_migrations (version) VALUES ('20180717184406');

INSERT INTO schema_migrations (version) VALUES ('20180718235127');

INSERT INTO schema_migrations (version) VALUES ('20180724214317');

INSERT INTO schema_migrations (version) VALUES ('20180727153611');

INSERT INTO schema_migrations (version) VALUES ('20180731220301');

INSERT INTO schema_migrations (version) VALUES ('20180803162003');

INSERT INTO schema_migrations (version) VALUES ('20180808162941');

INSERT INTO schema_migrations (version) VALUES ('20180808163314');

INSERT INTO schema_migrations (version) VALUES ('20180808191815');

INSERT INTO schema_migrations (version) VALUES ('20180814195254');

INSERT INTO schema_migrations (version) VALUES ('20180816152437');

INSERT INTO schema_migrations (version) VALUES ('20180820181446');

INSERT INTO schema_migrations (version) VALUES ('20180823154303');

INSERT INTO schema_migrations (version) VALUES ('20180823162904');

INSERT INTO schema_migrations (version) VALUES ('20180824161707');

INSERT INTO schema_migrations (version) VALUES ('20180824230826');

INSERT INTO schema_migrations (version) VALUES ('20180827155924');

INSERT INTO schema_migrations (version) VALUES ('20180827190155');

INSERT INTO schema_migrations (version) VALUES ('20180828195834');

INSERT INTO schema_migrations (version) VALUES ('20180830221637');

INSERT INTO schema_migrations (version) VALUES ('20180904233749');

INSERT INTO schema_migrations (version) VALUES ('20180905150343');

INSERT INTO schema_migrations (version) VALUES ('20180906174329');

INSERT INTO schema_migrations (version) VALUES ('20180906195703');

INSERT INTO schema_migrations (version) VALUES ('20180920223103');

INSERT INTO schema_migrations (version) VALUES ('20180926144447');

INSERT INTO schema_migrations (version) VALUES ('20180928201154');

INSERT INTO schema_migrations (version) VALUES ('20181002200433');

INSERT INTO schema_migrations (version) VALUES ('20181003153406');

INSERT INTO schema_migrations (version) VALUES ('20181005172858');

INSERT INTO schema_migrations (version) VALUES ('20181009224622');

INSERT INTO schema_migrations (version) VALUES ('20181010163402');

INSERT INTO schema_migrations (version) VALUES ('20181016203300');

INSERT INTO schema_migrations (version) VALUES ('20181017143517');

INSERT INTO schema_migrations (version) VALUES ('20181017175700');

INSERT INTO schema_migrations (version) VALUES ('20181019200431');

INSERT INTO schema_migrations (version) VALUES ('20181029220855');

INSERT INTO schema_migrations (version) VALUES ('20181029231024');

INSERT INTO schema_migrations (version) VALUES ('20181029234848');

INSERT INTO schema_migrations (version) VALUES ('20181029235312');

INSERT INTO schema_migrations (version) VALUES ('20181029235455');

INSERT INTO schema_migrations (version) VALUES ('20181029235627');

INSERT INTO schema_migrations (version) VALUES ('20181029235757');

INSERT INTO schema_migrations (version) VALUES ('20181029235926');

INSERT INTO schema_migrations (version) VALUES ('20181030145803');

INSERT INTO schema_migrations (version) VALUES ('20181030150207');

INSERT INTO schema_migrations (version) VALUES ('20181030150344');

INSERT INTO schema_migrations (version) VALUES ('20181030150458');

INSERT INTO schema_migrations (version) VALUES ('20181030151117');

INSERT INTO schema_migrations (version) VALUES ('20181030151220');

INSERT INTO schema_migrations (version) VALUES ('20181030151331');

INSERT INTO schema_migrations (version) VALUES ('20181030151438');

INSERT INTO schema_migrations (version) VALUES ('20181030154626');

INSERT INTO schema_migrations (version) VALUES ('20181030154823');

INSERT INTO schema_migrations (version) VALUES ('20181030155017');

INSERT INTO schema_migrations (version) VALUES ('20181030155236');

INSERT INTO schema_migrations (version) VALUES ('20181030162525');

INSERT INTO schema_migrations (version) VALUES ('20181030195919');

INSERT INTO schema_migrations (version) VALUES ('20181109210114');

INSERT INTO schema_migrations (version) VALUES ('20181109215835');

INSERT INTO schema_migrations (version) VALUES ('20181114220604');

INSERT INTO schema_migrations (version) VALUES ('20181114222322');

INSERT INTO schema_migrations (version) VALUES ('20181128170742');

INSERT INTO schema_migrations (version) VALUES ('20181128192256');

INSERT INTO schema_migrations (version) VALUES ('20181203225422');

INSERT INTO schema_migrations (version) VALUES ('20181207161333');

INSERT INTO schema_migrations (version) VALUES ('20181207165616');

INSERT INTO schema_migrations (version) VALUES ('20181211184124');

INSERT INTO schema_migrations (version) VALUES ('20181214231839');

INSERT INTO schema_migrations (version) VALUES ('20181217205229');

INSERT INTO schema_migrations (version) VALUES ('20181219223906');

INSERT INTO schema_migrations (version) VALUES ('20181219224229');

INSERT INTO schema_migrations (version) VALUES ('20190104204830');

INSERT INTO schema_migrations (version) VALUES ('20190108203243');

INSERT INTO schema_migrations (version) VALUES ('20190109164351');

INSERT INTO schema_migrations (version) VALUES ('20190109203047');

INSERT INTO schema_migrations (version) VALUES ('20190109233840');

INSERT INTO schema_migrations (version) VALUES ('20190116172337');

INSERT INTO schema_migrations (version) VALUES ('20190116183943');

INSERT INTO schema_migrations (version) VALUES ('20190116232030');

INSERT INTO schema_migrations (version) VALUES ('20190122174506');

INSERT INTO schema_migrations (version) VALUES ('20190128223910');

INSERT INTO schema_migrations (version) VALUES ('20190129205412');

INSERT INTO schema_migrations (version) VALUES ('20190201230626');

INSERT INTO schema_migrations (version) VALUES ('20190201230759');

INSERT INTO schema_migrations (version) VALUES ('20190201230935');

INSERT INTO schema_migrations (version) VALUES ('20190204185031');

INSERT INTO schema_migrations (version) VALUES ('20190204211825');

INSERT INTO schema_migrations (version) VALUES ('20190206234459');

INSERT INTO schema_migrations (version) VALUES ('20190207174554');

INSERT INTO schema_migrations (version) VALUES ('20190208221216');

INSERT INTO schema_migrations (version) VALUES ('20190211210659');

INSERT INTO schema_migrations (version) VALUES ('20190212201419');

INSERT INTO schema_migrations (version) VALUES ('20190212234452');

INSERT INTO schema_migrations (version) VALUES ('20190218165153');

INSERT INTO schema_migrations (version) VALUES ('20190220225636');

INSERT INTO schema_migrations (version) VALUES ('20190221222811');

INSERT INTO schema_migrations (version) VALUES ('20190228214514');

INSERT INTO schema_migrations (version) VALUES ('20190305192629');

INSERT INTO schema_migrations (version) VALUES ('20190306004138');

INSERT INTO schema_migrations (version) VALUES ('20190308185459');

INSERT INTO schema_migrations (version) VALUES ('20190313152315');

INSERT INTO schema_migrations (version) VALUES ('20190314211618');

INSERT INTO schema_migrations (version) VALUES ('20190318182715');

INSERT INTO schema_migrations (version) VALUES ('20190320185349');

INSERT INTO schema_migrations (version) VALUES ('20190320192944');

INSERT INTO schema_migrations (version) VALUES ('20190321173106');

INSERT INTO schema_migrations (version) VALUES ('20190325170658');

INSERT INTO schema_migrations (version) VALUES ('20190326155839');

INSERT INTO schema_migrations (version) VALUES ('20190411194251');

INSERT INTO schema_migrations (version) VALUES ('20190415184006');

INSERT INTO schema_migrations (version) VALUES ('20190415223022');

INSERT INTO schema_migrations (version) VALUES ('20190417003046');

INSERT INTO schema_migrations (version) VALUES ('20190417191151');

INSERT INTO schema_migrations (version) VALUES ('20190502151536');

INSERT INTO schema_migrations (version) VALUES ('20190502173509');

INSERT INTO schema_migrations (version) VALUES ('20190510175604');

INSERT INTO schema_migrations (version) VALUES ('20190515184653');

INSERT INTO schema_migrations (version) VALUES ('20190515190150');
