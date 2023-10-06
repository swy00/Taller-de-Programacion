/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ej3;

public class EventoOcacional extends Recital {
    private String motivo;//{"A beneficio","Show de TV","Show Privado"};
    private String nombreOrganizador;
    private String diaEvento;

    public EventoOcacional(String motivo, String nombreOrganizador, String diaEvento, String nombreBanda, int cantTemas) {
        super(nombreBanda, cantTemas);
        this.motivo = motivo;
        this.nombreOrganizador = nombreOrganizador;
        this.diaEvento = diaEvento;
    }
    
    @Override
    public String actuar(){
        String aux="";
        if (this.getMotivo().equals("Beneficio")){
            aux+="Recuerden colaborar con... ";
        }else if(this.getMotivo().equals("Show de TV")){
            aux+="Saludos amigos televidentes";
        }else if(this.getMotivo().equals("Show privado")){
            aux+="Un feliz cumpleaños para..." + this.getNombreOrganizador();
        }
        aux+=super.actuar();
        return aux;
    }
    
    public double calcularCosto(){
        double x=0;
        if (this.getMotivo().equals("Beneficio")){
            x=0;
        }else if(this.getMotivo().equals("Show de TV")){
            x=50000;
        }else if(this.getMotivo().equals("Show privado")){
            x=150000;
        }
        return x;
    }
 
    public String getMotivo() {
        return motivo;
    }

    public String getNombreOrganizador() {
        return nombreOrganizador;
    }
    
}
