{1.- Implementar un programa que invoque a los siguientes módulos.

a. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto, los
almacene en un vector con dimensión física igual a 10 y retorne el vector.

b. Un módulo que reciba el vector generado en a) e imprima el contenido del vector.

c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector..

d. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne la cantidad de caracteres leídos. El programa debe informar el valor retornado.

e. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne una lista con los caracteres leídos.

f. Un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en el
mismo orden que están almacenados.

g. Implemente un módulo recursivo que reciba la lista generada en e) e imprima los valores de
la lista en orden inverso al que están almacenados.}


program practica2_1;
const
    dimF = 10;
    
type 
    vector = array [1..dimF] of char;
    
    lista = ^nodo;
    
    nodo = record
        dato:char;
        sig:lista;
    end;

procedure cargarVector(var v:vector);
var
    i:integer;
begin
    for i:=1 to dimF do
        v[i]:=' ';
end;

procedure imprimirNormal(v:vector);
var
    i:integer;
begin
    writeln;
    writeln('------VECTOR-------');
    for i:=1 to dimF do begin
        if(v[i]<>' ') then
            writeln(v[i]);
    end;
end;

procedure imprimirRecursivaVector(v:vector; i:integer);
begin
    if (i <> dimF) and (v[i] <> ' ') then begin
        writeln(v[i]);
        imprimirRecursivaVector(v, i+1);
    end;
end;

procedure imprimirRecursivaLista(l:lista);
begin
    if (l <> nil) then begin
        writeln(l^.dato);
        l:=l^.sig;
        imprimirRecursivaLista(l);
    end;
end;

procedure imprimirRecursivaListaInvertida(l:lista);  //Las listas no tienen solo nil al final, tambien antes del inicio
begin                                               // NIL-NODO-NODO-...-NODO-NIL
    if (l <> nil) then begin                
        imprimirRecursivaListaInvertida(l^.sig);
        writeln(l^.dato);
    end;
end;

procedure leerRecursivoVector(var v: vector; var i: integer);
var
    caracter: char;
begin
    if (i <= dimF) then begin
        write('Escriba un caracter: ');
        readln(caracter);
        if (caracter <> '.') then begin
            i := i + 1;
            v[i] := caracter;
            leerRecursivoVector(v, i);
        end;
    end;
end;

procedure leerRecursivoYContar(var v2: vector; i:integer;var cont:integer);
var
    caracter:char;
begin
    if (i <= dimF) then begin
        write('Escriba un caracter para contar: ');
        readln(caracter);
        if (caracter <> '.') then begin
            cont:=cont+1;
            i:=i+1;
            v2[i]:=caracter;
            leerRecursivoYContar(v2,i,cont);
        end;
    end;
end;

procedure agregarAdelante(var l:lista; a:char);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=a;
    nue^.sig:=l;
    l:=nue;
end;

procedure leerRecursivoLista(var l:lista; caracter:char);
begin
    if (caracter <> '.') then begin
        write('Escriba un caracter para la lista: ');
        readln(caracter);
        if (caracter <> '.') then begin
        agregarAdelante(l,caracter);
        leerRecursivoLista(l,caracter);
        end;
    end;
end;

var
    v,v2:vector;
    i,cont:integer;
    l:lista;
    caracter:char;
    
begin
    cont:=0;
    cargarVector(V);
    leerRecursivoVector(v,i); {inciso A}
    imprimirNormal(v); {inciso B}
    writeln;
    writeln('------IMPRESION RECURSIVA-------');
    i:=1;
    imprimirRecursivaVector(v,i); {inciso C}
    writeln;
    leerRecursivoYContar(v2,i,cont); {inciso D}
    writeln;
    writeln('Se leyeron ',cont,' caracteres');
    writeln;
    leerRecursivoLista(l,caracter); {inciso E}
    writeln;
    writeln('------LISTA-------');
    imprimirRecursivaLista(l); {inciso F}
    writeln;
    imprimirRecursivaListaInvertida(l); {inciso G}
end.