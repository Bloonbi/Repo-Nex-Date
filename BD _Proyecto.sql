Drop database if exists
BD_Proyecto;
Create database BD_Proyecto;
use BD_Proyecto;

CREATE TABLE admins(
id_admins int primary key not null,
nombre varchar(100) not null,
email varchar(100) not null,
contraseña int not null,
cargo varchar(100) not null
);

CREATE TABLE cliente(
id_cliente int primary key not null,
nombre varchar(100) not null,
email varchar(100) not null,
contraseña int not null,
direccion varchar(100) not null,
telefono int not null,
fecha_registro int not null,
edad int not null
);

CREATE TABLE consulta(
id_consulta int not null,
tipo_consulta varchar(100) not null,
descripcion varchar(100) not null,
fecha_consulta int not null,
id_cliente int not null,
primary key (id_consulta, id_cliente),
foreign key (id_cliente) references cliente(id_cliente)
);

CREATE TABLE producto(
id_producto int primary key not null,
nombre varchar(100) not null,
descripcion varchar(100) not null,
precio int not null,
cantidad int not null,
registro_cantidad_productos_vendidos int not null
);

CREATE TABLE compra(
id_compra int not null,
direccion_envio varchar(100) not null,
fecha_compra int not null,
id_producto int not null,
primary key (id_compra, id_producto),
foreign key (id_producto) references producto(id_producto)
);

CREATE TABLE carrito_compra(
id_carrito_compra int not null,
precio int not null,
fecha_registro int not null,
id_producto int not null,
id_cliente int not null,
confirmacion_compra varchar(100) not null,
numero_productos_vendidos int not null,
primary key (id_carrito_compra, id_producto, id_cliente),
foreign key (id_producto) references producto(id_producto),
foreign key (id_cliente) references cliente(id_cliente)
);