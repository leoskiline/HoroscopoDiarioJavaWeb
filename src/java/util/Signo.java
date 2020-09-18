/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

/**
 *
 * @author Leonardo
 */
public class Signo {
    private int Dia;
    private int Mes;
    private int idSigno;

    public Signo(int Dia, int Mes) {
        this.Dia = Dia;
        this.Mes = Mes;
    }
    

    public int getDia() {
        return Dia;
    }

    public void setDia(int Dia) {
        this.Dia = Dia;
    }

    public int getMes() {
        return Mes;
    }

    public void setMes(int Mes) {
        this.Mes = Mes;
    }

    public int getIdSigno() {
        int id = -1;
        if(Dia >= 21 && Mes == 3 || Dia <= 20 && Mes == 4)
            id = 0; // Aries
        else if(Dia >= 21 && Mes == 4 || Dia <= 20 && Mes == 5)
            id = 1; // Touro
        else if(Dia >= 21 && Mes == 5 || Dia <= 20 && Mes == 6)
            id = 2; // Gemeos
        else if(Dia >= 21 && Mes == 6 || Dia <= 22 && Mes == 7)
            id = 3; // Cancer
        else if(Dia >= 23 && Mes == 7 || Dia <= 22 && Mes == 8)
            id = 4; // Leao
        else if(Dia >= 23 && Mes == 8 || Dia <= 22 && Mes == 9)
            id = 5; // Virgem
        else if(Dia >= 23 && Mes == 9 || Dia <= 22 && Mes == 10)
            id = 6; // Libra
        else if(Dia >= 23 && Mes == 10 || Dia <= 21 && Mes == 11)
            id = 7; // Escorpiao
        else if(Dia >= 22 && Mes == 11 || Dia <= 21 && Mes == 12)
            id = 8; // Sagitario
        else if(Dia >= 22 && Mes == 12 || Dia <= 20 && Mes == 1)
            id = 9; // Capricornio
        else if(Dia >= 21 && Mes == 1 || Dia <= 18 && Mes == 2)
            id = 10; // Aquario
        else if(Dia >= 19 && Mes == 2 || Dia <= 20 && Mes == 3)
            id = 11; // Peixes
        return id;
    }

    public void setIdSigno(int idSigno) {
        this.idSigno = idSigno;
    }
    
    
}
