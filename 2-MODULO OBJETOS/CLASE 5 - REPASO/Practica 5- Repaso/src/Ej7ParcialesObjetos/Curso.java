/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ej7ParcialesObjetos;

/**
 *
 * @author franc
 */
public abstract class Curso {
    private int aCursada;
    private Alumno [] a;
    private int dimL;

    public Curso(int aCursada,int cantAlumnos) {
        this.aCursada = aCursada;
        this.a=new Alumno[cantAlumnos];//Asumo que esta inicializado vacio
        this.dimL=0;
    }
    
    
    public boolean agregarAlumno(Alumno a){
        if (this.dimL < this.a.length){
            this.a[this.dimL]=a;
            this.dimL++;
            return true;
        }
        return false;
    }
    
    public void incrementarAsistencia(int d){
        for (int i=0;i<this.a.length;i++){
            int dniActual=this.a[i].getDni();
            if (dniActual == d ){
                int asisActualizada=this.a[i].getAsistencias()+1;
                this.a[i].setAsistencias(asisActualizada);
            }
        }     
    }
    
    public void aprobarAutoevaluacion(int d){
        for (int i=0;i<this.a.length;i++){
            int dniActual=this.a[i].getDni();
            if (dniActual == d ){
                int evalActual=this.a[i].getCantAutoevaluacionesAprobadas()+1;
                this.a[i].setCantAutoevaluacionesAprobadas(evalActual);
            }
        }  
    }
    
    public int cantidadDeAlumnosQuePuedenRendir(){
        int cantRinden=0;
        for (int i=0;i<this.a.length;i++){
            if (this.puedeRendir(this.a[i])){
                cantRinden++;
            }
        }
        
        return cantRinden;
    } 
    
    public abstract boolean puedeRendir(Alumno a);
    
}
