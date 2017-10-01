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

    private double totalCompra;
    private double totalVenda;
    private int qtdCompra;
    private int qtdVenda;
    private List<Historico> historico;

    public double calcularTotalCompra() {
        if (historico != null) {
            for (Historico historico1 : historico) {

                totalCompra += historico1.getTotal();
            }

        }
        return totalCompra;
    }
}
