/*
2-A- Modifique la clase Libro.java (carpeta tema3) para ahora considerar que el primer
autor es un objeto instancia de la clase Autor.
Implemente la clase Autor, sabiendo que se caracterizan por nombre, biografía y origen
y que deben permitir devolver/modificar el valor de sus atributos y devolver una
representación String formada por nombre, biografía y origen.
Luego realice las modificaciones necesarias en la clase Libro.


B- Modifique el programa Demo01Constructores (carpeta tema3) para instanciar los
libros con su autor, considerando las modificaciones realizadas. Luego, a partir de uno de
los libros instanciados, obtenga e imprima la representación del autor de ese libro.
 */
package Ejercicios;

/**
 *
 * @author franc
 */
public class Ej2P3 {
    public static void main(String [] args){
        //--------------- A ---------------
        
        Autor autor = new Autor();
        Libro libro = new Libro(autor);
        
        System.out.println(libro.toString());
    }
}
