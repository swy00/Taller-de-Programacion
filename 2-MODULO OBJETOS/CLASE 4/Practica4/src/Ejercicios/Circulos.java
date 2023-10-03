/*
A- Definir una clase para representar círculos. Los círculos se caracterizan por su radio
(double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
 */
package Ejercicios;

/**
 *
 * @author franc
 */
public class Circulos extends Figura{
    private double radio=0;

    public Circulos(double radio, String colorRelleno, String colorLinea) {
        super(colorLinea,colorRelleno);
        this.radio = radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    public double calcularArea(){
        double a=Math.PI * Math.pow(this.radio,2);
        //Para que devuelva el resultado con 2 decimales solamente
        return (Math.round(a*100)/100);
    }
    public double calcularPerimetro(){
        double p=2 * Math.PI * this.radio;
        //Para que devuelva el resultado con 2 decimales solamente
        return (Math.round(p*100)/100);
    }
    
    public String informarAreayPerimetro(){
        return ("El perimetro del círculo es de:"+this.calcularPerimetro()+" y su área: "+this.calcularArea());
    }

    
    
    
}
