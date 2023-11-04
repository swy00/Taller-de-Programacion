program Ej1ModImperativo;
type
 
	cantMaterias = 1..36;
	vectorNotaObtenidas= array[cantMaterias] of integer;
 
	alumnos= record
			apellido:string;
			numAlum:integer;
			anoIngreso:integer;
			cantMatAprob:cantMaterias;
			vectorNotaObtenida:vectorNotaObtenidas;
			end;
 
	lista= ^nodo;
 
	nodo= record
		dato:alumnos;
		sig:lista;
	end;
 
procedure cargarVectorNotas (var v:vectorNotaObtenidas , cant:integer)
var
	notaMateria:integer;
begin
	for i:=1 to cant do 
	begin
		writeln('Ingresar Nota Obtenida en Materia',i)
		read(notaMateria);
		vectorNotas[i]:=notaMateria;
	end;
end;
 
procedure cargarInfoAlumno(var l:lista ,var numAluActual:integer);
var
	n: lista;
	numAlum,añoIngreso:integer;
	apellido:string;
	cantMateriasAprob:cantMaterias;
	vectorNotas: vectorNotaObtenidas;
begin
	new(n)
	writeln ('Ingresar Apellido');
	read(apellido);
	writeln ('Ingresar Num Alum');
	read(numAlu);
	writeln ('Ingresar Año de Ingreso');
	read(añoIngreso);
	writeln ('Ingresar Cantidad de materias aprobadas');
	read(cantMateriasAprob);
	cargarVectorNotas(vectorNotas,cantMateriasAprob);
	n^.dato.apellido :=apellido;
	n^.dato.numAlu:=numAlu;
	n^.dato.añoIngreso:=añoIngreso;
	n^.dato.cantMatAprob:=cantMateriasAprob;
	n^.dato.vectorNotaObtenida:=vectorNotas;
	numAluActual:=numAlu;
 
	if (l = nil) then
		l:=n;
		end
	else
		n^.sig:= l;
		l:=n;
	end;
end;
 
procedure cargarLista(var l:lista)
var
	numAluActual: integer;
begin
repeat
	cargarInfoAlumno(l,numAluActual);
until (numAluActual= 11111)
 
end;
 
function calcularPromedio():real;
begin
 
end;
 
 
 
 
var
 listaAlum: lista;
begin
crearLista(listaAlum);
end.
