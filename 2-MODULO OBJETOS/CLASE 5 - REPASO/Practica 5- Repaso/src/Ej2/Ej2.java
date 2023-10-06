/*
2- Queremos un sistema para gestionar estacionamientos. Un estacionamiento conoce su 
nombre, dirección, hora de apertura, hora de cierre, y almacena para cada número de piso 
(1..N) y número de plaza (1..M), el auto que ocupa dicho lugar. De los autos se conoce 
nombre del dueño y patente.
a) Genere las clases, incluyendo getters y setters adecuados.
b) Implemente constructores. En particular, para el estacionamiento:
- Un constructor debe recibir nombre y dirección, e iniciar el estacionamiento 
con hora de apertura “8:00”, hora de cierre “21:00”, y para 5 pisos y 10 plazas 
por piso. El estacionamiento inicialmente no tiene autos. 
- Otro constructor debe recibir nombre, dirección, hora de apertura, hora de 
cierre, el número de pisos (N) y el número de plazas por piso (M) e iniciar el 
estacionamiento con los datos recibidos y sin autos. 
c) Implemente métodos para: 
- Dado un auto A, un número de piso X y un número de plaza Y, registrar al auto 
en el estacionamiento en el lugar X,Y. Suponga que X, Y son válidos (es decir, 
están en rango 1..N y 1..M respectivamente) y que el lugar está desocupado.
- Dada una patente, obtener un String que contenga el número de piso y plaza 
donde está dicho auto en el estacionamiento. En caso de no encontrarse, 
retornar el mensaje “Auto Inexistente”.
- Obtener un String con la representación del estacionamiento. Ejemplo: “Piso 1 
Plaza 1: libre Piso 1 Plaza 2: representación del auto … 
 Piso 2 Plaza 1: libre … etc”
- Dado un número de plaza Y, obtener la cantidad de autos ubicados en dicha 
plaza (teniendo en cuenta todos los pisos).
d) Realice un programa que instancie un estacionamiento con 3 pisos y 3 plazas por piso. 
Registre 6 autos en el estacionamiento en distintos lugares. 
Muestre la representación String del estacionamiento en consola.
Muestre la cantidad de autos ubicados en la plaza 1.
Lea una patente por teclado e informe si dicho auto se encuentra en el 
estacionamiento o no. En caso de encontrarse, la información a imprimir es el piso y 
plaza que ocupa 
 */
package Ej2;

import PaqueteLectura.Lector;

/**
 *
 * @author Alumno
 */
public class Ej2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Estacionamiento e=new Estacionamiento("24hrs","Alvear 12","8:00","00:00",3,3);//(String nombre, String direccion, String hApertura, String hCierre, int numPiso,int numPlazas)
        Auto a1=new Auto("Antonio","1231");Auto a2=new Auto("Richard","gafs12");Auto a3=new Auto("Franco","df1");
        Auto a4=new Auto("Luis","fas1");Auto a5=new Auto("Ana","gfgf21");Auto a6=new Auto("Jorge","fdsklfdsjk7");
        
        e.registrarAuto(a1, 1, 1);e.registrarAuto(a2, 2, 1);e.registrarAuto(a3, 3, 1);e.registrarAuto(a4, 3, 3);e.registrarAuto(a5, 1, 3);e.registrarAuto(a6, 1, 2);
        System.out.println(e.toString());
        System.out.println("En la plaza 1 hay "+e.autosEnPlazaX(1)+" autos");
        System.out.print("Introducir una patente a buscar en el estacionamiento:  ");
        String a=Lector.leerString();
        System.out.println(e.encontrarAuto(a));
    }
}