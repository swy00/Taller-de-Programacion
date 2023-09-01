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
    
    ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo
    número de socio se encuentra entre los dos valores ingresados. Debe invocar a un módulo
    recursivo que reciba los dos valores leídos y retorne dicha cantidad.
    
    x. Informe los números de socio en orden creciente.
    
    xi. Informe los números de socio pares en orden decreciente.}

program practica3_1;

type
	socios = record
		numero, edad:integer;
		nombre:string;
	end;
	
	arbol = ^nodo;
	
	nodo  = record
		dato:socios;
		hi: arbol;
		hd: arbol;
	end;

procedure imprimirArbol(a:arbol); 
begin
	if (a<>nil) then begin
		imprimirArbol(a^.hi);
		writeln;
		writeln('Numero de socio: ', a^.dato.numero);
		writeln('Nombre: ', a^.dato.nombre);
		writeln('Edad  ', a^.dato.edad);
		writeln;
		imprimirArbol(a^.hd);
	end;
end;

procedure leer(var r:socios);
begin
	writeln;
	writeln('-------LEER---------');
	writeln;
	write('Numero de socio: ');
	readln(r.numero);
	if (r.numero <>0) then begin
		write('Nombre del socio: ');
		readln(r.nombre);
		write('Edad del socio: ');
		readln(r.edad);
	end;
end;

procedure agregar(var a:arbol; r:socios);
begin
	if (a=nil) then begin
		new(a);
		a^.dato:=r;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else  if (r.numero <= a^.dato.numero) then
		agregar(a^.hi,r)
	else
		agregar (a^.hd,r);
end;

procedure armarArbol(var a:arbol);
var
	r:socios;
	numero:integer;
begin
	numero:=-1;
	while (numero <> 0) do begin
		leer(r);
		numero:=r.numero;
		if (numero <> 0) then
			agregar(a,r);
	end;
end;

procedure masGrande(a:arbol; var max:integer); 
begin
	if (a<>nil) then begin
		masGrande(a^.hi,max);
			if (a^.dato.numero > max) or (max = 0) then
				max:=a^.dato.numero;
		masGrande(a^.hd,max);
	end;
end;

procedure masChico(a:arbol; var min:integer; var dato:socios); 
begin
	if (a<>nil) then begin
		masChico(a^.hi,min,dato);
			if (a^.dato.numero < min) or (min = 0) then begin
				min:=a^.dato.numero;
				dato.numero:=a^.dato.numero;
				dato.nombre:=a^.dato.nombre;
				dato.edad:=a^.dato.edad;
			end;
		masChico(a^.hd,min,dato);
	end;
end;

procedure mayorEdad(a:arbol; var max:integer); 
begin
	if (a<>nil) then begin
		mayorEdad(a^.hi,max);
			if (a^.dato.edad > max) or (max = 0) then
				max:=a^.dato.edad;
		mayorEdad(a^.hd,max);
	end;
end;

procedure sumarUno(a:arbol); 
begin
	if (a<>nil) then begin
		sumarUno(a^.hi);
			a^.dato.edad:=a^.dato.edad+1;
		sumarUno(a^.hd);
	end;
end;

procedure existeNumero(a:arbol; x:integer; var esta:boolean);
begin
	if (a<>nil) and not esta then begin
		existeNumero(a^.hi,x,esta);
			if (a^.dato.numero = x) then
				esta:=true;
		existeNumero(a^.hd,x,esta);
	end;
end;

procedure existeNombre(a:arbol; x:string; var esta:boolean);
begin
	if (a<>nil) and not esta then begin
		existeNombre(a^.hi,x,esta);
			if (a^.dato.nombre = x) then
				esta:=true;
		existeNombre(a^.hd,x,esta);
	end;
end;

procedure totalSocios(a:arbol; var total:integer);
begin
	if (a<>nil) then begin
		totalSocios(a^.hi,total);
			total:=total+1;
		totalSocios(a^.hd,total);
	end;
end;

procedure promEdad(a:arbol; var edadTotal:integer; total:integer);
begin
	if (a<>nil) then begin
		promEdad(a^.hi,edadTotal,total);
			edadTotal:=edadTotal+a^.dato.edad;
		promEdad(a^.hd,edadTotal,total);
	end;
