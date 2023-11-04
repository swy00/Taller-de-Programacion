{1.- Implementar un programa que procese la información de los alumnos de la Facultad de
Informática.

a) Implementar un módulo que lea y retorne, en una estructura adecuada, la información de
todos los alumnos. De cada alumno se lee su apellido, número de alumno, año de ingreso,
cantidad de materias aprobadas (a lo sumo 36) y nota obtenida (sin contar los aplazos) en cada
una de las materias aprobadas. La lectura finaliza cuando se ingresa el número de alumno
11111, el cual debe procesarse.

b) Implementar un módulo que reciba la estructura generada en el inciso a) y retorne número
de alumno y promedio de cada alumno.

c) Analizar: ¿qué cambios requieren los puntos a y b, si no se sabe de antemano la cantidad de
materias aprobadas de cada alumno, y si además se desean registrar los aplazos? ¿cómo
puede diseñarse una solución modularizada que requiera la menor cantidad de cambios?}


program ejercicio1_0;
const
    dimF = 36;
type
    vector = array [1..dimF] of real;
    
    alumnos = record
        nombreApellido: string;
        ingreso, numero: integer;
        materias: 1..36;
        notas: vector;
    end;
    
    lista = ^nodo;
    nodo = record
        alumno: alumnos;
        sig: lista;
    end;
    
procedure imprimir (l:lista);
var
    i:integer;
begin
    writeln;
    writeln('---------LISTA---------');
    while (l <> nil) do begin
        writeln;
        writeln('Numero de alumno: ', l^.alumno.numero);
        writeln('Nombre y apellido: ', l^.alumno.nombreApellido);
        writeln('Año de ingreso: ', l^.alumno.ingreso);
        writeln('Materias aprobadas: ',l^.alumno.materias);
        writeln;
        writeln('----Notas----');
        writeln;
        for i:=1 to dimF do begin
            if (l^.alumno.notas[i] <> 0) then
                writeln('Nota ',i,': ',l^.alumno.notas[i]:0:2);
        end;
        l:=l^.sig;
    end;
end;

procedure leerDatos(var r:alumnos);
var
    i:integer;
begin
    writeln('-----------Cargar datos----------');
    write('Numero de alumno: ');
    readln(r.numero);
    if (r.numero <> 111) then begin
        write('Nombre y apellido: ');
        readln(r.nombreApellido);
        write('Año de ingreso: ');
        readln(r.ingreso);
        write('Materias aprobadas: ');
        readln(r.materias);
        writeln('Notas por materia');
        for i:=1 to dimF do begin
            readln(r.notas[i])
        end;
    end;
end;

procedure agregarAdelante(var l:lista; r:alumnos);
var
    nue:lista;
begin
    new(nue);
    nue^.alumno:=r;
    nue^.sig:=l;
    l:=nue;
end;

procedure armarLista (var l:lista);
var
    num:integer;
    r:alumnos;
begin
    num:=0;
    while (num<>111) do begin
        leerDatos(r);
        num:= r.numero;
        if (num<>111) then
            agregarAdelante(l,r);
    end;
end;

function promedio (v:vector): real;
var
    i,cont:integer;
    total:real;
begin
    total:=0;
    cont:=0;
    for i:=1 to dimF do begin
        if (v[i] <> 0) then begin
            total:= total + v[i];
            cont:= cont + 1;
        end;
    end;
    promedio:=(total/cont);
end;

procedure procesarLista(l:lista);
var
    prom:real;
begin
    while (l<>nil) do begin
        prom:=promedio(l^.alumno.notas);
        writeln('El alumno ',l^.alumno.numero,' tiene un promedio de ',prom:0:2);
        l:=l^.sig;
    end;
end;

var
    l:lista;
begin
    l:=nil;
    armarLista(l);
    imprimir(l);
    procesarLista(l);
end.

