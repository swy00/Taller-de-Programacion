{Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
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

program ej2P5;
type
{---------- I ----------}
	auto = record
		patente:string;
		ano: 2010..2018;
		marca:string;
		modelo:string;
		end;
	
	arbolA =^nodoA;
	
	nodoA = record
		dato:auto;
		hi:arbolA;
		hd:arbolA;
		end;
	
{---------- II ----------}
	lista=^nodoLista;
	
	nodoLista = record
		dato:auto;
		sig:lista;
		end;
	
	marcas = record
		marca:string;
		auto:lista;
		end;
	arbolL = ^nodoM;
	
	nodoM = record
		dato:marcas;
		hi:arbolL;
		hd:arbolL;
		end;

{---------- D ----------}
	fabricacion = record
        fabri:integer;
        auto:lista
    end;
    
    arbolFabricacion = ^nodoF;
    
    nodoF = record
        dato:fabricacion;
        hi:arbolFabricacion;
        hd:arbolFabricacion;
    end;
	
procedure leer(var d:auto);
begin
	writeln('---- LECTURA DE AUTO ----');
	write('Introducir PATENTE: ');
	readln(d.patente);
	if (d.patente <> 'aaa') then begin
		write('Introducir ANIO: ');
		readln(d.ano);
		write('Introducir MARCA: ');
		readln(d.marca);
		write('Introducir MODELO: ');
		readln(d.modelo);
	end;
	writeln;
end;

procedure agregarLista(var l:lista;d:auto);
var
	aux:lista;
begin
	new(aux);
	aux^.dato.patente:=d.patente;
	aux^.dato.ano:=d.ano;
	aux^.dato.modelo:=d.modelo;
	aux^.sig:=l;
	l:=aux;
end;

procedure agregarArbolMarcas(var a:arbolL;d:auto);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.marca:=d.marca;
		agregarLista(a^.dato.auto,d);
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else begin
		if (a^.dato.marca = d.marca) then begin
            agregarLista(a^.dato.auto,d);
        end
        else if (a^.dato.marca > d.marca) then begin
            agregarArbolMarcas(a^.hi,d);
        end
        else if (a^.dato.marca <= d.marca) then begin
            agregarArbolMarcas(a^.hd,d);	
        end;
	end;
end;

procedure agregarArbolPatentes (var a:arbolA;d:auto);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:=d;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else if (a^.dato.patente > d.patente) then begin
		agregarArbolPatentes(a^.hi,d);
	end
	else begin
		agregarArbolPatentes(a^.hd,d);
	end;
end;


procedure crearArboles(var a:arbolA;var a2:arbolL);
var
	d:auto;
	patente:string;
begin
	patente:='';
	while (patente <> 'aaa') do begin
		leer(d);
		patente:=d.patente;
		if (patente <> 'aaa') then begin
			agregarArbolPatentes(a,d);
			agregarArbolMarcas(a2,d);
		end;
	end;
	
end;


procedure autosMarca(a:arbolA);

	procedure cuantosAutos(a:arbolA;d:string;var c:integer);
	begin
		if (a<>nil) then begin
			cuantosAutos(a^.hi,d,c);
			if (a^.dato.marca = d) then begin
				c:=c+1;
			end;
			cuantosAutos(a^.hd,d,c);
		end;
	end;
var
	marca:string;
	contador:integer;
begin
	marca:='';
	write('1-Introduzca marca para buscar total de autos: ');
	readln(marca);
	contador:=0;
	cuantosAutos(a,marca,contador);
	writeln('Se encontraron ',contador,' autos de marca ',marca);
	writeln;
end;


procedure autosMarcaLista(a:arbolL);

	function contarEnLista(a:lista):integer;
	begin
		contarEnLista:=0;
		if (a=nil) then begin
			contarEnLista:=0;
		end
		else begin
			while(a<>nil) do begin
				contarEnLista:=contarEnLista+1;
				a:=a^.sig;
			end;
		end;
	end;


	procedure cuantosAutosLista(a:arbolL;d:string;var c:integer);
	var
		aux:lista;
	begin
		if (a<>nil) then begin
			cuantosAutosLista(a^.hi,d,c);
			if (a^.dato.marca = d) then begin
				aux:=a^.dato.auto;
				c:=0;
				c:=contarEnLista(aux);
			end;
			cuantosAutosLista(a^.hd,d,c);
		end;
	
	end;

var
	marca:string;
	contador:integer;
begin
	marca:='';
	write('2-Introduzca marca para buscar total de autos: ');
	readln(marca);
	contador:=0;
	cuantosAutosLista(a,marca,contador);
	writeln('Se encontraron ',contador,' autos de marca ',marca);
	writeln;
end;


procedure armarArbolFabricacion(a:arbolA;var aF:arbolFabricacion);

	procedure agregarListaF(var l:lista;d:auto);
	var
		aux:lista;
	begin
		new(aux);
		aux^.dato.patente:=d.patente;
		aux^.dato.marca:=d.marca;
		aux^.dato.modelo:=d.modelo;
	end;
	
	procedure agregarArbolFabri(d:auto;var a:arbolFabricacion);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.fabri:=d.ano;
			agregarListaF(a^.dato.auto,d);
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else if (a^.dato.fabri = d.ano) then begin
			agregarListaF(a^.dato.auto,d);
		end
		else if (a^.dato.fabri > d.ano) then begin
			agregarArbolFabri(d,a^.hi);
		end
		else begin
			agregarArbolFabri(d,a^.hd);
		end;
		
	end;

begin
	if (a <> nil) then begin
		armarArbolFabricacion(a^.hi,aF);
		agregarArbolFabri(a^.dato,aF);
		armarArbolFabricacion(a^.hd,aF);
	end;
end;


procedure buscarPatenteII(a:arbolL);
    
    procedure busquedaPatente2(a:arbolL;p:string);
    var
        esta:boolean;
        aux:lista;
    begin
        esta:=false;
        if (a = nil) then begin
            writeln('Patente NO se encontro')
        end
        else  begin 
            aux:=a^.dato.auto;
            while (aux <> nil) do begin
                if (aux^.dato.patente = p) then begin
                    writeln('La patente ',p,' fue encontrada');
                    esta:=true;
                end;
                aux:=aux^.sig;
            end;
            if not esta then begin
                busquedaPatente2(a^.hi,p);
                busquedaPatente2(a^.hd,p);
            end;
        end;
    end;
var
    p:string;
begin
    writeln;
    write('Introducir patente para buscar en arbol ii: ');
    readln(p);
    busquedaPatente2(a,p);
end;


var
	a:arbolA;
	a2:arbolL;
	aF:arbolFabricacion;
begin
	a:=nil;
	a2:=nil;
	aF:=nil;
{i. Una estructura eficiente para la búsqueda por patente.

ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.}
	crearArboles(a,a2);
	
{b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la cantidad de autos de dicha marca que posee la agencia.}
	autosMarca(a);
{c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne la cantidad de autos de dicha marca que posee la agencia.}
	autosMarcaLista(a2);
{d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con la información de los autos agrupados por año de fabricación.}	
	armarArbolFabricacion(a,aF); 
{f) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el modelo del auto con dicha patente}
	//buscarPatenteII(a); //hacer
{f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el modelo del auto con dicha patente}
	buscarPatenteII(a2); 

end.
