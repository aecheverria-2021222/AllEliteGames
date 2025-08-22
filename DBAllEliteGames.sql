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
insert into Clientes (DPICliente, nombresCliente, correoCliente, direccionCliente, estado) values ('1234567890123','Carlos Ramirez','carlos.ramirez@gmail.com','Zona 1, Ciudad de Guatemala','activo');
insert into Clientes (DPICliente, nombresCliente, correoCliente, direccionCliente, estado) values ('2345678901234','María López','maria.lopez@gmail.com','Zona 7, Ciudad de Guatemala','activo');
insert into Clientes (DPICliente, nombresCliente, correoCliente, direccionCliente, estado) values ('3456789012345','Juan Pérez','juan.perez@gmail.com','Zona 12, Mixco','activo');
insert into Clientes (DPICliente, nombresCliente, correoCliente, direccionCliente, estado) values ('4567890123456','Ana Castillo','ana.castillo@gmail.com','Zona 5, Villa Nueva','activo');
insert into Clientes (DPICliente, nombresCliente, correoCliente, direccionCliente, estado) values ('5678901234567','Luis Hernández','luis.hernandez@gmail.com','Zona 18, Ciudad de Guatemala','activo');

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
	create procedure sp_AgregarEmpleado(
		in DPIEmpleado varchar(13),
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
 
call sp_AgregarEmpleado('1579420230101','Pedro Armas','32165478','parmas@gmail.com','activo','parmas123','123','img/EmpleadoPedroArmas.jpeg'); 
call sp_AgregarEmpleado('3216549871236','Jose Gonzalez','32165478','jgonzalez@gmail.com','activo','jgonzalez','123','img/EmpleadoJoseGonzalez.jpeg');
call sp_AgregarEmpleado('1234567890123','Alejandro Echeverria','55512345','aecheverria@gmail.com','activo','aecheverria','123','img/EmpleadoAlejandroEcheverria.jpeg');
call sp_AgregarEmpleado('9876543210987','Lucian Juarez','55567890','ljuarez@gmail.com','activo','ljuarez','123','img/EmpleadoLucianJuarez.jpeg');
call sp_AgregarEmpleado('4561237896541','Esdras Lopez','55524680','elopez@gmail.com','activo','elopez','123','img/EmpleadoEsdrasLopez.jpeg');
call sp_AgregarEmpleado('7412589631470','Juan Zeta','55536912','jzeta@gmail.com','activo','jzeta','123','img/EmpleadoJuanZeta.jpeg');
call sp_AgregarEmpleado('8523697412580','Daniel Marroquin','55574125','dmarroquin@gmail.com','activo','dmarroquin','123','img/EmpleadoDanielMarroquin.jpeg');
call sp_agregarEmpleado('1478963254789','Jose Gonzales','55596325','jgonzales@gmail.com','activo','jgonzales','123','img/EmpleadoJoseGonzales.jpg');
call sp_agregarEmpleado('2587413698521','Manuel Garcia','55574136','mgarcia@gmail.com','activo','mgarcia','123','img/EmpleadoManuelGarcia.jpeg');

/*call sp_agregarEmpleado('9632587413690','Fabian Say','55585214','fsay@gmail.com','activo','fsay','123','img/EmpleadoFabianSay.jpeg');
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
insert into Generos (genero, edadRecomendable, popularidad, publicoObjetivo, estado) values ('Acción','12+','Alta','Jóvenes y Adultos','activo');
insert into Generos (genero, edadRecomendable, popularidad, publicoObjetivo, estado) values ('Aventura','10+','Media','Niños y Jóvenes','activo');
insert into Generos (genero, edadRecomendable, popularidad, publicoObjetivo, estado) values ('Deportes','8+','Alta','Jóvenes y Adultos','activo');
insert into Generos (genero, edadRecomendable, popularidad, publicoObjetivo, estado) values ('Estrategia','15+','Media','Adultos','activo');
insert into Generos (genero, edadRecomendable, popularidad, publicoObjetivo, estado) values ('Terror','18+','Alta','Adultos','activo');


Create table Proveedores(
	codigoProveedor int not null auto_increment,
    nombresProveedor varchar(120) not null,
    telefonoProveedor varchar(8) not null,
    correoProveedor varchar(100) not null,
    direccion varchar(100) not null,
    estado varchar(15) not null,
    primary key PK_codigoProveedor (codigoProveedor)
);
insert into Proveedores (nombresProveedor, telefonoProveedor, correoProveedor, direccion, estado) values ('GameWorld S.A.','55581234','contacto@gameworld.com','Zona 10, Guatemala','activo');
insert into Proveedores (nombresProveedor, telefonoProveedor, correoProveedor, direccion, estado) values ('TechGames S.A.','55587412','ventas@techgames.com','Zona 4, Guatemala','activo');
insert into Proveedores (nombresProveedor, telefonoProveedor, correoProveedor, direccion, estado) values ('SoftPlay Ltd.','55596321','info@softplay.com','Zona 11, Guatemala','activo');
insert into Proveedores (nombresProveedor, telefonoProveedor, correoProveedor, direccion, estado) values ('DigitalFun Inc.','55574123','contacto@digitalfun.com','Zona 9, Guatemala','activo');
insert into Proveedores (nombresProveedor, telefonoProveedor, correoProveedor, direccion, estado) values ('NextGen Games','55585236','soporte@nextgen.com','Zona 13, Guatemala','activo');

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
insert into Tiendas (numeroTienda, direccion, telefonoTienda, correoTienda, horarioApertura, horarioCierre, estado, codigoEmpleado) values (101,'Centro Comercial Miraflores','55578901','miraflores@tiendas.com','09:00','21:00','activo',1);
insert into Tiendas (numeroTienda, direccion, telefonoTienda, correoTienda, horarioApertura, horarioCierre, estado, codigoEmpleado) values (102,'Oakland Mall','55596325','oakland@tiendas.com','10:00','21:00','activo',2);
insert into Tiendas (numeroTienda, direccion, telefonoTienda, correoTienda, horarioApertura, horarioCierre, estado, codigoEmpleado) values (103,'Plaza Américas','55574125','americas@tiendas.com','09:30','20:30','activo',3);
insert into Tiendas (numeroTienda, direccion, telefonoTienda, correoTienda, horarioApertura, horarioCierre, estado, codigoEmpleado) values (104,'Metrocentro','55535746','metrocentro@tiendas.com','08:00','20:00','activo',4);
insert into Tiendas (numeroTienda, direccion, telefonoTienda, correoTienda, horarioApertura, horarioCierre, estado, codigoEmpleado) values (105,'Pradera Concepción','55525814','pradera@tiendas.com','10:00','22:00','activo',5);


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
insert into Videojuegos (nombreVideojuego, precioVideojuego, stockVideojuego, desarrollador, estado, codigoGenero, codigoProveedor) values ('Legend of Heroes',299.99,50,'Epic Games','activo',1,1);
insert into Videojuegos (nombreVideojuego, precioVideojuego, stockVideojuego, desarrollador, estado, codigoGenero, codigoProveedor) values ('Soccer Stars',199.99,40,'Konami','activo',2,2);
insert into Videojuegos (nombreVideojuego, precioVideojuego, stockVideojuego, desarrollador, estado, codigoGenero, codigoProveedor) values ('Haunted Night',349.99,30,'Capcom','activo',4,3);
insert into Videojuegos (nombreVideojuego, precioVideojuego, stockVideojuego, desarrollador, estado, codigoGenero, codigoProveedor) values ('Kingdom Strategy',279.50,25,'Ubisoft','activo',3,4);
insert into Videojuegos (nombreVideojuego, precioVideojuego, stockVideojuego, desarrollador, estado, codigoGenero, codigoProveedor) values ('Adventure Quest',150.00,60,'Nintendo','activo',2,1);

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
	constraint FK_Consolas_Proveedor foreign key (codigoProveedor)
		references Proveedores(codigoProveedor)    
);
insert into Consolas (nombreConsola, precioConsola, stockConsola, marca, fechaLanzamiento, estado, codigoProveedor) values ('PlayBox X',450.00,20,'PlayBox','2022-11-15','activo',1);
insert into Consolas (nombreConsola, precioConsola, stockConsola, marca, fechaLanzamiento, estado, codigoProveedor) values ('GameSphere Z',500.00,15,'GameSphere','2023-03-10','activo',2);
insert into Consolas (nombreConsola, precioConsola, stockConsola, marca, fechaLanzamiento, estado, codigoProveedor) values ('NextPlay 5',650.00,10,'NextPlay','2021-12-05','activo',3);
insert into Consolas (nombreConsola, precioConsola, stockConsola, marca, fechaLanzamiento, estado, codigoProveedor) values ('UltraBox One',400.00,18,'UltraBox','2020-09-20','activo',4);
insert into Consolas (nombreConsola, precioConsola, stockConsola, marca, fechaLanzamiento, estado, codigoProveedor) values ('RetroMax Mini',199.99,30,'RetroMax','2019-06-15','activo',1);


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
insert into Suscripciones (fechaSuscripcion, fechaFin, tipoSuscripcion, estado, codigoCliente, codigoVideojuego) values ('2025-01-01','2025-12-31','PS PLUS','activo',1,1);
insert into Suscripciones (fechaSuscripcion, fechaFin, tipoSuscripcion, estado, codigoCliente, codigoVideojuego) values ('2025-02-01','2025-08-01','XBOX LIVE','activo',2,2);
insert into Suscripciones (fechaSuscripcion, fechaFin, tipoSuscripcion, estado, codigoCliente, codigoVideojuego) values ('2025-03-10','2026-03-10','GamePass','activo',3,3);
insert into Suscripciones (fechaSuscripcion, fechaFin, tipoSuscripcion, estado, codigoCliente, codigoVideojuego) values ('2025-01-15','2025-07-15','PS PLUS','activo',4,4);
insert into Suscripciones (fechaSuscripcion, fechaFin, tipoSuscripcion, estado, codigoCliente, codigoVideojuego) values ('2025-04-20','2026-04-20','Nintendo Online','activo',5,1);


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
insert into Membresias (numeroMembresia, tipoMembresia, precioMembresia, beneficios, estado, codigoCliente) values ('M12345','Gold','49.99','Descuentos exclusivos','activo',1);
insert into Membresias (numeroMembresia, tipoMembresia, precioMembresia, beneficios, estado, codigoCliente) values ('M54321','Silver','29.99','Acceso anticipado','activo',2);
insert into Membresias (numeroMembresia, tipoMembresia, precioMembresia, beneficios, estado, codigoCliente) values ('M67890','Bronze','19.99','Recompensas básicas','activo',3);
insert into Membresias (numeroMembresia, tipoMembresia, precioMembresia, beneficios, estado, codigoCliente) values ('M98765','Platinum','79.99','Eventos exclusivos','activo',4);
insert into Membresias (numeroMembresia, tipoMembresia, precioMembresia, beneficios, estado, codigoCliente) values ('M24680','Gold','49.99','Descuentos especiales','activo',5);


create table MetodosPago (
    codigoMetodoPago int not null auto_increment,
    nombreMetodo varchar(50) not null,
    descripcionMetodo varchar(200) not null,
    comision double,
    estado varchar(15) not null,
	primary key PK_MetodoPago (codigoMetodoPago)
);
insert into MetodosPago (nombreMetodo, descripcionMetodo, comision, estado)
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
	constraint FK_Ventas_MetodosPago foreign key (codigoMetodoPago)
		references MetodosPago(codigoMetodoPago)
);
insert into Ventas (tipoProducto, numeroSerie, fechaVenta, monto, estado, codigoCliente, codigoEmpleado, codigoMetodoPago) values ('Videojuego','SN123456','2025-02-15',299.99,'completado',1,1,1);
insert into Ventas (tipoProducto, numeroSerie, fechaVenta, monto, estado, codigoCliente, codigoEmpleado, codigoMetodoPago) values ('Consola','SN654321','2025-03-01',450.00,'completado',2,2,1);
insert into Ventas (tipoProducto, numeroSerie, fechaVenta, monto, estado, codigoCliente, codigoEmpleado, codigoMetodoPago) values ('Videojuego','SN789456','2025-03-05',199.99,'pendiente',3,3,1);
insert into Ventas (tipoProducto, numeroSerie, fechaVenta, monto, estado, codigoCliente, codigoEmpleado, codigoMetodoPago) values ('Suscripción','SN111222','2025-03-10',49.99,'completado',4,4,1);
insert into Ventas (tipoProducto, numeroSerie, fechaVenta, monto, estado, codigoCliente, codigoEmpleado, codigoMetodoPago) values ('Consola','SN333444','2025-03-15',650.00,'completado',5,5,1);

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
insert into Devoluciones (fechaSolicitud, fechaDevolucion, motivo, estado, codigoVenta) values ('2025-02-20','2025-02-25','Producto defectuoso','aceptado',1);
insert into Devoluciones (fechaSolicitud, fechaDevolucion, motivo, estado, codigoVenta) values ('2025-03-06','2025-03-12','No era el producto solicitado','aceptado',2);
insert into Devoluciones (fechaSolicitud, fechaDevolucion, motivo, estado, codigoVenta) values ('2025-03-11','2025-03-18','Problemas de compatibilidad','aceptado',3);
insert into Devoluciones (fechaSolicitud, fechaDevolucion, motivo, estado, codigoVenta) values ('2025-03-16','2025-03-22','Error en la entrega','aceptado',4);
insert into Devoluciones (fechaSolicitud, fechaDevolucion, motivo, estado, codigoVenta) values ('2025-03-20','2025-03-25','Producto incompleto','pendiente',1);


 

