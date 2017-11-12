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
public class ClassificacaoProduto {
    
    private int qt_n1;
    private int qt_n2;
    private int qt_n3;
    private int qt_n4;
    private int qt_n5;
    private int qt_total;
    private double mediaNota;

    public int getQt_n1() {
        return qt_n1;
    }

    public void setQt_n1(int qt_n1) {
        this.qt_n1 = qt_n1;
    }

    public int getQt_n2() {
        return qt_n2;
    }

    public void setQt_n2(int qt_n2) {
        this.qt_n2 = qt_n2;
    }

    public int getQt_n3() {
        return qt_n3;
    }

    public void setQt_n3(int qt_n3) {
        this.qt_n3 = qt_n3;
    }

    public int getQt_n4() {
        return qt_n4;
    }

    public void setQt_n4(int qt_n4) {
        this.qt_n4 = qt_n4;
    }

    public int getQt_n5() {
        return qt_n5;
    }

    public void setQt_n5(int qt_n5) {
        this.qt_n5 = qt_n5;
    }

    public int getQt_total() {
        return qt_total;
    }

    public void setQt_total(int qt_total) {
        this.qt_total = qt_total;
    }
    
    public void calcularNotaMedia(List<Compra> lista) {
        double soma = 0;
        int qt_total = 0;
        for (Compra qtdNota : lista) {
            soma = soma + qtdNota.getNota();
            qt_total++;
        }
        
        mediaNota = (soma/qt_total);
    }

    public double getMediaNota() {
        return mediaNota;
    }

    public void setMediaNota(double mediaNota) {
        this.mediaNota = mediaNota;
    }
    
}
