{3.- Escribir un programa que:

a. Implemente un módulo recursivo que genere una lista de números enteros “random”
mayores a 0 y menores a 100. Finalizar con el número 0.

b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.

c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.

d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se
encuentra en la lista o falso en caso contrario.}


program practica2_3;

type

    lista = ^nodo;
    
    nodo = record
        dato:integer;
        sig:lista;
    end;
    
procedure imprimirLista(l:lista);
begin
    while (l <> nil) do begin
        writeln(l^.dato);
        l:=l^.sig;
    end;
end;
    
procedure agregarAdelante(var l:lista; n:integer);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=n;
    nue^.sig:=l;
    l:=nue;
end;

procedure crearLista(var l:lista; n:integer);
begin
    n:=random(100);
    if (n<>0) then begin
        agregarAdelante(l,n);
        crearLista(l,n);
    end;
end;

procedure minimo(l:lista; var min:integer);
begin
    if (l<>nil) then begin
        if (l^.dato < min) or (min = 0) then begin
            min:=l^.dato;
        end;
        minimo(l^.sig,min);
    end;
end;

procedure maximo(l:lista; var max:integer);
begin
    if (l<>nil) then begin
        if (l^.dato > max) or (max = 0) then begin
            max:=l^.dato;
        end;
        maximo(l^.sig,max);
    end;
end;

function esta(l:lista;a:integer):boolean;
begin
    if (l<> nil) then begin
        if (l^.dato = a) then
            esta:=true
        else
            esta:=esta(l^.sig,a);
    end;
end;

var
    l:lista;
    n,min,max,a:integer;
begin
    randomize;
    l:=nil;
    n:=-1;
    min:=0;
    max:=0;
    crearLista(l,n); {Inciso A}
    imprimirLista(l);
    minimo(l,min); {Inciso B}
    writeln;
    writeln('El valor minimo en la lista es: ',min);
    maximo(l,max); {Inciso C}
    writeln;
    writeln('El valor maximo en la lista es: ',max);
    writeln;
    writeln('Busca un numero');
    readln(a);
    if esta(l,a) then
        writeln('Numero ',a,' encontrado!')
    else
        writeln('Numero no encontrado');
end.
