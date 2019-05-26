# Domain Objects

## Ad API `ads.stitcherx.com`

- AdCampaign
  - ?

- AdSpot
  - advertiser_id integer,
  - episode_id integer,
  - start_on date NOT NULL,
  - end_on date,
  - forecasted_downloads integer NOT NULL,
  - cost money,
  - created_at timestamp without time zone NOT NULL,
  - updated_at timestamp without time zone NOT NULL,
  - actual_downloads integer,
  - ad_unit_id integer,
  - cpm money NOT NULL,
  - ad_type_cd integer NOT NULL,
  - unit_number integer NOT NULL,
  - campaign_id integer,
  - invoice_id integer,
  - payout_id integer,
  - discount_percent numeric(2,2) DEFAULT 0 NOT NULL,
  - blocked boolean DEFAULT false NOT NULL,
  - service_fee double precision,
  - sold_at timestamp without time zone,
  - insertion_order_id integer,
  - podcast_id integer NOT NULL,
  - store public.hstore DEFAULT ''::public.hstore NOT NULL,
  - active boolean DEFAULT true NOT NULL,
  - prototype_spot_id integer,
  - end_delivery_date date,
  - fallback_forecasted_downloads integer,
  - fallback_cpm numeric(8,2)

- AdAgencies [account type]
  - Advertiser_id

- Advertiser

- Campaign
  
## Events API `events.stitcherx.com`

- Alert

- Activities
  - Trackable_id
  - Trackable_type
  - Owner_id
  - Owner_type
  - Recepeint_id
  - Recepient_type
  - Recepients

## User API `user.stitcherx.com`

- PlayState
  - Episode_id
  - User_id
  - Offset

- List

- SearchEntry
  - Search text
  - User_id

- Group (of users)

- Subscription
  - User_id
  - Receipt
  - SubscriptionType_id

- SubscriptionType
  - Product_id
  - Platform
  - Autorenewing
  - Tier
  - Duration? 

- UseCount
  - User_id
  - Show_id
  - Episode_id
  - Mode?
  - Action_count

- User
  - Email
  - Password
  - Name
  - Admin?
  - Podcast_id (if so, host)
  - Global_Notifications?
  - Active?

- Invites (k factor from the start)
  - Email
  - Code
  - User_id (who invited)
  - Emailed_at (invite sent at)

## Content API `content.stitcher.com`

- Assets (photos)

- Category
  - Title
  - Description
  - Status
  - has_many :shows

- Comment
  
- Category

- Show (do we want to call this `podcast`)
  - Feed_id
  - Category_id
  - Asset_id
  - Url
  - Twitter_url
  - Slug
  - Twitter_followers
  - Attributes from midroll app below
    ```
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
    ```

- Episode
  - Title
  - Podcast_id
  - Description
  - Episode number
  - Duration
  - Published_at
  - Guid
  - Category_id
  - Asset_id
  - Slug
  - Earwolf_id
  - Stitcher_id
  - Stagebloc_id
  - Wolfpub_id
  - Youtube_url
  - Art19_url
  - Soundcloud_url
  - Streaming_url
  - Download_url

- Season?
  - Show_id
  - Season_number
  - Title
  - Description
  - Release_date

- Job

- NamedEntity (entity from transcriptions, etc)

- Guests
  - Episode_id
  - Name
  - Bio
  - Asset_id

- Hosts
  - Podcast_id
  - Name
  - Bio
  - Asset_id

- People?

- Seasons

- TopShowsByGenre
  - Genre_id
  - Shows_array

- Taggings
  - Tag_id
  - Taggable_id
  - Tagger_id
  - Tagger_type
  - Context

- Tags
  - Name
  - Taggings_count

