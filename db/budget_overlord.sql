DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS accounts;




CREATE TABLE tags(
    id SERIAL4 PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE merchants(
    id SERIAL4 PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE accounts(
    id SERIAL4 PRIMARY KEY,
    name VARCHAR(255),
    budget INT4
);

CREATE TABLE transactions(
    id SERIAL4 PRIMARY KEY,
    item VARCHAR(255),
    cost INT4,
    merchant INT4 REFERENCES merchants(id),
    tag INT4 REFERENCES tags(id),
    date DATE
);
