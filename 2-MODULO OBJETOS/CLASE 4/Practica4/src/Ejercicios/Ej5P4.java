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
public class Ej5P4 {
    public static void main (String [] args){
        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        Rectangulo r= new Rectangulo(20,10,"Azul","Celeste");
        Cuadrado c2= new Cuadrado(30,"Rojo","Naranja");
        VisorFigurasModificado visor = new VisorFigurasModificado();
        visor.guardar(c1);visor.guardar(r);visor.guardar(c2);
        visor.guardar(c1);visor.guardar(r);visor.guardar(c2);
        visor.mostrar();
    }
}
