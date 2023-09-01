Program ordenar;

Const  dimF =... {máxima longitud del arreglo}

Type     
      TipoElem = ... { tipo de datos del vector }
      Indice  =  0.. dimF;
      Tvector =  array  [ 1..dimF] of TipoElem;

Procedure insercion ( var v: tVector; dimLog: indice );
var i, j: indice; actual: tipoElem;	
		
begin
 for i:= 2 to dimLog do begin 
     actual:= v[i];
     j:= i-1; 
     while (j > 0) y (v[j] > actual) do      
       begin
         v[j+1]:= v[j];
         j:= j – 1;                  
       end;  
     v[j+1]:= actual; 
 end;
end;

Var
  a:Tvector;
  dimL:integer;

Begin
  cargarVector (a, dimL);
  insercion (a, dimL); 
End.

