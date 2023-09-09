{2. Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de
producto 0. Un producto puede estar en más de una venta. Se pide:

i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto.

ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendida.

Nota: El módulo debe retornar los dos árboles.
 
b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.

c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.}
program Ej2P3;
type

	venta = record
		codProd:integer;
		fecha:string;
		cantV:integer;
		end;
	
	arbol=^nodo;
	
	nodo = record
		dato:venta;
		hi:arbol;
		hd:arbol;
		end;


procedure imprimirArbol(a:arbol); 
begin
	if (a<>nil) then begin
		imprimirArbol(a^.hi);
		writeln('Codigo del producto: ', a^.dato.codProd);
		writeln('Fecha: ', a^.dato.fecha);
		writeln('Cantidad de unidades vendidas:  ', a^.dato.cantV);
		imprimirArbol(a^.hd);
	end;
end;
procedure leerVenta(var s:venta);
begin
	writeln('--LEER VENTA--');
	writeln('Ingresar CODIGO de Producto');
	readln(s.codProd);
	if (s.codProd<>0) then begin
		writeln('Ingresar FECHA de venta');
		readln(s.fecha);
		writeln('Ingresar CANTIDAD de VENTAS');
		readln(s.cantV);
		writeln('--LECTURA DE VENTA FINALIZADA --')
	end
	else
		writeln('--LECTURA TERMINADA--')
end;

procedure agregar(var a:arbol;s:venta);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:=s;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else if (s.codProd <= a^.dato.codProd) then begin
		agregar(a^.hi,s);
	end
	else begin
		agregar(a^.hd,s);
	end;
end;

procedure agregarProductos(var a:arbol;s:venta);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:=s;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else if (s.codProd = a^.dato.codProd) then begin
		a^.dato.cantV:=a^.dato.cantV+s.cantV
	end
	else if (s.codProd < a^.dato.codProd) then begin
		agregar(a^.hi,s);
	end
	else begin
		agregar(a^.hd,s);
	end;
end;

procedure armarArbol(var a:arbol; var a2:arbol);
var
	num:integer;
	v:venta;
begin
	num:=-1;
	while (num <> 0) do begin
		leerVenta(v);
		num:=v.codProd;
		if (num <> 0) then begin
			agregar(a,v);
			agregarProductos(a2,v);
		end;
	end;
	imprimirArbol(a);
	imprimirArbol(a2);
end;

var
	a,a2:arbol;
begin
{i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto.}
{ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendida.}
	a:=nil;
	armarArbol(a,a2);

	
end.

