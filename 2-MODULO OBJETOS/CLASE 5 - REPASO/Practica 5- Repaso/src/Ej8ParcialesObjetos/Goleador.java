/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ej8ParcialesObjetos;

/**
 *
 * @author franc
 */
public class Goleador {
    private String nombre;
    private String nombreEquipo;
    private int cantGolesFecha=0;

    public Goleador(String nombre, String nombreEquipo, int cantGolesFecha) {
        this.nombre = nombre;
        this.nombreEquipo = nombreEquipo;
        this.cantGolesFecha = cantGolesFecha;
    }

    public String getNombre() {
        return nombre;
    }
    public int getCantGolesFecha() {
        return cantGolesFecha;
    }

    @Override
    public String toString() {
        return "{" + nombre + "," + nombreEquipo + "," + cantGolesFecha + '}';
    }
    
    
    
    
}
