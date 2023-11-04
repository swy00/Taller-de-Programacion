/*
1-A- Incluya la clase Triángulo a la jerarquía de figuras vista (carpeta tema4). Triángulo
debe heredar de Figura todo lo que es común y definir su constructor y sus atributos y
métodos propios. Además debe redefinir el método toString.
B- De igual manera, incluya la clase Círculo a la jerarquía de figuras.
C- Añada a la representación String el valor del perímetro. Piense ¿qué método toString
debe modificar: el de cada subclase o el de Figura?
D- Añada el método despintar que establece los colores de la figura a línea “negra” y
relleno “blanco”. Piense ¿dónde debe definir el método: en cada subclase o en Figura?
 */
package Ejercicios;

/**
 *
 * @author franc
 */
public class Ej1P4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //E- Realizar un programa que instancie un triángulo y un círculo. Muestre en consola la representación String de cada uno. Pruebe el funcionamiento del método despintar.
        Triangulo t = new Triangulo(1, 1, 1, "Verde", "Naranja"); // (l1,l2,l3) de la subclase Triangulo, y (String,String) de la superclase Figura
        Circulos c = new Circulos(4,"Verde","Azul");
        
        System.out.println(t.toString());
        System.out.println(c.toString());
        
        c.despintar();System.out.println(c.toString());
        t.despintar();System.out.println(t.toString());
        
    }
    
}
