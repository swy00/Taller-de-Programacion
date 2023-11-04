/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ej5ParcialesObjetos;

/**
 *
 * @author franc
 */
public class Paciente {
    private String nombre;
    private boolean obraSocial;
    private int costoAbonar;

    public Paciente(String nombre, boolean obraSocial, int costoAbonar) {
        this.nombre = nombre;
        this.obraSocial = obraSocial;
        this.costoAbonar = costoAbonar;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isObraSocial() {
        return obraSocial;
    }

    public void setObraSocial(boolean obraSocial) {
        this.obraSocial = obraSocial;
    }

    public int getCostoAbonar() {
        return costoAbonar;
    }

    public void setCostoAbonar(int costoAbonar) {
        this.costoAbonar = costoAbonar;
    }
    
    
}
