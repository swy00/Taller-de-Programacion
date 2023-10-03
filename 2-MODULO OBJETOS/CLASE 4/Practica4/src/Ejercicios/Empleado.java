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
public abstract class Empleado {
    private String nombre;
    private double sueldo;  
    private int antigüedad;

    public Empleado(String nombre, double sueldo, int antigüedad) {
        this.nombre = nombre;
        this.sueldo = sueldo;
        this.antigüedad = antigüedad;
    }


    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntigüedad() {
        return antigüedad;
    }

    public void setAntigüedad(int antigüedad) {
        this.antigüedad = antigüedad;
    }
    
    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();
    
    public  double calcularSueldoSinPlus(){
        double sueldo= this.getSueldo() + (this.getSueldo()*(0.10*this.getAntigüedad()));
        return (sueldo);
    };
    
    public String toString(){
        //compuesto por nombre, sueldo a cobrar y efectividad.
        return this.getNombre() +" deberá cobrar "+ this.calcularSueldoACobrar() + ", posee una efectividad de "+this.calcularEfectividad();
    }
    
    
}
