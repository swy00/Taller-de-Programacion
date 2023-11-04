{4. Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo
se lee código, DNI de la persona, año y tipo de reclamo. La lectura finaliza con el código de
igual a -1. Se pide:

a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.

b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.

c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.

d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido.}


program practica5_3;
    
type
    reclamos = record
        codigo,dni,annio:integer;
        tipo:string;
    end;
    
    lista = ^nodo;
    
    nodo = record
        dato:reclamos;
        sig:lista;
    end;
    
    listaReclamos = record
        dni:integer;
        reclamos:lista;
    end;
    
    arbol = ^nodo2;
    
    nodo2 = record
        dato:listaReclamos;
        hi,hd:arbol;
    end;

///////////////inciso A//////////////////////

procedure leer(var r:reclamos);
begin
    writeln;
    writeln('-----------LEER---------');
    writeln;
    write('Codigo del reclamo: ');
    readln(r.codigo);
    if (r.codigo <> -1) then begin
        write('DNI del reclamante: ');
        readln(r.dni);
        write('Año del reclamo: ');
        readln(r.annio);
        write('Tipo de reclamo: ');
        readln(r.tipo);
    end;
end;

procedure imprimir(a:arbol);
    procedure imprimirArbol(a:arbol);
    var
        aux:lista;
        
    begin
        if (a <> nil) then begin
            imprimirArbol(a^.hi);
                writeln;
                writeln('----RECLAMOS DEL DNI----  ', a^.dato.dni);
                aux:= a^.dato.reclamos;
                while (aux <> nil) do begin
                    writeln;
                    writeln('Codigo del reclamo: ', aux^.dato.codigo);
                    writeln('Año del reclamo:    ', aux^.dato.annio);
                    writeln('Tipo de reclamo:    ', aux^.dato.tipo);
                    aux:=aux^.sig;
                end;
            imprimirArbol(a^.hd);
        end;
    end;
    
begin
    writeln;
    writeln('-----------ARBOL DE LISTAS--------');
    imprimirArbol(a);
end;

procedure agregarAdelante(var l:lista; r:reclamos);
var
    nue:lista;

begin
    new(nue);
    nue^.dato.codigo:=r.codigo;
    nue^.dato.annio:=r.annio;
    nue^.dato.tipo:=r.tipo;
    nue^.sig:=l;
    l:=nue;
end;

procedure agregar(var a:arbol; r:reclamos; dni:integer);
begin
    if(a = nil) then begin
        new(a);
        a^.dato.dni:=dni;
        agregarAdelante(a^.dato.reclamos,r);
        a^.hi:=nil;
        a^.hd:=nil;
    end
    else begin
        if (a^.dato.dni = r.dni) then
            agregarAdelante(a^.dato.reclamos,r)
        else if (r.dni < a^.dato.dni) then
            agregar(a^.hi,r,dni)
        else
            agregar(a^.hd,r,dni);
    end;
end;

procedure armarArbol(var a:arbol);
var
    codigo:integer;
    r:reclamos;
    
begin
    codigo:=0;
    while (codigo <> -1) do begin
        leer(r);
        codigo:=r.codigo;
        if (codigo <> -1) then
            agregar(a,r,r.dni);
    end;
end;

///////////////inciso B//////////////////////
procedure cantidadReclamos(a:arbol);
    function cantidad(a:arbol;x:integer):integer;
    var
        aux:lista;
        
    begin
        if (a = nil) then
            cantidad:=0
        else begin
            if (a^.dato.dni = x) then begin
                aux:=a^.dato.reclamos;
                cantidad:=0;
                while (aux <> nil) do begin
                    cantidad:=cantidad + 1;
                    aux:=aux^.sig;
                end;
            end
            else if (a^.dato.dni < x) then
                cantidad:= cantidad(a^.hd,x)
            else
                cantidad:= cantidad(a^.hi,x);
        end;
    end;

var
    x:integer;
    
begin
    writeln;
    write('Cuantos reclamos tuvo el DNI: ');
    readln(x);
    if (cantidad(a,x) > 0) then
        writeln('El DNI ',x,' tuvo ',cantidad(a,x),' reclamos')
    else
        writeln('El DNI ',x,' no tuvo ningun reclamo');
end;

///////////////inciso C//////////////////////
procedure rangoReclamos(a:arbol);
    function cantidad(a:arbol;x,y:integer):integer;
    var
        aux:lista;
        total:integer;
        
    begin
        if (a = nil) then
            cantidad:=0
        else begin
            if (a^.dato.dni < x ) then
                cantidad:= cantidad(a^.hd,x,y)
            else if (a^.dato.dni > y ) then
                cantidad:= cantidad(a^.hi,x,y)
            else begin
                aux:=a^.dato.reclamos;
                while (aux <> nil) do begin
                    total:=0;
                    total:=total + 1;
                    aux:=aux^.sig;
                end;
            end;
            cantidad:= total + cantidad(a^.hd,x,y) + cantidad(a^.hi,x,y);
        end;
    end;

var
    x,y:integer;
    
begin
    writeln;
    writeln('Cuantos reclamos hicieron los DNI en el rango');
    readln(x);
    readln(y);
    if (cantidad(a,x,y) > 0) then
        writeln('Todos los DNI en el rango hicieron ',cantidad(a,x,y),' reclamos en total')
    else
        writeln('Ningun DNI en el rango hizo un reclamo');
end;

///////////////inciso D//////////////////////
procedure reclamosAnno(a:arbol);
    procedure reclamo(a:arbol; x:integer; var a2:arbol);
    var
        aux:lista;
        
    begin
        if (a = nil) then
            writeln('No hay reclamos')
        else begin
            aux:=a^.dato.reclamos;
            while (aux <> nil) do begin
                if (aux^.dato.annio = x) then
                    agregar(a2,aux^.dato,a^.dato.dni);
                aux:=aux^.sig;
            end;
            reclamo(a^.hi,x,a2);
            reclamo(a^.hd,x,a2);
        end;
    end;
    
var
    aux,a2:arbol;
    x:integer;
    
begin
    aux:=a;
    a2:=nil;
    writeln;
    writeln('Ingrese un año para obtener los reclamos de ese año');
    readln(x);
    reclamo(aux,x,a2);
    imprimir(a2);
end;

//////////////PRINCIPAL///////////////
var
    a:arbol;

begin
    a:=nil;
    armarArbol(a); {inciso A}
    imprimir(a);
    cantidadReclamos(a); {inciso B}
    rangoReclamos(a); {inciso C}
    reclamosAnno(a); {inciso D}
end.
