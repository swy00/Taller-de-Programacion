/*
4-A- Un hotel posee N habitaciones. De cada habitación conoce costo por noche, si está
ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).

(i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.

(ii) Implemente los constructores necesarios para iniciar: los clientes a partir de nombre,
DNI, edad; el hotel para N habitaciones, cada una desocupada y con costo aleatorio e/
2000 y 8000.

(iii) Implemente en las clases que corresponda todos los métodos necesarios para:
- Ingresar un cliente C en la habitación número X. Asuma que X es válido (es decir, está
en el rango 1..N) y que la habitación está libre.
- Aumentar el precio de todas las habitaciones en un monto recibido.
- Obtener la representación String del hotel, siguiendo el formato:
{Habitación 1: costo, libre u ocupada, información del cliente si está ocupada}
…
{Habitación N: costo, libre u ocupada, información del cliente si está ocupada}

B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones,
muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.
NOTAS: Reúse la clase Persona. Para cada método solicitado piense a qué clase debe
delegar la responsabilidad de la operación.
 */
package Ejercicios;


/**
 *
 * @author franc
 */
public class Ej4P3 {
    public static void main(String [] args){
        //Hotel de 10 habitaciones
        
        Hotel h = new Hotel(10);
        
        //Creo cliente (Nombre,dni,edad)|() y le asigno una habitacion con armarHabitacion(Cliente,Numero de habitacion)
        Cliente c1 = new Cliente("Francisco","142314123",22);
        h.armarHabitacion(c1, 8);h.armarHabitacion(c1, 6);h.armarHabitacion(c1, 2);
        //Otro cliente
        Cliente c12 = new Cliente("Ricardo","123",60);
        h.armarHabitacion(c12, 1);h.armarHabitacion(c12, 3);
        //Muestro el hotel
        System.out.println(h.toString());
        System.out.println();
        //Aumento el precio de todas las habitaciones 2000
        h.aumentarPrecio(2000);
        
        //Vuelvo a imprimir para confirmar aumento 
        //System.out.println(h.toString());       
    }
}
