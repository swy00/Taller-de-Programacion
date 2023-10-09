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
public class Corista extends Persona {
    private int tonoFundamental;

    public Corista(int tonoFundamental, String nombre, int dni, int edad) {
        super(nombre, dni, edad);
        this.tonoFundamental = tonoFundamental;
    }

    public int getTonoFundamental() {
        return tonoFundamental;
    }
    
    public String toString(){
        return "\n"+super.toString()+" ,Tono fundamental: "+this.tonoFundamental;
    }
}
