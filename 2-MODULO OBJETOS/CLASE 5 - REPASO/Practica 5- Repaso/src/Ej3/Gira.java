/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ej3;

/**
 *
 * @author franc
 */
public class Gira extends Recital{
    private String nombreGira;
    private Fecha [] fecha;
    private int numFechas;
    private int fechaActual=0;
    

    public Gira(String nombreGira, String nombreBanda, int cantTemas,int cantFechasTotales) {
        super(nombreBanda, cantTemas);
        this.nombreGira = nombreGira;
        this.fecha=new Fecha[cantFechasTotales];
        this.numFechas=0;
    }
    
    public void agregarFecha(Fecha f){
        if (this.numFechas<this.fecha.length){
            this.fecha[this.numFechas]=f;
            this.numFechas++;
        }
    }

    public String actuar(){
        String aux="Buenas noches ... "+ this.fecha[this.fechaActual].getCiudad() + super.actuar();
        this.fechaActual++;//Paso a la proxima fecha una vez que actuo
        return aux;
    }
    
    public double calcularCosto(){
        return (30000*this.fecha.length); 
    }
    
}
