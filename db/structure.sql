CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "regions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime, "country_id" integer);
CREATE TABLE "houses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" text(255), "region_id" integer, "created_at" datetime, "updated_at" datetime, "size" integer, "n_people" integer, "add_n_people" integer, "activated" boolean, "images" json);
CREATE TABLE "countries" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "suitabilities" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "pets" varchar(255), "allergic" varchar(255), "family" varchar(255), "horse" varchar(255), "dog" varchar(255), "senior" varchar(255), "baby" varchar(255), "monteur" varchar(255), "nsmoker" varchar(255), "longtime" varchar(255), "disability" varchar(255), "created_at" datetime, "updated_at" datetime, "house_id" integer);
CREATE TABLE "pricings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "n_people" integer, "surcharge_night" integer, "surcharge_week" integer, "house_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "periods" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "from" date, "to" date, "min" integer, "min_type" varchar(255), "cost_per_night" integer, "cost_per_week" integer, "cost_add_nights" integer, "pricing_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "costs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "type" varchar(255), "amount" integer, "optional" boolean, "pricing_id" integer, "created_at" datetime, "updated_at" datetime);
INSERT INTO schema_migrations (version) VALUES ('20150906223004');

INSERT INTO schema_migrations (version) VALUES ('20150906223334');

INSERT INTO schema_migrations (version) VALUES ('20150906223707');

INSERT INTO schema_migrations (version) VALUES ('20150906224046');

INSERT INTO schema_migrations (version) VALUES ('20150906224309');

INSERT INTO schema_migrations (version) VALUES ('20150907145103');

INSERT INTO schema_migrations (version) VALUES ('20150907151422');

INSERT INTO schema_migrations (version) VALUES ('20150907154954');

INSERT INTO schema_migrations (version) VALUES ('20150908125754');

INSERT INTO schema_migrations (version) VALUES ('20150908130146');

INSERT INTO schema_migrations (version) VALUES ('20150908130246');

INSERT INTO schema_migrations (version) VALUES ('20150909094059');

INSERT INTO schema_migrations (version) VALUES ('20150925071922');

