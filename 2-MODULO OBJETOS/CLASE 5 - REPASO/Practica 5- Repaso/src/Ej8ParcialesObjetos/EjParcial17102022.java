/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ej8ParcialesObjetos;

/**
 *
 * @author franc
 */
public class EjParcial17102022 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        TorneoFutbol t=new TorneoFutbol("Liga A",3,2);//(String nombre, int cantidadFechas, int cantidadMaximaGoleadores)
        Goleador g1 = new Goleador("Palermo", "Boca", 5);
        Goleador g2 = new Goleador("Messi", "Inter Miami", 3);
        Goleador g3 = new Goleador("Ronaldo", "Al hail", 1);
        Goleador g4 = new Goleador("Neymar", "PSG", 2);
        Goleador g5 = new Goleador("Suárez", "Gremio", 3);
        Goleador g6 = new Goleador("Lewandowski", "Barcelona", 4);
        
        t.agregarGoleador(1, g6);t.agregarGoleador(1, g4);
        t.agregarGoleador(2, g5);t.agregarGoleador(2, g2);
        t.agregarGoleador(3, g3);t.agregarGoleador(3, g3);
        
        System.out.println(t.toString());
        System.out.print("El goleador con menos goles es ");
        System.out.println(t.menosGolesFecha(3));

    }
    
}
