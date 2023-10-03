/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejercicios;

/**
 *
 * @author franc
 */
public class VisorFigurasModificado {
    private int guardadas;
    private int capacidadMaxima=5;
    private Figura [] vector;
    
    public VisorFigurasModificado(){
        //Inicializo el vector de figuras y el contador de guardadas
        this.vector = new Figura[this.capacidadMaxima];
        this.guardadas=0;
    }
    public void guardar(Figura f){
        if (this.guardadas < this.capacidadMaxima) {
            this.vector[guardadas] = f;
            this.guardadas++;
        } else {
            System.out.println("No hay espacio para almacenar más figuras.");
        }
    }
    public boolean quedaEspacio(){
        return (this.guardadas<this.capacidadMaxima);
    }
    public void mostrar(){
        String aux="";
        for (int i=0;i<guardadas;i++){
            aux+= this.vector[i].toString() +"\n";
        }
        System.out.println(aux);
    }
    public int getGuardadas() {
        return guardadas;
    }
}