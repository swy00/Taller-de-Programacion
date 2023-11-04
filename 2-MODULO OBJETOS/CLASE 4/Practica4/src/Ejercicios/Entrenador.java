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
public class Entrenador extends Empleado {
    private int cantCampeonatos;

    public Entrenador(int cantCampeonatos, String nombre, double sueldo, int antigüedad) {
        super(nombre, sueldo, antigüedad);
        this.cantCampeonatos = cantCampeonatos;
    }

    public int getCantCampeonatos() {
        return cantCampeonatos;
    }

    public void setCantCampeonatos(int cantCampeonatos) {
        this.cantCampeonatos = cantCampeonatos;
    }
    
    public double calcularEfectividad(){
        double aux=(this.cantCampeonatos/this.getAntigüedad());
        return aux;
    }
    
    public double calcularSueldoACobrar(){
        //Plus dependiendo de cantida de campeonatos ganados
        double plus;
        if (this.getCantCampeonatos() >= 1 && this.getCantCampeonatos() <= 4) {
            plus= 5000;
        } else if (this.getCantCampeonatos() >= 5 && this.getCantCampeonatos() <= 10) {
            plus=30000;
        } else if (this.getCantCampeonatos() > 10) {
            plus=50000;
        } else {
            plus=0;
        }
        return this.calcularSueldoSinPlus() + plus;
    }
}
