/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizador;

import java.io.File;

/**
 *
 * @author denis
 */
public class Practica {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
          try {
            parser p = new parser(new Yylex(new java.io.FileInputStream("C:\\Users\\denis\\Desktop\\Analizadores\\prueba.mlp")));
            p.parse();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }
  

}
