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

////////////INCISO A///////////////////

procedure imprimir(a:arbol);
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
    
var
    aux:arbol;

begin
    aux:=a;
    writeln;
    writeln('--------ARBOL------');
    impresion(aux);
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

procedure agregarPrestamos(var a:arbol; r:prestamos);
begin
    if (a = nil) then begin
        new(a);
        a^.dato:=r;
        a^.hd:=nil;
        a^.hi:=nil;
    end
    else if (a^.dato.isbn >= r.isbn) then
        agregarPrestamos(a^.hi,r)
    else
        agregarPrestamos(a^.hd,r);
end;

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

procedure armarArboles(var a,a2:arbol);
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
            agregarISBN(a2,r);
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
procedure menorISBN_ii(a:arbol);
    procedure menor(a:arbol;var isbn:integer);
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
    aux:arbol;
    
begin
    isbn:=0;
    aux:=a;
    menor(aux,isbn);
    writeln;
    writeln('El menor  ISBN del segundo arbol es ',isbn);
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

////////////INCISO F///////////////////

procedure armarArbolISBN(var a:arbol; a2:arbol);
    procedure agregar(a,a2:arbol);
    begin
        if (a2 <> nil) then begin
            agregarISBN(a, a2^.dato);
            agregar(a, a2^.hi);
            agregar(a, a2^.hd);
        end;
    end;
var
    aux:arbol;
    
begin
    aux:=a2;
    agregar(a,aux);
end;


////////PRINCIPAL////////
var
    a,a2,a3:arbol;
    
begin
    a:=nil;
    a2:=nil;
    a3:=nil;
    armarArboles(a,a2); {inciso A i y ii}
    imprimir(a);
    imprimir(a2);
    mayorISBN_i(a); {inciso B}
    menorISBN_ii(a2);{inciso C}
    prestamosSocio_i(a);{inciso D}
    {PREGUNTAR INCISO E}
    armarArbolISBN(a3,a);
    imprimir(a3);
end.