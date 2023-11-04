/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ej6ParcialesObjetos;

/**
 *
 * @author franc
 */
public class Estanteria {
    Libro[][] e;

    public Estanteria(int cantEstantes, int cantLibrosEstante) {
        this.e=new Libro[cantEstantes][cantLibrosEstante];//Inicializada en NULL
    }
    
    public void almacenarLibro(Libro l,int numEstante,int lugar){
        this.e[numEstante-1][lugar-1]=l;
    }
    
    public Libro sacarLibro(String n){
        for (int i=0;i<this.e.length;i++){
            for(int j=0;j<this.e[0].length;j++){
                if (this.e[i][j]!= null){
                    if (this.e[i][j].getNombre().equals(n)){
                        Libro aux=this.e[i][j];
                        this.e[i][j]=null;
                        return aux; 
                    }
                }
            }
        }
        Libro a = null;//=new Libro("","",0);
        return a;
    }
    
    public Libro calcular(){
        Libro masPesado =this.e[0][0];//Le asigno el primer libro
        for (int i=0;i<this.e.length;i++){
            for(int j=0;j<this.e[0].length;j++){
                if (this.e[i][j]!= null){
                    if (masPesado.getPeso() < this.e[i][j].getPeso()){
                        masPesado=this.e[i][j];
                    }
                }
            }
        }
        return masPesado;
    }
    
    
    
}
