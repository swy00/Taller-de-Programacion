{Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:

a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN -1. Las estructuras deben
ser eficientes para buscar por ISBN.
i. En una estructura cada préstamo debe estar en un nodo.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).
b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.
c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.
d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.

h. Un módulo recursivo que reciba la estructura generada en h. y muestre su contenido.

i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).

j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).}

program ej2P4;
type
{i. En una estructura cada préstamo debe estar en un nodo.}
	prestamos = record
		isbn:integer;
		numSocio:integer;
		fecha:string;
		dias:integer;
		end;
	
	arbol = ^nodo;
	
	nodo = record
		dato:prestamos;
		hi:arbol;
		hd:arbol;
		end;
{ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.}		
	lista=^nodoL;
	
	nodoL = record
		dato:prestamos;
		sig:lista;
		end;
	
	ISBNprestamo = record
		isbn:integer;
		pres:lista;
		end;
	
	arbol2 =^nodo2;
	
	nodo2 = record
		dato:ISBNprestamo;
		hi:arbol2;
		hd:arbol2;
		end;

{----------------------------------- A -----------------------------------}

procedure imprimirArbol(a:arbol;a2:arbol2);

	procedure imprimir(a:arbol);
	begin
		if (a<>nil) then begin
			imprimir(a^.hi);
			writeln('-- PRESTAMO --');
			writeln('ISBN: ',a^.dato.isbn);
			writeln('Numero de Socio: ',a^.dato.numSocio);
			writeln('Fecha: ',a^.dato.fecha);
			writeln('Cantida de dias: ',a^.dato.dias);
			writeln('--------------');
			imprimir(a^.hd);
		end;
	end;

	procedure imprimirArbolListas(a:arbol2);
	var
		aux:lista;
	begin
		if (a <> nil) then begin
			imprimirArbolListas(a^.hi);
				writeln;
				writeln('ISBN: ', a^.dato.isbn);
				aux:=a^.dato.pres;
				while (aux <> nil) do begin
					writeln('Numero de Socio: ',aux^.dato.numSocio);
					writeln('Fecha: ',aux^.dato.fecha);
					writeln('Cantida de dias: ',aux^.dato.dias);
					aux:=aux^.sig;
				end;
			imprimirArbolListas(a^.hd);
		end;
	end;
begin
	writeln;
	writeln('------ IMRRESION DE ARBOLES ------');
	writeln;
	writeln('---- ARBOL 1 ----');
	imprimir(a);
	writeln('---- FINAL ARBOL 1 ----');
	writeln;
	writeln('---- ARBOL 2 ----');
	imprimirArbolListas(a2);
	writeln('---- FINAL ARBOL 2 ----');
	writeln;           
end;


procedure leerPrestamo(var p:prestamos); //Finaliza la lectura con ISBN -1
begin
	writeln;
	writeln('---- LEER NUEVO PRESTAMO ----');
	write('Introducir ISBN:');
	readln(p.isbn);
	if(p.isbn <> -1) then begin
		write('Introducir Numero de Socio:');
		readln(p.numSocio);
		write('Introducir Fecha:');
		readln(p.fecha);
		write('Introducir Dias Prestados:');
		readln(p.dias);
	end;
	writeln('---- LECTURA FINALIZADA ----');
end;

procedure agregarPrestamo(var a:arbol;p:prestamos);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:=p;
		a^.hd:=nil;
		a^.hi:=nil;
	end
	else if (a^.dato.isbn > p.isbn) then begin
		agregarPrestamo(a^.hi,p);
	end
	else begin
		agregarPrestamo(a^.hd,p);
	end;
end;


procedure agregarLista(var l:lista;p:prestamos);
var 
	nue:lista;
begin
	new(nue);
	nue^.dato:=p;
	nue^.sig:=l;
	l:=nue;
end;

procedure agregarISBNL(var a:arbol2;p:prestamos);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.isbn:=p.isbn;
		a^.dato.pres:=nil; //Inicializo vacia la lista;
		a^.hi:=nil;
		a^.hd:=nil;
	end;
	if (a^.dato.isbn = p.isbn) then begin
		agregarLista(a^.dato.pres,p);
	end
	else if (a^.dato.isbn > p.isbn) then begin
		agregarISBNL(a^.hi,p);
	end
	else begin
		agregarISBNL(a^.hd,p);
	end;
	
end;

procedure cargarArbol(var a:arbol;var a2:arbol2);	
var
	isbn:integer;
	p:prestamos;
begin
	isbn:=0;
	while (isbn <> -1) do begin
		leerPrestamo(p);
		isbn:= p.isbn;
		if (isbn <> -1) then begin
			agregarPrestamo(a,p);
			agregarISBNL(a2,p);
		end;
	end;
end;	

{----------------------------------- A -----------------------------------}

