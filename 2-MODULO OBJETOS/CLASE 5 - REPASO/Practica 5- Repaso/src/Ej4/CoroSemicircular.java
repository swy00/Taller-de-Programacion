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
public class CoroSemicircular extends Coros{
    
    private Corista[] c;//Array de coristas
    private int cantCoristas;
    private boolean completo;

    public CoroSemicircular(String nombre,Director director, int cantXFila) {
        super(nombre,director, cantXFila);
        this.c = new Corista[cantXFila];//Asumo que esta inicializado en NULL
        this.cantCoristas=0;
        this.completo=false;
    }
    
    
    public void agregarCorista(Corista c){
        if (this.cantCoristas < this.c.length){
            this.c[this.cantCoristas]=c;
            this.cantCoristas++;
            if (this.cantCoristas == this.c.length){
                this.completo=true;
            }
        }
    }
    
    public boolean coroLleno(){
        return this.completo;
    }
    
    /*o En el caso del coro semicircular, de izquierda a derecha los coristas 
    están ordenados de mayor a menor en cuanto a tono fundamental.*/
    
    public String ordenadoCorrectamente(){
        for (int i=0;i<this.c.length-1;i++){ //recorro el array comparando los tonos fundamentales
            if ((this.c[i].getTonoFundamental() < this.c[(i+1)].getTonoFundamental())){
                return "El coro NO esta bien formado";
            }
        }
        return "El coro está bien formado";
    }
    
    @Override
    public String toString(){
        String aux= super.toString()+ "\n-CORISTAS-";
        for (int i=0;i<this.c.length;i++){
            if (c[i] != null){
                aux+=this.c[i].toString();
            }
        }
        return aux;
    }
    
    
    
    
}
