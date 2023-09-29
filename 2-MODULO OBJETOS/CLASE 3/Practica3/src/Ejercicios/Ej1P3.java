/*
1-A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área.
NOTA: Calcular el área con la fórmula Área = √s(s − a)(s − b)(s − c) , donde a, b y c son
los lados y s = (𝐚+𝐛+𝐜)/2
. La función raíz cuadrada es Math.sqrt(#)
*/
package Ejercicios;

import PaqueteLectura.Lector;

/**
 *
 * @author franc
 */
public class Ej1P3 {
    public static void main(String [] args){
        
        Triangulo triangulo = new Triangulo();
        //LEER Y ASIGNAR VALORES
        System.out.print("Introducir LADO 1: ");
        triangulo.setLado1(Lector.leerInt());
        System.out.print("Introducir LADO 2: ");
        triangulo.setLado2(Lector.leerInt());
        System.out.print("Introducir LADO 3: ");
        triangulo.setLado3(Lector.leerInt());
        System.out.print("Introducir COLOR DE LINEA: ");
        triangulo.setColorLinea(Lector.leerString());
        System.out.print("Introducir COLOR DE RELLENO: ");
        triangulo.setColorRelleno(Lector.leerString());
        //
        //IMPRIMIR PERIMETRO Y AREA
        System.out.println("El perimetro del triangulo es: "+triangulo.calcularPerimetro()+" y su area es: "+triangulo.calcularArea());
        
    }
}
