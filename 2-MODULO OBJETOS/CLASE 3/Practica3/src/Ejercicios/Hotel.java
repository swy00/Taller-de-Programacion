/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejercicios;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author franc
 */
public class Hotel {
    private Habitacion[] habitaciones;
    private int cantH=10;
    
    public Hotel(int cantHabi) {
        int i;
        this.cantH=cantHabi;
        habitaciones = new Habitacion[cantHabi];
        //Randomizo el precio de cada habitacion entre 2000 y 8000
        for (i=0;i<cantHabi;i++){
            GeneradorAleatorio.iniciar();
            double a=GeneradorAleatorio.generarDouble(8000);
            //Creo una instancia de la habitacion con el precio aleatorio
            habitaciones[i] = new Habitacion(a);
        }
    }
    
    public Habitacion[] getHabitaciones() {
        return habitaciones;
    }

    public void setHabitaciones(Habitacion[] habitaciones) {
        this.habitaciones = habitaciones;
    }

    @Override
    public String toString() {
        String aux="";
        for (int i=0;i<this.cantH;i++){
           //{Habitación N: costo, libre u ocupada, información del cliente si está ocupada}
           aux+= "\n"+"{Habitacion: "+(i+1)+" cuesta: "+habitaciones[i].getCostoNoche()+" "+ (habitaciones[i].isOcupada()? ("ocupada "+habitaciones[i].getClienteAlojado().toString()):"desocupada");
        }
        return aux;
    }
    
    public void armarHabitacion(Cliente c,int numH){
        //Agrego al cliente que recibo en la habitacion numH
        if (!this.habitaciones[numH-1].isOcupada()){
            this.habitaciones[numH-1].setClienteAlojado(c);
            this.habitaciones[numH-1].setOcupada(true);
        }else{
            System.out.println("Habitacion "+numH+" ocupada");
        }
    }
    
    
    //Recibe un monto, y se lo suma a todas las habitaciones
     public void aumentarPrecio(double p){
        for (int i=0;i<this.cantH;i++){
            double nuevoCosto = habitaciones[i].getCostoNoche()+p;
            habitaciones[i].setCostoNoche(nuevoCosto);
        }
    }
}
