/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ej6ParcialesObjetos;

/**
 *
 * @author franc
 */
public class Libro {
    private String nombre;
    private String autor;
    private double peso;

    public Libro() {
    }
    
    public Libro(String nombre, String autor, double peso) {
        this.nombre = nombre;
        this.autor = autor;
        this.peso = peso;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    @Override
    public String toString() {
        return "Libro: "+ nombre + " ,autor: " + autor + ",peso: " + peso;
    }
    
    
    
}
