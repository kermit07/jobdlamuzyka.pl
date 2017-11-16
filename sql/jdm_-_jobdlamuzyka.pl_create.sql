-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-11-16 12:26:13.121

-- tables
-- Table: jdm_achievement
CREATE TABLE jdm_achievement (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    achievement_group_id int NOT NULL,
    CONSTRAINT jdm_achievement_pk PRIMARY KEY (id)
);

-- Table: jdm_achievement_group
CREATE TABLE jdm_achievement_group (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    CONSTRAINT jdm_achievement_group_pk PRIMARY KEY (id)
);

-- Table: jdm_address
CREATE TABLE jdm_address (
    id int NOT NULL AUTO_INCREMENT,
    country_id int NULL,
    region_id int NULL,
    city varchar(30) NOT NULL,
    postal_code varchar(10) NOT NULL,
    street varchar(50) NOT NULL,
    CONSTRAINT jdm_address_pk PRIMARY KEY (id)
);

-- Table: jdm_artist
CREATE TABLE jdm_artist (
    id int NOT NULL,
    name varchar(30) NOT NULL,
    surname varchar(30) NOT NULL,
    phone varchar(30) NOT NULL,
    date_of_birth date NOT NULL,
    photo blob NULL,
    views int NOT NULL,
    address_id int NULL,
    CONSTRAINT jdm_artist_pk PRIMARY KEY (id)
);

-- Table: jdm_artist_achievement
CREATE TABLE jdm_artist_achievement (
    artist_id int NOT NULL,
    achievement_id int NOT NULL,
    CONSTRAINT jdm_artist_achievement_pk PRIMARY KEY (artist_id,achievement_id)
);

-- Table: jdm_artist_band
CREATE TABLE jdm_artist_band (
    artist_id int NOT NULL,
    band_id int NOT NULL,
    CONSTRAINT jdm_artist_band_pk PRIMARY KEY (artist_id,band_id)
);

-- Table: jdm_artist_photo
CREATE TABLE jdm_artist_photo (
    artist_id int NOT NULL,
    photo_id int NOT NULL,
    CONSTRAINT jdm_artist_photo_pk PRIMARY KEY (artist_id,photo_id)
);

-- Table: jdm_artist_tag
CREATE TABLE jdm_artist_tag (
    artist_id int NOT NULL,
    tag_id int NOT NULL,
    CONSTRAINT jdm_artist_tag_pk PRIMARY KEY (artist_id,tag_id)
);

-- Table: jdm_band
CREATE TABLE jdm_band (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    phone varchar(30) NOT NULL,
    logo blob NULL,
    address_id int NULL,
    CONSTRAINT jdm_band_pk PRIMARY KEY (id)
);

-- Table: jdm_band_achievement
CREATE TABLE jdm_band_achievement (
    band_id int NOT NULL,
    achievement_id int NOT NULL,
    CONSTRAINT jdm_band_achievement_pk PRIMARY KEY (band_id,achievement_id)
);

-- Table: jdm_band_invitation
CREATE TABLE jdm_band_invitation (
    id int NOT NULL AUTO_INCREMENT,
    email varchar(30) NOT NULL,
    band_id int NOT NULL,
    inviting_artist_id int NOT NULL,
    CONSTRAINT jdm_band_invitation_pk PRIMARY KEY (id)
);

-- Table: jdm_band_photo
CREATE TABLE jdm_band_photo (
    band_id int NOT NULL,
    photo_id int NOT NULL,
    CONSTRAINT jdm_band_photo_pk PRIMARY KEY (band_id,photo_id)
);

-- Table: jdm_band_tag
CREATE TABLE jdm_band_tag (
    tag_id int NOT NULL,
    band_id int NOT NULL,
    CONSTRAINT jdm_band_tag_pk PRIMARY KEY (tag_id,band_id)
);

-- Table: jdm_client
CREATE TABLE jdm_client (
    id int NOT NULL,
    name varchar(30) NOT NULL,
    phone varchar(30) NOT NULL,
    photo blob NULL,
    views int NOT NULL,
    address_id int NULL,
    CONSTRAINT jdm_client_pk PRIMARY KEY (id)
);

-- Table: jdm_client_photo
CREATE TABLE jdm_client_photo (
    client_id int NOT NULL,
    photo_id int NOT NULL,
    CONSTRAINT jdm_client_photo_pk PRIMARY KEY (client_id,photo_id)
);

