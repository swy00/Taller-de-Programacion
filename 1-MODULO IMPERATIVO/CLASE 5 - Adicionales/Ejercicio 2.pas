{2. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
información de los autos en venta. Implementar un programa que:

a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo) y los almacene en dos estructuras de datos:

    i. Una estructura eficiente para la búsqueda por patente.
    
    ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
    almacenar todos juntos los autos pertenecientes a ella.
    
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.

c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.

d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.

e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.

f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}


program practica5_2;
    
type
    autos = record
        patente, marca, modelo:string;
        fabricacion:2010..2018;
    end;
    
    arbol = ^nodo;
    
    nodo = record
        dato:autos;
        hi,hd:arbol;
    end;
    
    lista = ^nodo2;
    
    nodo2 = record
        dato:autos;
        sig:lista;
    end;
    
    marcas = record
        marca:string;
        auto:lista;
    end;
    
    arbolListas = ^nodo3;
    
    nodo3 = record
        dato:marcas;
        hi,hd:arbolListas;
    end;
    
    fabricacion = record
        fabri:integer;
        auto:lista
    end;
    
    arbolFabricacion = ^nodo4;
    
    nodo4 = record
        dato:fabricacion;
        hi,hd:arbolFabricacion;
    end;

///////////////inciso A//////////////////////

procedure leer(var r:autos);
begin
    writeln;
    writeln('-----------LEER---------');
    writeln;
    write('Patente del auto: ');
    readln(r.patente);
    if (r.patente <> 'zzz') then begin
        write('Año de fabricacion: ');
        readln(r.fabricacion);
        write('Marca del auto: ');
        readln(r.marca);
        write('Modelo del auto: ');
        readln(r.modelo);
    end;
end;

procedure agregarArbolPatentes(var a:arbol; r:autos);
begin
    if (a = nil) then begin
        new(a);
        a^.dato:=r;
        a^.hi:=nil;
        a^.hd:=nil;
    end
    else if (a^.dato.patente > r.patente) then
        agregarArbolPatentes(a^.hi,r)
    else
        agregarArbolPatentes(a^.hd,r);
end;

procedure agregarLista(var l:lista; r:autos);
var
    nue:lista;
    
begin
    new(nue);
    nue^.dato.patente:=r.patente;
    nue^.dato.modelo:=r.modelo;
    nue^.dato.fabricacion:=r.fabricacion;
    nue^.sig:=l;
    l:=nue;
end;

procedure agregarArbolMarcas(var a:arbolListas; r:autos);
begin
    if(a = nil) then begin
        new(a);
        a^.dato.marca:=r.marca;
        agregarLista(a^.dato.auto,r);
        a^.hi:=nil;
        a^.hd:=nil;
    end
    else begin
        if (a^.dato.marca = r.marca) then
            agregarLista(a^.dato.auto,r)
        else if (a^.dato.marca > r.marca) then
            agregarArbolMarcas(a^.hi,r)
        else if (a^.dato.marca <= r.marca) then
            agregarArbolMarcas(a^.hd,r);
    end;
end;

procedure armarArboles(var a:arbol; var a2:arbolListas);
var
    patente:string;
    r:autos;
    
begin
    patente:='';
    while (patente <> 'zzz') do begin
        leer(r);
        patente:=r.patente;
        if (patente <> 'zzz') then begin
            agregarArbolPatentes(a,r);
            agregarArbolMarcas(a2,r);
        end;
    end;
end;

procedure imprimir(a:arbol; a2:arbolListas; a3:arbolFabricacion);
    procedure imprimirArbol_i(a:arbol);
    begin
        if (a <> nil) then begin
            imprimirArbol_i(a^.hi);
                writeln;
                writeln('Patente del auto:            ', a^.dato.patente);
                writeln('Año de fabricacion del auto: ', a^.dato.fabricacion);
                writeln('Marca del auto:              ', a^.dato.marca);
                writeln('Modelo del auto:             ', a^.dato.modelo);
            imprimirArbol_i(a^.hd);
        end;
    end;
    
    procedure imprimirArbol_ii(a:arbolListas);
    var
        aux:lista;
        
    begin
        if (a<> nil) then begin
            imprimirArbol_ii(a^.hi);
                writeln;
                writeln('Marca: ', a^.dato.marca);
                aux:= a^.dato.auto;
                while (aux <> nil) do begin
                    writeln;
                    writeln('Patente del auto:            ', aux^.dato.patente);
                    writeln('Año de fabricacion del auto: ', aux^.dato.fabricacion);
                    writeln('Modelo del auto:             ', aux^.dato.modelo);
                    aux:=aux^.sig;
                end;
            imprimirArbol_ii(a^.hd);
        end;
    end;
    
    procedure imprimirArbol_iii(a:arbolFabricacion);
    var
        aux:lista;
        
    begin
        if (a<> nil) then begin
            imprimirArbol_iii(a^.hi);
                writeln;
                writeln('Año de fabricacion: ', a^.dato.fabri);
                aux:= a^.dato.auto;
                while (aux <> nil) do begin
                    writeln;
                    writeln('Patente del auto:            ', aux^.dato.patente);
                    writeln('Marca del auto:              ', aux^.dato.marca);
                    writeln('Modelo del auto:             ', aux^.dato.modelo);
                    aux:=aux^.sig;
                end;
            imprimirArbol_iii(a^.hd);
        end;
    end;
