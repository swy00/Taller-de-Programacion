{1. El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
de las expensas de dichas oficinas. Implementar un programa con:

a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se debe leer, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación -1.

b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.

c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.

d) Un módulo recursivo que retorne el monto total de las expensas.}


program practica5_1;

const
    dimF = 300;
    
type
    oficinas = record
        dni,ident:integer;
        expensas:real;
    end;
    
    vector = array [1..dimF] of oficinas;

///////////////inciso A//////////////////////
procedure imprimir(v:vector);
var
    i:integer;
    
begin
    writeln;
    writeln('------IMPRIMIR VECTOR--------');
    for i:=1 to dimF do begin
        if (v[i].dni <> 0) then begin
            writeln;
            writeln('Codigo de identificacion: ',v[i].ident);
            writeln('DNI del propietario:      ',v[i].dni);
            writeln('Expensas:                 ',v[i].expensas:0:2);
        end;
    end;
end;

procedure leer(var o:oficinas);
begin
    writeln;
    writeln('-----------LEER---------');
    writeln;
    write('Codigo de identificación: ');
    readln(o.ident);
    if (o.ident <> -1) then begin
        write('DNI del propietario: ');
        readln(o.dni);
        write('Expensas: ');
        readln(o.expensas);
    end;
end;

procedure armarVector(var v:vector);
var
    o:oficinas;
    identificacion,i:integer;
    
begin
    identificacion:=0;
    i:=1;
    while (identificacion <> -1) do begin
        leer(o);
        identificacion:=o.ident;
        if (identificacion <> -1) then begin
            v[i]:=o;
            i:=i+1;
        end;
    end;
    imprimir(v);
end;

///////////////inciso B//////////////////////
procedure ordenarVector(var v:vector);
var
    i,j:integer;
    act:oficinas;
    
begin
    for i:=2 to dimF do begin
        act:=v[i];
        j:=i-1;
        while (j>0) and (v[j].ident > act.ident) do begin
            v[j+1]:=v[j];
            j:=j-1;
        end;
        v[j+1]:=act;
    end;
    imprimir(v);
end;

///////////////inciso C//////////////////////
procedure busquedaDicotomica(v:vector);
    procedure buscar(v:vector; ini,fin,codigo:integer; var pos:integer);
    var
        medio:integer;
        
    begin
        if (ini > fin) then begin
            pos:= -1;
            writeln;
            writeln('Codigo no encontrado');
        end
        else begin
            medio:= (ini+fin) div 2;
            
        if (v[medio].ident = codigo) then begin
            pos:=medio;
            writeln;
            writeln('Codigo encontrado en la posicion ',pos);
        end
        else if (v[medio].ident > codigo) then
            buscar(v,ini,medio-1,codigo,pos)
        else
            buscar(v,medio+1,fin,codigo,pos);
        end;
    end;
var
    codigo,pos:integer;
    
begin
    writeln;
    write('Ingrese un codigo para buscar: ');
    readln(codigo);
    buscar(v,1,dimF,codigo,pos);
end;

///////////////inciso D//////////////////////
procedure totalExpensas(v:vector);
    function expensas(v:vector; i:integer):real;
    begin
        if (i <> dimF) then begin
            expensas:=expensas + v[i].expensas + expensas(v,i+1);
        end;
    end;
var
    i:integer;
    
begin
    i:=1;
    writeln;
    writeln('El monto total de las expensas es ',expensas(v,i):0:2);
end;

/////////PRINCIPAL///////////
var
    v:vector;

begin
    armarVector(v); {inciso A}
    ordenarVector(v); {inciso B}
    busquedaDicotomica(v); {inciso C}
    totalExpensas(v); {inciso D}
end.

