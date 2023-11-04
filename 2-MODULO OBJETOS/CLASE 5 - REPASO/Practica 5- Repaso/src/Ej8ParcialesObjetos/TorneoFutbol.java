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
public class TorneoFutbol {
    private String nombre;
    Fecha [] tabla;
    private int cantFechas;
    private int cantGoleadores;

    public TorneoFutbol(String nombre, int cantidadFechas, int cantidadMaximaGoleadores){
        this.nombre = nombre;
        this.cantFechas = cantidadFechas;
        this.cantGoleadores = cantidadMaximaGoleadores;
        this.tabla = new Fecha[cantidadFechas];

        for (int i = 0; i < cantidadFechas; i++) {
            this.tabla[i] = new Fecha(cantidadMaximaGoleadores);
        }
    }
    
    public void agregarGoleador(int fecha,Goleador g){
        tabla[fecha-1].agregarGoleador(g);
    }
    
    public Goleador menosGolesFecha(int f){
        int min=6;
        Goleador g=null;
        for (int i=0;i<this.tabla[f-1].getDimL();i++){
            if (min > this.tabla[f-1].getGoleadores()[i].getCantGolesFecha()){
                min=this.tabla[f-1].getGoleadores()[i].getCantGolesFecha();
                g=this.tabla[f-1].getGoleadores()[i];
            }
        }
        return g;
    }
    
    public int cantidadGoleadoresRegistrados(){
        int totalGoleadores=0;
        for (int i=0;i<this.cantFechas;i++){
            for (int j=0;j<this.cantGoleadores;j++){
                if (this.tabla[i].getGoleadores()[j] != null){
                    totalGoleadores++;
                }
            }
        }
        return totalGoleadores;
    }
    
    public String toString(){
        String aux="'Torneo 2022: "+this.nombre;
        for (int i=0;i<this.cantFechas;i++){
            aux+= "\n Fecha # "+(i+1)+" / Cantidad de goleadores de la fecha "+ this.tabla[i].getDimL() +"\n   / Goleadores:";
            for (int j=0;j<this.cantGoleadores;j++){
                if (this.tabla[i].getGoleadores()[j] != null){
                    aux+= "\n        "+this.tabla[i].getGoleadores()[j].toString();
                }
            }
            
            
        }
        return aux;
    }
}
