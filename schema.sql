CREATE TABLE  IF NOT EXISTS stuff (
	stuff_id INTEGER PRIMARY KEY,
	name TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS pays (
   pays_id INTEGER PRIMARY KEY,
   name TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS truc_pays(
   stuff_id INTEGER,
   pays_id INTEGER,
   PRIMARY KEY (stuff_id, pays_id),
   FOREIGN KEY (stuff_id) 
      REFERENCES stuff (stuff_id) 
         ON DELETE CASCADE 
         ON UPDATE NO ACTION,
   FOREIGN KEY (pays_id) 
      REFERENCES pays (pays_id) 
         ON DELETE CASCADE 
         ON UPDATE NO ACTION
);
INSERT OR IGNORE INTO stuff (stuff_id, name)
VALUES( '1', 'musique');
INSERT OR IGNORE INTO pays(pays_id, name)
VALUES( '1', 'france');
INSERT OR IGNORE INTO pays(pays_id, name)
VALUES( '2', 'mexique');
INSERT OR IGNORE INTO truc_pays (stuff_id, pays_id)
VALUES( '1', '1');
INSERT OR IGNORE INTO truc_pays (stuff_id, pays_id)
VALUES( '1', '2');
