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
public class Auto {
    private String nombreDueño;
    private String patente;

    public Auto(String nombreDueño, String patente) {
        this.nombreDueño = nombreDueño;
        this.patente = patente;
    }

    public String getPatente() {
        return patente;
    }

    @Override
    public String toString() {
        return "NombreDueño: "  + nombreDueño + ", patente: " + patente + '}';
    }
}
