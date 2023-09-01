{4.- Escribir un programa con:

a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y
menores a 100.

b. Un módulo recursivo que devuelva el máximo valor del vector.

c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.}


program practica2_4;
const
    dimF = 20;
type
    vector = array [1..dimF] of integer;
    
procedure imprimir(v:vector);
var
    i:integer;
begin
    for i:=1 to dimF do
        writeln(v[i]);
end;
    
procedure crearVector(var v:vector; i:integer);
var
    n:integer;
begin
    if (i<=dimF) then begin
        n:=random(98)+1;
        v[i]:=n;
        i:=i+1;
        crearVector(v,i);
    end;
end;

procedure maximo(v:vector; var max:integer;i:integer);
begin
    if (i<=dimF) then begin
        if (v[i] > max) or (max = 0) then begin
            max:=v[i];
        end;
        maximo(v,max,i+1);
    end;
end;

procedure suma(v:vector; var s:integer; i:integer);
begin
    if (i<=dimF) then begin
        s:=s+v[i];
        suma(v,s,i+1);
    end;
end;

var
    v:vector;
    i,s,max:integer;
begin
    randomize;
    max:=0;
    i:=1;
    crearVector(v,i); {Inciso A}
    imprimir(v);
    maximo(v,max,i); {Inciso B}
    writeln;
    writeln('El valor maximo en es: ',max);
    suma(v,s,i);
    writeln;
    writeln('La suma de los elementos es: ',s);
end.