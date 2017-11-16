INSERT INTO jdm_world_country (name) VALUES ('Poland'); -- 1
INSERT INTO jdm_world_country (name) VALUES ('Australia'); -- 2
INSERT INTO jdm_world_region (name, country_id) VALUES ('Mazowieckie', 1); -- 1
INSERT INTO jdm_world_region (name, country_id) VALUES ('Małopolskie', 1); -- 2
INSERT INTO jdm_world_region (name, country_id) VALUES ('Pomorskie', 1); -- 3
INSERT INTO jdm_world_region (name, country_id) VALUES ('Sydeny', 2); -- 4
INSERT INTO jdm_world_region (name, country_id) VALUES ('Reszta Australii', 2); -- 5

INSERT INTO jdm_address (country_id, region_id, city, postal_code, street) VALUES (1, 1, 'Warszawa', '00-001', 'Marszałkowska 110'); -- 1
INSERT INTO jdm_address (country_id, region_id, city, postal_code, street) VALUES (1, 1, 'Warszawa', '00-042', 'Nowy Świat 47A'); -- 2
INSERT INTO jdm_address (country_id, region_id, city, postal_code, street) VALUES (2, 2, 'Sydney', 'XX-ASC', 'Ul. Operowa 12'); -- 3

INSERT INTO jdm_achievement_group (name) VALUES ('konkursy');
INSERT INTO jdm_achievement_group (name) VALUES ('ukończone kursy');

INSERT INTO jdm_achievement (name, achievement_group_id) VALUES ('konkurs 1', 1);
INSERT INTO jdm_achievement (name, achievement_group_id) VALUES ('konkurs 2', 1);
INSERT INTO jdm_achievement (name, achievement_group_id) VALUES ('konkurs 3', 1);
INSERT INTO jdm_achievement (name, achievement_group_id) VALUES ('konkurs 4', 1);
INSERT INTO jdm_achievement (name, achievement_group_id) VALUES ('kurs 1', 2);
INSERT INTO jdm_achievement (name, achievement_group_id) VALUES ('kurs 2', 2);
INSERT INTO jdm_achievement (name, achievement_group_id) VALUES ('kurs 3', 2);
INSERT INTO jdm_achievement (name, achievement_group_id) VALUES ('kurs 4', 2);

INSERT INTO jdm_user_type (name) VALUES ('admin'), ('artist'), ('client');
INSERT INTO jdm_user_state (name) VALUES ('new'), ('active'), ('deleted');

INSERT INTO jdm_user (email, password, type_id, state_id) VALUES ('admin@jdm.pl', 'masło', 1, 2); -- 1
INSERT INTO jdm_user (email, password, type_id, state_id) VALUES ('artist0@jdm.pl', 'masło', 2, 1); -- 2
INSERT INTO jdm_user (email, password, type_id, state_id) VALUES ('artist1@jdm.pl', 'masło', 2, 2); -- 3
INSERT INTO jdm_user (email, password, type_id, state_id) VALUES ('artist2@jdm.pl', 'masło', 2, 2); -- 4
INSERT INTO jdm_user (email, password, type_id, state_id) VALUES ('client0@jdm.pl', 'masło', 3, 1); -- 5
INSERT INTO jdm_user (email, password, type_id, state_id) VALUES ('client1@jdm.pl', 'masło', 3, 2); -- 6
INSERT INTO jdm_user (email, password, type_id, state_id) VALUES ('client2@jdm.pl', 'masło', 3, 2); -- 7

INSERT INTO jdm_artist (id, name, surname, phone, date_of_birth, photo, views, address_id) VALUES (2, 'Julia', 'Łopuszyńska', '3241243324', '1995-04-20', null, 0, 1); -- 1
INSERT INTO jdm_artist (id, name, surname, phone, date_of_birth, photo, views, address_id) VALUES (3, 'Maciej', 'Bogdański', '912392384', '1993-11-20', null, 0, 2); -- 2
INSERT INTO jdm_artist (id, name, surname, phone, date_of_birth, photo, views, address_id) VALUES (4, 'Stanley', 'Łopuszyński', '3123123123', '1993-09-12', null, 0, 1); -- 3
INSERT INTO jdm_client (id, name, phone, photo, views, address_id) VALUES (5, 'Wesele', '31313132', null, 0, null); -- 1
INSERT INTO jdm_client (id, name, phone, photo, views, address_id) VALUES (6, 'Filharmonia', '123123123', null, 0, null); -- 2
INSERT INTO jdm_client (id, name, phone, photo, views, address_id) VALUES (7, 'Sydney Opera', '111111111', null, 0, 3); -- 3

INSERT INTO jdm_artist_achievement (artist_id, achievement_id) VALUES (2, 1), (2, 2), (2, 3), (2, 4), (2, 5), (2, 6), (2, 7), (2, 8);
INSERT INTO jdm_artist_achievement (artist_id, achievement_id) VALUES (3, 1), (3, 2), (3, 3), (3, 5), (3, 7), (3, 8);

INSERT INTO jdm_tag_group (name) VALUES ('instrument');
INSERT INTO jdm_tag_group (name) VALUES ('uczelnia');