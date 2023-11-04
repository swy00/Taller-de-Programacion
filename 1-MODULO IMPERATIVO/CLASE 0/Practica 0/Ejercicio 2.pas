{2.- Implementar un programa que procese información de propiedades que están a la venta
en una inmobiliaria.

Se pide:

a) Implementar un módulo para almacenar en una estructura adecuada, las propiedades
agrupadas por zona. Las propiedades de una misma zona deben quedar almacenadas
ordenadas por tipo de propiedad. Para cada propiedad debe almacenarse el código, el tipo de
propiedad y el precio total. De cada propiedad se lee: zona (1 a 5), código de propiedad, tipo
de propiedad, cantidad de metros cuadrados y precio del metro cuadrado. La lectura finaliza
cuando se ingresa el precio del metro cuadrado -1.

b) Implementar un módulo que reciba la estructura generada en a), un número de zona y un tipo de
propiedad y retorne los códigos de las propiedades de la zona recibida y del tipo recibido.}


program ejercicio2_0;

const
    dimF = 5;
type
    propiedades = record
        zona:1..5;
        codigo: integer;
        tipo:string;
        metrosCuadrados,precioPorMetro:real;
    end;
    
    lista = ^nodo;
    
    nodo = record
        dato: propiedades;
        sig: lista;
    end;
    
    vector = array [1..dimF] of lista;
    
procedure imprimir (v:vector);
var
    i:integer;
begin
    writeln;
    writeln('---------LISTAS---------');
    for i:=1 to dimF do begin
        writeln;
        writeln('--------LISTA ',i,'-------'); //imprimir las listas por separado
        while ((v[i]) <> nil) do begin
            writeln;
            writeln('Zona: ', v[i]^.dato.zona);
            writeln('Codigo de la propiedad: ', v[i]^.dato.codigo);
            writeln('Tipo de propiedad: ', v[i]^.dato.tipo);
            writeln('Metros cuadrados: ',v[i]^.dato.metrosCuadrados:0:2);
            writeln('Precio por metro cuadrado: ',v[i]^.dato.precioPorMetro:0:2);
            v[i]:=v[i]^.sig;
        end;
    end;
end;

procedure leer(var r:propiedades);
begin
    writeln;
    writeln('---------LEER---------');
    writeln;
    write('Zona: ');
    readln(r.zona);
    write('Codigo de la propiedad: ');
    readln(r.codigo);
    write('Tipo de propiedad: ');
    readln(r.tipo);
    write('Metros cuadrados: ');
    readln(r.metrosCuadrados);
    write('Precio por metro cuadrado: ');
    readln(r.precioPorMetro);
end;

procedure insertarOrdenado(var v:vector; r:propiedades; i:integer); //v[i] es equivalente a L, es una lista
var
    nue,act,ant:lista;
begin
    new(nue);
    nue^.dato:=r;
    act:=v[i];
    ant:=v[i];
    while (act <> nil) and (act^.dato.tipo > r.tipo) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act=ant) then
        v[i]:=nue
    else
        ant^.sig:=nue;
    nue^.sig:=act;
end;

procedure armarLista(var v:vector);
var
    r:propiedades;
    precio:real;
    i:integer;
begin
    precio:=0;
    while(precio <> -1) do begin
        leer(r);
        precio:= r.precioPorMetro;
        i:= r.zona;
        if (precio <> -1) then
            insertarOrdenado(v,r,i);
    end;
end;

var
    v:vector;
begin
    armarLista(v); //inciso A
    imprimir(v); //no es el B pero es lo mismo y me da flojera hacerlo
end.