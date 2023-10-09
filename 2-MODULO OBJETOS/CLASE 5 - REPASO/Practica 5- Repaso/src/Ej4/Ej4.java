/*
 c. Escriba un programa que instancie un coro de cada tipo. Lea o bien la cantidad de
coristas (en el caso del coro semicircular) o la cantidad de hileras e integrantes por
hilera (en el caso del coro por hileras). Luego cree la cantidad de coristas necesarios,
leyendo sus datos, y almacenándolos en el coro. Finalmente imprima toda la
información de los coros indicando si están bien formados o no.
 */
package Ej4;

/**
 *
 * @author franc
 */
public class Ej4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //---- CREACION CORO SEMICIRCULAR ---
        Director d1 = new Director(20,"Norberto",123121,60);//(int antiguedad, String nombre, int dni, int edad)
        CoroSemicircular cSC = new CoroSemicircular("Musica Clasica",d1,4);//(Director director, int cantXFila)
        //Creo coristas (int tonoFundamental, String nombre, int dni, int edad)
        Corista c1 = new Corista(1,"Corista 1",123,30);Corista c3 = new Corista(3,"Corista 3",9992,30);
        Corista c2 = new Corista(2,"Corista 2",1233,40);Corista c4 = new Corista(4,"Corista 4",1442,30);
        //Agrego los coristar al coro Semicurcular
        cSC.agregarCorista(c4);cSC.agregarCorista(c3);cSC.agregarCorista(c2);cSC.agregarCorista(c1);
        //----  ----
        
        
        //---- CREACION CORO HILERAS ---
        Director d2 = new Director(30,"Juan",12312,65);
        CoroPorHileras cPH = new CoroPorHileras("Musica POP",d2,3,3);//(Director director, int cantCol,int cantFilas)
        Corista c5 = new Corista(1,"Corista 5", 5555, 35);Corista c6 = new Corista(2,"Corista 6", 6666, 36);
        Corista c7 = new Corista(3,"Corista 7", 7777, 37);Corista c8 = new Corista(4,"Corista 8", 8888, 38);
        Corista c9 = new Corista(5,"Corista 9", 9999, 39);Corista c10 = new Corista(6,"Corista 10", 10000, 40);
        Corista c11 = new Corista(4,"Corista 11", 1111, 41);Corista c12 = new Corista(5,"Corista 12", 1212, 42);
        Corista c13 = new Corista(6,"Corista 13", 1313, 32);
        
        cPH.agregarCorista(c5);cPH.agregarCorista(c6);cPH.agregarCorista(c7);
        cPH.agregarCorista(c8);cPH.agregarCorista(c9);cPH.agregarCorista(c10);
        cPH.agregarCorista(c11);cPH.agregarCorista(c12);cPH.agregarCorista(c13);
        //----  ----
        
        System.out.println(cSC.toString());
        System.out.println(cPH.toString());
        //El ordenado Correctamente funciona solamente si los coros estan completos //enunciado ->(se supone que está lleno)
        System.out.println("CORO SEMICULAR -->"+cSC.ordenadoCorrectamente());
        System.out.println("CORO POR HILERAS -->"+cPH.ordenadoCorrectamente());
        System.out.println(cSC.coroLleno()?"El coro SemiCircular esta lleno":"El coro SemiCircular no esta lleno");
        System.out.println(cPH.coroLleno()?"El coro por Hileras esta lleno":"El coro por Hileras no esta lleno");
    }
    
}