var
    aux:arbol;
    aux1:arbolListas;
    aux2:arbolFabricacion;
    
begin
    aux:=a;
    aux1:=a2;
    aux2:=a3;
    writeln;
    writeln('-----------ARBOL PATENTES--------');
    imprimirArbol_i(aux);
    writeln;
    writeln('------------ARBOL MARCAS---------');
    imprimirArbol_ii(aux1);
    writeln;
    writeln('-----ARBOL AÑO DE FABRICACION----');
    imprimirArbol_iii(aux2);
end;

///////////////inciso B//////////////////////
procedure cantidadMarcas_i(a:arbol);
    function contar(a:arbol; m:string):integer;
    begin
        if (a = nil) then
            contar:=0
        else begin
            if (a^.dato.marca = m) then
                contar:= contar + 1;
            contar:= contar + contar(a^.hi,m) + contar(a^.hd,m);
        end;
    end;
var
    m:string;
    
begin
    writeln;
    write('Busca una marca en arbol i: ');
    readln(m);
    writeln;
    writeln('La agencia tiene ',contar(a,m),' autos de esta marca');
end;

///////////////inciso C//////////////////////
procedure cantidadMarcas_ii(a:arbolListas);
    function contar(a: arbolListas; m: string): integer;
    var
        aux:lista;
    begin
        if (a = nil) then
            contar:= 0
        else begin
            if (a^.dato.marca = m) then begin
                aux:= a^.dato.auto;
                contar := 0;
                while (aux <> nil) do begin
                    contar := contar + 1;
                    aux := aux^.sig;
                end;
            end;
            contar:= contar + contar(a^.hi, m) + contar(a^.hd, m);
        end;
    end;

var
    m:string;
    
begin
    writeln;
    write('Busca una marca en arbol ii: ');
    readln(m);
    writeln;
    writeln('La agencia tiene ',contar(a,m),' autos de esta marca');
end;

///////////////inciso D//////////////////////
procedure agregarListaF(var l:lista; r:autos);
var
    nue:lista;
    
begin
    new(nue);
    nue^.dato.patente:=r.patente;
    nue^.dato.marca:=r.marca;
    nue^.dato.modelo:=r.modelo;
    nue^.sig:=l;
    l:=nue;
end;

procedure agregarArbolFabricacion(var a3:arbolFabricacion; r:autos);
begin
    if(a3 = nil) then begin
        new(a3);
        a3^.dato.fabri:=r.fabricacion;
        agregarListaF(a3^.dato.auto,r);
        a3^.hi:=nil;
        a3^.hd:=nil;
    end
    else begin
        if (a3^.dato.fabri = r.fabricacion) then
            agregarListaF(a3^.dato.auto,r)
        else if (a3^.dato.fabri > r.fabricacion) then
            agregarArbolFabricacion(a3^.hi,r)
        else if (a3^.dato.fabri <= r.fabricacion) then
            agregarArbolFabricacion(a3^.hd,r);
    end;
end;

procedure armarArbolFabricacion(a:arbol; var a3:arbolFabricacion);
begin
    if (a <> nil) then begin
        armarArbolFabricacion(a^.hi,a3);
        agregarArbolFabricacion(a3,a^.dato);
        armarArbolFabricacion(a^.hd,a3);
    end;
end;

///////////////inciso E//////////////////////
procedure buscarPatente_i(a:arbol);
    procedure busqueda(a:arbol;p:string);
    begin
        if (a = nil) then
            writeln('Patente no encontrada')
        else  begin 
            if (a^.dato.patente = p) then
                write('Patente ',p,' encontrada')
            else if (a^.dato.patente > p) then
                busqueda(a^.hi,p)
            else
                busqueda(a^.hd,p);
        end;
    end;

var
    p:string;
    
begin
    writeln;
    write('Buscar la patente en arbol i: ');
    readln(p);
    writeln;
    busqueda(a,p);
end;

///////////////inciso F//////////////////////
procedure buscarPatente_ii(a:arbolListas);
    procedure busqueda(a:arbolListas;p:string);
    var
        encontrada:boolean;
        aux:lista;
        
    begin
        encontrada:=false;
        if (a = nil) then
            writeln('Patente no encontrada')
        else  begin 
            aux:=a^.dato.auto;
            while (aux <> nil) do begin
                if (aux^.dato.patente = p) then begin
                    writeln('Patente ',p,' encontrada');
                    encontrada:=true;
                end;
                aux:=aux^.sig;
            end;
            if not encontrada then begin
                busqueda(a^.hi,p);
                busqueda(a^.hd,p);
            end;
        end;
    end;

var
    p:string;
    
begin
    writeln;
    write('Buscar la patente en arbol ii: ');
    readln(p);
    writeln;
    busqueda(a,p);
end;

/////////PRINCIPAL///////////
var
    a:arbol;
    a2:arbolListas;
    a3:arbolFabricacion;

begin
    a:=nil;
    a2:=nil;
    a3:=nil;
    armarArboles(a,a2); {inciso A i y ii}
    cantidadMarcas_i(a); {inciso B}
    cantidadMarcas_ii(a2); {inciso C}
    armarArbolFabricacion(a,a3); {inciso D}
    buscarPatente_i(a); {inciso E}
    buscarPatente_ii(a2); {inciso F}
    imprimir(a,a2,a3);
end.