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
public class Servicio extends EstacionMeteorologica{
    private int cantAnios;
    private int aInicial;
    //Almaceno la temp de los meses de cada año en una matriz
    private double [][] tempAños;
    
    public Servicio(int cantAnios, int aInicial, String nombre, double latitud, double longitud) {
        super(nombre, latitud, longitud);
        this.cantAnios = cantAnios;
        this.aInicial = aInicial;
        this.tempAños = new double[cantAnios][12];
        
        //Me pide que inicialice las temperaturas en un valor alto
        for (int i=0;i<cantAnios;i++){
            for (int j=0;j<12;j++){
                this.tempAños[i][j]=100;
            }
        } 
    }
    private boolean validarDatos(int año,int mes){
        return ((año >= aInicial && año < (aInicial + cantAnios) && mes >= 1 && mes <= 12));
    }
    //--------------------B--------------------
    //El mes está en rango 1..12 y el año está en rango A..A+N-1. Siendo N cant de años consecutivos
    public void registrarTemperatura(int mes,int año,double temp){
        //Checkeo que lo ingresado sea correcto antes de asignar
        //que año esté entre añoInicial+cantAños y que mes en el rango 1-12
        if (validarDatos(año,(mes))){
            tempAños[(año-this.aInicial)][(mes-1)]=temp;
        }else{
            System.out.println("Informacion ingresada INCORRECTA: " + año + "/" + mes);
        }
    }
    //--------------------C--------------------
    public double obtenerTemp(int año,int mes){
        if (validarDatos(año,mes)){
            return this.tempAños[año][mes];
        }else{
            return 3200;
        }
    }
    //--------------------D--------------------
    public String mayorTemp(){
        //Recorro toda la matriz en busca de la mayor temp, y me guardo la pos
        double max=0;
        int año=0,mes=0;
        for (int i=0;i<cantAnios;i++){
            for (int j=0;j<12;j++){
                if(this.tempAños[i][j]>max){
                    max=this.tempAños[i][j];
                    año=i;
                    mes=j;
                }
            }
        } 
        return "La temperatura maxima fue registrada en el mes "+(mes+1)+" año "+(año+this.aInicial)+" se midio "+max;
    }
    
    
    public int getCantAnios() {
        return cantAnios;
    }

    public void setCantAnios(int cantAnios) {
        this.cantAnios = cantAnios;
    }

    public int getaInicial() {
        return aInicial;
    }

    public void setaInicial(int aInicial) {
        this.aInicial = aInicial;
    }

    public double[][] getTempAños() {
        return tempAños;
    }

    public void setTempAños(double[][] tempAños) {
        this.tempAños = tempAños;
    }
    
    
    
    
    
}
