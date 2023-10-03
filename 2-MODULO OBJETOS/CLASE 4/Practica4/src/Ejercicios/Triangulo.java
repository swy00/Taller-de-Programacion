/*
A- Incluya la clase Triángulo a la jerarquía de figuras vista (carpeta tema4). Triángulo
debe heredar de Figura todo lo que es común y definir su constructor y sus atributos y
métodos propios. Además debe redefinir el método toString.
 */
package Ejercicios;
/**
 *
 * @author franc
 */
public class Triangulo extends Figura {
    private double lado1=1;
    private double lado2=2;
    private double lado3=2;

    public Triangulo(double lado1, double lado2, double lado3,String cL,String cR) {
        super(cL,cR);
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }
    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    
    public double calcularPerimetro(){
        return (lado1+lado2+lado3);
    }

    public double calcularArea(){
        double p=(lado1+lado2+lado3)/2;
        double area = Math.sqrt(p * (p - lado1) * (p - lado2) * (p - lado3));
        return area;
    }
    
    
}
