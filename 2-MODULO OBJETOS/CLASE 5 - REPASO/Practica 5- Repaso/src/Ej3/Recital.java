/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ej3;

/**
 *
 * @author franc
 */
public abstract class Recital {
    private String nombreBanda;
    private String[] listaTemas;
    private int cantTemas;
    private int dimLTema=0;

    public Recital(String nombreBanda,int cantTemas) {
        this.nombreBanda = nombreBanda;
        this.cantTemas=cantTemas;
        this.listaTemas = new String[cantTemas];
    }

  
    public void agregarTema(String t){
        this.listaTemas[dimLTema]=new String(t);
        this.dimLTema++;
    }
    
    public String actuar(){
        if (this.dimLTema != 0){
            String aux="";
            for (int i=0;i<this.dimLTema;i++){
                aux+="\n Y ahora tocaremos... "+this.listaTemas[i];
            }
            return aux;
        }else{
            return ("No hay Temas para actuar");
        }
    }
    
    public abstract double calcularCosto();
    
    public String getNombreBanda() {
        return nombreBanda;
    }
    
}
