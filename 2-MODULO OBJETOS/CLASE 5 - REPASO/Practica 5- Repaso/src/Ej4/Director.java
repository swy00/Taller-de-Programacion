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
public class Director extends Persona {
    private int antiguedad;

    public Director(int antiguedad, String nombre, int dni, int edad) {
        super(nombre, dni, edad);
        this.antiguedad = antiguedad;
    }
    
    public String toString(){
        return "\n-DIRECTOR- "+super.toString()+ " ,antiguedad :"+this.antiguedad;
    }
}