{----------------------------------- B -----------------------------------}
procedure masGrandeISBN(a:arbol);

	procedure masGrande(a:arbol;var max:integer);
	begin
		if (a<>nil) then begin
			if (a^.hd <> nil) then begin
				if (a^.dato.isbn > max) then begin
					max:=a^.dato.isbn;
				end;
				masGrande(a^.hd,max);
			end
			else begin
				max:=a^.dato.isbn;
			end;
		end;
	end;

var
	max:integer;
begin
	max:=0;
	masGrande(a,max);
	writeln;
	writeln('--- INCISO B ---');
	writeln('El ISBN mayor fue ',max);
	writeln;
end;

{----------------------------------- B -----------------------------------}
{----------------------------------- C -----------------------------------}
procedure masChicoISBN(a:arbol2);

	procedure masChico(a:arbol2;var min:integer);
	begin
		if (a<>nil) then begin
			if (a^.hi <> nil) then begin
				if (a^.dato.isbn < min) then begin
					min:=a^.dato.isbn;
				end;
				masChico(a^.hi,min);
			end
			else begin
				min:=a^.dato.isbn;
			end;
		end;
	end;

var
	min:integer;
begin
	min:=0;
	masChico(a,min);
	writeln;
	writeln('--- INCISO C ---');
	writeln('El ISBN menor fue ',min);
	writeln;
end;

{----------------------------------- C -----------------------------------}

{----------------------------------- D -----------------------------------}

procedure cantPresSocio (a:arbol);


	procedure presSocio(a:arbol;s:integer;var c:integer);
	begin
		if (a <> nil) then begin
			presSocio(a^.hi,s,c);
			if (a^.dato.numSocio = s) then begin
				c:=c+1;
			end;
			presSocio(a^.hd,s,c);
		end;
	end;
var
	preSocio,socio:integer;
begin
	writeln;
	writeln('--- INCISO D ---');
	write('Ingresar Numero del Socio que desea buscarle prestamos en el ARBOL I: ');
	readln(socio);
	preSocio:=0;
	presSocio(a,socio,preSocio);
	writeln('El socio ',socio,' tuvo ',preSocio,' prestamos');
	writeln;
end;


{----------------------------------- D -----------------------------------}
{----------------------------------- E -----------------------------------}

procedure cantPresSocioLista (a:arbol2);

	procedure presSocioLista(a:arbol2;s:integer;var c:integer);
	var 
		aux:lista;
	begin
		if (a <> nil) then begin
			presSocioLista(a^.hi,s,c);
			aux:=a^.dato.pres;
			while (aux <> nil) do begin
				if (aux^.dato.numSocio = s) then begin
					c:=c+1;
				end;
				aux:=aux^.sig;
			end;
			presSocioLista(a^.hd,s,c);
		end;
	end;
var
	preSocioLista,socioLista:integer;
begin
	writeln;
	writeln('--- INCISO E ---');
	write('Ingresar Numero del Socio que desea buscarle prestamos en el ARBOL II: ');
	readln(socioLista);
	preSocioLista:=0;
	presSocioLista(a,socioLista,preSocioLista);
	writeln('El socio ',socioLista,' tuvo ',preSocioLista,' prestamos');
	writeln;
end;

{----------------------------------- E -----------------------------------}

{----------------------------------- F -----------------------------------}

procedure agregarNuevoArbol(p:prestamos;var a:arbol);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.isbn:= p.isbn;
		a^.dato.dias:= 1;
		a^.hi:=nil;
		a^.hd:=nil;
	end;
	if (a^.dato.isbn = p.isbn) then begin
		a^.dato.dias:= p.dias + 1;
	end
	else if (a^.dato.isbn > p.isbn) then begin
		agregarNuevoArbol(p,a^.hi);
	end
	else begin
		agregarNuevoArbol(p,a^.hd);
	end;
end;	

procedure armarArbolI(a:arbol;var a2:arbol);
begin
	if (a <> nil) then begin
		agregarNuevoArbol(a^.dato,a2);
		armarArbolI(a^.hi,a2);
		armarArbolI(a^.hd,a2);
	end;
end;


{----------------------------------- F -----------------------------------}

{----------------------------------- G -----------------------------------}


function contarCantListas(a:lista):integer;
var
	contador:integer;
begin
	contador:=0;
	while (a <> nil) do begin
		contador := contador +1;
		a:=a^.sig;
	end;
	contarCantListas:=contador;
end;

procedure agregarNuevoArbol2(d:ISBNprestamo;var a:arbol);
var 
	aux:lista;
begin
	//d.isbn o d.pres(lista)
	aux:=d.pres;
	if (a = nil) then begin
		new(a);
		a^.dato.isbn:= d.isbn;
		a^.dato.dias:= contarCantListas(aux);
		a^.hd:= nil;
		a^.hi:= nil;
	end
    else if (a^.dato.isbn > d.isbn) then begin
		agregarNuevoArbol2(d,a^.hi);
	end
    else begin
        agregarNuevoArbol2(d,a^.hd);
    end;
