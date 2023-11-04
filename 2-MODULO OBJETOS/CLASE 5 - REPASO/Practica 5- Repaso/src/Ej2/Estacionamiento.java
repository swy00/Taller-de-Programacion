/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ej2;

/**
 *
 * @author Alumno
 */
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String hApertura;
    private String  hCierre;
    private Auto[][] lugar;
    private int pisos;
    private int plazas;

    public Estacionamiento(String nombre, String direccion) {
        this.pisos = 5;
        this.plazas = 10;
        this.nombre = nombre;
        this.direccion = direccion;
        this.hApertura="08:00";
        this.hCierre="21:00";
        this.lugar=new Auto[pisos][plazas]; // Asumo que esta inicializada en null
        
    }

    public Estacionamiento(String nombre, String direccion, String hApertura, String hCierre, int numPiso,int numPlazas) {
        this.pisos = 5;
        this.plazas = 10;
        this.nombre = nombre;
        this.direccion = direccion;
        this.hApertura = hApertura;
        this.hCierre = hCierre;
        this.pisos=numPiso;
        this.plazas=numPlazas;
        this.lugar=new Auto[numPiso][numPlazas]; // Asumo que esta inicializada en null
        
    }
    
    public void registrarAuto(Auto a,int piso,int plaza){
        this.lugar[piso-1][plaza-1]=a;
    }
    
    public String encontrarAuto(String p){
        String aux="";
        boolean e=false;
        for (int i=0;i<this.pisos;i++){
            for (int j=0;j<this.plazas;j++){
                if (!(this.lugar[i][j] == null)){
                    if (this.lugar[i][j].getPatente().equals(p)){
                    e=true;
                    aux="El auto con patente "+p+" se encuentra en el piso "+(i+1)+" num de plaza "+(j+1);
                    }
                }
            }
        }
        if (!e){
            aux="Auto INEXISTENTE";
        }
        return aux;
    }
    
    public String busquedaEspecifica(int i,int j){
        String a="";
        String auto;
         if (this.lugar[i][j]!= null){
             auto=this.lugar[i][j].toString();
         }else{
             auto="Plaza libre";
         }
         a+="\n Piso "+(i+1)+"  Plaza "+(j+1)+": "+auto;
        return a;    
    }
    
    
    @Override
    public String toString(){
        String aux="";
        for (int i=0;i<this.pisos;i++){
            for (int j=0;j<this.plazas;j++){
                aux+=this.busquedaEspecifica(i, j);
            }
            aux+="\n";
        }
        return aux;
    }
    
    public int autosEnPlazaX(int p){
        int cant=0;
        for (int i=0;i<this.pisos;i++){
            if(this.lugar[i][p-1]!=null){
                cant++;
            }
        }
        return cant;
    }
    
}
