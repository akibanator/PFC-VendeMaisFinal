/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.Iterator;
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

    public double getTotalCompra() {
        return totalCompra;
    }

    public void setTotalCompra(double totalCompra) {
        this.totalCompra = totalCompra;
    }

    public double getTotalVenda() {
        return totalVenda;
    }

    public void setTotalVenda(double totalVenda) {
        this.totalVenda = totalVenda;
    }

    public int getQtdCompra() {
        return qtdCompra;
    }

    public void setQtdCompra(int qtdCompra) {
        this.qtdCompra = qtdCompra;
    }

    public int getQtdVenda() {
        return qtdVenda;
    }

    public void setQtdVenda(int qtdVenda) {
        this.qtdVenda = qtdVenda;
    }

    public double totalValorCompra(List<Compra> lista) {
        for (Compra historico : lista) {
            totalCompra += historico.getTotal();
        }
        return totalCompra;
    }
    
    public double totalValorVenda(List<Compra> lista) {
        for (Compra historico : lista) {
            totalVenda += historico.getTotal();
        }
        return totalVenda;
    }
    
    public double totalQtdCompra(List<Compra> lista) {
        for (Compra historico : lista) {
            qtdCompra += historico.getQuantidadeComprada();
        }
        return qtdCompra;
    }

    public double totalQtdVenda(List<Compra> lista) {
        for (Compra historico : lista) {
            qtdVenda += historico.getQuantidadeComprada();
        }
        return qtdVenda;
    }

}