end;


procedure armarArbolII (a:arbol2;var a2:arbol);
begin
	if (a<>nil) then begin
		agregarNuevoArbol2(a^.dato,a2); //Le paso el ISBN y la lista con todos los prestamos que se hicieron
		armarArbolII(a^.hi,a2);
		armarArbolII(a^.hd,a2);
	end;
 
end;

procedure imprimirArbol(a:arbol);

	procedure imprimir(a:arbol);
	begin
		if (a<>nil) then begin
			imprimir(a^.hi);
			writeln('-- ISBN --');
			writeln('ISBN: ',a^.dato.isbn);
			writeln('Cantidad de veces prestada: ',a^.dato.dias);
			writeln('--------------');
			imprimir(a^.hd);
		end;
	end;

begin
	writeln;
	writeln('------ IMRRESION DE ARBOLES F y G ------');
	writeln;
	writeln('---- ARBOL ----');
	imprimir(a);
	writeln('---- FINAL ARBOL ----');
	writeln;          
end;

{----------------------------------- G -----------------------------------}
{----------------------------------- I -----------------------------------}
procedure valRangoI(a:arbol);

	procedure informarISBNRango(a:arbol;x,y:integer;var contador:integer);
	begin
		if (a<> nil) then begin
			if (a^.dato.isbn >= x) and (a^.dato.isbn <= y) then begin
				contador:=contador+1;
				informarISBNRango(a^.hd,x,y,contador);
				informarISBNRango(a^.hi,x,y,contador);
			end;
			if (a^.dato.isbn < x) then begin
				informarISBNRango(a^.hd,x,y,contador);
			end;
			if (a^.dato.isbn > y) then begin
				informarISBNRango(a^.hi,x,y,contador);
			end;
		end;
	end;

var
	x,y:integer;
	contador:integer;
begin
	writeln;
    writeln('Ingrese un rango de ISBN para arbol I [x,y]');
    readln(x);
    readln(y);
    contador:=0;
    informarISBNRango(a,x,y,contador);
    writeln('Hubo ',contador,' ISBN dentro del rango I');
    writeln;
end;

{----------------------------------- I -----------------------------------}

{----------------------------------- J -----------------------------------}

procedure valRangoII(a:arbol2);

	function longLista(a:lista):integer;
	var 
		aux:lista;
		c:integer;
	begin
		aux:=a;
		c:=0;
		while (aux <> nil) do begin
			c:=c+1;
			aux:=aux^.sig;
		end;
		longLista:=c;
	end;

	procedure informarISBNRango(a:arbol2;x,y:integer;var contador:integer);
	begin
		if (a<> nil) then begin
			if (a^.dato.isbn >= x) and (a^.dato.isbn <= y) then begin
				contador:=contador+longLista(a^.dato.pres);
				informarISBNRango(a^.hd,x,y,contador);
				informarISBNRango(a^.hi,x,y,contador);
			end;
			if (a^.dato.isbn < x) then begin
				informarISBNRango(a^.hd,x,y,contador);
			end;
			if (a^.dato.isbn > y) then begin
				informarISBNRango(a^.hi,x,y,contador);
			end;
		end;
	end;

var
	x,y:integer;
	contador:integer;
begin
	writeln;
    writeln('Ingrese un rango de ISBN para arbol II [x,y]');
    readln(x);
    readln(y);
    contador:=0;
    informarISBNRango(a,x,y,contador);
    writeln('Hubo ',contador,' ISBN dentro del rango II');
    writeln;
end;

{----------------------------------- J -----------------------------------}


var
	a,aFI,aFII:arbol;
	a2:arbol2;

begin
	a:=nil;
	a2:=nil;
	aFI:=nil;
	aFII:=nil;
{a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de los préstamos. La lectura de los préstamos finaliza con ISBN -1. Las estructuras deben
ser eficientes para buscar por ISBN.}
	cargarArbol(a,a2);
	//imprimirArbol(a,a2);
{b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más grande.}
	masGrandeISBN(a);
{c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más pequeño.}
	masChicoISBN(a2);
{d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El módulo debe retornar la cantidad de préstamos realizados a dicho socio.}
	cantPresSocio(a);
{e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El módulo debe retornar la cantidad de préstamos realizados a dicho socio.}
	cantPresSocioLista(a2);
{f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces que se prestó.}
	armarArbolI(a,aFI);
	imprimirArbol(aFI);
{g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces que se prestó.}
	armarArbolII(a2,aFII);
	imprimirArbol(aFII);
{i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El módulo debe retornar la cantidad total de préstamos realizados a los ISBN comprendidos entre los dos valores recibidos (incluidos).}
	valRangoI(a);
{j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El módulo debe retornar la cantidad total de préstamos realizados a los ISBN comprendidos entre los dos valores recibidos (incluidos).}
	valRangoII(a2);
end.
