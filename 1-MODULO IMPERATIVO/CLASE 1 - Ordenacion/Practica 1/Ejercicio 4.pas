{4.- Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.

b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.

c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.

d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.

e. Muestre los precios del vector resultante del punto d).

f. Calcule el promedio de los precios del vector resultante del punto d).}

program practica1_4;

const
    dimF = 8;
    dimFRubro3 = 30;
    
type
    producto = record
        codigo:integer;
        rubro:1..8;
        precio:real;
    end;
    
    lista = ^nodo;
    
    nodo = record
        dato:producto;
        sig:lista;
    end;
    
    vector = array [1..dimF] of lista;
    
    vectorRubro3 = array [1..dimFRubro3] of producto;
    
procedure imprimirVector(v:vectorRubro3);
var
    i:integer;
begin
    writeln;
    writeln('--------IMPRIMIR VECTOR RUBRO 3-------');
    for i:=1 to dimFRubro3 do begin
        if(v[i].precio <> 0) then begin
            writeln;
            writeln('Codigo del producto: ',v[i].codigo);
            writeln('Precio del producto: ',v[i].precio:0:2);
        end;
    end;
end;

procedure imprimirListas(v:vector);
var
    i:integer;
begin
    writeln;
    writeln('--------IMPRIMIR LISTAS-------');
    writeln;
    for i:=1 to dimF do begin
        writeln;
        writeln('-------------LISTA ',i,'-------------');
        while (v[i] <> nil) do begin
            writeln;
            writeln('Codigo del producto: ',v[i]^.dato.codigo);
            writeln('Precio del producto: ',v[i]^.dato.precio:0:2);
            v[i]:=v[i]^.sig;
        end;
    end;
end;

procedure leer(var r:producto);
begin
    writeln;
    writeln('--------LEER-------');
    writeln;
    write('Codigo del producto: ');
    readln(r.codigo);
    write('Rubro [1:8]: ');
    readln(r.rubro);
    write('Precio del producto: ');
    readln(r.precio);
end;

procedure insertarOrdenado(var v:vector; r:producto; i:integer);
var
    nue,act,ant:lista;

begin
    new(nue);
    nue^.dato:=r;
    ant:=v[i];
    act:=v[i];
    while (act <> nil) and (r.codigo < v[i]^.dato.codigo) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act=ant) then
        v[i]:=nue
    else
        ant^.sig:=nue;
    nue^.sig:=act;
end;

procedure armarListas(var v:vector);
var
    i:integer;
    r:producto;
    precio:real;

begin
    precio:=-1;
    while (precio <> 0) do begin
        leer(r);
        precio:=r.precio;
        i:=r.rubro;
        if (precio <> 0) then
            insertarOrdenado(v,r,i);
    end;
end;

procedure armarVectorRubro3(v:vector; var v2:vectorRubro3; var dimLR3:integer);
var
    j:integer;
    
begin
    dimLR3:=0;
    j:=1;
    while (v[3] <> nil) do begin
        if (dimLR3 < dimFRubro3) then begin
            v2[j]:=v[3]^.dato;
            dimLR3:=dimLR3+1;
            j:=j+1;
        end;
        v[3]:=v[3]^.sig;
    end;
end;

procedure ordenarSeleccion(var v:vectorRubro3; dimLR3:integer);
var
    i,j,pos:integer;
    actual:producto;
    
begin
    for i:=1 to dimLR3-1 do begin
        pos:=i;
        for j:= i+1 to dimLR3 do
            if (v[j].precio < v[pos].precio) then
                pos:=j;
                
        actual:=v[pos];
        v[pos]:=v[i];
        v[i]:=actual;
    end;
end;

function promedio(v:vectorRubro3;dimLR3:integer):real;
var
    i:integer;
    total:real;
begin
    total:=0;
    for i:=1 to dimLR3 do begin
        total:=total+v[i].precio;
    end;
    promedio:=(total/dimLR3);
end;
    
//PRINCIAPL---------------

var
    v:vector;
    v2:vectorRubro3;
    dimLR3:integer;
    
begin
    armarListas(v); {inciso A}
    imprimirListas(v); {inciso B} //muestra todo el vector por legibilidad, entre ello los codigos
    armarVectorRubro3(v,v2,dimLR3); {inciso C}
    imprimirVector(v2);
    ordenarSeleccion(v2,dimLR3); {inciso D} 
    imprimirVector(v2); {inciso E}
    writeln;
    writeln('El promedio de precio del rubro 3 es de ',promedio(v2,dimLR3):0:2,'$'); {incicdo F}
end.

