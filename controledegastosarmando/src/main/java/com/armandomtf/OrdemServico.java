/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.armandomtf;

import java.util.Date;

/**
 *
 * @author aluno
 */
public class OrdemServico {

    /**
     * @return the data
     */
    public Date getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(Date data) {
        this.data = data;
    }

    /**
     * @return the valorTotal
     */
    public Double getValorTotal() {
        return valorTotal;
    }

    /**
     * @param valorTotal the valorTotal to set
     */
    public void setValorTotal(Double valorTotal) {
        this.valorTotal = valorTotal;
    }
    private int ordemservico;

    /**
     * @return the ordemservico
     */
    public int getOrdemservico() {
        return ordemservico;
    }

    /**
     * @param ordemservico the ordemservico to set
     */
    public void setOrdemservico(int ordemservico) {
        this.ordemservico = ordemservico;
    }
    private Date data;
    private Double valorTotal; 

}
