program act2ej3;
type
	rang=0..99;
	lista=^nodo;
	nodo=record
		ele:rang;
		sig:lista;
	end;
procedure agregar(var l:lista;num:rang);
var
	nue:lista;
begin
	new(nue);
	nue^.ele:=num;
	nue^.sig:=l;
	l:=nue;
end;
procedure cargar(var l:lista);
var
	n:rang;
begin
	Randomize;
	n:=random(100);
	while n<>0 do
	begin
		agregar(l,n);
		n:=random(100);
	end;
end;
procedure mini(l:lista;var min:rang);
begin
	if l<>nil then
	begin
		if l^.ele<min then
			min:=l^.ele;
		l:=l^.sig;
		mini(l,min);
	end;
end;
procedure buscar(l:lista;num:rang;var esta:boolean);
begin
	if l<>nil then
	begin
		if l^.ele<> num then
		begin
			l:=l^.sig;
			buscar(l,num,esta);
		end
		else
			esta:=true;
		end;	
	end;		
var
	l:lista;
	min,n:rang;
	e:boolean;
begin
	e:=false;
	min:=99;
	l:=nil;
	cargar(l);
	mini(l,min);
	writeln(min);
	readln(n);
	buscar(l,n,e);
	writeln(e);
end.
