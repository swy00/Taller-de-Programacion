/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ej4;

/**
 *
 * @author franc
 */
public class CoroPorHileras extends Coros{
    private Corista [][] c;
    private int cantCoristas;
    private int filaActual;
    private boolean completo;
    
    public CoroPorHileras(String nombre,Director director, int cantCol,int cantFilas) {
        super(nombre,director, cantCol);
        this.c=new Corista[cantFilas][cantCol];
        //Inicializo matriz
        for (int i = 0; i < cantFilas; i++) {
            for (int j = 0; j < cantCol; j++) {
                this.c[i][j] = null;
            }
        }
        this.cantCoristas=0;
        this.filaActual=0;
        this.completo=false;
    }
    
    public void agregarCorista(Corista c){
        if ((this.filaActual < this.c.length)){ //c[x].length devuelve columnas ,c.length filas  
            this.c[this.filaActual][this.cantCoristas]=c;
            this.cantCoristas++;
            if ((this.cantCoristas == this.c[0].length )&&(this.filaActual<this.c.length)){ // Una vez que completo la fila, reseteo y paso a la prox
                this.filaActual++;
                this.cantCoristas=0;
            }else if((this.filaActual==this.c.length)&&(this.cantCoristas==this.c[0].length)){
                    System.out.println("Coro COMPLETO");
                    this.completo=true;
                }
        }else{
            System.out.println("Coro COMPLETO no se pudo agregar a corista");
        }
    }
    public boolean coroLleno(){
        return this.completo;
    }
    
    /*En el caso del coro por hileras, todos los miembros de una misma hilera
    tienen el mismo tono fundamental y además todos los primeros
    miembros de cada hilera están ordenados de mayor a menor en cuanto a tono fundamental.*/
    public String ordenadoCorrectamente(){ // SE SUPONE QUE ESTA LLENO EL CORO
        //Checkeo que todos los de la fila tengan mismo tono fundamental
        for (int i=0; i < this.c.length; i++){
            int tonoFundamentalFila = this.c[i][0].getTonoFundamental();//Asigno para comparar el primer corista de la fila
            for (int j=1;j<this.c[i].length;j++){
                if ((this.c[i][j].getTonoFundamental() != tonoFundamentalFila)){
                    return "El coro NO esta bien formado";
                }
            }
        }
        //Checkeo si los primeros miembros de cada hilera están ordenados de mayor a menor
        for (int i=0; i < (this.c.length-1) ; i++){
            if (this.c[i][0].getTonoFundamental() < this.c[(i+1)][0].getTonoFundamental()){
            return "El coro NO esta bien formado";   
            }
        }
        return "El coro SI esta bien formado";
    }
    
    public String toString(){
        String aux= super.toString() + "\n-CORISTAS-";
        for (int i = 0; i < c.length; i++) {
            for (int j = 0; j < c[0].length; j++) {
                if (c[i][j] != null){
                    aux+= this.c[i][j].toString();    
                }
            }
        }
        return aux;
    }
    
    
    
    
}
