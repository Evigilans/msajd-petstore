DROP TABLE IF EXISTS petstore.petstorepetservice_db.pet_tag;
DROP TABLE IF EXISTS petstore.petstorepetservice_db.tag;
DROP TABLE IF EXISTS petstore.petstorepetservice_db.pet;
DROP TABLE IF EXISTS petstore.petstorepetservice_db.category;
DROP SEQUENCE IF EXISTS petstore.petstorepetservice_db.hibernate_sequence;
CREATE SEQUENCE petstore.petstorepetservice_db.hibernate_sequence;

CREATE TABLE petstore.petstorepetservice_db.category
(
    id   BIGSERIAL   NOT NULL PRIMARY KEY,
    name VARCHAR(64) NOT NULL UNIQUE
);

CREATE TABLE petstore.petstorepetservice_db.tag
(
    id   BIGSERIAL   NOT NULL PRIMARY KEY,
    name VARCHAR(64) NOT NULL UNIQUE
);

CREATE TABLE petstore.petstorepetservice_db.pet
(
    id          BIGSERIAL    NOT NULL PRIMARY KEY,
    name        VARCHAR(64)  NOT NULL UNIQUE,
    category_id BIGSERIAL    NOT NULL,
    photoURL    VARCHAR(255) NOT NULL,
    status      VARCHAR(64)  NOT NULL,
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES petstore.petstorepetservice_db.category (id)
);

CREATE TABLE petstore.petstorepetservice_db.pet_tag
(
    pet_id BIGSERIAL NOT NULL REFERENCES petstore.petstorepetservice_db.pet (id) ON DELETE CASCADE,
    tag_id BIGSERIAL NOT NULL REFERENCES petstore.petstorepetservice_db.tag (id) ON DELETE CASCADE,
    CONSTRAINT pet_tag_pkey PRIMARY KEY (pet_id, tag_id)
);

INSERT INTO petstore.petstorepetservice_db.category (id, name)
VALUES (1, 'Dog'),
       (2, 'Cat'),
       (3, 'Fish');

INSERT INTO petstore.petstorepetservice_db.tag (id, name)
VALUES (1, 'doggie'),
       (2, 'large'),
       (3, 'small'),
       (4, 'kittie'),
       (5, 'fishy');

INSERT INTO petstore.petstorepetservice_db.pet (id, name, category_id, photoURL, status)
VALUES (1, 'Afador', 1,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/afador.jpg?raw=true', 'available'),
       (2, 'American Bulldog', 1,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/american-bulldog.jpg?raw=true',
        'available'),
       (3, 'Australian Retriever', 1,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/australian-retriever.jpg?raw=true',
        'available'),
       (4, 'Australian Shepherd', 1,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/australian-shepherd.jpg?raw=true',
        'available'),
       (5, 'Basset Hound', 1,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/basset-hound.jpg?raw=true',
        'available'),
       (6, 'Beagle', 1,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/beagle.jpg?raw=true', 'available'),
       (7, 'Border Terrier', 1,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/border-terrier.jpg?raw=true',
        'available'),
       (8, 'Boston Terrier', 1,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/boston-terrier.jpg?raw=true',
        'available'),
       (9, 'Bulldog', 1,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/bulldog.jpg?raw=true', 'available'),
       (10, 'Bullmastiff', 1,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/bullmastiff.jpg?raw=true',
        'available'),

       (11, 'Chihuahua', 1,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/chihuahua.jpg?raw=true',
        'available'),
       (12, 'Cocker Spaniel', 1,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/cocker-spaniel.jpg?raw=true',
        'available'),
       (13, 'German Sheperd', 1,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/german-shepherd.jpg?raw=true',
        'available'),
       (14, 'Labrador Retriever', 1,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/labrador-retriever.jpg?raw=true',
        'available'),
       (15, 'Pomeranian', 1,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/pomeranian.jpg?raw=true',
        'available'),
       (16, 'Pug', 1, 'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/pug.jpg?raw=true',
        'available'),
       (17, 'Rottweiler', 1,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/rottweiler.jpg?raw=true',
        'available'),
       (18, 'Shetland Sheepdog', 1,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/shetland-sheepdog.jpg?raw=true',
        'available'),
       (19, 'Shih Tzu', 1,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/shih-tzu.jpg?raw=true',
        'available'),
       (20, 'Toy Fox Terrier', 1,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-breeds/toy-fox-terrier.jpg?raw=true',
        'available'),

       (21, 'Abyssinian', 2,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/cat-breeds/abyssinian.jpg?raw=true',
        'available'),
       (22, 'American Bobtail', 2,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/cat-breeds/american-bobtail.jpg?raw=true',
        'available'),
       (23, 'American Shorthair', 2,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/cat-breeds/american-shorthair.jpg?raw=true',
        'available'),
       (24, 'Balinese', 2,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/cat-breeds/balinese.jpg?raw=true',
        'available'),
       (25, 'Birman', 2,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/cat-breeds/birman.jpg?raw=true', 'available'),
       (26, 'Bombay', 2,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/cat-breeds/bombay.jpg?raw=true', 'available'),
       (27, 'British Shorthair', 2,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/cat-breeds/british-shorthair.jpg?raw=true',
        'available'),
       (28, 'Burmilla', 2,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/cat-breeds/burmilla.jpg?raw=true',
        'available'),
       (29, 'Chartreux', 2,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/cat-breeds/chartreux.jpg?raw=true',
        'available'),
       (30, 'Cornish Rex', 2,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/cat-breeds/cornish-rex.jpg?raw=true',
        'available'),

       (31, 'Goldfish', 3,
        'https://raw.githubusercontent.com/chtrembl/staticcontent/master/fish-breeds/goldfish.jpg?raw=true',
        'available');

INSERT INTO petstore.petstorepetservice_db.pet_tag (pet_id, tag_id)
VALUES (1, 1),
       (1, 2),
       (2, 1),
       (2, 2),
       (3, 1),
       (3, 2),
       (4, 1),
       (4, 2),
       (5, 1),
       (5, 3),
       (6, 1),
       (6, 3),
       (7, 1),
       (7, 3),
       (8, 1),
       (8, 3),
       (9, 1),
       (9, 2),
       (10, 1),
       (10, 2),
       (11, 1),
       (11, 3),
       (12, 1),
       (12, 3),
       (13, 1),
       (13, 2),
       (14, 1),
       (14, 2),
       (15, 1),
       (15, 3),
       (16, 1),
       (16, 3),
       (17, 1),
       (17, 2),
       (18, 1),
       (18, 2),
       (19, 1),
       (19, 3),
       (20, 1),
       (20, 3),
       (21, 3),
       (21, 4),
       (22, 3),
       (22, 4),
       (23, 3),
       (23, 4),
       (24, 3),
       (24, 4),
       (25, 3),
       (25, 4),
       (26, 3),
       (26, 4),
       (27, 3),
       (27, 4),
       (28, 3),
       (28, 4),
       (29, 3),
       (29, 4),
       (30, 3),
       (30, 4),
       (31, 3),
       (31, 5);
