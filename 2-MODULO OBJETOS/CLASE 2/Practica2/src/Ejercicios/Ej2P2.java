/*
 2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:
- Informe la cantidad de personas mayores de 65 años.
- Muestre la representación de la persona con menor DNI.
 */
package Ejercicios;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author franc
 */
public class Ej2P2 {
    public static void main(String [] args){
        //Creo el vector de 15 espacios de personas
        int edad,dni,i=0,mayores65=0,menor=9999,pmenor=0;
        boolean x=false;
        Persona [] personas=new Persona[15];
        GeneradorAleatorio.iniciar();
        //System.out.println(personas.length);
        while ((i<personas.length)&& !(x)){
            //Genero aleatoriamente un nombre
            String nombre=new String (GeneradorAleatorio.generarString(7));
            edad = GeneradorAleatorio.generarInt(99);
            dni = GeneradorAleatorio.generarInt(10000);
            //System.out.println(edad);
            //Cuando se genere la edad 0, salgo del while
            if (edad == 0){
                x=true;
            }
            else {
                if(edad>65){mayores65++;}
                if(dni<menor){
                    menor=dni;
                    pmenor=i;
                }
                //Genero una nueva persona en la posicion personas[i]
                personas[i] = new Persona(nombre,dni,edad);
                i++;
            }
      
        }
        //Cantidad de personas mayores a 65 y el menor DNI
        System.out.println("Cantidad de personas mayores a 65 años: "+mayores65);
        System.out.println();
        System.out.println("La info de la persona con el menor DNI es: ");
        System.out.println(personas[pmenor].toString());
        /*      
        //Imprimo el vector
        for (i=0;i<15;i++){
            System.out.println("Persona Numero: "+(i+1));
            System.out.println("Nombre: "+personas[i].getNombre());
            System.out.println("Dni: "+personas[i].getDNI());
            System.out.println("Edad: "+personas[i].getEdad());
            System.out.println();
            
        } 
        */
    }
}