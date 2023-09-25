/*
4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
de piso 9. Al finalizar la llegada de personas, informe lo pedido.
 */
package Ej4;

import PaqueteLectura.Lector;

public class Ej4 {
    public static void main(String[] args) {
        int [][] matrizOficinas = new int [8][4];
        //Se supone que la matriz esta inicializada con ceros
        int numPiso=0,numOficina;
        
        while (numPiso != 9){
            System.out.print("Ingrese el numero de piso de persona [1-8] :");
            numPiso=Lector.leerInt();
            if (numPiso!= 9){
                System.out.print("Ingrese el numero de oficina [1-4] :");
                numOficina=Lector.leerInt();
                System.out.println();
                matrizOficinas[numPiso-1][numOficina-1]++;
            }
        }    
        //Imprimo la matriz para comprobar
        int i,j;
        for ( i=0 ;i<8 ;i++){
            System.out.print("PISO "+(i+1)+"| ");
            for (j=0 ;j<4 ;j++){
                System.out.print(matrizOficinas[i][j] + " | ");
            }
            System.out.println();
        }
    }
}
