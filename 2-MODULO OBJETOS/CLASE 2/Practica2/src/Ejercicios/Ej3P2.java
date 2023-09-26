/*
 3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
Strings use el método equals.
 */
package Ejercicios;
import PaqueteLectura.Lector;
/**
 *
 * @author franc
 */
public class Ej3P2 {
    public static void main(String [] args){
        int dias=5,personasPorDia=8,dni,edad;
        int dia=0,turno=0;
        Persona [][] turnos=new Persona[dias][personasPorDia];
        //supongo que esta completa en 0
        String nombre = new String("");
        //Mientras que no haya cumplido con los 40 cupos
        while ((dia < 5) && (!(nombre.equals("ZZZ")))){
            //Leo la data
            System.out.print("Introducir nombre de la persona: ");
            nombre = Lector.leerString();
            System.out.print("Introducir edad de la persona: ");
            dni = Lector.leerInt();
            System.out.print("Introducir DNI de la persona: ");
            edad= Lector.leerInt();
            //Le asigno lo leido al turno y dia que estoy
            turnos[dia][turno]=new Persona(nombre,dni,edad);
            //Aumento el turno que rellené
            turno++;
            //Si llego al turno max del dia, reseteo turnos y paso de dia, si llegue al ultimo dia significa que terminé
            if(turno == personasPorDia){
                turno=0;
                dia++;
                System.out.println(dia);
            }
            
            System.out.println();
        }
        
        //Informar la persona para cada día y turno asignado
        for (int i=0;i<dias;i++){
            for(int j=0;j<personasPorDia;j++){
                Persona personaActual=turnos[i][j];
                if (personaActual == null){
                    break;
                }else{
                    System.out.print("El día "+(i+1)+" en el turno "+(j+1)+": ");
                    System.out.println(turnos[i][j].toString());
                }
            }   
        }
    }
            
}
