{1.- Se desea procesar la información de las ventas de productos de un comercio (como máximo
50).

Implementar un programa que invoque los siguientes módulos:

a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce el
día de la venta, código del producto (entre 1 y 15) y cantidad vendida (como máximo 99
unidades). El código debe generarse automáticamente (random) y la cantidad se debe leer. El
ingreso de las ventas finaliza con el día de venta 0 (no se procesa).

b. Un módulo que muestre el contenido del vector resultante del punto a).

c. Un módulo que ordene el vector de ventas por código.

d. Un módulo que muestre el contenido del vector resultante del punto c).

e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos
valores que se ingresan como parámetros.

f. Un módulo que muestre el contenido del vector resultante del punto e).

g. Un módulo que retorne la información (ordenada por código de producto de menor a
mayor) de cada código par de producto junto a la cantidad total de productos vendidos.

h. Un módulo que muestre la información obtenida en el punto g).}


program ejercicio1_1;
const
    dimF = 50;

type
    ventas = record
        dia:integer;
        codigo:1..15;
        cantidad:1..99;
    end;
    
    vector = array [1..dimF] of ventas;
    
    lista = ^nodo;
    
    nodo = record
        dato:ventas;
        sig:lista;
    end;

procedure imprimirVector(v:vector; dimL:integer);
var
    i:integer;
begin
    writeln;
    writeln('----IMPRIMIR VECTOR------');
    if (dimL = 0) then
        writeln('Vector vacio :(');
    for i:=1 to dimL do begin
        writeln;
        writeln('Dia de venta: ',v[i].dia);
        writeln('Codigo de venta: ',v[i].codigo);
        writeln('Cantidad de unidades vendidas: ',v[i].cantidad);
    end;
end;

procedure imprimirLista(l:lista);
begin
    writeln;
    writeln('----IMPRIMIR LISTA------');
    while(l<>nil) do begin
        writeln;
        writeln('Dia de venta: ',l^.dato.dia);
        writeln('Codigo de venta: ',l^.dato.codigo);
        writeln('Cantidad de unidades vendidas: ',l^.dato.cantidad);
        l:=l^.sig;
    end; 
end;

function aleatorio():integer;
begin
    randomize;
    aleatorio:= random(14) + 1;
end;

procedure leer(var r:ventas);
begin
    writeln;
    writeln('-------LEER-------');
    writeln;
    write('Dia de venta: ');
    readln(r.dia);
    if (r.dia <> 0) then begin
        write('Cantidad de unidades vendidas: ');
        readln(r.cantidad);
        r.codigo:=aleatorio();
    end;
end;

procedure crearVector(var v:vector; var dimL:integer);
var
    i,dia:integer;
    r:ventas;
begin
    dimL:=0;
    dia:=-1;
    i:=1;
    repeat
        leer(r);
        dia:=r.dia;
        if (dia <> 0) then begin
            v[i].dia:=r.dia;
            v[i].codigo:=r.codigo;
            v[i].cantidad:=r.cantidad;
            dimL:=dimL+1
        end;
        i:=i+1;
        ;
    until (i = dimF) or (dia = 0);
    writeln(dimL);
    
end;

procedure ordenarVector(var v:vector; dimL:integer);
var
    i,j:integer;
    aux:ventas;
begin
    for i:=1 to dimL-1 do begin
        for j:=i+1 to dimL do begin
            if (v[j].codigo<v[i].codigo) then begin
                aux:=v[i];
                v[i]:=v[j];
                v[j]:=aux;
            end;
        end;
    end;
end;

procedure eliminarDelVector(var v: vector; var dimL: integer);
var
    i, j, a, b: integer;
begin
    writeln;
    writeln('Ingrese dos codigos a eliminar del vector');
    readln(a);
    readln(b);
    j := 1;
    for i := 1 to dimL do begin
        if (v[i].codigo <> a) and (v[i].codigo <> b) then begin
            v[j]:= v[i];
            j:=j+1;
        end;
    end;
    dimL:= j-1;
end;

procedure insertarOrdenado(var l:lista; var v:vector; i:integer);
var
    nue,act,ant:lista;
    
begin
    new(nue);
    nue^.dato:=v[i];
    act:=l;
    ant:=l;
    while (act <> nil) and (v[i].codigo < act^.dato.codigo) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act=ant) then
        l:=nue
    else
        ant^.sig:=nue;
    nue^.sig:=act;
end;

function esPar(a:integer):boolean;
begin
    esPar:= (a Mod 2 = 0);
end;

procedure armarLista(var l:lista; v:vector; dimL:integer);
var
    i:integer;
    
begin
    for i:=1 to dimL do begin
        if (esPar(v[i].codigo)) then
            insertarOrdenado(l,v,i);
    end;
end;


// PRINCIPAL

var
    v:vector;
    dimL:integer;
    l:lista;
begin
  l:=nil;
  crearVector(v,dimL); {inciso A}
  imprimirVector(v,dimL); {inciso B}
  if (dimL <> 0) then begin
    ordenarVector(v,dimL); {Inciso C}
    imprimirVector(v,dimL); {inciso D}
    eliminarDelVector(v,dimL);{inciso E}
    imprimirVector(v,dimL);{inciso F}
    armarLista(l,v,dimL); {inciso G}
    imprimirLista(l); {Inciso H}
  end;
end.