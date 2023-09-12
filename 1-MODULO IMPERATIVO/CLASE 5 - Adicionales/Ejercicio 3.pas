{3. Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:

a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. La lectura finaliza con el código de producto igual a -1.

b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.

c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.

d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados.}


program practica5_3;

const
    dimF = 10;
    
type
    productos = record
        codigo,stock:integer;
        rubro:1..10;
        precio:real;
    end;
    
    arbol = ^nodo;
    
    nodo = record
        dato:productos;
        hi,hd:arbol;
    end;
    
    vector = array [1..dimF] of arbol;

///////////////inciso A//////////////////////

procedure leer(var r:productos);
begin
    writeln;
    writeln('-----------LEER---------');
    writeln;
    write('Codigo del producto: ');
    readln(r.codigo);
    if (r.codigo <> -1) then begin
        write('Stock del producto: ');
        readln(r.stock);
        write('Rubro del producto: ');
        readln(r.rubro);
        write('Precio por unidad: ');
        readln(r.precio);
    end;
end;

procedure imprimir(v:vector);
    procedure imprimirArbol(a:arbol);
    begin
        if (a <> nil) then begin
            imprimirArbol(a^.hi);
                writeln;
                writeln('Codigo del producto: ', a^.dato.codigo);
                writeln('Stock del producto:  ', a^.dato.stock);
                writeln('Precio por unidad    ', a^.dato.precio:0:2);
            imprimirArbol(a^.hd);
        end;
    end;
var
    i:integer;
    
begin
    writeln;
    writeln('-----------VECTOR DE ARBOLES--------');
    for i:=1 to dimF do begin
        if (v[i] <> nil) then begin
            writeln;
            writeln('Rubro: ',i);
            imprimirArbol(v[i]);
        end;
    end;
end;

procedure cargarVector(var v:vector);
var
    i:integer;
    
begin
    for i:=1 to dimF do
        v[i]:= nil;
end;

procedure agregar(var a:arbol; r:productos);
begin
    if (a = nil) then begin
        new(a);
        a^.dato:=r;
        a^.hi:=nil;
        a^.hd:=nil;
    end
    else if (a^.dato.codigo > r.codigo) then
        agregar(a^.hi,r)
    else
        agregar(a^.hd,r);
end;

procedure armarVector(var v:vector);
var
    r:productos;
    codigo:integer;
    
begin
    codigo:=0;
    while (codigo <> -1) do begin
        leer(r);
        codigo:=r.codigo;
        if (codigo <> -1) then begin
            agregar(v[r.rubro],r);
        end;
    end;
end;

///////////////inciso B//////////////////////
procedure existencia(v:vector);
    function existe(a:arbol; x:integer):boolean;
    begin
        if (a = nil) then
            existe:=false
        else begin
            if (a^.dato.codigo = x) then
                existe:=true
            else if (a^.dato.codigo > x) then
                existe:=existe(a^.hi,x)
            else
                existe:=existe(a^.hd,x);
        end;
    end;
var
    x,i:integer;
    esta:boolean;
    
begin
    esta:=false;
    writeln;
    write('Buscar el codigo: ');
    readln(x);
    for i:=1 to dimF do
        if (existe(v[i],x)) then begin
            writeln('El producto ',x,' existe en el arbol del rubro ',i);
            esta:=true;
        end;
    if (not esta) then
        writeln('El producto ',x,' no existe en ningun rubro');
end;

///////////////inciso C//////////////////////
procedure mayorCodigo(v:vector);
    procedure mayorCod(a:arbol; var mayor,stock:integer);
    begin
        if (a = nil) then begin
            mayor:=0;
            stock:=0;
        end
        else begin
            mayorCod(a^.hd,mayor,stock);
            if (a^.dato.codigo > mayor) then begin
                mayor:=a^.dato.codigo;
                stock:=a^.dato.stock;
            end;
        end;
    end;
    
var
    mayor,stock,i:integer;
    
begin
    mayor:=0;
    stock:=0;
    for i:=1 to dimF do begin
        if (v[i] <> nil) then begin
            mayorCod(v[i],mayor,stock);
            writeln;
            writeln('En el rubro ',i,' el producto de mayor codigo es ',mayor,' con un stock de ',stock,' unidades');
        end;
    end;
end;

///////////////inciso B//////////////////////
procedure rango(v:vector);
    function enRango(a:arbol; x,y:integer):integer;
    begin
        if (a = nil) then
            enRango:=0
        else if (a^.dato.codigo < x) then
            enRango(a^.hd,x,y)
        else if (a^.dato.codigo > y) then
            enRango(a^.hi,x,y)
        else
            enRango:= 1 + enRango(a^.hi,x,y) + enRango(a^.hd,x,y); 
    end;
var
    i,x,y:integer;
    
begin
    writeln;
    writeln('Ingrese dos valores para establecer un rango de busqueda');
    readln(x);
    readln(y);
    for i:=1 to dimF do begin
        if (v[i]<>nil) then
            if (enRango(v[i],x,y) > 0) then
                writeln('En el rubro ',i,' hay ',enRango(v[i],x,y),' productos dentro del rango')
            else
                writeln('En el rubro ',i,' no hay productos dentro del rango')
    end;
end;

//////////////PRINCIPAL///////////////
var
    v:vector;

begin
    cargarVector(v);
    armarVector(v); {inciso A}
    imprimir(v);
    existencia(v); {inciso B}
    mayorCodigo(v); {inciso C}
    rango(v); {inciso D}
end.
