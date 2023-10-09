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
public class CursoPresencial extends Curso{
    private int numAula;

    public CursoPresencial(int numAula, int aCursada, int cantAlumnos) {
        super(aCursada, cantAlumnos);
        this.numAula = numAula;
    }
    
    public  boolean puedeRendir(Alumno a){
        if (a.getAsistencias()>= 3){
            return true;
        }else{
            return false;
        }
    }
}
