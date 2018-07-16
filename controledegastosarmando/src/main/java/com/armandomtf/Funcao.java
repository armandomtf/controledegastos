/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.armandomtf;

/**
 *
 * @author aluno
 */
public class Funcao {

    /**
     * @return the acessoRestrito
     */
    public boolean isAcessoRestrito() {
        return acessoRestrito;
    }

    /**
     * @param acessoRestrito the acessoRestrito to set
     */
    public void setAcessoRestrito(boolean acessoRestrito) {
        this.acessoRestrito = acessoRestrito;
    }

    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    private int funcao;

    /**
     * @return the funcao
     */
    public int getFuncao() {
        return funcao;
    }

    /**
     * @param funcao the funcao to set
     */
    public void setFuncao(int funcao) {
        this.funcao = funcao;
    }
    private boolean acessoRestrito;
    private String descricao;

}
