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
public class Jugadores extends Empleado {
    
    private int numPartidos;
    private int numGoles;

    public Jugadores(int numPartidos, int numGoles, String nombre, double sueldo, int antigüedad) {
        super(nombre, sueldo, antigüedad);
        this.numPartidos = numPartidos;
        this.numGoles = numGoles;
    }

    public int getNumPartidos() {
        return numPartidos;
    }

    public void setNumPartidos(int numPartidos) {
        this.numPartidos = numPartidos;
    }

    public int getNumGoles() {
        return numGoles;
    }

    public void setNumGoles(int numGoles) {
        this.numGoles = numGoles;
    }
    
    public double calcularEfectividad(){
        double aux=(this.numGoles/this.numPartidos);
        return aux;
    }
    
    public double calcularSueldoACobrar(){
        //si el promedio de goles por partido es superior a 0,5 se adiciona un plus de otro sueldo básico.
        double plus=0;
        if (calcularEfectividad()>0.5){
            plus=this.getSueldo();
        }
        return this.calcularSueldoSinPlus()+ plus;        
    }
    
}
