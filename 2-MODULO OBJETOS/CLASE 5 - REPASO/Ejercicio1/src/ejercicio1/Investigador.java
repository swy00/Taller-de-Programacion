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
public class Investigador  {
    private String nombreInvestigador;
    private int categoria; //de 1 a 5
    private String especialidad;
    //Vector para guardar los subsidios del investigador
    private Subsidio[] subsidios;
    private int subPedidos;
    


    public Investigador(String nombreInvestigador, int categoria, String especialidad) {
        this.nombreInvestigador = nombreInvestigador;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.subsidios=new Subsidio[4];//Max 4 subsidios
        this.subPedidos=0;
    }
    
    public void agregarSubsidio(Subsidio unSubsidio) {
        // Checkeo si ya tiene 4
        if (this.subPedidos < 4) {
            this.subsidios[this.subPedidos] = unSubsidio;
            this.subPedidos++;
        } else {
            System.out.println("El investigador ya posee 4 subsidios");
        }
    }
    
    public double calcularTotalSubsidiosXInvest(){
        double total = 0;
        for (int i = 0; i < this.subPedidos; i++) {
            if (subsidios[i].isOtorgado()) {
                total += subsidios[i].getMontoPedido();
            }
        }
        return total;
    }
    
    @Override
    public String toString() {
        return "----INVESTIGADOR----"+
               "\n Nombre: " + this.nombreInvestigador +
               "\n Categoría: " + this.categoria +
               "\n Especialidad: " + this.especialidad +
               "\n Total subsidios otorgados: " + this.calcularTotalSubsidiosXInvest();
    }
    
    
    public String getNombreInvestigador() {
        return nombreInvestigador;
    }

    public void setNombreInvestigador(String nombreInvestigador) {
        this.nombreInvestigador = nombreInvestigador;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public Subsidio[] getSubsidios() {
        return subsidios;
    }

    public void setSubsidios(Subsidio[] subsidios) {
        this.subsidios = subsidios;
    }

    public int getSubPedidos() {
        return subPedidos;
    }

    public void setSubPedidos(int subPedidos) {
        this.subPedidos = subPedidos;
    }
}
