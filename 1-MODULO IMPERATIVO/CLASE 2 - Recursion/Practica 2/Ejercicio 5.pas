{5.- Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el
siguiente encabezado:

Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);

Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.}


program practica2_5;
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

procedure ordenarVector(var v:vector);
var
    i,j,actual:integer;
    
begin
    for i:=1 to dimF-1 do begin
        for j:=i+1 to dimF do begin
            if(v[j]<v[i]) then begin
                actual:=v[i];
                v[i]:=v[j];
                v[j]:=actual;
            end;
        end;
    end;
end;

Procedure busquedaDicotomica(v: vector; ini,fin,dato: integer; var pos:integer);
var
    medio:integer;
begin
    if (ini>fin) then begin
        pos := -1;
        writeln('No encontrado');
    end
    else begin
        medio := (ini+fin) div 2;
        
    if (v[medio] = dato) then begin
            pos := medio;
            writeln('Encontrado');
    end
    else if (v[medio] > dato) then
        busquedaDicotomica(v, ini, medio-1, dato, pos) // Buscar en la izquierda
    else
        busquedaDicotomica(v, medio+1, fin, dato, pos); // Buscar en la derecha
    end;
end;


var
    v:vector;
    i,valor,pos:integer;
begin
    randomize;
    i:=1;
    crearVector(v,i);
    ordenarVector(v);
    imprimir(v);
    writeln;
    write('Buscar: ');
    readln(valor);
    busquedaDicotomica(v,1,dimF,valor,pos);
end.