/*
Demo que crea objetos Libro invocando a los constructores definidos. 
B- Modifique el programa Demo01Constructores (carpeta tema3) para instanciar los
libros con su autor, considerando las modificaciones realizadas. Luego, a partir de uno de
los libros instanciados, obtenga e imprima la representación del autor de ese libro.
 */
package Ejercicios;

/**
 *
 * @author vsanz
 */
public class Demo01ConstructoresLibro {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //CONSTRUCTOR AUTOR
        //Autor (Nombre,Biografia,Origen)
        //Autor (Nombre) o Autor()
        Autor autorL1 = new Autor("Herbert Schildt");
        Autor autorL2 = new Autor("John Horton");
        Autor autorL3 = new Autor("Pedro");
        //CONSTURCTORES LIBRO
        //Libro(Titulo,Editorial,AñoEdicio,Autor,ISBN,Precio)
        //Libro(TItulo,Editorial,Autor,ISBN)
        //Libro(Autor) o Libro()
        Libro libro1= new  Libro( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                 autorL1, "978-0071809252", 21.72);
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               autorL2, "978-1512108347");
        System.out.println(libro1.toString());
        System.out.println();
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        Libro libro3= new Libro(autorL3);
        System.out.println("--------------------------------");
        System.out.println(libro3.getPrimerAutor().toString());
        
    }
    
}
