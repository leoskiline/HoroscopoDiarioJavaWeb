/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.time.LocalDate;

/**
 *
 * @author Leonardo
 */
public class Usuario {
    private String email;
    private String senha;
    LocalDate dataNasc;

    public LocalDate getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(LocalDate dataNasc) {
        this.dataNasc = dataNasc;
    }

    public Usuario(LocalDate dataNasc) {
        this.dataNasc = dataNasc;
    }

    public Usuario(String email, String senha, LocalDate dataNasc) {
        this.email = email;
        this.senha = senha;
        this.dataNasc = dataNasc;
    }

    public Usuario(String email, String senha) {
        this.email = email;
        this.senha = senha;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
}
