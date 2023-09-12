(* Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la información de los autos en venta. Implementar un programa que:

a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y modelo) y los almacene en dos estructuras de datos:

    i.  Una estructura eficiente para la búsqueda por patente.
    ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben almacenar todos juntos los autos pertenecientes a ella.

b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la cantidad de autos de dicha marca que posee la agencia.

c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne la cantidad de autos de dicha marca que posee la agencia.

d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con la información de los autos agrupados por año de fabricación.

e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el modelo del auto con dicha patente.

f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el modelo del auto con dicha patente.
*)

program tp5_2;

type
  rangoAnios = 2010..2018;

  auto = record
    patente: string;
    anio: rangoAnios;
    marca: string;
    modelo: string;
  end;

  listaAutos = ^nodoAutos;
  nodoAutos = record
    dato: auto;
    sig: listaAutos;
  end;

  arbolPatentes = ^nodoPatentes;
  nodoPatentes = record
    dato: auto;
    HI, HD: arbolPatentes;
  end;

  arbolMarcas = ^nodoMarcas;
  nodoMarcas = record
    dato: listaAutos;
    HI, HD: arbolMarcas;
  end;

  vectorAnios = array[rangoAnios] of listaAutos;

procedure randomAuto(var a: auto);
  procedure randomPatente(var patente: string);
  var
    termina : boolean;
  begin
    termina := random(19) = 0;
    patente := '';
    if (not termina) then begin
      patente := patente + chr(random(26) + 65) + chr(random(26) + 65) + chr(random(26) + 65);
      patente := patente + chr(random(10) + 48) + chr(random(10) + 48) + chr(random(10) + 48);
    end;
  end;

  procedure randomMarca(var marca: string);
  var
    marcas: array[1..10] of string = ('Fiat', 'Ford', 'Chevrolet', 'Renault', 'Peugeot', 'Volkswagen', 'Toyota', 'Citroen', 'Honda', 'Nissan');
  begin
    marca := marcas[random(10) + 1];
  end;

  procedure randomModelo(var modelo: string);
  var
    modelos : array[1..10] of string = ('Uno', 'Ka', 'Corsa', 'Clio', '206', 'Gol', 'Corolla', 'C3', 'Fit', 'March');
  begin
    modelo := modelos[random(10) + 1];
  end;

begin
  randomPatente(a.patente);
  if (a.patente <> '') then begin
    a.anio := random(9) + 2010;
    randomMarca(a.marca);
    randomModelo(a.modelo);
  end;
end;

procedure cargar_patentes(var a_patentes: arbolPatentes; a: auto);
  procedure insertarNodo (var A: arbolPatentes; E: auto);
  begin
    if (A = NIL) then begin
      new(A);
      A^.dato:= E;
      A^.HI:= NIL;
      A^.HD:= NIL;
    end else
      if (E.patente <= A^.dato.patente) then
        insertarNodo(A^.HI, E)
      else
        insertarNodo(A^.HD, E); 
  end;
begin
  insertarNodo(a_patentes, a);
end;

procedure cargar_marcas(var a_marcas: arbolMarcas; a: auto);
  procedure insertarAdelante(var autos: listaAutos; a: auto);
  var
    aux: listaAutos;
  begin
    new(aux);
    aux^.dato := a;
    aux^.sig := nil;

    if (autos = NIL) then
      autos := aux
    else begin
      aux^.sig := autos;
      autos := aux;
    end;
  end;

  procedure insertarNodo (var A: arbolMarcas; E: auto);
  var
    marcaActual: string;
  begin
    if (A = NIL) then begin
      new(A);
      A^.dato := NIL;
      insertarAdelante(A^.dato, E);
      A^.HI:= NIL;
      A^.HD:= NIL;
    end else begin
      marcaActual := A^.dato^.dato.marca;
      if (E.marca = marcaActual) then
        insertarAdelante(A^.dato, E)
      else if (E.marca < marcaActual) then
        insertarNodo(A^.HI, E)
      else
        insertarNodo(A^.HD, E); 
    end;
  end;

begin
  insertarNodo(a_marcas, a);
end;

procedure cargar_autos(var a_patentes: arbolPatentes; var a_marcas: arbolMarcas);
var a: auto;
begin
  randomAuto(a);
  while (a.patente <> '') do begin
    cargar_patentes(a_patentes, a);
    cargar_marcas(a_marcas, a);
    randomAuto(a);
  end;
end;

procedure imprimirAuto(a: auto);
begin
    writeln('  Patente: ', a.patente);
    writeln('  Anio: ', a.anio);
    writeln('  Marca: ', a.marca);
    writeln('  Modelo: ', a.modelo);
    writeln;
