(*
Implementar un programa modularizado para una librería que:
a. Almacene los productos vendidos en una estructura eficiente para la búsqueda por código de producto. De cada producto deben quedar almacenados la cantidad total de unidades vendidas y el monto total. De cada venta se lee código de venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El ingreso de las ventas finaliza cuando se lee el código de venta -1.
b. Imprima el contenido del árbol ordenado por código de producto.
c. Contenga un módulo que reciba la estructura generada en el punto a y retorne el código de producto con mayor cantidad de unidades vendidas.
d. Contenga un módulo que reciba la estructura generada en el punto a y un código de producto y retorne la cantidad de códigos menores que él que hay en la estructura.
e. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de producto y retorne el monto total entre todos los códigos de productos comprendidos entre los dos valores recibidos (sin incluir)
*)

program tp4_1;

const
	corte = -1;

type
	t_producto = record
		codigo: integer;
		vendido: integer;
		montoTotal: real;
	end;

	t_venta = record
		codigo: integer;
		producto: integer;
		unidades: integer;
		precioUnitario: real;
	end;

	a_prods = ^n_prod;
	n_prod = record
		dato: t_producto;
		HI: a_prods;
		HD: a_prods;
	end;

var
	cantidadProds : integer;

procedure cargar_ventas(var productos: a_prods);
	procedure leerVenta(var venta: t_venta);
	begin
		write('Ingrese el codigo de venta: '); readln(venta.codigo);
		if (venta.codigo <> corte) then begin
			write('Ingrese el codigo del producto vendido: '); readln(venta.producto);
			write('Ingrese la cantidad de unidades vendidas: '); readln(venta.unidades);
			write('Ingrese el precio unitario: '); readln(venta.precioUnitario);
		end;
	end;

	procedure randomVenta(var venta: t_venta);
	begin
		venta.codigo := random(30) - 1;

		if (venta.codigo <> -1) then begin
			venta.producto := random(500);
			venta.unidades := random(100) + 1;
			venta.precioUnitario := random(10000) / 100;
		end;
	end;

	function buscar(productos: a_prods; codigo: integer; encontrado: boolean):boolean;
	begin
		if (productos <> nil) and (not encontrado) then begin
			if (productos^.dato.codigo = codigo) then
				encontrado := true
			else
				if (productos^.dato.codigo > codigo) then
					encontrado := buscar(productos^.HI, codigo, encontrado)
				else
					encontrado := buscar(productos^.HD, codigo, encontrado);
		end;
		buscar := encontrado;
	end;
	
	procedure agregar(var productos: a_prods; venta: t_venta);
	begin
		if (productos = nil) then begin
			new(productos);
			cantidadProds := cantidadProds + 1;
			productos^.dato.codigo := venta.producto;
			productos^.dato.vendido := venta.unidades;
			productos^.dato.montoTotal := venta.precioUnitario * venta.unidades;
			productos^.HI := nil;
			productos^.HD := nil;
		end
		else
			if (buscar(productos, venta.producto, false)) then begin
				productos^.dato.vendido := productos^.dato.vendido + venta.unidades;
				productos^.dato.montoTotal := productos^.dato.montoTotal + venta.precioUnitario * venta.unidades;
			end
			else
				if (productos^.dato.codigo > venta.producto) then
					agregar(productos^.HI, venta)
				else
					agregar(productos^.HD, venta);
	end;

var 
	venta: t_venta;
begin
	randomVenta(venta);
	while (venta.codigo <> corte) do begin
		agregar(productos, venta);
		randomVenta(venta);
	end;
end;

procedure imprimir_ordenado(productos: a_prods);
begin
	if (productos <> nil) then begin
		imprimir_ordenado(productos^.HI);
		writeln('Codigo del producto: ', productos^.dato.codigo);
		writeln('Unidades vendidas: ', productos^.dato.vendido);
		writeln('Monto total: ', productos^.dato.montoTotal:0:2);
		writeln;
		imprimir_ordenado(productos^.HD);
	end;
end;

function masVendido(productos: a_prods; maxVentas: integer; maxCod: integer) : integer;
begin
	if (productos <> nil) then begin
		if (productos^.dato.vendido > maxVentas) then begin
			maxVentas := productos^.dato.vendido;
			maxCod := productos^.dato.codigo;
		end;

		masVendido := masVendido(productos^.HI, maxVentas, maxCod);
		masVendido := masVendido(productos^.HD, maxVentas, maxCod);
	end
	else
		masVendido := maxCod;
end;

function cods_menores(productos: a_prods; codigo: integer) : integer;
begin
	if (productos <> nil) then begin
		if (productos^.dato.codigo < codigo) then
			cods_menores := 1 + cods_menores(productos^.HI, codigo) + cods_menores(productos^.HD, codigo)
		else
			cods_menores := cods_menores(productos^.HI, codigo);
	end
	else
		cods_menores := 0;
end;

function buscarHoja (A: a_prods; N: integer): a_prods;
begin
  if (A = NIL) then
    buscarHoja := NIL
  else if (A^.dato.codigo = N) then
    buscarHoja := A
  else
  begin
    buscarHoja := buscarHoja(A^.HI, N);
    if (buscarHoja = NIL) then
      buscarHoja := buscarHoja(A^.HD, N);
  end;
end;

var
	productos: a_prods;
	
begin
	randomize;
	productos := nil;
	cantidadProds := 0;

	cargar_ventas(productos);
	writeln('Cantidad de productos: ', cantidadProds);
	writeln('Presione ENTER para continuar...'); readln;

	imprimir_ordenado(productos);

	writeln('codigo prod mas vendido: ', masVendido(productos, -1, -1));
	writeln;

	writeln('codigos menores que 50: ', cods_menores(productos, 50));
	writeln;

	if (buscarHoja(productos, 50) = nil) then
		writeln('El producto con el codigo 50 no existe.')
	else
		writeln('El producto con el codigo 50 existe.');
	writeln;

end.
