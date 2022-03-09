create database normalizacao;


use normalizacao;

CREATE TABLE tipo (
  id int unsigned NOT NULL auto_increment,
  tipo varchar(45) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE instrutor (
  id int unsigned NOT NULL auto_increment,
  instrutor varchar(45) NOT NULL,
  telefone varchar(11) NOT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE curso (
  id int unsigned NOT NULL auto_increment,
  curso varchar(45) NOT NULL,
  tipo_id int unsigned,
  instrutor_id int unsigned,
  valor double NOT NULL default '0',
  PRIMARY KEY (ID),
  CONSTRAINT fk_curso_tipo Foreign Key (tipo_id) References tipo (id),  
  Constraint fk_curso_instrutor Foreign Key (instrutor_id) References instrutor (id)  
);

CREATE TABLE aluno (
  id int unsigned NOT NULL auto_increment,
  aluno varchar(45) NOT NULL,
  endereco varchar(45) NOT NULL,
  email varchar(45) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE pedido (
  id int unsigned NOT NULL auto_increment,
  aluno_id int unsigned,
  dia date,
  horario time,
  PRIMARY KEY (ID),
  Constraint fk_pedido_aluno Foreign Key (aluno_id) References aluno (id)
);


CREATE TABLE pedido_detalhes (
  pedido_id int unsigned,
  curso_id int unsigned,  
  valor double NOT NULL default '0',  
  Constraint fk_pedido_detalhes_pedido Foreign Key (pedido_id) References pedido (id),
  Constraint fk_pedido_detalhes_curso Foreign Key (curso_id) References curso (id)
);

Alter Table aluno 
 add column data_nascimento varchar(10);

Alter Table aluno
change column data_nascimento nascimento date;

Create Index aluno on aluno (aluno);

Alter Table instrutor
add column email varchar(100);

Create Index instrutor on curso (instrutor_id);

use normalizacao;

Alter Table instrutor
drop column email;