end;

procedure imprimirAutos(a: listaAutos);
  procedure imprimirAutosRec(a: listaAutos);
  begin
    if (a <> nil) then begin
      imprimirAuto(a^.dato);
      imprimirAutosRec(a^.sig);
    end;
  end;

begin
  if (a <> nil) then begin
    writeln(a^.dato.marca);
    imprimirAutosRec(a);
  end;
end;

procedure imprimirPatentes(a: arbolPatentes);
begin
  if (a <> nil) then begin
    imprimirPatentes(a^.HI);
    imprimirAuto(a^.dato);
    imprimirPatentes(a^.HD);
  end;
end;

procedure imprimirMarcas(a: arbolMarcas);
begin
  if (a <> nil) then begin
    imprimirMarcas(a^.HI);
    imprimirAutos(a^.dato);
    imprimirMarcas(a^.HD);
  end;
end;

function totalNodos (A: arbolPatentes): integer;
begin
  if (A = NIL) then
    totalNodos := 0
  else
    totalNodos := 1 + totalNodos(A^.HI) + totalNodos(A^.HD);
end;

function totalAutosLista (L: listaAutos): integer;
begin
  if (L = NIL) then
    totalAutosLista := 0
  else
    totalAutosLista := 1 + totalAutosLista(L^.sig);
end;

function totalAutosMarca (A: arbolMarcas; marca: string): integer;
begin
  if (A = NIL) then
    totalAutosMarca := 0
  else begin
    if (A^.dato^.dato.marca = marca) then
      totalAutosMarca := totalAutosLista(A^.dato)
    else if (A^.dato^.dato.marca < marca) then
      totalAutosMarca := totalAutosMarca(A^.HD, marca)
    else
      totalAutosMarca := totalAutosMarca(A^.HI, marca);
  end;
end;

procedure generarVectorAnios(var v: vectorAnios; a: arbolPatentes);
  procedure insertarAdelante(var L: listaAutos; a: auto);
  var
    aux: listaAutos;
  begin
    new(aux);
    aux^.dato := a;
    aux^.sig := nil;

    if (L = NIL) then
      L := aux
    else begin
      aux^.sig := L;
      L := aux;
    end;
  end;

begin
  if (a <> nil) then begin
    generarVectorAnios(v, a^.HI);
    generarVectorAnios(v, a^.HD);
    insertarAdelante(v[a^.dato.anio], a^.dato)
  end;
end;

procedure totalAutosMarcas(a: arbolMarcas);
begin
  if (a <> nil) then begin
    totalAutosMarcas(a^.HI);
    WriteLn(a^.dato^.dato.marca, ': ', totalAutosMarca(a, a^.dato^.dato.marca));
    totalAutosMarcas(a^.HD);
  end;
end;

function buscarNodo(A: arbolPatentes; P: string): arbolPatentes;
begin
  if (A = NIL) then
    buscarNodo := NIL
  else if (A^.dato.patente = P) then
    buscarNodo := A
  else
    if (A^.dato.patente > P) then
      buscarNodo := buscarNodo(A^.HI, P)
    else
      buscarNodo := buscarNodo(A^.HD, P);
end;

var
  a_patentes: arbolPatentes;
  a_marcas: arbolMarcas;
  marca: string;
  v: vectorAnios;
  i: integer;
  patenteExistente: string;

begin
  randomize;
  cargar_autos(a_patentes, a_marcas);

  WriteLn('Autos: ', totalNodos(a_patentes));

  if (a_marcas <> nil) then begin
    writeln;
    totalAutosMarcas(a_marcas);
  end;

  if (a_patentes <> nil) then begin
    writeln;
    generarVectorAnios(v, a_patentes);
    for i:= 2010 to 2018 do
      if (v[i] <> nil) then
        WriteLn(i, ': ', totalAutosLista(v[i]));
  end;

  if (a_patentes <> nil) then begin
    writeln;
    patenteExistente := a_patentes^.dato.patente;
    writeln('Ingrese una patente: ', patenteExistente);
    WriteLn('Modelo: ', buscarNodo(a_patentes, patenteExistente)^.dato.modelo);
  end;

  if (a_marcas <> nil) then begin
    writeln;
    patenteExistente := a_marcas^.dato^.dato.patente;
    writeln('Ingrese una patente: ', patenteExistente);
    WriteLn('Modelo: ', buscarNodo(a_patentes, patenteExistente)^.dato.modelo);
  end;

  writeln;
end.
