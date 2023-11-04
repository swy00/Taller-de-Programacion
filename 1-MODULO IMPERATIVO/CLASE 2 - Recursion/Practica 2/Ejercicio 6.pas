{6.- Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero).

Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la
próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.}

program practica2_6;

procedure binario(a: integer; var bits: string);
begin
    if (a <> 0) then begin
        if (a mod 2 = 0) then
            bits := '0' + bits
        else
            bits := '1' + bits;
        a := a div 2;
        binario(a, bits);
    end;
end;

var
    numero: integer;
    bits: string;
begin
    numero:=-1;
    while (numero <> 0) do begin
        writeln;
        write('Numero en decimal: ');
        readln(numero);
        if (numero <> 0) then begin
            writeln;
            bits := '';
            binario(numero,bits);
            writeln(bits, ' es su valor en binario');
        end;
    end;
end.
