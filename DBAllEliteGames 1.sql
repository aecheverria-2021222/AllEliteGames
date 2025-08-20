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
insert into Clientes (DPICliente, nombresCliente, correoCliente, direccionCliente, estado)
values ('1234567890123','Carlos Ramirez','carlos.ramirez@gmail.com','Zona 1, Ciudad de Guatemala','activo');

Create table Empleado(
	codigoEmpleado int not null auto_increment,
    DPIEmpleado varchar(13) not null,
    nombresEmpleado varchar(200) not null,
    telefonoEmpleado varchar(8) not null,
    correoEmpleado varchar (150) not null,
    estado varchar(15) not null,
    usuario varchar (30) not null,
    contrasena varchar (50) not null,
    rutaImagen varchar(255),
    primary key PK_codigoEmpleado (codigoEmpleado) 
);

Delimiter $$
	create procedure sp_agregarEmpleado(
		in  DPIEmpleado varchar(13),
        in nombresEmpleado varchar(200),
        in telefonoEmpleado varchar(8),
        in correoEmpleado varchar(150),
        in estado varchar(15),
        in usuario varchar (30),
        in contrasena varchar(50),
        rutaImagen varchar(255))
        Begin
			Insert into Empleado (DPIEmpleado, nombresEmpleado, telefonoEmpleado, correoEmpleado, estado, usuario, contrasena, rutaImagen)
            values (DPIEmpleado, nombresEmpleado, telefonoEmpleado, correoEmpleado, estado, usuario, contrasena, rutaImagen);
        End$$
Delimiter ; 
 
call sp_agregarEmpleado('1579420230101','Pedro Armas','32165478','parmas@gmail.com','activo','parmas123','123','img/EmpleadoPedroArmas.jpeg'); 
call sp_agregarEmpleado('3216549871236','Jose Gonzalez','32165478','jgonzalez@gmail.com','activo','jgonzalez','123','img/EmpleadoJoseGonzalez.jpeg');
call sp_agregarEmpleado('1234567890123','Alejandro Echeverria','55512345','aecheverria@gmail.com','activo','aecheverria','123','img/EmpleadoAlejandroEcheverria.jpeg');
call sp_agregarEmpleado('9876543210987','Lucian Juarez','55567890','ljuarez@gmail.com','activo','ljuarez','123','img/EmpleadoLucianJuarez.jpeg');
call sp_agregarEmpleado('4561237896541','Esdras Lopez','55524680','elopez@gmail.com','activo','elopez','123','img/EmpleadoEsdrasLopez.jpeg');
call sp_agregarEmpleado('7412589631470','Juan Zeta','55536912','jzeta@gmail.com','activo','jzeta','123','img/EmpleadoJuanZeta.jpeg');
call sp_agregarEmpleado('8523697412580','Daniel Marroquin','55574125','dmarroquin@gmail.com','activo','dmarroquin','123','img/EmpleadoDanielMarroquin.jpeg');

/*call sp_agregarEmpleado('9632587413690','Fabian Say','55585214','fsay@gmail.com','activo','fsay','123','img/EmpleadoFabianSay.jpeg');
call sp_agregarEmpleado('1478963254789','Jose Gonzales','55596325','jgonzales@gmail.com','activo','jgonzales','123','img/EmpleadoJoseGonzales.jpeg');
call sp_agregarEmpleado('2587413698521','Manuel Garcia','55574136','mgarcia@gmail.com','activo','mgarcia','123','img/EmpleadoManuelGarcia.jpeg');
call sp_agregarEmpleado('3692581479632','Mauricio Xocoxic','55525814','mxocoxic@gmail.com','activo','mxocoxic','123','img/EmpleadoMauricioXocoxic.jpeg');
call sp_agregarEmpleado('1593574562587','Sebastian Mendez','55535746','smendez@gmail.com','activo','smendez','123','img/EmpleadoSebastianMendez.jpeg');*/

 select * from Empleado where usuario = "jgonzalez" and contrasena = "123";
Create table Generos(
	codigoGenero int not null auto_increment,
    genero varchar(100) not null,
    edadRecomendable varchar(10) not null,
    popularidad varchar(100) not null,
    publicoObjetivo varchar(100) not null,
    estado varchar(15) not null,
    primary key PK_codigoGenero (codigoGenero)
);
insert into Generos (genero, edadRecomendable, popularidad, publicoObjetivo, estado)
values ('Acción','12+','Alta','Jóvenes y Adultos','activo');


