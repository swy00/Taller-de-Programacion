/*
Implemente la clase Autor, sabiendo que se caracterizan por nombre, biografía y origen
y que deben permitir devolver/modificar el valor de sus atributos y devolver una
representación String formada por nombre, biografía y origen.
Luego realice las modificaciones necesarias en la clase Libro.
 */
package Ejercicios;

/**
 *
 * @author franc
 */
public class Autor {
    private String nombre="Fernando";
    private String biografia="me gusta escribir";
    private String origen="Argentina";

    public Autor() {
    }
    public Autor(String unAutor) {
        this.nombre=unAutor;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getBiografia() {
        return biografia;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    @Override
    public String toString() {
        return "INFO AUTOR-->" + "Nombre: "+ nombre + ",biografia: " + biografia + " ,originario de: " + origen ;
    }
    
    
    
}
