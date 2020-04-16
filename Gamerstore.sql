# Crear base de datos
Create database gamerstore;

# usar base de datos
use gamerstore;

# tabla de estados
create table estados(
	idestado int primary key auto_increment,
    estado varchar(10)
);
insert into estados values( 1, "on");
insert into estados values( 2, "off");

# tabla de roles
create table roles(
	idrol int primary key,
	rol varchar(20)
);

insert into roles values( 1, "Admin");
insert into roles values( 2, "Empleado");
insert into roles values( 3, "usuario");

# tabla de roles
create table usuarios(
	idusuario int primary key,
    nombre varchar(20),
    apellido varchar(20),
    idrol int,
    direccion varchar(30),
    correo varchar(50) not null unique,
    contrasena varchar(8) not null,
    idestado int,
    foreign key(idrol) references roles(idrol) on delete set null,
    foreign key(idestado) references estados(idestado) on delete set null
);
insert into usuarios values(1, 'Juan', 'Gonzales', 3, 'CLL 20 # 123-30', "JGonzales@mail.com","1234", 1);
insert into usuarios values(2, 'Laura', 'Sanchez', 3, 'CRR 20 # 2-30', "ls2020@mail.com","5641", 1);
insert into usuarios values(3, 'Lorena', 'Murcia', 3, 'AVE 25 # 10-30', "lMURCIA@mail.com","1561", 2);
insert into usuarios values(4, 'David', 'Rodriguez', 3, 'TR 20 # 8-15', "rodri@mail.com","9684", 1);
insert into usuarios values(5, 'Omaira', 'Domingues', 3, 'CLL 20 # 23-80', "mao@mail.com","16516549", 2);

# crear tabla empleados
create table empleados(
	idempleado int primary key,
    nombre varchar(20),
    apellido varchar(20),
    salario int,
    idsupervisor int,
    idrol int,
    contrasena varchar(8),
    idestado int,
    foreign key(idestado) references estados(idestado) on delete set null,
    foreign key(idrol) references roles(idrol) on delete set null
);
-- creo un registro para poder asignarlo como supervisor y luego si hacer el foreign key de id supervisor
insert into empleados values (1, 'David', 'Rueda', 3500000, null, 1, "admin123", 1);
alter table empleados add foreign key(idsupervisor) references empleados(idempleado) on delete set null;
-- ahora si anado los demas empleados
insert into empleados values (2, 'Jenny', 'Nivia', 1200000, 1, 2, "JN2545", 1);
insert into empleados values (3, 'Pria', 'Suarez', 850000, 1, 2, "PS569", 1);

#crear tabla sucursales
create table sucursales(
	idsucursal int primary key,
    sucursal varchar(30),
    idsupervisor int,
    idestado int,
    foreign key(idestado) references estados(idestado) on delete set null
);
insert into sucursales values ( 1, "Bogota", 1, 1);

# tabla para categorias
create table categorias(
	idcategoria int primary key,
    categoria varchar(30),
    idestado int,
    foreign key(idestado) references estados(idestado) on delete set null
);
insert into categorias values ( 1, "Shoes", 1);
insert into categorias values ( 2, "Hoodies", 1);

# tabla de subcategorias
create table subcategorias(
	idsubcategoria int primary key,
    subcategoria varchar(30),
    idcategoria int,
    idestado int,
    stock int,
    descripcion varchar(50),
    foreign key(idestado) references estados(idestado) on delete set null,
    foreign key(idcategoria) references categorias(idcategoria) on delete set null 
);
insert into subcategorias values ( 1, "hooudie tela azul", 2, 1, 15, "Hoodie para caballero de tela azul");
insert into subcategorias values ( 2, "hooudie tela verde", 2, 1, 15, "Hoodie para caballero de tela verde");
insert into subcategorias values ( 3, "Jordan", 1, 1, 50, "Tenis marca jordan color blanco");
insert into subcategorias values ( 4, "Lebron", 1, 2, 0, "Tenis marca Lebron james color blanco");
insert into subcategorias values ( 5, "hooudie algodon", 2, 1, 5, "Hoodie para caballero de algodon clanco");
insert into subcategorias values ( 6, "Generica", 1, 1, 100, "Zapatilla generica caballero");

# finalmente tabal de productos
create table productos(
	idproducto int primary key,
    producto varchar(30),
    idsubcategoria int,
    precio int,
    imagen varchar(20),
    foreign key(idsubcategoria) references subcategorias(idsubcategoria) on delete set null 
);
insert into productos values ( 1, "Houdies", 2, 150000, "dsadasd");
insert into productos values ( 2, "Houdies", 1, 115000, "fsafsa");
insert into productos values ( 3, "Houdies", 5, 30000, "fsadfsa");
insert into productos values ( 4, "Houdies", 6, 25000, "bdfgd");
insert into productos values ( 5, "Shoes", 3, 420000, "hgdfgdf");
insert into productos values ( 6, "shoes", 4, 400000, "dsawwer");


# gracias si llegaste hasta aca profe