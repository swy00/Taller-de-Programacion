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
public class AgendaSemanal {
    Paciente[][] a; //Matriz de turnos
    private int diasAtencion=5;
    private int horariosPorDia=6;

    public AgendaSemanal() {
        this.a= new Paciente[this.diasAtencion][this.horariosPorDia];//Inicializada en null
    }
    
    //Agendar al paciente P en un día D y turno T. Asuma que el turno está libre. D y T son válidos.
    public void agendarPaciente(Paciente p,int d,int t){
        this.a[d-1][t-1]=p;
    }
    
    public void liberarTurnos(String p){
        for (int i=0;i<this.diasAtencion;i++){
            for (int j=0;j<this.horariosPorDia;j++){
                if (this.a[i][j] != null){
                    if(this.a[i][j].getNombre().equals(p)){
                        this.a[i][j]=null;
                    }
                }
            }
            
        }
    }
    
    public boolean pacienteTieneTurno(int d,String n){
        for (int i=0;i<this.horariosPorDia;i++){
            if (this.a[d-1][i] != null){
                if (this.a[d-1][i].getNombre().equals(n)){
                return true;
                }  
            }
        }
        return false;
    }
    
    
    
}
