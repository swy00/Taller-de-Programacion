Program ordenar;

Const  dimF =... {máxima longitud del arreglo}

Type     
      TipoElem = ... { tipo de datos del vector }
      Indice  =  0.. dimF;
      Tvector =  array  [ 1..dimF] of TipoElem;

Procedure seleccion ( var v: tVector; dimLog: indice );

var i, j, pos: indice; item : tipoElem;	
		
begin
	for i:=1 to dimLog-1 do begin {busca el mínimo y guarda en pos la posición}
          pos := i;
          for j := i+1 to dimLog do
             if v[ j ] < v[ pos ] then pos:=j;

         {intercambia v[i] y v[p]}
         item := v[ pos ];   
         v[ pos ] := v[ i ];   
         v[ i ] := item;
      end;
end;

Var
  a:Tvector;
  dimL:integer;

Begin
  cargarVector (a, dimL);
  seleccion (a, dimL); 
End.
{Va recorriendo el vector y por cada vuelta intercambia en orden los minimos dentro de los restantes}
{La primera vuelta encuentra el menor guardar su pos y valor y se lo asiga en la pos 1, en la segunda vuelta hace lo mismo con los demás y lo asigna al 2do
* y asi hasta reasignar en orden todos los valores del vector}
{Dimensión lógica del arreglo.
Posición donde va el elemento ordenado.
Posición desde la que vamos a buscar el mínimo.
Posición del elemento mínimo.} 
{Fácil de implementar.

El tiempo de ejecución es de orden N2.

Posición del elemento mínimo.
}
