/*
5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
para cada uno de los aspectos y almacene la información en una estructura. Luego
imprima la calificación promedio obtenida por cada aspecto.
 */
package Ej5;
import PaqueteLectura.Lector;
public class Ej5 {
    public static void main(String[] args) {
        //Cada cliente va a ser una fila, y cada puntaje una columna
        String [] aspectos = {"Atencion al cliente ","Calidad de la Comida ","Precio ","Ambiente "};
        
        int [][] matriz = new int[5][4];
        int i,j;
        int suma;
        //Paso 1, leer las calificaciones
        for (i=0;i<5;i++){
            System.out.println();
            System.out.println("Introducir calificaciones del cliente "+(i+1));
            for (j=0;j<4;j++){
                System.out.print("Calificacion de -> "+aspectos[j]);
                matriz[i][j]=Lector.leerInt();
            }
        }
        //Imprimir la calificacion promedio por cada aspecto
        for (j=0;j<4;j++){
            suma=0;
            System.out.println();
            for (i=0;i<5;i++){
                suma+=matriz[i][j];
            }
            System.out.println("La calificacion promedio de "+aspectos[j]+" fue de "+ (suma/5));
        }
    }
}