end;

function prom(a,b:integer):real;
begin
    prom:=a/b;
end;

procedure sumEdades(a:arbol; var s:integer);
begin
	if (a<>nil) then begin
		sumEdades(a^.hi,s);
			s:=s+a^.dato.edad;
		sumEdades(a^.hd,s);
	end;
end;

procedure entreDosValores(a:arbol; var s:integer;c,b:integer);
begin
	if (a<>nil) then begin
		entreDosValores(a^.hi,s,c,b);
			if (a^.dato.numero >= c) and (a^.dato.numero <= b) then
			    s:=s+1;
		entreDosValores(a^.hd,s,c,b);
	end;
end;

function par(a:integer):boolean;
begin
    par:=(a mod 2 = 0);
end;

procedure ordenCrecientePares(a:arbol); 
begin
	if (a<>nil) then begin
		    ordenCrecientePares(a^.hi);
		    if par(a^.dato.numero) then begin
		        writeln;
		        writeln('Numero de socio: ', a^.dato.numero);
		        writeln('Nombre: ', a^.dato.nombre);
		        writeln('Edad  ', a^.dato.edad);
		        writeln;
		    ordenCrecientePares(a^.hd);
	    end;
	end;
end;

//-------PRINCIPAL------------

var
	a:arbol;
	max,min,mayor,valor,total,edadTotal,s,b,c:integer;
	socio:socios;
	esta,estaN:boolean;
	nombre:string;
	promedio:real;
	
begin //muchas variables podrian simplificarse y procesos compactarse, pero no quise hacerlo
      //tambien el proceso de recorrido puede ser un modulo dentro de cada modulo del programa principal
      //para asi no llenar de writeln; el programa principal e informar las cosas dentro del modulo
      //ver ejercicio 1 a completar para ver ejemplos de esto
	max:=0;
	min:=0;
	mayor:=0;
	s:=0;
	a:=nil;
	armarArbol(a); {Inciso principal}
	writeln;
	writeln('----------IMPRIMIR-----------');
	imprimirArbol(a);
	masGrande(a,max);  {Inciso 1}
	writeln;
	writeln('El numero de socio mas grande es ',max);
	masChico(a,min,socio); {Inciso 2}
	writeln;
	writeln('El numero de socio mas chico es ',min,' de nombre ',socio.nombre,' y de edad ',socio.edad,' años');
	mayorEdad(a,mayor); {Inciso 3}
	writeln;
	writeln('El numero de socio con mayor edad es ',mayor);
	sumarUno(a); {inciso 4}
	writeln('----------SUMAR A EDAD-----------');
	imprimirArbol(a);
	writeln;
	write('Valor: ');
	readln(valor);
	existeNumero(a,valor,esta); {inciso 5}
	if esta then
		writeln(valor, ' existe en el arbol')
	else
		writeln(valor, ' no existe en el arbol');
	writeln;
	write('Nombre: ');
	readln(nombre);
	existeNombre(a,nombre,estaN); {inciso 6}
	if estaN then
		writeln(nombre, ' existe en el arbol')
	else
		writeln(nombre, ' no existe en el arbol');
	totalSocios(a,total); {inciso 7}
	writeln;
	writeln('Hay ',total,' socios en total');
	promEdad(a,edadTotal,total);
	writeln;
	promedio:=prom(edadTotal,total); {inciso 8}
	writeln('Edad promedio: ',promedio:0:2,' años');
	sumEdades(a,s);             {inciso 9}
	writeln;
	writeln('Total de suma de edad ',s);
	writeln;
	s:=0;
	writeln('Ingrese dos valores');
	readln(c);
	readln(b);
	entreDosValores(a,s,c,b); {inciso 10}
	writeln;
	writeln('Total de socios dentro del rango: ',s);
	writeln('----------ORDEN CRECIENTE-----------');
	imprimirArbol(a); {inciso 11}
	writeln('----------ORDEN PARES-----------');
	ordenCrecientePares(a); {inciso 12}
end.