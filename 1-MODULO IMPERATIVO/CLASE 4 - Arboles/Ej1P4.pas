{1. Implementar un programa modularizado para una librería que:

a. Almacene los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados la cantidad total de
unidades vendidas y el monto total. De cada venta se lee código de venta, código del
producto vendido, cantidad de unidades vendidas y precio unitario. El ingreso de las
ventas finaliza cuando se lee el código de venta -1.

b. Imprima el contenido del árbol ordenado por código de producto.

c. Contenga un módulo que reciba la estructura generada en el punto a y retorne el
código de producto con mayor cantidad de unidades vendidas.

d. Contenga un módulo que reciba la estructura generada en el punto a y un código de
producto y retorne la cantidad de códigos menores que él que hay en la estructura.

e. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de
producto y retorne el monto total entre todos los códigos de productos comprendidos
entre los dos valores recibidos (sin incluir).}
program ej1P4;
type

	ventas= record
		codVenta:integer;
		codProd:integer;
		uniVend:integer;
		precio:real;
		end;
	
	arbol = ^nodo;
    
    nodo = record
        dato:ventas;
        hd:arbol;
        hi:arbol;
    end;

procedure leer(var v:ventas);
begin
	writeln('---LECTURA DE VENTA---');
	write('Codigo De Venta:');
	readln(v.codVenta);
	if (v.codVenta <> -1) then begin
		write('Codigo De Producto:');
		readln(v.codProd);
		write('Cantidad de unidades vendidas:');
		readln(v.uniVend);
		write('Precio Unitario:');
		readln(v.precio);
	end;
	writeln('---LECTURA DE VENTA FINALIZADA---');
	writeln();
end;

procedure agregar(var a:arbol;v:ventas);//Armo el arbol solamente con las cosas que me pide, que son cod prod, cant uni vendidas y monto total
begin
	if(a=nil) then begin
		new(a);
		a^.dato.codProd:= v.codProd;
		a^.dato.uniVend:= v.uniVend;
		a^.dato.precio:= v.uniVend*v.precio;
	end
	else if (v.codProd = a^.dato.codProd) then begin
		a^.dato.uniVend:= a^.dato.uniVend + v.uniVend;
		a^.dato.precio:= a^.dato.precio + (v.uniVend*v.precio);
	end
	else if (v.codProd < a^.dato.codProd) then begin
		agregar(a^.hi,v);
	end
	else begin
		agregar(a^.hd,v);
	end;
end;

procedure crearArbol (var a:arbol);
var
	v:ventas;
	cod:integer;
begin
	cod:=0;
	while (cod <> -1) do begin
		leer(v); //Finaliza de leer con cod venta -1
		cod:= v.codVenta;
		if (cod <> -1) then begin
			agregar(a,v);
		end;
	
	end;
end;

procedure imprimirArbol(a:arbol);
begin
	if (a <> nil) then begin
		imprimirArbol(a^.hi);
		writeln();
		writeln('Codigo de Producto: ',a^.dato.codProd);
		writeln('Unidades vendidas: ',a^.dato.uniVend);
		writeln('Monto total: ',a^.dato.precio:0:3);
		writeln();
		imprimirArbol(a^.hd);
	end;
end;

procedure mayor(a:arbol;var max:integer; var cod:integer);
begin
	if (a <> nil) then begin
		mayor(a^.hi,max,cod);
		if (a^.dato.uniVend > max) or (max = 0) then begin
			max:= a^.dato.uniVend;
			cod:= a^.dato.codProd;
		end;
		mayor(a^.hd,max,cod);
	end;
end;

var
	a:arbol;
	codProdMasVentas,max:integer;
begin
{a}
	crearArbol(a); //Ordenado por codigo de producto
{b. Imprima el contenido del árbol ordenado por código de producto.}
	writeln();
	writeln('---- IMPRIMIR ARBOL ORDENADO ----');
	imprimirArbol(a);
	writeln();
{c. Contenga un módulo que reciba la estructura generada en el punto a y retorne el código de producto con mayor cantidad de unidades vendidas.}
	mayor(a,max,codProdMasVentas);
	writeln('El codigo de producto ',codProdMasVentas,' fue el que mas ventas tuvo con un total de ',max);
	
{d. Contenga un módulo que reciba la estructura generada en el punto a y un código de producto y retorne la cantidad de códigos menores que él que hay en la estructura.}	
	
	
{e. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de producto y retorne el monto total entre todos los códigos de productos comprendidos
entre los dos valores recibidos (sin incluir).}


end.
