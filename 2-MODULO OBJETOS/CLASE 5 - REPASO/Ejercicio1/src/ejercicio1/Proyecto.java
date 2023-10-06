/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio1;

/**
 *
 * @author franc
 */
public class Proyecto{
    private String nombre;
    private int codigo;
    private String nombreDirector;
    //Vector para almacenar los inv, 50 como max
    private Investigador[] investigadores;
    private int cantInvestigadores;
    private double totalOtorgado=0;

    public Proyecto(String nombre, int codigo, String nombreDirector) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreDirector = nombreDirector;
        this.investigadores=new Investigador[50]; //Maximo 50 invest, inicia vacio (0 investigadores)
        this.cantInvestigadores=0;
        this.totalOtorgado=0;
    }
    
    public void agregarInvestigador(Investigador unInvestigador){
        //Checkeo que no haya 50 ya
        if (this.cantInvestigadores<50){
            this.investigadores[this.cantInvestigadores]=unInvestigador;
            this.cantInvestigadores++;
        }else{
            System.out.println("Se llegó al maximo de 50 investigadores");
        }
    }
    
    public void otorgarTodos(String nombreInvestigador) {
        boolean encontrado = false;

        for (int i = 0; i < cantInvestigadores; i++) {
            if (investigadores[i].getNombreInvestigador().equals(nombreInvestigador)) {
                encontrado = true;
                Subsidio[] s = investigadores[i].getSubsidios();
                
                for (int j = 0; j < investigadores[i].getSubPedidos(); j++) {
                    if (!(investigadores[i].getSubsidios()[j].isOtorgado())) {
                        s[j].setOtorgado(true);
                        double monto = investigadores[i].getSubsidios()[j].getMontoPedido();
                        this.actualizarTotalOtorgado(monto);        
                    }
                }
            }
        }
        if (!encontrado) {
            System.out.println("No se encontró un investigador con ese nombre.");
        }
    }
    public void actualizarTotalOtorgado(double monto) {
        this.totalOtorgado += monto;
    }
    public double calcularTotalSubsidios(){
        this.totalOtorgado=0;
        for (int i = 0; i < this.cantInvestigadores; i++){
            for (int j = 0; j < this.investigadores[i].getSubPedidos(); j++) {
                if ((this.investigadores[i].getSubsidios()[j].isOtorgado())) {
                        double monto = this.investigadores[i].getSubsidios()[j].getMontoPedido();
                        this.actualizarTotalOtorgado(monto);        
                    }
            }
        }
        return this.totalOtorgado;
    }
    
    @Override
    public String toString() {
    String aux= "----PROYECTO "+this.nombre +"---- " + "\n Codigo: " + this.codigo + "\n Nombre del Director: " + this.nombreDirector
                    +"\n Total de dinero otorgado: "+ this.calcularTotalSubsidios();
        
        for (int i=0;i< this.cantInvestigadores;i++){
            aux+= "\n"+ this.investigadores[i].toString();
        }
        return aux;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    public double getTotalOtorgado() {
        return totalOtorgado;
    }

    public void setTotalOtorgado(double totalOtorgado) {
        this.totalOtorgado = totalOtorgado;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }

    public Investigador[] getInvestigadores() {
        return investigadores;
    }

    public void setInvestigadores(Investigador[] investigadores) {
        this.investigadores = investigadores;
    }

    public int getCantInvestigadores() {
        return cantInvestigadores;
    }

    public void setCantInvestigadores(int cantInvestigadores) {
        this.cantInvestigadores = cantInvestigadores;
    }
    
    
    
    
    
    
}
