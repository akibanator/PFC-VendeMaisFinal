/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.List;

/**
 *
 * @author ailto
 */
public class Relatorio {

    private double total;
    private int qtd;

    public double getTotal() {
        return total;
    }

    public int getQtd() {
        return qtd;
    }

    public double totalValor(List<Compra> lista) {
        for (Compra historico : lista) {
            total += historico.getTotal();
        }
        return total;
    }
    
    public int totalQtd(List<Compra> lista) {
        for (Compra historico : lista) {
            qtd += historico.getQuantidadeComprada();
        }
        return qtd;
    }
}
