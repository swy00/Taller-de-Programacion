{3.- Implementar un programa que procese las ventas de un supermercado. 
El supermercado dispone de una tabla con los precios y stocks de los 1000 productos que tiene a la venta.

a) Implementar un módulo que retorne, en una estructura de datos adecuada, los tickets de las ventas.
De cada venta se lee código de venta y los productos vendidos. Las ventas finalizan con el código de
venta -1. De cada producto se lee código y cantidad de unidades solicitadas. Para cada venta, la lectura
de los productos a vender finaliza con cantidad de unidades vendidas igual a 0. El ticket debe contener:
- Código de venta
- Detalle (código de producto, cantidad y precio unitario) de los productos que se pudieron vender. En
caso de no haber stock suficiente, se venderá la máxima cantidad posible.
- Monto total de la venta.

c) Implementar un módulo que reciba la estructura generada en el inciso a) y un código de
producto y retorne la cantidad de unidades vendidas de ese código de producto.}


program ejercicio3_0;

const
    dimF = 10;
type

    vector = array [1..dimF] of record
        stock:integer;
        precio:real;
    end;
    
    lista2 = ^nodo2;
    
    tickets = record
        codigo:integer;
        detalle:lista2;
        total:real;
    end;
    
    productos = record
        codigoP,cantidad:integer;
        precio:real;
    end;
    
    nodo2 = record
        data:productos;
        sig:lista2;
    end;
    
    lista = ^nodo;
    
    nodo = record
        dato:tickets;
        sig:lista;
    end;

procedure imprimir(l:lista;p:integer);
var
    cont:integer;
begin
    cont:=0;
    writeln;
    writeln('-------TICKETS--------');
    writeln;
    while (l <> nil) do begin
        writeln('-----TICKET------');
        writeln('Codigo de venta: ',l^.dato.codigo);
        writeln;
        writeln('-----Detalle---');
        while (l^.dato.detalle <> nil) do begin
            writeln;
            writeln('Producto: ',l^.dato.detalle^.data.codigoP);
            writeln('Cantidad: ',l^.dato.detalle^.data.cantidad);
            writeln('Precio x unidad: ',l^.dato.detalle^.data.precio:0:2);
            if (l^.dato.detalle^.data.codigoP = p) then
                cont:=cont + l^.dato.detalle^.data.cantidad;
            l^.dato.detalle:=l^.dato.detalle^.sig;
        end;
        writeln;
        writeln('-----TOTAL A PAGAR----');
        writeln('Total: ',l^.dato.total:0:2,'$');
        l:=l^.sig;
    end;
    writeln;
    writeln('Se vendieron ',cont,' unidades del producto de codigo ',p);
end;

procedure cargarVector(var v:vector);{se dispone}
var
    i:integer;
begin
    Randomize;  //Funcion para generar numeros aleatorios
    for i:=1 to dimF do begin
        v[i].precio:=random(1000) + i; //Ilegal, pero funciona para probar el codigo
        v[i].stock:=random(100); 
    end;
end;

//no pude hallar una forma no absurdamente compleja de juntar ambos agregarAdelante :c

procedure agregarAdelanteProductos(var l:lista2; p:productos);
var
    nue:lista2;
begin
    new(nue);
    nue^.data:=p;
    nue^.sig:=l;
    l:=nue;
end;

procedure agregarAdelanteTickets(var l:lista; r:tickets);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=r;
    nue^.sig:=l;
    l:=nue;
end;

{procedure imprimirV(v:vector); //Testeo de que el vector funciona correctamente
var
    i:integer;
begin
    for i:=1 to dimF do begin
        writeln;
        writeln('Producto ',i);
        writeln('Stock: ',v[i].stock);
        writeln('Precio: ',v[i].precio:0:2,'$');
    end;
end;}

procedure leerProductos(var p:productos; var t:real;var v:vector);
begin
    writeln;
    write('Codigo del producto: ');
    readln(p.codigoP);
    write('Cantidad: ');
    readln(p.cantidad);
    if (p.cantidad <> 0) then begin
        if (v[p.codigoP].stock < p.cantidad) then //si hay menos stock que el solicitado entonces se vende el stock que haya
            p.cantidad:= v[p.codigoP].stock;
        v[p.codigoP].stock:= v[p.codigoP].stock - p.cantidad;
        p.precio:=v[p.codigoP].precio;
    end;
    t:=p.cantidad * p.precio; //esto sirve para obtener el total del ticket
end;
procedure leer(var r:tickets; var v:vector);
var
    p:productos;
    cantidadProducto:integer;
    precioTotal,t:real;
begin
    r.detalle:=nil;
    cantidadProducto:=-1;
    precioTotal:=0;
    writeln;
    writeln('-------LEER--------');
    writeln;
    write('Codigo de venta: ');
    readln(r.codigo);
    if(r.codigo <> -1) then begin
        writeln('Detalle');
        while (cantidadProducto <> 0) do begin
            leerProductos(p,t,v);
            precioTotal:=precioTotal + t; //esto sirve para obtener el total del ticket
            cantidadProducto:= p.cantidad;
            if (cantidadProducto <> 0) then
                agregarAdelanteProductos(r.detalle,p);
        end;
        r.total:= precioTotal;
    end;
end;

procedure armarLista(var l:lista);
var
    t:tickets;
    codigo:integer;
    v:vector;
begin
    cargarVector(v);
    codigo:=0;
    while (codigo <> -1) do begin
        leer(t,v);
        codigo:= t.codigo;
        if (codigo <> -1) then
            agregarAdelanteTickets(l,t);
    end;
end;

var
    l:lista;
    p:integer;
begin
    armarLista(l);
    
    writeln;
    write('Introduzca el codigo de un producto para conocer sus ventas (1-1000): ');
    readln(p);
    imprimir(l,p); //Segundo inciso (e impresion de lista)
end.