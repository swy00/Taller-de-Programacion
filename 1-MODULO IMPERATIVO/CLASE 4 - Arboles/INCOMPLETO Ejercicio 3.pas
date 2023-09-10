{3. Una facultad nos ha encargado procesar la información de sus alumnos de la carrera XXX.
Esta carrera tiene 30 materias. Implementar un programa con:

a. Un módulo que lea la información de los finales rendidos por los alumnos y los
almacene en dos estructuras de datos.

    i. Una estructura que para cada alumno se almacenen sólo código y nota de las
    materias aprobadas (4 a 10). De cada final rendido se lee el código del alumno, el
    código de materia y la nota (valor entre 1 y 10). La lectura de los finales finaliza con
    nota -1. La estructura debe ser eficiente para buscar por código de alumno.
    
    ii. Otra estructura que almacene para cada materia, su código y todos los finales
    rendidos en esa materia (código de alumno y nota).

b. Un módulo que reciba la estructura generada en i. y un código de alumno y retorne los
códigos y promedios de los alumnos cuyos códigos sean mayor al ingresado.

c. Un módulo que reciba la estructura generada en i., dos códigos de alumnos y un valor
entero, y retorne la cantidad de alumnos con cantidad de finales aprobados igual al
valor ingresado para aquellos alumnos cuyos códigos están comprendidos entre los dos
códigos de alumnos ingresados.}

program practica4_3;
const
    dimF = 3;
    
type
    nota = 1..10;
    
    vector = array [1..dimF] of nota;
    
    finales = record
        alumno:integer;
        materia: 1..30;
        notas: vector;
    end;
    
    lista = ^nodo;
    
    nodo = record
        dato:finales;
        sig:lista;
    end;
    
    arbol = ^nodoA;
    
    nodoA = record
        dato:finales;
        hi,hd:arbol;
    end;
    
//////////Inciso A/////////////
procedure leer(r:finales);
var
    nota,dimL:integer;

begin
    writeln;
    writeln('-------LEER------');
    writeln;
    write('Codigo del alumno: ');
    readln(r.alumno);
    repeat
        write('Materia: ');
        readln(r.materia);
        write('Nota: ');
        readln(nota);
        if (nota <> -1) then begin
            r.notas[r.materia]:= nota;
            writeln(nota);
            dimL:=dimL+1;
        end;
    until (dimL = dimF) or (nota = -1);
end;

////////PRINCIPAL////////
var
    r:finales;
    
begin
    leer(r);
end.
