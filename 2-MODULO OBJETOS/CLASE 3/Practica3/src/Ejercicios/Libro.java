/*
Clase Libro a la cual se agregaron constructores. 
 */
package Ejercicios;

/**
 *
 * @author vsanz
 */
public class Libro {
   private String titulo="Interstellar ";
   private Autor primerAutor; 
   private String editorial="Laureles";
   private int añoEdicion=2023;
   private String ISBN="12312"; 
   private double precio=200.12; 
     
    
    public Libro(  String unTitulo,  String unaEditorial, 
    int unAñoEdicion,  Autor unPrimerAutor, String unISBN, double unPrecio){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= unAñoEdicion;
         primerAutor = unPrimerAutor;
         ISBN =  unISBN;
         precio = unPrecio;
    }
    
    public Libro(  String unTitulo,  String unaEditorial, Autor unPrimerAutor, String unISBN){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= 2015;
         primerAutor = unPrimerAutor;
         ISBN =  unISBN;
         precio = 100;
    }
    
    public Libro(){
   
    }
    public Libro(Autor unAutor){
        this.primerAutor=unAutor;  
    }  
    public String getTitulo(){
        return titulo;
    }
  
    public String getEditorial(){
        return editorial;
    }
    public int getAñoEdicion(){
        return añoEdicion;
    }
  
     
    public String getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
   
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
   
    public void setEditorial(String unaEditorial){
         editorial = unaEditorial;
    }
    public void setAñoEdicion(int unAño){
         añoEdicion = unAño;
    }

    public Autor getPrimerAutor() {
        return primerAutor;
    }

    public void setPrimerAutor(Autor primerAutor) {
        this.primerAutor = primerAutor;
    }
    
    public void setISBN(String unISBN){
         ISBN=unISBN;
    } 
    public void setPrecio(double unPrecio){
         precio=unPrecio;
    }
   
    
   @Override
    public String toString(){
        String aux;
        aux= titulo + " por " + primerAutor.getNombre() + " - " + añoEdicion + " - " + " ISBN: " + ISBN + "\n";
        //aux+="----DATA DEL AUTOR----"+"\n"+primerAutor.toString();
       return ( aux);
    }
        
}
