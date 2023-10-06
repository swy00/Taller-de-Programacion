/*
3- Un productor musical desea administrar los recitales que organiza, que pueden ser:
eventos ocasionales y giras.
 De todo recital se conoce el nombre de la banda y la lista de temas que tocarán durante
el recital.
 Un evento ocasional es un recital que además tiene el motivo (a beneficio, show de TV
o show privado), el nombre del contratante del recital y el día del evento.
 Una gira es un recital que además tiene un nombre y las “fechas” donde se repetirá la
actuación. De cada “fecha” se conoce la ciudad y el día. Además la gira guarda el
número de la fecha en la que se tocará próximamente (actual).
a) Genere las clases necesarias. Implemente métodos getters/setters adecuados.
b) Implemente los constructores. El constructor de recitales recibe el nombre de la banda
y la cantidad de temas que tendrá el recital. El constructor de eventos ocasionales además
recibe el motivo, el nombre del contratante y día del evento. El constructor de giras
además recibe el nombre de la gira y la cantidad de fechas que tendrá.
c) Implemente los métodos listados a continuación:
i. Cualquier recital debe saber responder a los mensajes:
 agregarTema que recibe el nombre de un tema y lo agrega a la lista de temas.
 actuar que imprime (por consola) para cada tema la leyenda “y ahora
tocaremos…” seguido por el nombre del tema.
ii. La gira debe saber responder a los mensajes:
 agregarFecha que recibe una “fecha” y la agrega adecuadamente.
 La gira debe responder al mensaje actuar de manera distinta. Imprime la leyenda
“Buenas noches …” seguido del nombre de la ciudad de la fecha “actual”. Luego
debe imprimir el listado de temas como lo hace cualquier recital. Además debe
establecer la siguiente fecha de la gira como la nueva “actual”.
iii. El evento ocasional debe saber responder al mensaje actuar de manera distinta:
 Si es un show de beneficencia se imprime la leyenda “Recuerden colaborar con…“
seguido del nombre del contratante.
 Si es un show de TV se imprime “Saludos amigos televidentes”
 Si es un show privado se imprime “Un feliz cumpleaños para…” seguido del
nombre del contratante.
Independientemente del motivo del evento, luego se imprime el listado de temas como
lo hace cualquier recital.
iv. Todo recital debe saber responder al mensaje calcularCosto teniendo en cuenta lo
siguiente. Si es un evento ocasional devuelve 0 si es a beneficio, 50000 si es un show de TV
y 150000 si es privado. Las giras deben devolver 30000 por cada fecha de la misma.
d) Realice un programa que instancie un evento ocasional y una gira, cargando la
información necesaria. Luego, para ambos, imprima el costo e invoque al mensaje actuar.
 */
package Ej3;

/**
 *
 * @author franc
 */
public class Ej3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
//(String motivo, String nombreOrganizador, String diaEvento, String nombreBanda, int cantTemas)        
        // Evento Ocasional
        EventoOcacional evento = new EventoOcacional("Show de TV", "Marcelo", "12-08-2023", "Duki", 10);
        evento.agregarTema("Tema1");evento.agregarTema("Tema4");
        evento.agregarTema("Tema2");evento.agregarTema("Tema5");
        evento.agregarTema("Tema3");evento.agregarTema("Tema6");

        // Gira
        Gira gira = new Gira("Por el mundo", "Mr Musculo", 12, 10);
        gira.agregarTema("TemaA");gira.agregarTema("TemaD");
        gira.agregarTema("TemaB");gira.agregarTema("TemaE");
        gira.agregarTema("TemaC");gira.agregarTema("TemaF");
        // Fechas para la gira
        Fecha fecha1 = new Fecha("Buenos Aires", "01/02/2023");
        gira.agregarFecha(fecha1);

        Fecha fecha2 = new Fecha("Barcelona", "15/02/2023");
        gira.agregarFecha(fecha2);

        Fecha fecha3 = new Fecha("Nueva York", "10/03/2023");
        gira.agregarFecha(fecha3);

        Fecha fecha4 = new Fecha("Madrid", "20/03/2023");
        gira.agregarFecha(fecha4);

        Fecha fecha5 = new Fecha("Londres", "05/04/2023");
        gira.agregarFecha(fecha5);

        Fecha fecha6 = new Fecha("Tokio", "15/05/2023");
        gira.agregarFecha(fecha6);
        //Imprimir el costo de ambos eventos
        System.out.println("El costo del evento es de "+evento.calcularCosto());
        System.out.println("El costo de la gira es de "+gira.calcularCosto());
        //Invocar el mensaje actuar
        System.out.println("------ ACTUAR EVENTO ------");
        System.out.println(evento.actuar());
        System.out.println("------ ACTUAR GIRA ------");
        System.out.println(gira.actuar());
        
        
        
    }
    
}
