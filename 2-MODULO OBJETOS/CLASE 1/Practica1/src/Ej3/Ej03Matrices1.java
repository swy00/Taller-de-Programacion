/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ej3;
import PaqueteLectura.Lector;
//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
public class Ej03Matrices1 {

    public static void main(String[] args) {
        int i=0,j=0;
        int suma=0;
        boolean e=false;
        int val=0;
	//Paso 2. iniciar el generador aleatorio     
	GeneradorAleatorio.generarInt(30);
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        //Paso 4. mostrar el contenido de la matriz en consola
        int [][] matriz = new int [5][5];    
        for (i=0;i<5;i++){
            for (j=0;j<5;j++){
                matriz[i][j]= GeneradorAleatorio.generarInt(30);
                System.out.print(matriz[i][j] + " | ");
            }
            System.out.println();
        }
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        for (i=0;i<5;i++){
            suma+=matriz[0][i];
        }
        System.out.println("La suma de los elementos de la fila 1 es de: "+suma);
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        int [] vector = new int[5];
        for (i=0;i<5;i++){
            vector[i]=0;
        }
        
        for (i=0;i<5;i++){
            for (j=0;j<5;j++){
                vector[i]+=matriz[j][i];
            }
            System.out.print(vector[i]+" | ");
        }
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        System.out.println();
        System.out.print("Ingrese un valor a buscar en la matriz: " );
        val=Lector.leerInt();
        for (i=0;i<5;i++){
            for (j=0;j<5;j++){
                if (val == matriz[i][j]){
                    e=true;
                    System.out.println("El valor "+ val +" se encontró en la fila "+(i+1)+" y columna "+(j+1));
                }
            }
        }
        if (!e){
            System.out.println("El valor "+ val +" NO se encontró");
        }

    }
}
