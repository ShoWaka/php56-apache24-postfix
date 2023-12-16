USE local_db;

CREATE TABLE test_table(
    `id` int NOT NULL,
    `name` varchar(100)
);

INSERT INTO test_table(`id`,`name`) VALUES
(1,"Hello World"),
(2,"hello world");