-- Table: jdm_follow_artist
CREATE TABLE jdm_follow_artist (
    client_id int NOT NULL,
    artist_id int NOT NULL,
    CONSTRAINT jdm_follow_artist_pk PRIMARY KEY (client_id,artist_id)
);

-- Table: jdm_follow_client
CREATE TABLE jdm_follow_client (
    artist_id int NOT NULL,
    client_id int NOT NULL,
    CONSTRAINT jdm_follow_client_pk PRIMARY KEY (artist_id,client_id)
);

-- Table: jdm_follow_offer
CREATE TABLE jdm_follow_offer (
    artist_id int NOT NULL,
    offer_id int NOT NULL,
    CONSTRAINT jdm_follow_offer_pk PRIMARY KEY (artist_id,offer_id)
);

-- Table: jdm_offer
CREATE TABLE jdm_offer (
    id int NOT NULL AUTO_INCREMENT,
    position_name varchar(40) NOT NULL,
    note text NOT NULL,
    views int NOT NULL,
    created_time timestamp NOT NULL,
    publicated_time timestamp NOT NULL,
    event_date date NOT NULL,
    address_id int NULL,
    offer_state_id int NOT NULL,
    client_id int NOT NULL,
    CONSTRAINT jdm_offer_pk PRIMARY KEY (id)
);

-- Table: jdm_offer_photo
CREATE TABLE jdm_offer_photo (
    offer_id int NOT NULL,
    photo_id int NOT NULL,
    CONSTRAINT jdm_offer_photo_pk PRIMARY KEY (offer_id,photo_id)
);

-- Table: jdm_offer_state
CREATE TABLE jdm_offer_state (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    CONSTRAINT jdm_offer_state_pk PRIMARY KEY (id)
);

-- Table: jdm_offer_tag
CREATE TABLE jdm_offer_tag (
    offer_id int NOT NULL,
    tag_id int NOT NULL,
    CONSTRAINT jdm_offer_tag_pk PRIMARY KEY (offer_id,tag_id)
);

-- Table: jdm_photo
CREATE TABLE jdm_photo (
    id int NOT NULL AUTO_INCREMENT,
    path varchar(30) NOT NULL,
    photo_state_id int NOT NULL,
    CONSTRAINT jdm_photo_pk PRIMARY KEY (id)
);

-- Table: jdm_photo_state
CREATE TABLE jdm_photo_state (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    CONSTRAINT jdm_photo_state_pk PRIMARY KEY (id)
);

-- Table: jdm_tag
CREATE TABLE jdm_tag (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    tag_group_id int NOT NULL,
    CONSTRAINT jdm_tag_pk PRIMARY KEY (id)
);

-- Table: jdm_tag_group
CREATE TABLE jdm_tag_group (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    CONSTRAINT jdm_tag_group_pk PRIMARY KEY (id)
);

-- Table: jdm_user
CREATE TABLE jdm_user (
    id int NOT NULL AUTO_INCREMENT,
    email varchar(30) NOT NULL,
    password varchar(30) NOT NULL,
    type_id int NOT NULL,
    state_id int NOT NULL,
    CONSTRAINT jdm_user_pk PRIMARY KEY (id)
);

-- Table: jdm_user_state
CREATE TABLE jdm_user_state (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    CONSTRAINT jdm_user_state_pk PRIMARY KEY (id)
);

-- Table: jdm_user_type
CREATE TABLE jdm_user_type (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    CONSTRAINT jdm_user_type_pk PRIMARY KEY (id)
);

-- Table: jdm_world_country
CREATE TABLE jdm_world_country (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    CONSTRAINT jdm_world_country_pk PRIMARY KEY (id)
);

