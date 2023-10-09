/*
1) Un psicólogo necesita un sistema para organizar su agenda semanal. El sistema
mantiene para c/u de los 5 días de atención y c/u de los 6 turnos (horarios) del día, la
información del paciente que tomó el turno. De los pacientes guarda: nombre, si tiene
obra social y costo a abonar por la sesión.
a)Genere las clases necesarias. Implemente constructores para iniciar: el sistema sin
pacientes; los pacientes a partir de toda su información.
b)Lea atentamente y luego implemente métodos que permitan:
- Agendar al paciente P en un día D y turno T. Asuma que el turno está libre. D y T son
válidos.
- Dado el nombre de un paciente, liberar todos sus turnos.
- Dado un día D y el nombre de un paciente, devolver si el paciente tiene agendado un
turno ese día. Asuma que D es válido.
C) Realice un programa que instancie el sistema. Cargue varios pacientes al sistema.
Libere turnos agendados. Para finalizar, imprima el resultado del inciso b-.iii
 */
package Ej5ParcialesObjetos;

/**
 *
 * @author franc
 */
public class Parcial1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        AgendaSemanal a=new AgendaSemanal();
        Paciente p1= new Paciente("Paciente 1",true,1230);//(String nombre, boolean obraSocial, int costoAbonar)
        Paciente p2= new Paciente("Paciente 2",true,4142);Paciente p4= new Paciente("Paciente 4",true,213);
        Paciente p3= new Paciente("Paciente 3",false,5151);Paciente p5= new Paciente("Paciente 5",false,22);
        
        a.agendarPaciente(p1, 1, 1);a.agendarPaciente(p1, 3, 1);
        a.agendarPaciente(p2, 1, 3);a.agendarPaciente(p2, 1, 2);
        a.agendarPaciente(p3, 3, 1);a.agendarPaciente(p3, 2, 3);
        a.agendarPaciente(p4, 4, 2);a.agendarPaciente(p4, 2, 1);
        a.agendarPaciente(p5, 4, 3);a.agendarPaciente(p5, 4, 6);
        
        System.out.println(a.pacienteTieneTurno(2,"Paciente 1")?"El paciente TIENE turno":"El paciente NO tiene turno");
        
    
    
    
    }
    
}
