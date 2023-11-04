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
public class ServicioAnual extends Servicio{

    public ServicioAnual(int cantAnios, int aInicial, String nombre, double latitud, double longitud) {
        super(cantAnios, aInicial, nombre, latitud, longitud);
    }

    
    private String sistemaPromedioAnual(){
        //Recorro la matriz en la fila correspondiente sumando las temperaturas de todos los meses
        String aux="";
        for (int i=0;i<this.getCantAnios();i++){
            double año=0;
            for (int j=0;j<12;j++){
                año+=this.getTempAños()[i][j];
            }
            aux+="\n         - Año "+ (this.getaInicial()+i)+": "+(año/12)+" °C;";
        }
        return aux;
    }

    @Override
    public String toString() {
        return super.toString()+ this.sistemaPromedioAnual();
    }
    
    
    
    
    
    
}
