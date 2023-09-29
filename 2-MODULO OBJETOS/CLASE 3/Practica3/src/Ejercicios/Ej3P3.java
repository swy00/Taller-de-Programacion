/*
3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros. 
Provea métodos para:
(i) devolver la cantidad de libros que almacenados 
(ii) devolver si el estante está lleno
(iii) agregar un libro al estante 
(iv) devolver el libro con un título particular que se recibe.
B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
busque e informe el autor del libro “Mujercitas”.
C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
almacenen como máximo N libros? ¿Cómo instanciaría el estante?
 */
package Ejercicios;
import PaqueteLectura.Lector;
/**
 *
 * @author franc
 */
public class Ej3P3 {
    public static void main(String [] args){
        Estantes estante = new Estantes();
        
        //Creo libros
        Autor autor1 = new Autor();
        Autor autor2 = new Autor();
        Autor autor3 = new Autor();
        
        Libro lib1 = new Libro(autor1);
        lib1.setTitulo("Pablito");
        Libro lib2 = new Libro(autor2);
        lib2.setTitulo("Jorgito");
        
        
        //Agrego libros al estante
        estante.agregarLibro(lib1);
        estante.agregarLibro(lib2);
        //(i) devolver la cantidad de libros que almacenados
        System.out.println(estante.getCantLibros());
        //(ii) devolver si el estante está lleno 
        System.out.println("El estante " + (estante.estaLleno() ? "está lleno" : "NO está lleno"));
        //(iii) agregar un libro al estante 
        Libro lib3 = new Libro(autor3);
        lib3.setTitulo("Java");
        estante.agregarLibro(lib3);
        //(iv) devolver el libro con un título particular que se recibe.
        System.out.print("Ingresar un titulo para devolver info de ese libro: ");
        String l=Lector.leerString();
        System.out.println(estante.encontrarLibro(l));
    }
}
