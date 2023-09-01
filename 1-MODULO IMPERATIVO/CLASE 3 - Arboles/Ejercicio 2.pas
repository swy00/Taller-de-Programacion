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


program practica3_2;

type
	ventas = record
		codigo, cantidad:integer;
		fecha:string;
	end;
	
	arbol = ^nodo;
	
	nodo  = record
		dato:ventas;
		hi: arbol;
		hd: arbol;
	end;

procedure imprimirArbol(a:arbol); 
begin
	if (a<>nil) then begin
		imprimirArbol(a^.hi);
		writeln;
		writeln('Codigo del producto: ', a^.dato.codigo);
		if (a^.dato.fecha <> '') then
		    writeln('Fecha: ', a^.dato.fecha);
		writeln('Cantidad de unidades vendidas:  ', a^.dato.cantidad);
		writeln;
		imprimirArbol(a^.hd);
	end;
end;

procedure leer(var r:ventas);
begin
    writeln;
	writeln('-------LEER---------');
	writeln;
	write('Codigo del producto: ');
	readln(r.codigo);
	if (r.codigo <>0) then begin
		write('Fecha: ');
		readln(r.fecha);
		write('Cantidad de unidades vendidas:  ');
		readln(r.cantidad);
	end;
end;

procedure agregar(var a:arbol; r:ventas);
begin
	if (a=nil) then begin
		new(a);
		a^.dato:=r;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else  if (r.codigo <= a^.dato.codigo) then
		agregar(a^.hi,r)
	else
		agregar (a^.hd,r);
end;

procedure agregarProductos(var a:arbol; r:ventas);
begin
	if (a=nil) then begin
		new(a);
		a^.dato.codigo:=r.codigo;
		a^.dato.cantidad:=r.cantidad;
		a^.dato.fecha:='';
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else if (r.codigo = a^.dato.codigo) then begin
	    a^.dato.cantidad:=a^.dato.cantidad + r.cantidad;
	end
	else  if (r.codigo <= a^.dato.codigo) then
		agregarProductos(a^.hi,r)
	else
		agregarProductos (a^.hd,r);
end;

procedure armarArboles(var a, a2:arbol);
var
    r:ventas;
    numero:integer;

begin
    numero:=-1;
    while (numero <> 0) do begin
        leer(r);
        numero:=r.codigo;
        if (numero <> 0) then begin
            agregar(a,r);
            agregarProductos(a2,r);
        end;
    end;
end;

procedure totalProductosArbol(a:arbol; var total: integer; codigo:integer);
begin
    if (a<>nil) then begin
        totalProductosArbol(a^.hi,total,codigo);
            if (a^.dato.codigo = codigo) then
                total:=total + a^.dato.cantidad;
        totalProductosArbol(a^.hd,total,codigo);
    end;
end;

      //el proceso de recorrido puede ser un modulo dentro de cada modulo del programa principal
      //para asi no llenar de writeln; el programa principal e informar las cosas dentro del modulo
      //ver ejercicio 1 a completar para ver ejemplos de esto

var
    a,a2:arbol;
    total,codigo:integer;
    
begin
    a:=nil;
    a2:=nil;
    total:=0;
    armarArboles(a,a2); {Inciso A: i y ii}
    writeln;
	writeln('-------IMPRIMIR ARBOL---------');
    imprimirArbol(a);
    writeln('-------IMPRIMIR ARBOL PRODUCTOS---------');
    imprimirArbol(a2);
    writeln;
    write('Buscar las ventas totales en arbol uno de ');
    readln(codigo);
    totalProductosArbol(a,total,codigo); {inciso B}
    writeln;
    writeln('El producto ',codigo,' tiene un total de ',total,' unidades vendidas');
    writeln;
    total:=0;
    codigo:=0;
    write('Buscar las ventas totales en arbol dos de ');
    readln(codigo);
    totalProductosArbol(a2,total,codigo);  {inciso c}
    writeln;
    writeln('El producto ',codigo,' tiene un total de ',total,' unidades vendidas');  
end.

