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
public class Alumno {
    private int dni;
    private String nombre;
    private int asistencias;
    private int cantAutoevaluacionesAprobadas;

    public Alumno(int dni, String nombre) {
        this.dni = dni;
        this.nombre = nombre;
        this.asistencias=0;
        this.cantAutoevaluacionesAprobadas=0;
    }

    public int getDni() {
        return dni;
        }

    public int getAsistencias() {
        return asistencias;
    }

    public void setAsistencias(int asistencias) {
        this.asistencias = asistencias;
    }

    public int getCantAutoevaluacionesAprobadas() {
        return cantAutoevaluacionesAprobadas;
    }

    public void setCantAutoevaluacionesAprobadas(int cantAutoevaluacionesAprobadas) {
        this.cantAutoevaluacionesAprobadas = cantAutoevaluacionesAprobadas;
    }
    
    
}
