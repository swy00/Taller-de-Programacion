{1. Escribir un programa que:
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol
binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
parámetro y que :
i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que
retorne dicho valor.
ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo
recursivo que retorne dicho socio.
iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que
retorne dicho valor.
iv. Aumente en 1 la edad de todos los socios.
v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a
un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a
un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
cantidad.
viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso
vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
xi. Informe los números de socio en orden creciente.
x. Informe los números de socio pares en orden decreciente.}


program Ej1P3;
type

socio= record
	num:integer;
	nombre:string;
	edad:integer;
	end;
	
arbol=^nodo;

nodo= record
	dato:socio;
	hi:arbol;
	hd:arbol;
	end;


procedure imprimirArbol(a:arbol); 
begin
	if (a<>nil) then begin
		imprimirArbol(a^.hi);
		writeln;
		writeln('Numero de socio: ', a^.dato.num);
		writeln('Nombre: ', a^.dato.nombre);
		writeln('Edad  ', a^.dato.edad);
		writeln;
		imprimirArbol(a^.hd);
	end;
end;

procedure agregar(var a:arbol;s:socio);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:=s;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else if (s.num <= a^.dato.num) then begin
		agregar(a^.hi,s);
	end
	else begin
		agregar(a^.hd,s);
	end;
end;

procedure leerSocio(var s:socio);
begin
	writeln('--LEER SOCIO--');
	writeln('Ingresar NUMERO de Socio');
	readln(s.num);
	if (s.num<>0) then begin
		writeln('Ingresar NOMBRE de Socio');
		readln(s.nombre);
		writeln('Ingresar EDAD de Socio');
		readln(s.edad);
		writeln('--LECTURA DE SOCIO FINALIZADA --')
	end
	else
		writeln('--LECTURA TERMINADA--')
end;

procedure cargarArbol (var a:arbol);
var
	n:integer;
	s:socio;
begin
	n:=-1;
	while (n<>0) do begin
		leerSocio(s);
		n:=s.num;
		if (n<>0) then begin
			agregar(a,s);
		end;
	end;
	imprimirArbol(a);
end;

procedure socioMayor(a:arbol; var max:integer);
begin
	if (a<>nil) then begin
		socioMayor(a^.hi,max);
			if (a^.dato.num > max) or (max = 0) then
				max:=a^.dato.num;
		socioMayor(a^.hd,max);
	end;
end;

procedure socioMenor(a:arbol;var min:integer;var dataSocio:socio);
begin
	if (a<>nil) then begin
		socioMenor(a^.hi,min,dataSocio);
			if (a^.dato.num < min) or (min = 0) then
				min:=a^.dato.num;
				dataSocio.nombre:=a^.dato.nombre;
				dataSocio.edad:=a^.dato.edad;	
		socioMenor(a^.hd,min,dataSocio);
	end;
end;
procedure mayorEdad (a:arbol; var mayor:integer; var num:integer);
begin
	if (a<>nil) then begin
		mayorEdad(a^.hi,mayor,num);
			if (a^.dato.edad > mayor) or (mayor = 0) then
				mayor:=a^.dato.edad;
				num:=a^.dato.num;
		mayorEdad(a^.hd,mayor,num);
	end;
end;

procedure aumentarEdad(var a:arbol);
begin
	if (a <> nil) then begin
		aumentarEdad(a^.hi);
		a^.dato.edad:=a^.dato.edad+1;
		aumentarEdad(a^.hd);
	end;
end;

procedure existeValor(a:arbol; v:integer;var existe:boolean);
begin
	if (a<>nil) and not existe then begin
		existeValor(a^.hi,v,existe);
			if (a^.dato.num = v) then
				existe:=true;
		existeValor(a^.hd,v,existe);
	end;
end;

procedure existeNombre(a:arbol; n:string;var existeN:boolean);
begin
	if (a<>nil) and not existeN then begin
		existeNombre(a^.hi,n,existeN);
			if (a^.dato.nombre = n) then 
				existeN:=true;
		existeNombre(a^.hd,n,existeN);
	end;
end;

procedure cantidadTotalSocios(a:arbol; var c:integer);
begin
	if (a<>nil) then begin
		cantidadTotalSocios(a^.hd,c);
		c:=c+1;
		cantidadTotalSocios(a^.hi,c);
	end;
end;

procedure calcPromEdad(a:arbol; var p:integer);
begin
	if (a<>nil) then begin
		cantidadTotalSocios(a^.hd,p);
		p:=p+a^.dato.edad;
		cantidadTotalSocios(a^.hi,p);
	end;
end;


procedure sociosParesDecreciente(a:arbol);
begin
	if (a <> nil) then begin
		sociosParesDecreciente(a^.hd);
		if ((a^.dato.num MOD 2) = 0) then begin
			writeln;
			writeln('Numero de socio: ', a^.dato.num);
			writeln('Nombre: ', a^.dato.nombre);
			writeln('Edad  ', a^.dato.edad);
			writeln;
		end;
		sociosParesDecreciente(a^.hi);
	end;
end;

var
	a:arbol;	
	max,min,mayor,numSocioMayor,valorEntero:integer;
	dataSocio:socio;
	existe,existeN:boolean;
	stringNombre:string;
	cantSocios,totalEdad:integer;
begin
{---INCISO A---}
	a:=nil;
	cargarArbol(a);
{---INCISO B---}
{i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que retorne dicho valor.}
	max:=0;
	socioMayor(a,max);
	writeln('El NUM de Socio mas grande es ',max);
{ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo recursivo que retorne dicho socio.}
	min:=0;
	socioMenor(a,min,dataSocio);
	writeln('El socio con el numero mas chico ',min,' de nombre ',dataSocio.nombre,' con una edad de ',dataSocio.edad);
	writeln();
{iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que retorne dicho valor.}
	mayor:=0;
	mayorEdad(a,mayor,numSocioMayor);
	writeln('El socio con mayor edad es ',numSocioMayor,' con una edad de ',mayor);
{iv. Aumente en 1 la edad de todos los socios.}
	aumentarEdad(a);
{v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un módulo recursivo que reciba el valor leído y retorne verdadero o falso.}
	writeln('Ingrese el valor entero que desea buscar:');
	readln(valorEntero);
	existe:=false;
	existeValor(a,valorEntero,existe);
	if (existe) then begin
		writeln('El valor introducido fue encontrado');
	end
	else begin
		writeln('El valor NO fue encontrado');
	end;
{vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.}
	writeln('Ingrese el nombre que desea buscar:');
	readln(stringNombre);
	existeN:=false;
	existeNombre(a,stringNombre,existeN);
	if (existeN) then begin
		writeln('El nombre introducido fue encontrado');
	end
	else begin
		writeln('El nombre NO fue encontrado');
	end;
{vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.}
	cantSocios:=0;
	cantidadTotalSocios(a,cantSocios);
	writeln('El numero total de socios fue de ',cantSocios);
{viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso}
	totalEdad:=0;
	calcPromEdad(a,totalEdad);
	writeln('El total entre todas las edades es de ',totalEdad);
	writeln('El promedio entre las edades de todos los socios fue de ',totalEdad/cantSocios);
{ix. Informe los números de socio en orden creciente.}
	imprimirArbol(a);
{x. Informe los números de socio pares en orden decreciente.}
	sociosParesDecreciente(a);
end.
