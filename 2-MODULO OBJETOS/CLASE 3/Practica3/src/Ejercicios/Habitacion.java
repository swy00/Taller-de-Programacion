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
public class Habitacion {
    
    private double costoNoche=50.25;
    private boolean ocupada=false;
    private Cliente clienteAlojado;

    public Habitacion(double costoNoche, Cliente clienteAlojado) {
        this.costoNoche = costoNoche;
        this.clienteAlojado = clienteAlojado;
    }
    
    public double getCostoNoche() {
        return costoNoche;
    }

    public void setCostoNoche(double costoNoche) {
        this.costoNoche = costoNoche;
    }
    
   
    public Habitacion(double c) {
        this.costoNoche=c;
    }
    

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public Cliente getClienteAlojado() {
        return clienteAlojado;
    }

    public void setClienteAlojado(Cliente clienteAlojado) {
        this.clienteAlojado = clienteAlojado;
    }
    
    
}
