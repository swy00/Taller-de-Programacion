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
public class ServicioMensual extends Servicio{

    public ServicioMensual(int cantAnios, int aInicial, String nombre, double latitud, double longitud) {
        super(cantAnios, aInicial, nombre, latitud, longitud);
    }
    
    public String sistemaPromedioMensual(){
        String[] meses = {"Enero", "Febrero", "Marzo", "Abril","Mayo", "Junio", "Julio", "Agosto","Septiembre", "Octubre", "Noviembre", "Diciembre"};
        //Recorro los años sacando promedio del mes, me clavo en un mes y lo busco en los años
        String aux="";
        for (int j=0;j<12;j++){
            double mes=0;
            for (int i=0;i< this.getCantAnios();i++){    
                mes+=this.getTempAños()[i][j];
            }
            aux+="\n         - "+meses[j]+": "+mes+" °C;";  
        }
        return aux;
    }

    @Override
    public String toString() {
        return super.toString()+ this.sistemaPromedioMensual();
    }
    
    
}
