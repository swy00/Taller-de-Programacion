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

f. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
alumno con mayor promedio.

g. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}


program practica3_3;

type
	
	finales = record
	    codigo,nota:integer;
	end;
	
	lista = ^nodoL;
	
	nodoL = record
	    dato:finales;
	    sig:lista;
	end;
	
	alumnos = record
		legajo, dni, ingreso:integer;
		notas:lista;
	end;
	
	arbol = ^nodoA;
	
	nodoA  = record
		datos:alumnos;
		hi: arbol;
		hd: arbol;
	end;

procedure imprimirArbol(a:arbol); 
    procedure imprimir(a:arbol);
    var
        tempLista: lista;  // Agrega esta variable temporal
    begin
        if (a <> nil) then begin
            imprimir(a^.hi);
            writeln;
            writeln('Legajo del alumno: ', a^.datos.legajo);
            writeln('DNI:               ', a^.datos.dni);
            writeln('Año de ingreso:    ', a^.datos.ingreso);
            writeln;
            
            // Hacer una copia temporal de la lista
            tempLista := a^.datos.notas;
            
            writeln('----NOTAS----');
            while (tempLista <> nil) do begin
                writeln;
                writeln('Final ', tempLista^.dato.codigo);
                writeln('Nota  ', tempLista^.dato.nota);
                tempLista := tempLista^.sig;  // Mover el puntero de la lista temporal
            end;
            writeln;
            imprimir(a^.hd);
        end;
    end;
begin
    writeln;
    writeln('-------IMPRIMIR ARBOL---------');
    imprimir(a);
end;


procedure agregarAdelante(var l:lista; f:finales);
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
    writeln;
	writeln('-------NOTAS---------');
    write('Codigo del final: ');
    readln(f.codigo);
    if (f.codigo <> -1) then begin
        write('Nota obtenida: ');
        readln(f.nota);
    end;
end;

procedure leerAlumnos(var r:alumnos);
var
    f:finales;
    codigo:integer;
    
begin
    codigo:=0;
    writeln;
	writeln('-------ALUMNO---------');
	writeln;
	write('Legajo alumno: ');
	readln(r.legajo);
	if (r.legajo <>0) then begin
		write('DNI: ');
		readln(r.dni);
		write('Año de ingreso:  ');
		readln(r.ingreso);
		writeln;
	    writeln('Notas de finales');
	    while (codigo <> -1) do begin
	        leerNotas(f);
	        codigo:=f.codigo;
	        if (f.codigo <> -1) then
	            agregarAdelante(r.notas,f);
	    end;
	end;
end;

procedure agregar(var a:arbol; r:alumnos);
begin
	if (a=nil) then begin
		new(a);
		a^.datos:=r;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else  if (r.legajo <= a^.datos.legajo) then
		agregar(a^.hi,r)
	else
		agregar (a^.hd,r);
end;

procedure armarArbol(var a:arbol);
var
    r:alumnos;
    numero:integer;

begin
    numero:=-1;
    while (numero <> 0) do begin
        leerAlumnos(r);
        numero:=r.legajo;
        if (numero <> 0) then begin
            agregar(a,r);
        end;
    end;
end;

procedure legajoInferior(a:arbol);
    procedure legajo(a:arbol; x:integer);
    begin
        if (a<>nil) then begin
            legajo(a^.hi,x);
                if (a^.datos.legajo < x) then begin
                    writeln;
                    writeln('DNI:            ',a^.datos.dni);
                    writeln('Año de ingreso: ',a^.datos.ingreso);
                end;
            legajo(a^.hd,x);
        end;
    end;
var
    x:integer;
    
begin
    writeln;
    write('Alumnos con legajo menor que: ');
    readln(x);
    writeln;
    writeln('---ALUMNOS QUE CUMPLEN----');
    legajo(a,x);
end;

procedure legajoMasGrande(a:arbol);
    procedure legajoMG(a:arbol; var max:integer);
    begin
        if (a<>nil) then begin
            legajoMG(a^.hi,max);
                if (a^.datos.legajo > max) then begin
                    max:=a^.datos.dni;
                end;
            legajoMG(a^.hd,max);
        end;
    end;
var
    max:integer;
    
begin
    max:=0;
    writeln;
    writeln('----------------------');
    writeln;
    legajoMG(a,max);
    writeln('Legajo mas grande ',max);
end;

procedure dniMasGrande(a:arbol);
    procedure dniMG(a:arbol; var max:integer);
    begin
        if (a<>nil) then begin
            dniMG(a^.hi,max);
                if (a^.datos.dni > max) then begin
                    max:=a^.datos.dni;
                end;
            dniMG(a^.hd,max);
        end;
    end;
var
    dni:integer;
    
begin
    dni:=0;
    writeln;
    writeln('----------------------');
    writeln;
    dniMG(a,dni);
    writeln('DNI mas grande ',dni);
end;

procedure legajoImpar(a:arbol);
    function esImpar(a:integer):boolean;
    begin
        esImpar:= (a mod 2 <> 0);
    end;
    
    procedure impar(a:arbol; var x:integer);
    begin
        if (a<>nil) then begin
            impar(a^.hi,x);
                if esImpar(a^.datos.legajo) then begin
                    x:=x+1;
                end;
            impar(a^.hd,x);
        end;
    end;
var
    x:integer;
    
begin
    x:=0;
    writeln;
    writeln('----------------------');
    impar(a,x);
    writeln;
    writeln('Hay ',x,' alumnos con legajo impar');
end;

procedure prom(l:lista; var promedioLista:real); //Sin la lista temporal se pierde el puntero de la original y en un segundo recorrido no va a funcionar
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

procedure mayorPromedio(a:arbol); 
    
    procedure promedio(a:arbol; var lg:integer; var p:real);
    var
        pr:real;
        
    begin
        if (a <> nil) then begin
            promedio(a^.hi, lg, p);
            prom(a^.datos.notas, pr);
            if (pr > p) then begin
                p:= pr;
                lg:= a^.datos.legajo;
            end;
            promedio(a^.hd, lg, p);
        end;
    end;
var
    lg:integer;
    p:real;
    
begin
    writeln;
    writeln('----------------------');
    promedio(a,lg,p);
    writeln;
    writeln('El alumno ',lg,' tiene el mayor promedio con ',p:0:2);
end;

procedure mayorPromedioCondicion(a:arbol);

    procedure cumplen(a:arbol;x:integer);
    var
        pr:real;
        promedioLista: real;
    begin
        if (a <> nil) then begin
            cumplen(a^.hi,x);
            prom(a^.datos.notas, pr);
                if (pr > x) then begin
                    writeln;
                    writeln('Legajo:   ',a^.datos.legajo);
                    writeln('Promedio: ',pr:0:2);
                end;
            cumplen(a^.hd,x);
        end;
    end;
var
    x:integer;
    
begin
    writeln;
    writeln('----------------------');
    writeln;
    write('Valor ');
    readln(x);
    writeln;
    writeln('---ALUMNOS QUE CUMPLEN CON PROMEDIO----');
    cumplen(a,x);

end;

var
    a:arbol;
    
begin
    a:=nil;
    armarArbol(a); {inciso A}
    imprimirArbol(a);
    legajoInferior(a); {inciso B}
    legajoMasGrande(a);  {inciso C}
    dniMasGrande(a); {inciso D}
    legajoImpar(a); {inciso E}
    mayorPromedio(a); {inciso F}
    mayorPromedioCondicion(a); {inciso G}
end.