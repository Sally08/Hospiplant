#BASE DE DATOS HOSPIPLANT VERSION 0.2
#ULTIMA MODIFICACION 14-02-2017

drop database hospiplant;
create database hospiplant;
use hospiplant;

#vease la posibilidad de de cambiar zona e historial a llave foránea.
create table usuario(
	id_usuario int not null,
	nombre varchar(25),
	appaterno varchar(20),
	apmaterno varchar(20),
	usuario varchar(15),
	contrasenia varchar(15),
	tipo_usuario varchar(10),
	primary key(id_usuario)
);

create table proveedor(
	id_proveedor int not null,
	rfc varchar(25),
	razonsocial varchar(30),
	direccion varchar(30),
	nombre varchar(25),
	appaterno varchar(20),
	apmaterno varchar(20),
	telefono varchar(15),
	id_usuario int not null,
	primary key(id_proveedor)
);

create table zona(
	id_zona int not null,
	nombre varchar(25),
	primary key(id_zona)
);

create table historial(
	id_historial int not null,
	id_planta int not null,
	id_enfermedad int not null,
	id_plaga int not null,
	id_usuario int not null,
	primary key(id_historial)
);

create table plaga(
	id_plaga int not null,
	nombre varchar(25),
	zona varchar(15),
	primary key(id_plaga)
);

create table planta(
	id_planta int not null,
	nombre varchar(25),
	zona varchar(15),
	plaga varchar(15),
	enfermedad varchar(15),
	id_clasificacionplanta int not null,
	id_caracteristicasplanta int not null,
	primary key(id_planta)
);

create table clasificacionplanta(
	id_clasificacionplanta int not null,
	nombre varchar(25),
	primary key(id_clasificacionplanta)
);

create table enfermedad(
	id_enfermedad int not null,
	nombre varchar(25),
	zona varchar(15),
	id_enfermedadsintoma int not null,
	primary key(id_enfermedad)
);

create table caracteristicasplanta(
	id_caracteristicasplanta int not null,
	nombre varchar(25),
	color varchar(10),
	tamanio float,
	primary key(id_caracteristicasplanta)
);

create table sintoma(
	id_sintoma int not null,
	nombre varchar(25),
	color varchar(10),
	primary key(id_sintoma)
);

create table enfermedadsintoma(
	id_enfermedadsintoma int not null,
	id_enfermedad int not null,
	id_sintoma int not null,
	primary key(id_enfermedadsintoma)
);

#laves foráneas

#proveedor
alter table proveedor add constraint fk_id_usuario_proveedor foreign key(id_usuario) references usuario(id_usuario);


#planta
alter table planta add constraint fk_id_clasificacionplanta_planta foreign key(id_clasificacionplanta) references clasificacionplanta(id_clasificacionplanta);
alter table planta add constraint fk_id_carasteristicasplanta_planta foreign key(id_caracteristicasplanta) references caracteristicasplanta(id_caracteristicasplanta);

#historial
alter table historial add constraint fk_id_usuario_historial foreign key(id_usuario) references usuario(id_usuario);
alter table historial add constraint fk_id_planta_historial foreign key(id_planta) references planta(id_planta);
alter table historial add constraint fk_id_enfermedad_historial foreign key(id_enfermedad) references enfermedad(id_enfermedad);
alter table historial add constraint fk_id_plaga_historial foreign key(id_plaga) references plaga(id_plaga);

#enfermedad
alter table enfermedad add constraint fk_id_enfermedadsintoma_enfermedad foreign key(id_enfermedadsintoma) references enfermedadsintoma(id_enfermedadsintoma);

#enfermedadsintoma
alter table enfermedadsintoma add constraint fk_id_sintoma_enfermedadsintoma foreign key(id_sintoma) references sintoma(id_sintoma);




	