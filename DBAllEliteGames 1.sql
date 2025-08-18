Drop Database If exists DBAllEliteGames;
create database DBAllEliteGames;
use DBAllEliteGames;

Create table Clientes(
	codigoCliente int not null auto_increment,
    DPICliente varchar(13) not null,
    nombresCliente varchar (200) not null,
    correoCliente varchar(150) not null,/*Se Agrego*/
    direccionCliente varchar(150) not null,
    estado varchar(15) not null,
	primary key PK_CodigoCliente (codigoCliente)
);

Create table Empleado(
	codigoEmpleado int not null auto_increment,
    DPIEmpleado varchar(13) not null,
    nombresEmpleado varchar(200) not null,
    telefonoEmpleado varchar(8) not null,
    correoEmpleado varchar (150) not null,
    estado varchar(15) not null,
    usuario varchar (30) not null,
    contrasena varchar (50) not null,
    primary key PK_codigoEmpleado (codigoEmpleado) 
);

Create table Genero(
	codigoGenero int not null auto_increment,
    genero varchar(100) not null,
    edadRecomendable varchar(10) not null,
    popularidad varchar(100) not null,
    publicoObjetivo varchar(100) not null,
    primary key PK_codigoGenero (codigoGenero)
);

Create table Proveedores(
	codigoProveedor int not null auto_increment,
    nombreProveedor varchar(120) not null,
    telefonoProveedor varchar(8) not null,
    correoProvedor varchar(100) not null,
    dirección varchar(100) not null,
    primary key PK_codigoProveedor (codigoProveedor)
);

Create table Tiendas(
	codigoTienda int not null auto_increment,
    numeroTienda int not null,
    direccion varchar(100) not null,
    telefonoTienda varchar(100) not null,
    correoTienda varchar(100) not null,
    horarioApertura varchar(10) not null,
    horarioCierre varchar(10) not null,
    codigoEmpleado int not null,
    primary key PK_codigoTienda(codigoTienda),
	constraint FK_Tiendas_Empleado foreign key (codigoEmpleado)
		references Empleado(codigoEmpleado)
);

Create table Videojuegos(
	codigoVideojuego int not null auto_increment,
    nombreVideojuego varchar(200) not null,
    precioVideojuego double not null,
    stockVideojuego int not null,
    desarrollador varchar(100) not null,
    codigoGenero int not null,
    codigoProveedor int not null,
    primary key PK_codigoVideojuego (codigoVideojuego),
    constraint FK_Videojuegos_Genero foreign key (codigoGenero) references Genero(codigoGenero),
    constraint FK_Videojuegos_Proveedores foreign key (codigoProveedor) references Proveedores(codigoProveedor)
);

Create table Consolas(
	codigoConsola int not null auto_increment,
    nombreConsola varchar(200) not null,
    precioConsola double not null,
    stockConsola int not null,
    marca varchar(50) not null,
    fechaLanzamiento date,
    codigoProveedor int not null,
    primary key PK_codigoConsola (codigoConsola),
	constraint FK_Consolas_Proveedores foreign key (codigoProveedor)
		references Proveedores(codigoProveedor)    
);

create table Suscripciones(
	codigoSuscripcion int not null auto_increment,
    fechaSuscripcion date not null, 
    fechaFin date not null,
    tipoSuscripcion varchar(100) not null,
    estado varchar(15) not null,
	codigoCliente int not null,
    codigoVideojuego int not null,
    primary key PK_codigoSuscripcion (codigoSuscripcion),
	constraint FK_Suscripciones_Clientes foreign key (codigoCliente)
		references Clientes(codigoCliente),
	constraint FK_Suscripciones_Videojuegos foreign key (codigoVideojuego)
		references Videojuegos(codigoVideojuego)     
);
 
create table Membresias(
	codigoMembresia int not null auto_increment,
    numeroMembresia varchar(50) not null,
    tipoMembresia varchar(50) not null,
    precioMembresia varchar(50) not null,
    beneficios varchar(50) not null,
    codigoCliente int not null,
    primary key PK_codigoMembresia (codigoMembresia),
	constraint FK_Membresias_Clientes foreign key (codigoCliente)
		references Clientes(codigoCliente)     
);


create table MetodoPago (
    codigoMetodoPago int not null auto_increment,
    nombreMetodo varchar(50) not null,
    descripcionMetodo varchar(200) not null,
    comision double,
    estado varchar(15) not null,
	primary key PK_MetodoPago (codigoMetodoPago)
);



Create table Ventas(
	codigoVenta int not null auto_increment,
    tipoProducto varchar(50) not null,
    numeroSerie varchar(225) not null,
    fechaVenta date not null,
    monto double not null,
    estado varchar(15) not null,
    codigoCliente int not null,
    codigoEmpleado int not null,
    codigoMetodoPago int not null,
    primary key PK_codigoVenta (codigoVenta),
    constraint FK_Ventas_Clientes foreign key (codigoCliente)
		references Clientes(codigoCliente),
	constraint FK_Ventas_Empleado foreign key (codigoEmpleado)
		references Empleado(codigoEmpleado),
	constraint FK_Ventas_MetodoPago foreign key (codigoMetodoPago)
		references MetodoPago(codigoMetodoPago)
);
 

Create table Devoluciones(
	codigoDevolucion int not null auto_increment,
    fechaSolicitud date not null,
    fechaDevolucion date not null,
    motivo varchar(150) not null,
    estado varchar(15),
	codigoVenta int not null,
    primary key codigoDevolucion(codigoDevolucion),
	constraint FK_Devoluciones_Ventas foreign key (codigoVenta)
		references Ventas(codigoVenta)
);

Delimiter $$
	create procedure sp_agregarEmpleado(
		in  DPIEmpleado varchar(13),
        in nombresEmpleado varchar(200),
        in telefonoEmpleado varchar(8),
        in correoEmpleado varchar(150),
        in estado varchar(15),
        in usuario varchar (30),
        in contrasena varchar(50))
        Begin
			Insert into Empleado (DPIEmpleado, nombresEmpleado, telefonoEmpleado, correoEmpleado, estado, usuario, contrasena)
            values (DPIEmpleado, nombresEmpleado, telefonoEmpleado, correoEmpleado, estado, usuario, contrasena);
        End$$
Delimiter ;
 
 describe Empleado;
 select * from Genero;
 
 call sp_agregarEmpleado('3216549871236','Jose Gonzalez','32165478','jgonzalez@gmail.com','activo','jgonzalez','123');
Insert into Genero (genero, edadRecomendable, popularidad, publicoObjetivo)values('Acción','E','10%','niños');

select * from Genero;
 select * from Empleado where usuario = "jgonzalez" and contrasena = "123";