/*
1- La UNLP desea administrar sus proyectos, investigadores y subsidios. Un proyecto
tiene: nombre, código, nombre completo del director y los investigadores que participan
en el proyecto (50 como máximo). De cada investigador se tiene: nombre completo,
categoría (1 a 5) y especialidad. Además, cualquier investigador puede pedir hasta un
máximo de 5 subsidios. De cada subsidio se conoce: el monto pedido, el motivo y si fue
otorgado o no.
i) Implemente el modelo de clases teniendo en cuenta:
a. Un proyecto sólo debería poder construirse con el nombre, código, nombre del
director.
b. Un investigador sólo debería poder construirse con nombre, categoría y
especialidad.
c. Un subsidio sólo debería poder construirse con el monto pedido y el motivo.
Un subsidio siempre se crea en estado no-otorgado.


ii) Implemente los métodos necesarios (en las clases donde corresponda) que permitan:
a. void agregarInvestigador(Investigador unInvestigador);
// agregar un investigador al proyecto.
b. void agregarSubsidio(Subsidio unSubsidio);
// agregar un subsidio al investigador.
c. double dineroTotalOtorgado();
//devolver el monto total otorgado en subsidios del proyecto (tener en cuenta
todos los subsidios otorgados de todos los investigadores)
d. void otorgarTodos(String nombre_completo);
//otorgar todos los subsidios no-otorgados del investigador llamado
nombre_completo
e. String toString();
// devolver un string con: nombre del proyecto, código, nombre del director, el
total de dinero otorgado del proyecto y la siguiente información de cada
investigador: nombre, categoría, especialidad, y el total de dinero de sus
subsidios otorgados.
iii) Escriba un programa que instancie un proyecto con tres investigadores. Agregue dos
subsidios a cada investigador y otorgue los subsidios de uno de ellos. Luego imprima
todos los datos del proyecto en pantalla.
 */
package ejercicio1;

/**
 *
 * @author franc
 */
public class Ejercicio1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Proyecto p = new Proyecto("Z",1202,"Juan Carlos Mandarin");
        //
        Investigador inv1 = new Investigador("Ricardo", 2, "Ingeniero");
        
        Subsidio s1 = new Subsidio(500000, "Herramientas");
        Subsidio s2 = new Subsidio(200000, "Sueldo",true);
        inv1.agregarSubsidio(s1);
        inv1.agregarSubsidio(s2);
        //
        Investigador inv2 = new Investigador("Fernando", 4, "Abogado");
        
        Subsidio s3 = new Subsidio(300000, "Material",true);
        Subsidio s4 = new Subsidio(150000, "Transporte");
        inv2.agregarSubsidio(s3);
        inv2.agregarSubsidio(s4);
        //
        Investigador inv3 = new Investigador("Ana", 1, "Recursos Humanos");
        Subsidio s5 = new Subsidio(300000, "Material");
        Subsidio s6 = new Subsidio(150000, "Transporte");
        inv3.agregarSubsidio(s5);
        inv3.agregarSubsidio(s6);
        
        //Agrego todos los investigadores al proyecto
        p.agregarInvestigador(inv1);
        p.agregarInvestigador(inv2);
        p.agregarInvestigador(inv3);
        //Le otorgo todos los subsidios a x
        p.otorgarTodos("Ana");
        //Imprimo toda la data
        System.out.println(p.toString());
    }
    
}
