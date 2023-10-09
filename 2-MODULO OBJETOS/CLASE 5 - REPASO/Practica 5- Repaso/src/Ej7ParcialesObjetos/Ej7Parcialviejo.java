/*
Representar un curso con alumnos. Un curso tiene año de cursada, y guarda la informacion de sus alumnos (como maximo N alumnos)
De cada alumno se conoce:DNI,Nombre,Asistencias y cantidad de autoevaluaciones aprobadas.
Un curso puede ser a distancia o presencial
Los cursos a distancia llevan el lunk a la sala virtual y los cursos presenciales el numero de aula

1- Genere las clases necesarias. Provea constructores para iniciar los cursos con un año de cursada, un máximo de alumnos N Los cursos se crean sin alumnos inscriptos .
Un alumno se crea con O asistencia y O autoevaluaciones aprobadas

2-Implemente los métodos necesarios, en las clases que corresponda para:
a) agregarAlumno: Agregar un alumno a un curso. El método debe retornar true si pudo agregar al alumno y false en caso contrario
b) incrementarAsistencia: Dado un DNI, incrementar la asistencia del alumno con dicho DNI
c) aprobarAutoevaluación: Dado un DNI, incrementar la cantidad de autoevaluaciones aprobadas del alumno con dicho DNI
d) puedeRendir: Recibe un alumno y retorna si puede rendir o no
--Si el curso es a distancia, pueden rendir el examen los alumnos que cumplen con tener 3 autoevaluaciones y al menos una asistencia
--Si el curso es presencial, pueden rendir el examen los alumnos que tienen al menos 3 asistencias.
e) cantidadDeAlumnosQuePuedenRendir: Retorna la cantidad de alumnos en condiciones de rendir.
3- Realice un programa que instancie un curso presencial y un curso a distancia. 
Agregue alumnos a cada curso. Incremente la asistencia y autoevaluaciones de los alumnos. 
Imprima la cantidad de alumnos en condiciones de rendir en cada curso.
 */
package Ej7ParcialesObjetos;

/**
 *
 * @author franc
 */
public class Ej7Parcialviejo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //Instancio un curso de cada tipo
        CursoADistancia cD = new CursoADistancia("clase.com",2023,4);//(String linkClases, int aCursada, int cantAlumnos)
        CursoPresencial cP = new CursoPresencial(2,2023,4);//(int numAula, int aCursada, int cantAlumnos)
        
        Alumno a1 = new Alumno(22,"Alumno 1");Alumno a5 = new Alumno(123,"Alumno 5");Alumno a8 = new Alumno(44,"Alumno 8");
        Alumno a3 = new Alumno(11,"Alumno 3");Alumno a6 = new Alumno(133,"Alumno 6");Alumno a9 = new Alumno(55,"Alumno 9");
        Alumno a4 = new Alumno(33,"Alumno 4");Alumno a7 = new Alumno(232,"Alumno 7");Alumno a2 = new Alumno(66,"Alumno 2");
        
        //Agrego alumnos a los cursos
        cD.agregarAlumno(a1);cD.agregarAlumno(a2);cD.agregarAlumno(a3);cD.agregarAlumno(a4);cD.agregarAlumno(a5);
        cP.agregarAlumno(a6);cP.agregarAlumno(a7);cP.agregarAlumno(a8);cP.agregarAlumno(a9);
        
        cD.incrementarAsistencia(22);
        cD.incrementarAsistencia(11);cD.incrementarAsistencia(11);
        
        cP.incrementarAsistencia(133);cP.incrementarAsistencia(133);cP.incrementarAsistencia(133);
        cP.incrementarAsistencia(232);cP.incrementarAsistencia(232);cP.incrementarAsistencia(232);cP.incrementarAsistencia(232);
        
        cD.aprobarAutoevaluacion(11);cD.aprobarAutoevaluacion(11);cD.aprobarAutoevaluacion(11);
        cP.aprobarAutoevaluacion(232);
        
        System.out.println("Pueden rendir del Curso Presencial "+cP.cantidadDeAlumnosQuePuedenRendir()+" alumnos");
        System.out.println("Pueden rendir del Curso a Distancia "+cD.cantidadDeAlumnosQuePuedenRendir()+" alumnos");
    }
    
}