Create table Proveedores(
	codigoProveedor int not null auto_increment,
    nombreProveedor varchar(120) not null,
    telefonoProveedor varchar(8) not null,
    correoProveedor varchar(100) not null,
    direccion varchar(100) not null,
    estado varchar(15) not null,
    primary key PK_codigoProveedor (codigoProveedor)
);
insert into Proveedores (nombreProveedor, telefonoProveedor, correoProveedor, direccion, estado)
values ('GameWorld S.A.','55581234','contacto@gameworld.com','Zona 10, Guatemala','activo');

Create table Tiendas(
	codigoTienda int not null auto_increment,
    numeroTienda int not null,
    direccion varchar(100) not null,
    telefonoTienda varchar(100) not null,
    correoTienda varchar(100) not null,
    horarioApertura varchar(10) not null,
    horarioCierre varchar(10) not null,
    estado varchar(15) not null,
    codigoEmpleado int not null,
    primary key PK_codigoTienda(codigoTienda),
	constraint FK_Tiendas_Empleado foreign key (codigoEmpleado)
		references Empleado(codigoEmpleado)
);
insert into Tiendas (numeroTienda, direccion, telefonoTienda, correoTienda, horarioApertura, horarioCierre, estado, codigoEmpleado)
values (101,'Centro Comercial Miraflores','55578901','miraflores@tiendas.com','09:00','21:00','activo',1);


Create table Videojuegos(
	codigoVideojuego int not null auto_increment,
    nombreVideojuego varchar(200) not null,
    precioVideojuego double not null,
    stockVideojuego int not null,
    desarrollador varchar(100) not null,
    estado varchar(15) not null,
    codigoGenero int not null,
    codigoProveedor int not null,
    primary key PK_codigoVideojuego (codigoVideojuego),
    constraint FK_Videojuegos_Generos foreign key (codigoGenero) references Generos(codigoGenero),
    constraint FK_Videojuegos_Proveedores foreign key (codigoProveedor) references Proveedores(codigoProveedor)
);
insert into Videojuegos (nombreVideojuego, precioVideojuego, stockVideojuego, desarrollador, estado, codigoGenero, codigoProveedor)
values ('Legend of Heroes',299.99,50,'Epic Games','activo',1,1);

Create table Consolas(
	codigoConsola int not null auto_increment,
    nombreConsola varchar(200) not null,
    precioConsola double not null,
    stockConsola int not null,
    marca varchar(50) not null,
    fechaLanzamiento date not null,
    estado varchar(15) not null,
    codigoProveedor int not null,
    primary key PK_codigoConsola (codigoConsola),
	constraint FK_Consolas_Proveedores foreign key (codigoProveedor)
		references Proveedores(codigoProveedor)    
);
insert into Consolas (nombreConsola, precioConsola, stockConsola, marca, fechaLanzamiento, estado, codigoProveedor)
values ('PlayBox X',450.00,20,'PlayBox','2022-11-15','activo',1);

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
insert into Suscripciones (fechaSuscripcion, fechaFin, tipoSuscripcion, estado, codigoCliente, codigoVideojuego)
values ('2025-01-01','2025-12-31','PS PLUS','activo',1,1);

create table Membresias(
	codigoMembresia int not null auto_increment,
    numeroMembresia varchar(50) not null,
    tipoMembresia varchar(50) not null,
    precioMembresia varchar(50) not null,
    beneficios varchar(50) not null,
    estado varchar(15) not null,
    codigoCliente int not null,
    primary key PK_codigoMembresia (codigoMembresia),
	constraint FK_Membresias_Clientes foreign key (codigoCliente)
		references Clientes(codigoCliente)     
);
insert into Membresias (numeroMembresia, tipoMembresia, precioMembresia, beneficios, estado, codigoCliente)
values ('M12345','Gold','49.99','Descuentos exclusivos','activo',1);

create table MetodoPago (
    codigoMetodoPago int not null auto_increment,
    nombreMetodo varchar(50) not null,
    descripcionMetodo varchar(200) not null,
    comision double,
    estado varchar(15) not null,
	primary key PK_MetodoPago (codigoMetodoPago)
);
insert into MetodoPago (nombreMetodo, descripcionMetodo, comision, estado)
values ('Tarjeta de Crédito','Pago con tarjetas VISA y Mastercard',2.5,'activo');


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
insert into Ventas (tipoProducto, numeroSerie, fechaVenta, monto, estado, codigoCliente, codigoEmpleado, codigoMetodoPago)
values ('Videojuego','SN123456','2025-02-15',299.99,'completado',1,1,1);

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
insert into Devoluciones (fechaSolicitud, fechaDevolucion, motivo, estado, codigoVenta)
values ('2025-02-20','2025-02-25','Producto defectuoso','aceptado',1);



 

