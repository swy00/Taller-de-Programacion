{6.- Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero).}

program ej6p2;

procedure pasarBinario(num:integer; var stringBits:string);
	{Para pasra el valor a binario voy dividiendo por 2,con el resto checkeo si es un 1 o 0}
begin
	if (num <> 0) then begin
		if (num mod 2 = 1) then begin
			stringBits:= '1' + stringBits {no poner ; acá... no anda sino -.-}
		end
		else begin
			stringBits:= '0' + stringBits;
		end;
		num := num div 2;
		pasarBinario(num,stringBits);
	end;
end;

var
	num:integer;
	sBits:string;
begin
	num:=-1;
	{Como el programa lee numero hasta que se ingrese 0}
	while (num<>0) do begin
		writeln('Ingrese un numero decimal');
		read(num);
		writeln('-------------------');
		if(num <> 0) then begin
			sBits:= '';
			pasarBinario(num,sBits);
			writeln('El numero ',num,' en binario es ', sBits);
			writeln('-------------------');
			writeln();
		end;
	end;
end.
