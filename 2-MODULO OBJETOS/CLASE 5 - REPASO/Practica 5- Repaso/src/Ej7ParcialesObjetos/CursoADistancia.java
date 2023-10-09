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
public class CursoADistancia extends Curso{
    private String linkClases;

    public CursoADistancia(String linkClases, int aCursada, int cantAlumnos) {
        super(aCursada, cantAlumnos);
        this.linkClases = linkClases;
    }
    
    public  boolean puedeRendir(Alumno a){
        if ((a.getAsistencias()>=1)&&(a.getCantAutoevaluacionesAprobadas()==3)){
            return true;
        }else{
            return false;
        }
    }
}