-- Table: jdm_world_region
CREATE TABLE jdm_world_region (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    country_id int NOT NULL,
    CONSTRAINT jdm_world_region_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: jdm_achievement_jdm_achievement_group (table: jdm_achievement)
ALTER TABLE jdm_achievement ADD CONSTRAINT jdm_achievement_jdm_achievement_group FOREIGN KEY jdm_achievement_jdm_achievement_group (achievement_group_id)
    REFERENCES jdm_achievement_group (id);

-- Reference: jdm_address_jdm_world_country (table: jdm_address)
ALTER TABLE jdm_address ADD CONSTRAINT jdm_address_jdm_world_country FOREIGN KEY jdm_address_jdm_world_country (country_id)
    REFERENCES jdm_world_country (id);

-- Reference: jdm_address_jdm_world_region (table: jdm_address)
ALTER TABLE jdm_address ADD CONSTRAINT jdm_address_jdm_world_region FOREIGN KEY jdm_address_jdm_world_region (region_id)
    REFERENCES jdm_world_region (id);

-- Reference: jdm_artist_achievement_jdm_achievement (table: jdm_artist_achievement)
ALTER TABLE jdm_artist_achievement ADD CONSTRAINT jdm_artist_achievement_jdm_achievement FOREIGN KEY jdm_artist_achievement_jdm_achievement (achievement_id)
    REFERENCES jdm_achievement (id);

-- Reference: jdm_artist_achievement_jdm_musician (table: jdm_artist_achievement)
ALTER TABLE jdm_artist_achievement ADD CONSTRAINT jdm_artist_achievement_jdm_musician FOREIGN KEY jdm_artist_achievement_jdm_musician (artist_id)
    REFERENCES jdm_artist (id);

-- Reference: jdm_artist_band_jdm_artist (table: jdm_artist_band)
ALTER TABLE jdm_artist_band ADD CONSTRAINT jdm_artist_band_jdm_artist FOREIGN KEY jdm_artist_band_jdm_artist (artist_id)
    REFERENCES jdm_artist (id);

-- Reference: jdm_artist_band_jdm_band (table: jdm_artist_band)
ALTER TABLE jdm_artist_band ADD CONSTRAINT jdm_artist_band_jdm_band FOREIGN KEY jdm_artist_band_jdm_band (band_id)
    REFERENCES jdm_band (id);

-- Reference: jdm_artist_jdm_address (table: jdm_artist)
ALTER TABLE jdm_artist ADD CONSTRAINT jdm_artist_jdm_address FOREIGN KEY jdm_artist_jdm_address (address_id)
    REFERENCES jdm_address (id);

-- Reference: jdm_artist_photo_jdm_artist (table: jdm_artist_photo)
ALTER TABLE jdm_artist_photo ADD CONSTRAINT jdm_artist_photo_jdm_artist FOREIGN KEY jdm_artist_photo_jdm_artist (artist_id)
    REFERENCES jdm_artist (id);

-- Reference: jdm_artist_photo_jdm_photo (table: jdm_artist_photo)
ALTER TABLE jdm_artist_photo ADD CONSTRAINT jdm_artist_photo_jdm_photo FOREIGN KEY jdm_artist_photo_jdm_photo (photo_id)
    REFERENCES jdm_photo (id);

-- Reference: jdm_artist_tag_jdm_artist (table: jdm_artist_tag)
ALTER TABLE jdm_artist_tag ADD CONSTRAINT jdm_artist_tag_jdm_artist FOREIGN KEY jdm_artist_tag_jdm_artist (artist_id)
    REFERENCES jdm_artist (id);

-- Reference: jdm_artist_tag_jdm_tag (table: jdm_artist_tag)
ALTER TABLE jdm_artist_tag ADD CONSTRAINT jdm_artist_tag_jdm_tag FOREIGN KEY jdm_artist_tag_jdm_tag (tag_id)
    REFERENCES jdm_tag (id);

-- Reference: jdm_band_achievement_jdm_achievement (table: jdm_band_achievement)
ALTER TABLE jdm_band_achievement ADD CONSTRAINT jdm_band_achievement_jdm_achievement FOREIGN KEY jdm_band_achievement_jdm_achievement (achievement_id)
    REFERENCES jdm_achievement (id);

-- Reference: jdm_band_achievement_jdm_band (table: jdm_band_achievement)
ALTER TABLE jdm_band_achievement ADD CONSTRAINT jdm_band_achievement_jdm_band FOREIGN KEY jdm_band_achievement_jdm_band (band_id)
    REFERENCES jdm_band (id);

-- Reference: jdm_band_invitation_jdm_artist (table: jdm_band_invitation)
ALTER TABLE jdm_band_invitation ADD CONSTRAINT jdm_band_invitation_jdm_artist FOREIGN KEY jdm_band_invitation_jdm_artist (inviting_artist_id)
    REFERENCES jdm_artist (id);

-- Reference: jdm_band_invitation_jdm_band (table: jdm_band_invitation)
ALTER TABLE jdm_band_invitation ADD CONSTRAINT jdm_band_invitation_jdm_band FOREIGN KEY jdm_band_invitation_jdm_band (band_id)
    REFERENCES jdm_band (id);

-- Reference: jdm_band_jdm_address (table: jdm_band)
ALTER TABLE jdm_band ADD CONSTRAINT jdm_band_jdm_address FOREIGN KEY jdm_band_jdm_address (address_id)
    REFERENCES jdm_address (id);

-- Reference: jdm_band_photo_jdm_band (table: jdm_band_photo)
ALTER TABLE jdm_band_photo ADD CONSTRAINT jdm_band_photo_jdm_band FOREIGN KEY jdm_band_photo_jdm_band (band_id)
    REFERENCES jdm_band (id);

-- Reference: jdm_band_photo_jdm_photo (table: jdm_band_photo)
ALTER TABLE jdm_band_photo ADD CONSTRAINT jdm_band_photo_jdm_photo FOREIGN KEY jdm_band_photo_jdm_photo (photo_id)
    REFERENCES jdm_photo (id);

-- Reference: jdm_band_tag_jdm_band (table: jdm_band_tag)
ALTER TABLE jdm_band_tag ADD CONSTRAINT jdm_band_tag_jdm_band FOREIGN KEY jdm_band_tag_jdm_band (band_id)
    REFERENCES jdm_band (id);

-- Reference: jdm_band_tag_jdm_tag (table: jdm_band_tag)
ALTER TABLE jdm_band_tag ADD CONSTRAINT jdm_band_tag_jdm_tag FOREIGN KEY jdm_band_tag_jdm_tag (tag_id)
    REFERENCES jdm_tag (id);

-- Reference: jdm_client_jdm_address (table: jdm_client)
ALTER TABLE jdm_client ADD CONSTRAINT jdm_client_jdm_address FOREIGN KEY jdm_client_jdm_address (address_id)
    REFERENCES jdm_address (id);

-- Reference: jdm_client_jdm_user (table: jdm_client)
ALTER TABLE jdm_client ADD CONSTRAINT jdm_client_jdm_user FOREIGN KEY jdm_client_jdm_user (id)
    REFERENCES jdm_user (id);

-- Reference: jdm_client_photo_jdm_client (table: jdm_client_photo)
ALTER TABLE jdm_client_photo ADD CONSTRAINT jdm_client_photo_jdm_client FOREIGN KEY jdm_client_photo_jdm_client (client_id)
    REFERENCES jdm_client (id);

-- Reference: jdm_client_photo_jdm_photo (table: jdm_client_photo)
ALTER TABLE jdm_client_photo ADD CONSTRAINT jdm_client_photo_jdm_photo FOREIGN KEY jdm_client_photo_jdm_photo (photo_id)
    REFERENCES jdm_photo (id);

-- Reference: jdm_follow_artist_jdm_artist (table: jdm_follow_artist)
ALTER TABLE jdm_follow_artist ADD CONSTRAINT jdm_follow_artist_jdm_artist FOREIGN KEY jdm_follow_artist_jdm_artist (artist_id)
    REFERENCES jdm_artist (id);

-- Reference: jdm_follow_artist_jdm_client (table: jdm_follow_artist)
ALTER TABLE jdm_follow_artist ADD CONSTRAINT jdm_follow_artist_jdm_client FOREIGN KEY jdm_follow_artist_jdm_client (client_id)
    REFERENCES jdm_client (id);

-- Reference: jdm_follow_client_jdm_artist (table: jdm_follow_client)
ALTER TABLE jdm_follow_client ADD CONSTRAINT jdm_follow_client_jdm_artist FOREIGN KEY jdm_follow_client_jdm_artist (artist_id)
    REFERENCES jdm_artist (id);

-- Reference: jdm_follow_client_jdm_client (table: jdm_follow_client)
ALTER TABLE jdm_follow_client ADD CONSTRAINT jdm_follow_client_jdm_client FOREIGN KEY jdm_follow_client_jdm_client (client_id)
    REFERENCES jdm_client (id);

-- Reference: jdm_follow_offer_jdm_artist (table: jdm_follow_offer)
ALTER TABLE jdm_follow_offer ADD CONSTRAINT jdm_follow_offer_jdm_artist FOREIGN KEY jdm_follow_offer_jdm_artist (artist_id)
    REFERENCES jdm_artist (id);

-- Reference: jdm_follow_offer_jdm_offer (table: jdm_follow_offer)
ALTER TABLE jdm_follow_offer ADD CONSTRAINT jdm_follow_offer_jdm_offer FOREIGN KEY jdm_follow_offer_jdm_offer (offer_id)
    REFERENCES jdm_offer (id);

-- Reference: jdm_musician_jdm_user (table: jdm_artist)
ALTER TABLE jdm_artist ADD CONSTRAINT jdm_musician_jdm_user FOREIGN KEY jdm_musician_jdm_user (id)
    REFERENCES jdm_user (id);

-- Reference: jdm_offer_jdm_address (table: jdm_offer)
ALTER TABLE jdm_offer ADD CONSTRAINT jdm_offer_jdm_address FOREIGN KEY jdm_offer_jdm_address (address_id)
    REFERENCES jdm_address (id);

-- Reference: jdm_offer_jdm_client (table: jdm_offer)
ALTER TABLE jdm_offer ADD CONSTRAINT jdm_offer_jdm_client FOREIGN KEY jdm_offer_jdm_client (client_id)
    REFERENCES jdm_client (id);

-- Reference: jdm_offer_jdm_offer_state (table: jdm_offer)
ALTER TABLE jdm_offer ADD CONSTRAINT jdm_offer_jdm_offer_state FOREIGN KEY jdm_offer_jdm_offer_state (offer_state_id)
    REFERENCES jdm_offer_state (id);

-- Reference: jdm_offer_photo_jdm_offer (table: jdm_offer_photo)
ALTER TABLE jdm_offer_photo ADD CONSTRAINT jdm_offer_photo_jdm_offer FOREIGN KEY jdm_offer_photo_jdm_offer (offer_id)
    REFERENCES jdm_offer (id);

-- Reference: jdm_offer_photo_jdm_photo (table: jdm_offer_photo)
ALTER TABLE jdm_offer_photo ADD CONSTRAINT jdm_offer_photo_jdm_photo FOREIGN KEY jdm_offer_photo_jdm_photo (photo_id)
    REFERENCES jdm_photo (id);

-- Reference: jdm_offer_tag_jdm_offer (table: jdm_offer_tag)
ALTER TABLE jdm_offer_tag ADD CONSTRAINT jdm_offer_tag_jdm_offer FOREIGN KEY jdm_offer_tag_jdm_offer (offer_id)
    REFERENCES jdm_offer (id);

-- Reference: jdm_offer_tag_jdm_tag (table: jdm_offer_tag)
ALTER TABLE jdm_offer_tag ADD CONSTRAINT jdm_offer_tag_jdm_tag FOREIGN KEY jdm_offer_tag_jdm_tag (tag_id)
    REFERENCES jdm_tag (id);

-- Reference: jdm_photo_jdm_photo_state (table: jdm_photo)
ALTER TABLE jdm_photo ADD CONSTRAINT jdm_photo_jdm_photo_state FOREIGN KEY jdm_photo_jdm_photo_state (photo_state_id)
    REFERENCES jdm_photo_state (id);

-- Reference: jdm_tag_jdm_tag_group (table: jdm_tag)
ALTER TABLE jdm_tag ADD CONSTRAINT jdm_tag_jdm_tag_group FOREIGN KEY jdm_tag_jdm_tag_group (tag_group_id)
    REFERENCES jdm_tag_group (id);

-- Reference: jdm_user_jdm_user_state (table: jdm_user)
ALTER TABLE jdm_user ADD CONSTRAINT jdm_user_jdm_user_state FOREIGN KEY jdm_user_jdm_user_state (state_id)
    REFERENCES jdm_user_state (id);

-- Reference: jdm_user_jdm_user_type (table: jdm_user)
ALTER TABLE jdm_user ADD CONSTRAINT jdm_user_jdm_user_type FOREIGN KEY jdm_user_jdm_user_type (type_id)
    REFERENCES jdm_user_type (id);

-- Reference: jdm_world_region_jdm_world_country (table: jdm_world_region)
ALTER TABLE jdm_world_region ADD CONSTRAINT jdm_world_region_jdm_world_country FOREIGN KEY jdm_world_region_jdm_world_country (country_id)
    REFERENCES jdm_world_country (id);

-- End of file.

