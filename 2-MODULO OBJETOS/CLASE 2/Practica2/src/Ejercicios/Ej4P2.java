/*
 4- Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:
a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el 
siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación. 
La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos 
de casting.
Una vez finalizada la inscripción:
b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la 
persona a entrevistar en cada turno asignado.
 */
package Ejercicios;
 
import PaqueteLectura.Lector;
 
/**
 *
 * @author franc
 */
public class Ej4P2 {
    public static void main(String [] args){
        int dias=5,personasPorDia=8,dni,edad,diaSolicitado,dia=0,turno=0;
        String nombre=new String("");
        Persona [][] turnos=new Persona[dias][personasPorDia];
        //supongo que esta completa en 0
        //Creo un vector de dimLogicas
        int [] vDimL = new int[5];
        //Mientras que no haya cumplido con los 40 cupos
        while (((dia < 5))&&(!(nombre.equals("ZZZ")))){
            //Leo la data
            System.out.print("Introducir DIA que quiere el turno la persona: ");
            diaSolicitado= Lector.leerInt();
            //Le asigno lo leido al turno y dia que estoy
            turno =vDimL[diaSolicitado];
            if (turno < 8){
                System.out.print("Introducir nombre de la persona: ");
                nombre = Lector.leerString();
                System.out.print("Introducir edad de la persona: ");
                dni = Lector.leerInt();
                System.out.print("Introducir DNI de la persona: ");
                edad= Lector.leerInt();
                turnos[diaSolicitado][turno]=new Persona(nombre,dni,edad);
                vDimL[diaSolicitado]++;
            }else {
                System.out.println("------------------------------------------------------");
                System.out.println("No hay mas turnos disponibles en el dia "+ diaSolicitado);
                System.out.println("------------------------------------------------------");
            }
            System.out.println();
        }
 
        //Informar la persona para cada día y turno asignado
        for (int i=0;i<dias;i++){
            for(int j=0;j<personasPorDia;j++){
                Persona personaActual=turnos[i][j];
                if (personaActual != null){
                    System.out.print("El día "+(i+1)+" en el turno "+(j+1)+": ");
                    System.out.println(turnos[i][j].getNombre());
                }
            }   
        }
    }
}