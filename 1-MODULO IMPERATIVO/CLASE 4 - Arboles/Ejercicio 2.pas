{2. Una biblioteca nos ha encargado procesar la información de los préstamos realizados
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

program practica4_2;
type
    prestamos = record
        isbn,socio,dias:integer;
        fecha:string;
    end;
    
    arbol = ^nodo;
    
    nodo = record
        dato:prestamos;
        hi,hd:arbol;
    end;
    
    lista = ^nodo2;
    
    nodo2 = record
		dato:prestamos;
		sig:lista;
    end;
    
    prestamosISBN = record
		isbn:integer;
		pres:lista;
	end;
    
    arbol2 = ^nodo3;
    
    nodo3 = record
		dato: prestamosISBN;
		hi,hd:arbol2;
	end;
	
////////////INCISO A///////////////////

procedure imprimir(a,a3,a4:arbol;a2:arbol2);
    procedure impresion(a:arbol);
    begin
        if (a<>nil) then begin
            impresion(a^.hi);
            writeln;
            writeln('Codigo ISBN: ',a^.dato.isbn);
            if (a^.dato.fecha <> ' ') then begin
                writeln('Codigo de socio: ',a^.dato.socio);
                writeln('Fecha: ',a^.dato.fecha);
            end;
            writeln('Total de dias prestado: ',a^.dato.dias);
            impresion(a^.hd);
        end;
    end;
    
    procedure impresionArbolLista(a:arbol2);
    var
        aux:lista;
    begin
		if (a<>nil) then begin
			impresionArbolLista(a^.hi);
				writeln;
				writeln('Codigo ISBN: ',a^.dato.isbn);
				aux:=a^.dato.pres;
				while (aux <> nil) do begin
				    writeln;
					writeln('Codigo de socio: ',aux^.dato.socio);
					writeln('Fecha del prestamo: ',aux^.dato.fecha);
					writeln('Total de dias prestado ',aux^.dato.dias);
					aux:=aux^.sig;
				end;
			impresionArbolLista(a^.hd)
		end;
    end;
    
var
    aux,aux3,aux4:arbol;
    aux2:arbol2;

begin
    aux:=a;
    aux2:=a2;
    aux3:=a3;
    aux4:=a4;
    writeln;
    writeln('--------ARBOL PRESTAMOS------');
    impresion(aux);
    writeln;
    writeln('--------ARBOL LISTAS------');
    impresionArbolLista(aux2);
    writeln;
    writeln('--------ARBOL ISBN PRESTAMOS TOTALES DESDE PRESTAMOS------');
    impresion(aux3);
    writeln;
    writeln('--------ARBOL ISBN PRESTAMOS TOTALES DESDE LISTAS------');
    impresion(aux4);
end;

procedure leer(var r:prestamos);
begin
    writeln;
    writeln('---------LEER---------');
    writeln;
    write('Codigo ISBN: ');
    readln(r.isbn);
    if (r.isbn <> -1) then begin
        write('Numero de socio: ');
        readln(r.socio);
        write('Fecha del prestamo: ');
        readln(r.fecha);
        write('Dias totales del prestamo: ');
        readln(r.dias);
    end;
end;

procedure agregarAdelante(var l:lista;r:prestamos);
var
	nue:lista;
	
begin
	new(nue);
	nue^.dato:=r;
	nue^.sig:=l;
	l:=nue;
end;

procedure agregarPrestamos(var a:arbol; r:prestamos);
begin
    if (a = nil) then begin
        new(a);
        a^.dato:=r;
        a^.hd:=nil;
        a^.hi:=nil;
    end
    else if (a^.dato.isbn > r.isbn) then
        agregarPrestamos(a^.hi,r)
    else
        agregarPrestamos(a^.hd,r);
end;

procedure agregarISBNListas(var a:arbol2; r:prestamos);
begin
    if (a = nil) then begin
        new(a);
        a^.dato.isbn:=r.isbn;
		a^.dato.pres:=nil;
        a^.hd:=nil;
        a^.hi:=nil;
    end;
    
    if (r.isbn = a^.dato.isbn) then
        agregarAdelante(a^.dato.pres,r)
    else if (a^.dato.isbn > r.isbn) then
        agregarISBNListas(a^.hi, r)
    else
        agregarISBNListas(a^.hd, r);
end;

procedure armarArboles(var a:arbol; var a2:arbol2);
var
    isbn:integer;
    r:prestamos;
    
begin
    isbn:=0;
    while (isbn <> -1) do begin
        leer(r);
        isbn:=r.isbn;
        if (isbn <> -1) then begin
            agregarPrestamos(a,r);
            agregarISBNListas(a2,r);
        end;
    end;
end;

////////////INCISO B///////////////////
procedure mayorISBN_i(a:arbol);
    procedure mayor(a:arbol;var isbn:integer);
    begin
        if (a <> nil) then begin
            if(a^.hd<>nil) then begin
                if (a^.dato.isbn > isbn) then
                    isbn:=a^.dato.isbn;
                mayor(a^.hd,isbn);
            end
            else
                isbn:=a^.dato.isbn;
        end;
    end;
    
var
    isbn:integer;
    aux:arbol;

begin
    aux:=a;
    isbn:=0;
    mayor(aux,isbn);
    writeln;
    writeln('El mayor ISBN del primer arbol es ',isbn);
end;

////////////INCISO C///////////////////
procedure menorISBN_ii(a:arbol2);
    procedure menor(a:arbol2;var isbn:integer);
    begin
        if (a <> nil) then begin
            if(a^.hi<>nil) then begin
                if (a^.dato.isbn < isbn) or (isbn = 0) then
                    isbn:=a^.dato.isbn;
                menor(a^.hi,isbn);
            end
            else
                isbn:=a^.dato.isbn;
        end;
    end;
    
var
    isbn:integer;
    aux:arbol2;
    
begin
    isbn:=0;
    aux:=a;
    menor(aux,isbn);
    writeln;
    writeln('El menor ISBN del segundo arbol es ',isbn);
end;


////////////INCISO D///////////////////
procedure prestamosSocio_i(a:arbol);
    procedure prestamo(a:arbol; var contar:integer; x:integer);
    begin
        if (a <> nil) then begin
            prestamo(a^.hi,contar,x);
            if (a^.dato.socio = x) then
                contar:= contar + 1;
            prestamo(a^.hd,contar,x);
        end;
    end;
    
var
    contar,x:integer;
    aux:arbol;

begin
    contar:=0;
    aux:=a;
    writeln;
    write('Cantidad de prestamos al socio: ');
    readln(x);
    prestamo(aux,contar,x);
    writeln;
    writeln('El socio ',x,' tiene en total ',contar,' prestamos');
end;

////////////INCISO E///////////////////
procedure prestamosSocio_ii(a:arbol2);
    procedure prestamo(a:arbol2; var contar:integer; x:integer);
    var
        auxLista:lista;
        
    begin
        if (a <> nil) then begin
            prestamo(a^.hi,contar,x);
            auxLista:=a^.dato.pres;
            while (auxLista <> nil) do begin
                if (auxLista^.dato.socio = x) then
                    contar:= contar + 1;
                auxLista:=auxLista^.sig;
            end;
            prestamo(a^.hd,contar,x);
        end;
    end;
    
var
    contar,x:integer;
    aux:arbol2;

begin
    contar:=0;
    aux:=a;
    writeln;
    write('Cantidad de prestamos al socio: ');
    readln(x);
    prestamo(aux,contar,x);
    writeln;
    writeln('El socio ',x,' tiene en total ',contar,' prestamos');
end;

////////////INCISO F///////////////////
procedure prestamosTotalesISBN_i(var a:arbol; a2:arbol);
    procedure agregarISBN(var a:arbol; r:prestamos);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato.isbn:= r.isbn;
            a^.dato.dias:= r.dias;
            a^.dato.fecha:= ' ';
            a^.hd:= nil;
            a^.hi:= nil;
        end
        else if (a^.dato.isbn = r.isbn) then
            a^.dato.dias:= a^.dato.dias + r.dias
        else if (a^.dato.isbn > r.isbn) then
            agregarISBN(a^.hi, r)
        else
            agregarISBN(a^.hd, r);
    end;
    
    procedure armarArbol(var a:arbol; a2:arbol);
    begin
        if (a2 <> nil) then begin
            agregarISBN(a,a2^.dato);
            armarArbol(a,a2^.hi);
            armarArbol(a,a2^.hd);
        end;
    end;
    
var
    aux:arbol;
        
begin
    aux:=a2;
    armarArbol(a,aux);
end;

////////////INCISO G///////////////////
procedure prestamosTotalesISBN_ii(var a:arbol; a2:arbol2);
    function sumarDias(l:lista):integer;
    var
        total:integer;
    begin
        total:=0;
        while (l<>nil) do begin
            total:=total + l^.dato.dias;
            l:=l^.sig;
        end;
        sumarDias:=total;
    end;
    
    procedure agregarISBN(var a:arbol; r:prestamosISBN);
    var
        auxL:lista;
        
    begin
        auxL:=r.pres;
        if (a = nil) then begin
            new(a);
            a^.dato.isbn:= r.isbn;
            a^.dato.dias:= sumarDias(auxL);
            a^.dato.fecha:= ' ';
            a^.hd:= nil;
            a^.hi:= nil;
        end
        else if (a^.dato.isbn > r.isbn) then
            agregarISBN(a^.hi, r)
        else
            agregarISBN(a^.hd, r);
    end;
    
    procedure armarArbol(var a:arbol; a2:arbol2);
    begin
        if (a2 <> nil) then begin
            agregarISBN(a,a2^.dato);
            armarArbol(a,a2^.hi);
            armarArbol(a,a2^.hd);
        end;
    end;
    
var
    aux:arbol2;
        
begin
    aux:=a2;
    armarArbol(a,aux);
end;

////////////INCISO I///////////////////
procedure rango_i(a:arbol);
    function calcular(a: arbol; x,y,isbn: integer): integer;
    var
      total: integer;
    
    begin
      total:= 0;
      if (a <> nil) and (a^.dato.isbn = isbn) then begin
        total:= 1;
        total:= total + calcular(a^.hi,x,y,isbn) + calcular(a^.hd,x,y,isbn);
      end;
      calcular:= total;
    end;

    procedure informarRango(a: arbol; x,y:integer);
    var
        contador,isbn_actual:integer;
        
    begin
        if (a <> nil) then begin
            informarRango(a^.hi,x,y);
            if (a^.dato.isbn => x) and (a^.dato.isbn <= y) then begin
                isbn_actual := a^.dato.isbn;
                contador := calcular(a, x, y, isbn_actual); 
                writeln('El ISBN ', isbn_actual, ' tiene en total ', contador, ' prestamos');
                contador:=0;
            end;
            informarRango(a^.hd,x,y);
        end;
    end;

var
    aux:arbol;
    x,y:integer;
    
begin
    aux:=a;
    writeln;
    writeln('Ingrese un rango de ISBN para arbol I');
    readln(x);
    readln(y);
    informarRango(aux,x,y);
end;

////////////INCISO J///////////////////
procedure rango_ii(a:arbol2);
    function calcular(l:lista; x,y,isbn: integer): integer;
    var
      total: integer;
    
    begin
      total:= 0;
      while (l<>nil) do begin
        total:= total + 1;
        l:=l^.sig;
      end;
      calcular:= total;
    end;

    procedure informarRango(a: arbol2; x,y:integer);
    var
        contador,isbn_actual:integer;
        
    begin
        if (a <> nil) then begin
            informarRango(a^.hi,x,y);
            if (a^.dato.isbn => x) and (a^.dato.isbn <= y) then begin
                isbn_actual := a^.dato.isbn;
                contador := calcular(a^.dato.pres, x, y, isbn_actual); 
                writeln('El ISBN ', isbn_actual, ' tiene en total ', contador, ' prestamos');
            end;
            informarRango(a^.hd,x,y);
        end;
    end;

var
    aux:arbol2;
    x,y,contador:integer;
    
begin
    contador:=0; 
    aux:=a;
    writeln;
    writeln('Ingrese un rango de ISBN para arbol II');
    readln(x);
    readln(y);
    informarRango(aux,x,y);
end;

////////PRINCIPAL////////
var
    a,a3,a4:arbol;
    a2:arbol2;
    
begin
    a:=nil;
    a2:=nil;
    a3:=nil;
    a4:=nil;
    armarArboles(a,a2); {inciso A i y ii}
    mayorISBN_i(a); {inciso B}
    menorISBN_ii(a2); {inciso C}
    prestamosSocio_i(a); {inciso D}
    prestamosSocio_ii(a2); {inciso E}
    prestamosTotalesISBN_i(a3,a); {inciso F}
    prestamosTotalesISBN_ii(a4,a2); {inciso G}
    imprimir(a,a3,a4,a2); {inciso H}
    rango_i(a); {inciso I}
    rango_ii(a2); {inciso J}
end.
