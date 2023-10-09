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
public abstract class Coros {
    private String nombre;
    private Director director;
    private int dimensiones;
    
    public Coros(String nombre, Director director, int dimensiones) {
        this.nombre = nombre;
        this.director = director;
        this.dimensiones = dimensiones;
    }
    
    public String toString(){
        String aux="";
        aux+= "---NOMBRE CORO--- "+ this.nombre;
        aux+= this.getDirector().toString();
        return aux;
    }
    
    public Director getDirector() {
        return director;
    }
    
    public abstract void agregarCorista(Corista c);
}
