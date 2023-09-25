
package Ej2;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores1 {

    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        int DF = 15;
        //Paso 3: Crear el vector para 15 double 
        double [] vector = new double[DF];
        //Paso 4: Declarar indice y variables auxiliares a usar
        double total=0;
        int contador=0;
        int i;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i=0;i<DF;i++){
            vector[i]=Lector.leerDouble(); 
            total+=vector[i];
        };
        //Paso 7: Calcular el promedio de alturas, informarlo
        double promedio = total/DF;
        System.out.println("El promedio de las altura de los 15 jugadores fue de: " +promedio);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for (i=0;i<DF;i++){
            if (vector[i] > promedio){
                contador++;
            }
        };
        //Paso 9: Informar la cantidad.
        System.out.println("Hubo un total de "+contador+" jugadores por encima del promedio");
    }
    
}
