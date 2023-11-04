package Ejercicios;

/*
 1- Se dispone de la clase Persona (en la carpeta tema2). Un objeto persona puede crearse
sin valores iniciales o enviando en el mensaje de creación el nombre, DNI y edad (en ese
orden). Un objeto persona responde a los siguientes mensajes:
getNombre() retorna el nombre (String) de la persona
getDNI() retorna el dni (int) de la persona
getEdad() retorna la edad (int) de la persona
setNombre(X) modifica el nombre de la persona al “String” pasado por parámetro (X)
setDNI(X) modifica el DNI de la persona al “int” pasado por parámetro (X)
setEdad(X) modifica la edad de la persona al “int” pasado por parámetro (X)
toString() retorna un String que representa al objeto. Ej: “Mi nombre es Mauro,
mi DNI es 11203737 y tengo 70 años”
Realice un programa que cree un objeto persona con datos leídos desde teclado. Luego
muestre en consola la representación de ese objeto en formato String.
 */

import PaqueteLectura.Lector;
/**
 *
 * @author franc
 */
public class Ej1P2 {
    public static void main(String[] args) {
        
        String nombre;
        int edad,dni;
        System.out.print("Introducir nombre de la persona: ");
        nombre=Lector.leerString();
        System.out.print("Introducir edad de la persona: ");
        edad=Lector.leerInt();
        System.out.print("Introducir DNI de la persona: ");
        dni=Lector.leerInt();
        
        Persona Ramon = new Persona(nombre,edad,dni);
        System.out.println(Ramon.toString());
    }
}
