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
public class Fecha {
    private Goleador[] goleadores;
    private int dimL;

    public Fecha(int cantGoleadores) {
        this.goleadores = new Goleador[cantGoleadores];//asumo que se inicia NULL
        this.dimL = 0;
    }
    public void agregarGoleador(Goleador g){
        this.goleadores[dimL]=g;
        dimL++;
    }

    public Goleador[] getGoleadores() {
        return goleadores;
    }
    
    public int getDimL() {
        return dimL;
    } 
}
