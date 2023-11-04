/*
5) Queremos representar estanterías de libros. Una estantería mantiene sus libros
organizados en N estantes cada uno con lugar para M libros. Un libro posee título, nombre
de su primer autor y peso.
a) Implemente las clases de su modelo, con sus atributos y getters/setters adecuados.
Provea constructores para iniciar: los libros a partir de toda su información; la estantería
para N estantes y lugar para M libros por estante (inicialmente no debe tener libros
cargados).
b) Implemente los siguientes métodos:
- almacenarLibro: recibe un libro, un nro. de estante y nro. de lugar válidos y guarda al
libro en la estantería. Asuma que dicho lugar está disponible.
- SacarLibro: recibe el título de un libro, y saca y devuelve el libro con ese título, quedando
su lugar disponible. Tenga en cuenta que el libro puede no existir.
- calcular: calcula y devuelve el libro más pesado de la estantería.
2) Realice un programa que instancie una estantería para 5 estantes y 3 libros por
estante. Almacene 7 libros en la estantería. A partir de la estantería: saque un libro e
informe su representación String; luego, informe el título del libro más pesado.
 */
package Ej6ParcialesObjetos;

/**
 *
 * @author franc
 */
public class Parcial5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estanteria e= new Estanteria(5,3);//(int cantEstantes, int cantLibrosEstante)
        //(String nombre, String autor, double peso)
        Libro l1 = new Libro("El señor de los anillos", "Ricardo", 220);
        Libro l2 = new Libro("Cien años de soledad", "Gabriel García Márquez", 180);
        Libro l3 = new Libro("Harry Potter y la piedra filosofal", "J.K. Rowling", 250);
        Libro l4 = new Libro("Don Quijote de la Mancha", "Miguel de Cervantes", 300);
        Libro l5 = new Libro("Orgullo y prejuicio", "Jane Austen", 200);
        Libro l6 = new Libro("Crimen y castigo", "Fyodor Dostoevsky", 280);
        Libro l7 = new Libro("Matar a un ruiseñor", "Harper Lee", 190);
        
        e.almacenarLibro(l1, 1, 1);e.almacenarLibro(l2, 1, 2);e.almacenarLibro(l3, 1, 3);
        e.almacenarLibro(l4, 3, 2);e.almacenarLibro(l5, 2, 1);e.almacenarLibro(l6, 5, 2);
        e.almacenarLibro(l7, 4, 1);
        
        
        System.out.println(e.sacarLibro("El señor de los anillos").toString());
        
    }
    
}
