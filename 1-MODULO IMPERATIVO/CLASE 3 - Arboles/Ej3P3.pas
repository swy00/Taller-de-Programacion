{3. Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y los almacene en
una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y
notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por
número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso
de las materias finaliza con el código de materia -1.
b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de
aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.
c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
e. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
alumno con mayor promedio.
f. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}

program Ej3P3;
type

	finales = record
		codigo:integer;
		nota:integer;
		end;
		
	lista=^nodoLista;
	
	nodoLista = record
		dato:finales;
		sig:lista;
		end;
	alumno = record
		legajo:integer;
		dni:integer;
		anoIngreso:integer;
		notasFinales:lista;
		end;
	
	arbol=^nodoArbol;
	
	nodoArbol = record
		dato:alumno;
		hi:arbol;
		hd:arbol;
		end;


procedure imprimirArbol(a:arbol); 
var
	tempLista: lista;  // Agrego variable temporal
begin
	if (a <> nil) then begin
		imprimirArbol(a^.hi);
		writeln;
		writeln('Legajo del alumno: ', a^.dato.legajo);
		writeln('DNI:               ', a^.dato.dni);
		writeln('Año de ingreso:    ', a^.dato.anoIngreso);
		writeln;
		
		// Para no perder el puntero inicial cuando la vaya a recorrer
		tempLista := a^.dato.notasFinales;
		
		writeln('----NOTAS----');
		while (tempLista <> nil) do begin
			writeln;
			writeln('Final ', tempLista^.dato.codigo);
			writeln('Nota  ', tempLista^.dato.nota);
			tempLista := tempLista^.sig;  // Mover el puntero de la lista temporal
		end;
		writeln;
		imprimirArbol(a^.hd);
	end;
end;


procedure agregarLista(var l:lista; f:finales);
var
	nue:lista;
begin
	new(nue);
    nue^.dato:=f;
    nue^.sig:=l;
    l:=nue;
end;

procedure leerNotas(var f:finales);
begin
	writeln('Intorducir Codigo De Final');
	readln(f.codigo);
	if (f.codigo <> -1) then begin
		writeln('Introducir Nota Final');
		readln(f.nota);
	end;
end;

procedure leerAlumno(var d:alumno);
var
	codigo:integer;
	f:finales;
begin
	codigo:=0; //Termino de leer notas con -1
	writeln('--LECTURA DE ALUMNO--');
	writeln('Ingresar Legajo de Alumno');
	readln(d.legajo);
	if(d.legajo <> 0) then begin
		write('DNI:');
		readln(d.dni);
		write('Año Ingreso:');
		readln(d.anoIngreso);
		while (codigo <> -1) do begin
			leerNotas(f);
			codigo:=f.codigo;
			if (codigo <> -1) then begin
				agregarLista(d.notasFinales,f);
			end;
		end;
	end;
	writeln('--LECTURA DE ALUMNO ',d.legajo,' FINALIZADA--');
	writeln();
end;
procedure agregar(var a:arbol; d:alumno); //agrego ordenado por NUM LEGAJO
begin
	if (a = nil) then begin
		new(a);
		a^.dato:=d;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else if (d.legajo <= a^.dato.legajo) then begin
		agregar(a^.hi,d);
	end
	else begin
		agregar(a^.hd,d);
	end;
end;

procedure armarArbol(var a:arbol);
var
	num:integer;
	d:alumno;
begin
	num:=-1; //Para finalizar la lectura con 0
	while (num <> 0) do begin
		leerAlumno(d);
		num:=d.legajo;
		if(num <> 0) then begin
			agregar(a,d);
		end;
	end;
end;

procedure inferiorAValor(a:arbol;v:integer);
begin
	if (a<> nil) then begin
		inferiorAValor(a^.hi,v);
		if (a^.dato.legajo < v) then begin
			writeln('El alumno ',a^.dato.legajo,' cumple con la condicion');
			writeln('El DNI del alumno es ',a^.dato.dni);
			writeln('El Año de Ingreso del alumno es ',a^.dato.anoIngreso);
		end;
		inferiorAValor(a^.hd,v);
	end;
end;

procedure legajoMayor(a:arbol; var max:integer);
begin
	if (a <> nil) then begin
		legajoMayor(a^.hd,max);
		if (a^.dato.legajo > max) then begin
			max:= a^.dato.legajo;
		end;
		legajoMayor(a^.hi,max);
	end;

end;

procedure dniMasGrande(a:arbol; var max:integer);
begin
	if (a <> nil) then begin
		dniMasGrande(a^.hd,max);
		if (a^.dato.dni > max) then begin
			max:= a^.dato.dni;
		end;
		dniMasGrande(a^.hi,max);
	end;

end;


procedure prom(l:lista; var promedioLista:real);
var
	total:real;
	cont:integer;
	temp:lista;
begin
	temp:=l;
	cont:=0;
	total:=0;
	while (temp <> nil) do begin
		total:= total + temp^.dato.nota;
		cont:= cont + 1;
		temp:= temp^.sig;
	end;
	if cont = 0 then
		promedioLista:= 0
	else
		promedioLista:=(total / cont);
end;


procedure mayorPromedio (a:arbol;var max:real;var l:integer);
var 
	p:real;
begin
	if (a <> nil) then begin
		mayorPromedio(a^.hi,max,l);
		prom(a^.dato.notasFinales,p);
		if (max < p) then begin
			max:=p;
		end;
		mayorPromedio(a^.hd,max,l);
	end;
end;



var
	a:arbol;
	vInferior,maxLegajo,dniMax,lMax:integer;
	maxProm:real;
begin
{a. Un módulo que lea información de alumnos de Taller de Programación y los almacene en
una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y
notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por
número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso
de las materias finaliza con el código de materia -1.}
	a:=nil;
	armarArbol(a);
	writeln();
	writeln('--IMPRIMIR ARBOL--');
	//imprimirArbol(a);
{b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.}
	writeln('Introducir Valor Para Encontrar Legajos Inferiores ');
	readln(vInferior);
	inferiorAValor(a,vInferior);
{c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.}
	maxLegajo:=0;
	legajoMayor(a,maxLegajo);
	writeln('El mayor legajo entre los alumnos fue ',maxLegajo);
{d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.}
	dniMax:=0;
	dniMasGrande(a,dniMax);
	writeln('El mayor DNI entre los alumnos fue ',dniMax);
{e. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del alumno con mayor promedio.}
	{-------- NO ANDA ---------------------}
	maxProm:=0;
	lMax:=0;
	mayorPromedio(a,maxProm,lMax);
	writeln('El legajo con mayor promedio fue ',lMax,' con un promedio de ',maxProm);
	{-------- NO ANDA ---------------------}
{f. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}

end.
